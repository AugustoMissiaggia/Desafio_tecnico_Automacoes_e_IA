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
-- Table structure for table `message_templates`
--

DROP TABLE IF EXISTS `message_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_lead` enum('novo','retorno','upsell') DEFAULT NULL,
  `patrimonio_faixa` varchar(50) DEFAULT NULL,
  `dias_para_reuniao` int DEFAULT NULL,
  `canal` enum('whatsapp','email') DEFAULT 'whatsapp',
  `mensagem_base` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_templates`
--

LOCK TABLES `message_templates` WRITE;
/*!40000 ALTER TABLE `message_templates` DISABLE KEYS */;
INSERT INTO `message_templates` VALUES (1,'novo','100k-300k',2,'whatsapp','Olá {nome}, sua reunião de consultoria financeira é em 2 dias. Podemos confirmar?'),(2,'novo','300k-500k',7,'whatsapp','Olá {nome}, vi que agendou para a próxima semana. Para adiantar, poderia me enviar sua carteira atual?'),(3,'retorno',NULL,2,'whatsapp','Oi {nome}, tudo bem? Bom te ver de volta! Nossa reunião é daqui a 2 dias.'),(4,'upsell',NULL,2,'whatsapp','Olá {nome}, como estão os rendimentos? Vamos revisar sua estratégia daqui a 2 dias?'),(5,'novo','300k-500k',2,'whatsapp','Olá {nome}, tudo bem? Sua reunião de consultoria financeira está confirmada para daqui a 2 dias. Podemos contar com sua presença?'),(6,'novo','500k-1M',2,'whatsapp','Olá {nome}, como vai? Lembrando que nosso especialista reservou a agenda para te atender daqui a 2 dias. Tudo certo para conversarmos?'),(7,'novo','1M+',2,'whatsapp','Olá {nome}, tudo bem? Confirmando nossa agenda exclusiva para daqui a 2 dias. O time já preparou a análise do seu perfil.'),(8,'novo','5M+',2,'whatsapp','Olá {nome}, tudo bem? Confirmando nossa agenda exclusiva para daqui a 2 dias. O time já preparou a análise do seu perfil.'),(9,'novo','100k-300k',7,'whatsapp','Oi {nome}, vi que você agendou para a próxima semana. Para adiantar, consegue me enviar sua carteira atual?'),(10,'novo','500k-1M',7,'whatsapp','Olá {nome}, sua reunião é na próxima semana. Para que o consultor chegue preparado, poderia nos enviar seus ativos atuais?'),(11,'novo','1M+',7,'whatsapp','Olá {nome}, tudo bem? Para otimizarmos seu tempo na reunião da semana que vem, seria ótimo recebermos seus dados de carteira previamente.'),(12,'novo','5M+',7,'whatsapp','Olá {nome}, tudo bem? Para otimizarmos seu tempo na reunião da semana que vem, seria ótimo recebermos seus dados de carteira previamente.'),(13,'upsell','1M+',2,'whatsapp','Oi {nome}, bom te ver de novo! Tudo pronto para nossa revisão de carteira daqui a 2 dias?'),(14,'retorno','N/A',2,'whatsapp','Olá {nome}, bem-vindo de volta! Sua reunião de reativação é daqui a 2 dias. Aguardamos você.'),(15,'retorno','N/A',7,'whatsapp','Olá {nome}, tudo bem? Sua reunião de retorno está chegando na próxima semana. Estamos ansiosos para te ver!'),(16,'upsell','1M+',7,'whatsapp','Olá {nome}, tudo certo? Nossa revisão de estratégia está marcada para a próxima semana. O time já está preparando os dados.');
/*!40000 ALTER TABLE `message_templates` ENABLE KEYS */;
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
