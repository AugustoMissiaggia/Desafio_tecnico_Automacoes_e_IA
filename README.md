# Desafio Técnico: Automações e IA - Clube do Valor

Olá! Este repositório contém a resolução técnica para a vaga de Analista Pleno de Automações.

Optei por desenvolver os **Desafios 1 e 3**. Abaixo está o detalhamento técnico e as respostas arquiteturais de cada solução.

---

## Desafio 3: Orquestrador de Follow-up com Máquina de Estados

### Resumo

Implementei um orquestrador de follow-ups no n8n que funciona como uma verdadeira máquina de estados transacional. O fluxo consulta um banco de dados relacional, gerencia concorrência com _Atomic Locks_, gera mensagens personalizadas via IA com _guardrails_ estritos e garante a idempotência dos envios (evitando spam para leads da mesma família).

---

### (a) Arquitetura da solução e justificativa

**Arquitetura:**

1. **Trigger Baseado em Tempo:** _Cron Job_ executando a cada 30 minutos.
2. **Controle de Concorrência (Lock):** Node MySQL realiza um `UPDATE` atômico setando `processing_lock = 1` nos leads elegíveis (paginação `LIMIT 10`).
3. **Busca e Iteração:** Leitura apenas dos leads travados e processamento em _Split In Batches_.
4. **Janela de Horário:** Validação se a hora atual está entre 09h e 20h. Caso contrário, o lead é reagendado para o dia seguinte e destravado.
5. **Máquina de Estados (Cérebro):** Node Code avalia a situação (Expirado, Cancelado, Reagendado ou Dias Restantes) e roteia a ação.
6. **Seleção de Template:** Consulta SQL buscando a mensagem base (`message_templates`) cruzando dias, tipo de lead e faixa de patrimônio.
7. **Idempotência:** Consulta se o número de telefone já recebeu mensagem hoje (`message_history`).
8. **IA com Guardrails:** OpenAI reescreve a mensagem. Um node de Código (Guardrail) valida se a IA não usou termos proibidos ou alucinou promessas. Se falhar, aplica um _fallback_ seguro.
9. **Commit Transacional:** Três ações SQL simultâneas: salva histórico, gera log de auditoria (`audit_logs`) com a transição de estado, e atualiza o status do lead destravando-o (`processing_lock = 0`).

**Justificativa:**
A escolha de colocar a "inteligência de estado" e o "lock" no banco de dados relacional (MySQL) e não na memória do n8n garante resiliência (ACID compliance) e escalabilidade. O n8n atua apenas como motor de execução e integração com a IA, enquanto o banco garante que a concorrência não quebre o processo.

---

### (b) Alternativas consideradas e descartadas

- **Estados controlados por `Wait` nodes no n8n:** Descartado porque fluxos em espera prolongada consomem memória do servidor, dificultam a auditoria e perdem o estado em caso de reinicialização da instância.
- **`SELECT` antes do `UPDATE`:** Descartado devido ao alto risco de _Race Condition_ em cenários de alta concorrência.
- **Templates _hardcoded_ no fluxo:** Descartado para cumprir o requisito de permitir que o time de negócios altere os textos sem depender de desenvolvedores.

---

### (c) Limitações conhecidas

- A estratégia de _polling_ (Cron a cada 30 minutos) pode introduzir um atraso de até 29 minutos na percepção de uma mudança de estado crítica (como um cancelamento de última hora).
- Dependência de conectividade constante com o banco de dados; quedas de rede do n8n para o DB podem pausar a cadência.

---

### (d) O que eu faria diferente com mais tempo

- Substituiria parte do _polling_ (Cron) por eventos baseados em _Webhooks_ disparados diretamente do CRM/Agenda para atualizações de status (Cancelamento/Reagendamento) em tempo real.
- Implementaria um sistema de fila (RabbitMQ/Redis) para gerenciar o envio das mensagens (rate limit da API do WhatsApp).
- Criaria um sistema de _retry_ com _exponential backoff_ caso a API do WhatsApp ou da OpenAI estivesse indisponível.

---

### # Perguntas obrigatórias (Desafio 3)

**1) Se amanhã tivermos 5.000 reuniões/mês ao invés de 1.300, o que quebra primeiro nessa arquitetura?**
O limite de chamadas (_rate limit_) das APIs externas (WhatsApp ou OpenAI). A arquitetura do banco (com paginação e _locks_ de linha) escala perfeitamente. Resolveria isso desacoplando o envio em uma fila assíncrona controlada.

**2) Impacto de adicionar um novo estado (ex: LISTA_DE_ESPERA)?**
A mudança é simples e pontual. Requereria apenas adicionar o status no banco, incluir uma nova ramificação no nó `Switch` (Roteador de Ações) e cadastrar os templates na tabela. Não exige refatoração pesada.

**3) Mudar a cadência de mensagens (D+0 a D+3) - quem faz?**
O time de negócios faz sozinho. Como os templates e as regras de dias estão isolados na tabela `message_templates`, basta uma interface administrativa simples (ex: Retool) ligada ao banco para que qualquer pessoa altere as regras sem mexer no n8n.

**4) Qual é o risco de race condition nessa arquitetura? Como você mitiga?**
O risco é alto em crons paralelos, mas foi **totalmente mitigado** pelo uso de um _Atomic Lock_. Ao executar `UPDATE leads SET processing_lock = 1... LIMIT 10` _antes_ do `SELECT`, delegamos a fila ao motor do banco de dados (Row-Level Lock), impossibilitando que duas instâncias da automação processem o mesmo lead.

---

## Desafio 1: Pipeline de Extração de Carteiras com Reconciliação

