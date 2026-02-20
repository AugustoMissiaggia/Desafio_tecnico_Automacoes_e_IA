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
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `data_reuniao` datetime NOT NULL,
  `canal_origem` varchar(50) DEFAULT 'Google Ads',
  `patrimonio_faixa` varchar(50) DEFAULT NULL,
  `tipo_lead` enum('novo','retorno','upsell') NOT NULL,
  `status` enum('AGENDADO','EM_CADENCIA','CONFIRMADO','REAGENDADO','CANCELADO','NO_SHOW','EXPIRADO','CONCLUIDO') DEFAULT 'AGENDADO',
  `processing_lock` tinyint(1) DEFAULT '0',
  `last_processed_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `next_action_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
INSERT INTO `leads` VALUES (1,'Carlos Curto 1','5511999991001','carlos@teste.com','2026-02-21 10:00:00','Instagram','100k-300k','novo','EM_CADENCIA',0,'2026-02-19 23:03:25','2026-02-19 22:51:56','2026-02-20 23:03:29'),(2,'Ana Curta 2','5511999991002','ana@teste.com','2026-02-21 11:00:00','Google Ads','300k-500k','novo','EM_CADENCIA',0,'2026-02-19 23:03:25','2026-02-19 22:51:56','2026-02-20 23:03:31'),(3,'Roberto Curto 3','5511999991003','beto@teste.com','2026-02-21 14:00:00','Indicação','500k-1M','novo','EM_CADENCIA',0,'2026-02-19 23:03:25','2026-02-19 22:51:56','2026-02-20 23:03:32'),(4,'Fernanda Curta 4','5511999991004','fer@teste.com','2026-02-21 15:00:00','Youtube','1M+','novo','EM_CADENCIA',0,'2026-02-19 23:03:25','2026-02-19 22:51:56','2026-02-20 23:03:34'),(5,'Lucas Curto 5','5511999991005','lucas@teste.com','2026-02-21 16:00:00','Linkedin','5M+','novo','EM_CADENCIA',0,'2026-02-19 23:03:25','2026-02-19 22:51:56','2026-02-20 23:03:36'),(6,'Mariana Longa 1','5511999992001','mari@teste.com','2026-02-26 10:00:00','Google Ads','100k-300k','novo','EM_CADENCIA',0,'2026-02-19 23:03:25','2026-02-19 22:51:56','2026-02-20 23:03:37'),(7,'Pedro Longo 2','5511999992002','pedro@teste.com','2026-02-26 11:00:00','Instagram','500k-1M','novo','EM_CADENCIA',0,'2026-02-19 23:03:25','2026-02-19 22:51:56','2026-02-20 23:03:40'),(8,'Juliana Longa 3','5511999992003','ju@teste.com','2026-02-26 14:00:00','Indicação','1M+','novo','EM_CADENCIA',0,'2026-02-19 23:03:25','2026-02-19 22:51:56','2026-02-20 23:03:42'),(9,'Ricardo Longo 4','5511999992004','rick@teste.com','2026-02-26 15:00:00','Youtube','300k-500k','novo','EM_CADENCIA',0,'2026-02-19 23:03:25','2026-02-19 22:51:56','2026-02-20 23:03:43'),(10,'Sonia Longa 5','5511999992005','sonia@teste.com','2026-02-26 16:00:00','Google Ads','5M+','novo','EM_CADENCIA',0,'2026-02-19 23:03:25','2026-02-19 22:51:56','2026-02-20 23:03:45'),(11,'Cancelador Um','5511999993001','cancel1@teste.com','2026-02-22 00:00:00','Google Ads','100k-300k','novo','CANCELADO',0,'2026-02-19 23:07:36','2026-02-19 22:51:57',NULL),(12,'Cancelador Dois','5511999993002','cancel2@teste.com','2026-02-23 00:00:00','Instagram','500k-1M','novo','CANCELADO',0,'2026-02-19 23:07:36','2026-02-19 22:51:57',NULL),(13,'Cancelador Três','5511999993003','cancel3@teste.com','2026-02-24 00:00:00','Youtube','1M+','novo','CANCELADO',0,'2026-02-19 23:07:36','2026-02-19 22:51:57',NULL),(14,'Reagendado Um','5511999994001','rea1@teste.com','2026-03-01 10:00:00','Google Ads','100k-300k','novo','AGENDADO',0,'2026-02-19 23:07:36','2026-02-19 22:51:57','2026-02-19 23:07:27'),(15,'Reagendado Dois','5511999994002','rea2@teste.com','2026-02-21 14:00:00','Indicação','500k-1M','novo','EM_CADENCIA',0,'2026-02-19 23:07:36','2026-02-19 22:51:57','2026-02-20 23:07:38'),(16,'Reagendado Três','5511999994003','rea3@teste.com','2026-03-06 16:00:00','Linkedin','1M+','novo','AGENDADO',0,'2026-02-19 23:07:36','2026-02-19 22:51:57','2026-02-19 23:07:27'),(17,'Cliente Antigo A','5511999995001','antigo@teste.com','2026-02-21 10:00:00','Base Interna','N/A','retorno','EM_CADENCIA',0,'2026-02-19 23:07:26','2026-02-19 22:51:57','2026-02-20 23:07:30'),(18,'Cliente Upsell B','5511999995002','upsell@teste.com','2026-02-21 11:00:00','Email Mkt','1M+','upsell','EM_CADENCIA',0,'2026-02-19 23:07:26','2026-02-19 22:51:57','2026-02-20 23:07:32'),(19,'João Original','551199999DUPL','joao@teste.com','2026-02-21 10:00:00','Google Ads','300k-500k','novo','EM_CADENCIA',0,'2026-02-19 23:07:26','2026-02-19 22:51:57','2026-02-20 23:07:33'),(20,'João Duplicado','551199999DUPL','joao.dup@teste.com','2026-02-21 12:00:00','Instagram','300k-500k','novo','AGENDADO',0,'2026-02-19 23:07:36','2026-02-19 22:51:57',NULL),(21,'Variado Futuro 1','5511999997001','v1@teste.com','2026-03-06 00:00:00','Google','100k-300k','novo','AGENDADO',0,'2026-02-19 23:07:36','2026-02-19 22:51:57',NULL),(22,'Variado Futuro 2','5511999997002','v2@teste.com','2026-03-11 00:00:00','Google','500k-1M','novo','AGENDADO',0,'2026-02-19 23:07:36','2026-02-19 22:51:57',NULL),(23,'Variado Passado 3','5511999997003','v3@teste.com','2026-02-18 00:00:00','Youtube','1M+','novo','EXPIRADO',0,'2026-02-19 23:07:36','2026-02-19 22:51:57',NULL),(24,'Variado NoShow 4','5511999997004','v4@teste.com','2026-02-17 00:00:00','Indicação','300k-500k','novo','NO_SHOW',0,NULL,'2026-02-19 22:51:57',NULL),(25,'Variado Concluido 5','5511999997005','v5@teste.com','2026-02-14 00:00:00','Google','100k-300k','novo','CONCLUIDO',0,NULL,'2026-02-19 22:51:57',NULL),(26,'Variado Hoje 6','5511999997006','v6@teste.com','2026-02-19 10:00:00','Google','500k-1M','novo','AGENDADO',0,NULL,'2026-02-19 22:51:57',NULL),(27,'Variado Amanha 7','5511999997007','v7@teste.com','2026-02-20 00:00:00','Instagram','1M+','novo','AGENDADO',0,NULL,'2026-02-19 22:51:57',NULL),(28,'Variado Quase 8','5511999997008','v8@teste.com','2026-02-22 00:00:00','Youtube','100k-300k','novo','AGENDADO',0,NULL,'2026-02-19 22:51:57',NULL),(29,'Variado Longe 9','5511999997009','v9@teste.com','2026-02-27 00:00:00','Google','300k-500k','novo','AGENDADO',0,NULL,'2026-02-19 22:51:57',NULL),(30,'Variado Rico 10','5511999997010','v10@teste.com','2026-02-21 18:00:00','Indicação','5M+','novo','AGENDADO',0,NULL,'2026-02-19 22:51:57',NULL);
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
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
