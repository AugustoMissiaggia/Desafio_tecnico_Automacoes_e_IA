-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: desafio1
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `batch_results`
--

DROP TABLE IF EXISTS `batch_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch_results` (
  `id` char(36) NOT NULL,
  `batch_id` char(36) NOT NULL,
  `score` int NOT NULL,
  `route` varchar(20) NOT NULL,
  `reconciled_count` int NOT NULL DEFAULT '0',
  `conflicts_count` int NOT NULL DEFAULT '0',
  `payload` json DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_batch_results_batch_id` (`batch_id`),
  KEY `idx_batch_results_route` (`route`),
  KEY `idx_batch_results_score` (`score`),
  CONSTRAINT `fk_batch_results_batch` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_results`
--

LOCK TABLES `batch_results` WRITE;
/*!40000 ALTER TABLE `batch_results` DISABLE KEYS */;
INSERT INTO `batch_results` VALUES ('1ae4a738-0e16-11f1-90c9-c01850fcc829','fd81b893-0e15-11f1-90c9-c01850fcc829',90,'auto',2,0,'{\"route\": \"auto\", \"score\": 90, \"conflicts\": [], \"reconciled\": [{\"tipo\": \"Fundo Imobiliário\", \"ativo\": \"KNSC11\", \"moeda\": \"\", \"risco\": \"Médio (17)\", \"data_base\": \"\", \"quantidade\": null, \"instituicao\": \"\", \"valor_investido\": null}, {\"tipo\": \"Fundo Imobiliário\", \"ativo\": \"XPML11\", \"moeda\": \"\", \"risco\": \"Médio (17)\", \"data_base\": \"\", \"quantidade\": null, \"instituicao\": \"\", \"valor_investido\": null}]}','2026-02-20 01:39:12'),('1b6318d0-0e13-11f1-90c9-c01850fcc829','f5851b84-0e12-11f1-90c9-c01850fcc829',90,'auto',2,0,'{\"route\": \"auto\", \"score\": 90, \"conflicts\": [], \"reconciled\": [{\"tipo\": \"Fundo Imobiliário (FII)\", \"ativo\": \"KNSC11\", \"moeda\": null, \"risco\": \"Médio (17)\", \"data_base\": null, \"quantidade\": null, \"instituicao\": null, \"observacoes\": \"Posição, quantidade disponível, preços e proventos não especificados\", \"valor_investido\": null}, {\"tipo\": \"Fundo Imobiliário (FII)\", \"ativo\": \"XPML11\", \"moeda\": null, \"risco\": \"Médio (17)\", \"data_base\": null, \"quantidade\": null, \"instituicao\": null, \"observacoes\": \"Posição, quantidade disponível, preços e proventos não especificados\", \"valor_investido\": null}]}','2026-02-20 01:17:45'),('25eddf1f-0dcb-11f1-90c9-c01850fcc829','09aa2fb8-0dcb-11f1-90c9-c01850fcc829',100,'auto',2,0,'{\"route\": \"auto\", \"score\": 100, \"conflicts\": [], \"reconciled\": [{\"tipo\": \"fundo imobiliário\", \"ativo\": \"KNSC11\", \"moeda\": \"BRL\", \"data_base\": \"\", \"quantidade\": 22, \"instituicao\": \"\", \"preco_atual\": 91.04, \"preco_medio\": 89.16, \"valor_investido\": 1900.23, \"proventos_acumulados\": 38.83, \"rentabilidade_bruta_percent\": 1.03}, {\"tipo\": \"fundo imobiliário\", \"ativo\": \"XPML11\", \"moeda\": \"BRL\", \"data_base\": \"\", \"quantidade\": 7, \"instituicao\": \"\", \"preco_atual\": 11.4, \"preco_medio\": null, \"valor_investido\": 1782.2}]}','2026-02-19 16:42:39'),('421423b2-0dd6-11f1-90c9-c01850fcc829','293ee4a9-0dd6-11f1-90c9-c01850fcc829',100,'auto',2,0,'{\"route\": \"auto\", \"score\": 100, \"conflicts\": [], \"reconciled\": [{\"tipo\": \"Fundo Imobiliário\", \"ativo\": \"KNCR11\", \"moeda\": \"BRL\", \"risco\": 17, \"data_base\": null, \"quantidade\": 2000, \"instituicao\": null, \"preco_atual\": 10.4, \"preco_medio\": 9.16, \"valor_investido\": 2990.23, \"proventos_acumulados\": 0.55, \"rentabilidade_preco_medio\": 38.83, \"rentabilidade_bruta_percent\": 1.03}, {\"tipo\": \"Fundo Imobiliário\", \"ativo\": \"XPML11\", \"moeda\": \"BRL\", \"risco\": 17, \"data_base\": null, \"quantidade\": 150, \"instituicao\": null, \"preco_atual\": 11.4, \"preco_medio\": null, \"valor_investido\": 1782.2}]}','2026-02-19 18:02:10'),('49d362d1-0d9f-11f1-90c9-c01850fcc829','2ef51488-0d9f-11f1-90c9-c01850fcc829',90,'auto',2,0,'{\"route\": \"auto\", \"score\": 90, \"conflicts\": [], \"reconciled\": [{\"tipo\": \"Fundo Imobiliário\", \"ativo\": \"KNSC11\", \"moeda\": null, \"risco\": \"Médio (17)\", \"botoes\": [\"Resgatar\", \"Investir\"], \"data_base\": null, \"quantidade\": null, \"instituicao\": null, \"valor_investido\": null}, {\"tipo\": \"Fundo Imobiliário\", \"ativo\": \"XPML11\", \"moeda\": null, \"risco\": \"Médio (17)\", \"botoes\": [\"Resgatar\", \"Investir\"], \"data_base\": null, \"quantidade\": null, \"instituicao\": null, \"valor_investido\": null}]}','2026-02-19 11:28:41'),('5569340d-0e0c-11f1-90c9-c01850fcc829','362dec75-0e0c-11f1-90c9-c01850fcc829',100,'auto',2,0,'{\"route\": \"auto\", \"score\": 100, \"conflicts\": [], \"reconciled\": [{\"tipo\": \"fundo imobiliário\", \"ativo\": \"KNRI11\", \"moeda\": \"BRL\", \"data_base\": \"\", \"quantidade\": \"2.000\", \"instituicao\": \"\", \"valor_investido\": \"R$ 1.900,23\"}, {\"tipo\": \"fundo imobiliário\", \"ativo\": \"XPML11\", \"moeda\": \"BRL\", \"data_base\": \"\", \"quantidade\": \"100\", \"instituicao\": \"\", \"valor_investido\": \"R$ 1.782,20\"}]}','2026-02-20 00:29:16'),('77cd4495-0e08-11f1-90c9-c01850fcc829','50fc7a07-0e08-11f1-90c9-c01850fcc829',100,'auto',2,0,'{\"route\": \"auto\", \"score\": 100, \"conflicts\": [], \"reconciled\": [{\"tipo\": \"Fundo Imobiliário\", \"ativo\": \"KNSC11\", \"moeda\": \"BRL\", \"data_base\": \"\", \"quantidade\": 432, \"instituicao\": \"\", \"valor_investido\": \"R$ 3.905,28\"}, {\"tipo\": \"Fundo Imobiliário\", \"ativo\": \"XPML11\", \"moeda\": \"BRL\", \"data_base\": \"\", \"quantidade\": 16, \"instituicao\": \"\", \"valor_investido\": \"R$ 1.782,40\"}]}','2026-02-20 00:01:35'),('7dbaff9f-0dcd-11f1-90c9-c01850fcc829','681a6f5a-0dcd-11f1-90c9-c01850fcc829',85,'auto',3,0,'{\"route\": \"auto\", \"score\": 85, \"conflicts\": [], \"reconciled\": [{\"tipo\": \"FII\", \"ativo\": \"HGLG11\", \"moeda\": \"BRL\", \"data_base\": \"\", \"quantidade\": null, \"instituicao\": \"\", \"valor_investido\": 2992}, {\"tipo\": \"FII\", \"ativo\": \"KNSC11\", \"moeda\": \"BRL\", \"data_base\": \"\", \"quantidade\": null, \"instituicao\": \"\", \"valor_investido\": 2000}, {\"tipo\": \"FII\", \"ativo\": \"XPML11\", \"moeda\": \"BRL\", \"data_base\": \"\", \"quantidade\": null, \"instituicao\": \"\", \"valor_investido\": null}]}','2026-02-19 16:59:25'),('86d47dea-0d9f-11f1-90c9-c01850fcc829','6df71840-0d9f-11f1-90c9-c01850fcc829',95,'auto',2,0,'{\"route\": \"auto\", \"score\": 95, \"conflicts\": [], \"reconciled\": [{\"tipo\": \"fundo imobiliário\", \"ativo\": \"KNCR11\", \"moeda\": \"BRL\", \"data_base\": \"\", \"quantidade\": 2, \"instituicao\": \"\", \"valor_investido\": 909.23}, {\"tipo\": \"fundo imobiliário\", \"ativo\": \"XPML11\", \"moeda\": \"BRL\", \"data_base\": \"\", \"quantidade\": 0, \"instituicao\": \"\", \"valor_investido\": 1782.2}]}','2026-02-19 11:30:23'),('a4094fcb-0dce-11f1-90c9-c01850fcc829','8a639451-0dce-11f1-90c9-c01850fcc829',90,'auto',2,0,'{\"route\": \"auto\", \"score\": 90, \"conflicts\": [], \"reconciled\": [{\"tipo\": \"fundo imobiliário\", \"ativo\": \"KNSC11\", \"moeda\": \"\", \"data_base\": \"\", \"quantidade\": null, \"instituicao\": \"\", \"valor_investido\": null}, {\"tipo\": \"fundo imobiliário\", \"ativo\": \"XPML11\", \"moeda\": \"\", \"data_base\": \"\", \"quantidade\": null, \"instituicao\": \"\", \"valor_investido\": null}]}','2026-02-19 17:07:39'),('be038f7c-0dec-11f1-90c9-c01850fcc829','992daeff-0dec-11f1-90c9-c01850fcc829',100,'auto',2,0,'{\"route\": \"auto\", \"score\": 100, \"conflicts\": [], \"reconciled\": [{\"tipo\": \"Fundo Imobiliário\", \"ativo\": \"KNRI11\", \"moeda\": \"BRL\", \"data_base\": \"\", \"quantidade\": 2000, \"instituicao\": \"\", \"valor_investido\": 9090.23}, {\"tipo\": \"Fundo Imobiliário\", \"ativo\": \"XPML11\", \"moeda\": \"BRL\", \"data_base\": \"\", \"quantidade\": 300, \"instituicao\": \"\", \"valor_investido\": 1782.2}]}','2026-02-19 20:43:07'),('e734fdcc-0e12-11f1-90c9-c01850fcc829','cd4ff0e8-0e12-11f1-90c9-c01850fcc829',100,'auto',2,0,'{\"route\": \"auto\", \"score\": 100, \"conflicts\": [], \"reconciled\": [{\"tipo\": \"Fundo Imobiliário\", \"ativo\": \"KNSC11\", \"moeda\": \"BRL\", \"data_base\": null, \"quantidade\": 432, \"instituicao\": null, \"valor_investido\": 3905.28}, {\"tipo\": \"Fundo Imobiliário\", \"ativo\": \"XPML11\", \"moeda\": \"BRL\", \"data_base\": null, \"quantidade\": 16, \"instituicao\": null, \"valor_investido\": 1782.4}]}','2026-02-20 01:16:17');
/*!40000 ALTER TABLE `batch_results` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-20  8:51:35