### Resumo

Implementei um pipeline no n8n para receber documentos por múltiplos canais, extrair informações com OCR/LLM, reconciliar dados de múltiplos arquivos do mesmo lead e decidir automaticamente o fluxo com base em um _score_ de confiança.

---

### (a) Arquitetura da solução e justificativa

**Arquitetura:**

1. **Ingestão multicanal:** Telegram + WhatsApp via webhook.
2. **Normalização do payload:** Padroniza `channel`, `chat_id` e `binary.file`.
3. **Persistência de eventos:** Grava os dados iniciais em `incoming_events`.
4. **Agrupamento por batch:** Utiliza chave (`channel:chat_id`) com janela de tempo para agrupar múltiplos arquivos enviados em sequência.
5. **Processamento por tipo:** Imagens vão para Vision; PDFs vão para Extract From File + LLM.
6. **Estruturação em JSON:** LLM estrutura os dados financeiros padronizados.
7. **Reconciliação e Conflitos:** Cruza ativos encontrados em múltiplos arquivos.
8. **Roteamento:** Aplica score de confiança para decisão automática (Análise, Revisão Humana ou Rejeição).
9. **Persistência Final:** Grava em `batch_results` e emite logs.

**Justificativa:**
A escolha pelo n8n facilita a integração rápida com múltiplos canais e serviços de IA. Separar a ingestão, o armazenamento temporário, a reconciliação e a decisão garante rastreabilidade total (auditabilidade) e flexibilidade para evoluir a solução modularmente.

---

### (b) Alternativas consideradas e descartadas

- **Processar tudo em um único fluxo "monolítico":** Descartado, pois falha no caso real de leads que enviam múltiplos documentos em sequência fragmentada.
- **Processamento imediato sem janela de tempo:** Descartado porque levaria a reconciliações incompletas e análises parciais da carteira.
- **OCR local (Tesseract/DocTR):** Descartado pela complexidade de infraestrutura e setup no tempo hábil do desafio; o modelo Vision da OpenAI foi adotado pela praticidade e alta taxa de acerto inicial.
- **Filas externas (Kafka):** Descartado por fugir do escopo e simplicidade exigidos no desafio atual.

---

### (c) Limitações conhecidas

- OCR/LLM não são infalíveis e podem alucinar ativos ou interpretar valores incorretamente.
- PDFs não nativos (escaneados de forma complexa) podem gerar muito ruído de texto.
- O _score_ de confiança atual é puramente heurístico e exigiria calibração com dados de produção reais.
- A deduplicação por hash de arquivo ainda não foi implementada.

---

### (d) O que eu faria diferente com mais tempo

- Separaria a ingestão e o processamento em workflows fisicamente distintos (Ingestão rápida -> Fila -> Processamento pesado em _background_).
- Implementaria parsing de planilhas de forma nativa e determinística (lendo o buffer CSV/Excel diretamente) ao invés de delegar tudo para a IA.
- Criaria validações matemáticas determinísticas adicionais (ex: verificar se a soma dos percentuais extraídos bate exatamente 100%).

---

### # Perguntas obrigatórias (Desafio 1)

**1) Se esse fluxo processar 200 carteiras/dia, qual é o gargalo provável? Como resolver?**
O gargalo é o tempo de processamento (_Timeout_) e custo das chamadas de OCR/LLM. Solução: Paralelizar o processamento, desacoplar a ingestão colocando os arquivos em uma fila assíncrona (ex: SQS/RabbitMQ) e responder instantaneamente ao usuário antes de iniciar o OCR.

**2) Se a API da OpenAI cair por 2 horas, o que acontece?**
Os arquivos **não** se perdem, pois são persistidos nas tabelas `incoming_events` e `extractions_raw` no ato do recebimento. A estratégia seria enfileirar os processos falhos (status `PENDING` ou `ERROR_AI`) e acionar um Cron Job de reprocessamento assim que a API estabilizar.

**3) Se um lead mandar foto de um prato de comida, o que acontece?**
No momento da estruturação JSON, o LLM identificará a ausência de entidades financeiras (como "renda fixa", valores, nomes de corretoras) e categorizará como `not_investment`. Isso despencará o Score de Confiança, ativando a rota de rejeição (_Reject_) que solicitará um novo envio ao lead.

**4) Qual é o custo estimado por extração?**
Usando o modelo `gpt-4o-mini`, uma imagem ou PDF curto consome entre 150 a 500 tokens (incluindo _Vision_ e _Prompt_). Isso resulta em um custo ínfimo (fração de centavo de dólar por extração). O custo cresce apenas se o volume de páginas (imagens sequenciais) por lead for desproporcional.

---

## (e) Por que não escolhi o Desafio 2 (Inteligência Competitiva)

Optei pelos Desafios 1 e 3 porque, em conjunto, eles refletem problemas diretos de engenharia de dados, transações de banco de dados e resiliência de pipelines operacionais críticos (relacionamento e captura de leads).

O **Desafio 3** exigiu decisões puras de engenharia de software (como mitigação de _Race Conditions_ com Locks de banco e máquinas de estado), enquanto o **Desafio 1** provaria minha capacidade de lidar com dados não estruturados, processamento em _batch_ e _Score Routing_.

Embora o Desafio 2 (Monitoramento de YouTube) seja extremamente interessante do ponto de vista analítico, o foco dele recai mais fortemente sobre raspagem de dados (_scraping_/APIs sociais) e análise de sentimento/tendências. Preferi focar nos cenários 1 e 3 para demonstrar domínio absoluto em estabilidade transacional, pipelines assíncronos e idempotência, que considero o coração de uma operação robusta de automação.
