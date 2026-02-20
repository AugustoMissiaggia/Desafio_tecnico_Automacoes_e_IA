-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: desafio_3
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
-- Table structure for table `message_history`
--

DROP TABLE IF EXISTS `message_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lead_id` int DEFAULT NULL,
  `template_id` int DEFAULT NULL,
  `content_sent` text,
  `sent_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `lead_id` (`lead_id`),
  CONSTRAINT `message_history_ibfk_1` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_history`
--

LOCK TABLES `message_history` WRITE;
/*!40000 ALTER TABLE `message_history` DISABLE KEYS */;
INSERT INTO `message_history` VALUES (1,1,1,'Olá Carlos, tudo bem? Sua reunião de consultoria financeira está marcada para daqui a 2 dias. Podemos confirmar?','2026-02-19 23:03:29'),(2,2,5,'Oi Ana, tudo certo? Estou te lembrando que nossa reunião de consultoria financeira está marcada para daqui a 2 dias. Espero que consiga participar!','2026-02-19 23:03:31'),(3,3,6,'Oi Roberto, tudo bem? Só passando para lembrar que nosso especialista está reservado para te atender em 2 dias. Está tudo certo para nossa conversa?','2026-02-19 23:03:32'),(4,4,7,'Oi Fernanda, tudo certo? Só passando para confirmar nossa reunião exclusiva em dois dias. O time já está finalizando a análise do seu perfil para a nossa conversa.','2026-02-19 23:03:34'),(5,5,8,'Oi Lucas, tudo certo? Estou passando para confirmar nossa conversa exclusiva em 2 dias. O time já preparou uma análise do seu perfil para a gente discutir.','2026-02-19 23:03:36'),(6,6,9,'Oi Mariana, tudo bem? Vi que você agendou um horário para a próxima semana. Para facilitar, você poderia me enviar sua carteira atual?','2026-02-19 23:03:37'),(7,7,10,'Oi Pedro, tudo bem? Sua reunião está agendada para a próxima semana. Para que o consultor possa te atender da melhor forma, você poderia nos informar quais são seus ativos atuais? Agradeço!','2026-02-19 23:03:40'),(8,8,11,'Oi Juliana, como você está? Para aproveitarmos melhor a nossa reunião na próxima semana, seria excelente se você pudesse nos enviar seus dados de carteira com antecedência.','2026-02-19 23:03:42'),(9,9,2,'Oi Ricardo, tudo bem? Notei que você agendou um horário para a próxima semana. Para facilitar nossa conversa, você poderia me enviar sua carteira atual? Abraços!','2026-02-19 23:03:43'),(10,10,12,'Oi Sonia, tudo certo? Para aproveitarmos melhor nosso tempo na reunião da próxima semana, seria ótimo se você pudesse nos enviar os dados da sua carteira com antecedência.','2026-02-19 23:03:45'),(11,17,14,'Oi Cliente Antigo A, que bom te ver de volta! Sua reunião de reativação está marcada para daqui a 2 dias. Estamos ansiosos para te encontrar!','2026-02-19 23:07:30'),(12,18,13,'Oi Cliente Upsell B, tudo bem? Estou ansioso para nossa revisão de carteira daqui a 2 dias! Preparado?','2026-02-19 23:07:32'),(13,19,5,'Oi João, tudo certo? Estou passando para confirmar que nossa reunião de consultoria financeira está marcada para daqui a 2 dias. Você vai poder vir?','2026-02-19 23:07:33'),(14,15,6,'Oi Reagendado Dois, tudo bem? Estou passando para lembrar que nosso especialista reservou um horário para te atender em 2 dias. Está tudo certo para a nossa conversa?','2026-02-19 23:07:38');
/*!40000 ALTER TABLE `message_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-20  8:51:36
