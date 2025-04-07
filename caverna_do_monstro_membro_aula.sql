-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: caverna_do_monstro
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `membro_aula`
--

DROP TABLE IF EXISTS `membro_aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membro_aula` (
  `ID_Membro` int NOT NULL,
  `ID_Aula` int NOT NULL,
  `Nome_membro` varchar(100) DEFAULT NULL,
  `Nome_aula` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Membro`,`ID_Aula`),
  KEY `ID_Aula` (`ID_Aula`),
  KEY `idx_membro_aula` (`ID_Membro`,`ID_Aula`),
  CONSTRAINT `membro_aula_ibfk_1` FOREIGN KEY (`ID_Membro`) REFERENCES `membro` (`ID_Membro`),
  CONSTRAINT `membro_aula_ibfk_2` FOREIGN KEY (`ID_Aula`) REFERENCES `aula` (`ID_Aula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membro_aula`
--

LOCK TABLES `membro_aula` WRITE;
/*!40000 ALTER TABLE `membro_aula` DISABLE KEYS */;
INSERT INTO `membro_aula` VALUES (1,1,'João Silva','Yoga'),(2,2,'Maria Oliveira','Crossfit'),(3,3,'Carlos Santos','Pilates');
/*!40000 ALTER TABLE `membro_aula` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-24 21:06:24
