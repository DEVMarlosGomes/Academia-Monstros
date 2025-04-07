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
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aula` (
  `ID_Aula` int NOT NULL,
  `Nome_Aula` varchar(100) DEFAULT NULL,
  `Horario` time DEFAULT NULL,
  `Duracao` int DEFAULT NULL,
  `Modalidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Aula`),
  KEY `idx_aula_horario` (`Horario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` VALUES (1,'Yoga','08:00:00',60,'Relaxamento'),(2,'Crossfit','10:00:00',45,'Intensivo'),(3,'Pilates','14:00:00',50,'Fortalecimento');
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aula_instrutor`
--

DROP TABLE IF EXISTS `aula_instrutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aula_instrutor` (
  `ID_Aula` int NOT NULL,
  `ID_Instrutor` int DEFAULT NULL,
  `Nome_instrutor` varchar(20) DEFAULT NULL,
  `Nome_aula` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Aula`),
  KEY `ID_Instrutor` (`ID_Instrutor`),
  CONSTRAINT `aula_instrutor_ibfk_1` FOREIGN KEY (`ID_Aula`) REFERENCES `aula` (`ID_Aula`),
  CONSTRAINT `aula_instrutor_ibfk_2` FOREIGN KEY (`ID_Instrutor`) REFERENCES `instrutor` (`ID_Instrutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula_instrutor`
--

LOCK TABLES `aula_instrutor` WRITE;
/*!40000 ALTER TABLE `aula_instrutor` DISABLE KEYS */;
INSERT INTO `aula_instrutor` VALUES (1,1,'Ana Costa','Yoga'),(2,2,'Bruno Lima','Crossfit'),(3,3,'Clara Souza','Pilates');
/*!40000 ALTER TABLE `aula_instrutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipamento`
--

DROP TABLE IF EXISTS `equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipamento` (
  `ID_Equipamento` int NOT NULL,
  `Nome_Equipamento` varchar(100) DEFAULT NULL,
  `Quantidade` int DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Equipamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipamento`
--

LOCK TABLES `equipamento` WRITE;
/*!40000 ALTER TABLE `equipamento` DISABLE KEYS */;
INSERT INTO `equipamento` VALUES (1,'Halteres',20,'Disponível'),(2,'Esteira',5,'Em Manutenção'),(3,'Bicicleta Ergométrica',10,'Disponível');
/*!40000 ALTER TABLE `equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipamento_aula`
--

DROP TABLE IF EXISTS `equipamento_aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipamento_aula` (
  `ID_Equipamento` int NOT NULL,
  `ID_Aula` int NOT NULL,
  `Nome_equipamento` varchar(100) DEFAULT NULL,
  `Nome_aula` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Equipamento`,`ID_Aula`),
  KEY `ID_Aula` (`ID_Aula`),
  CONSTRAINT `equipamento_aula_ibfk_1` FOREIGN KEY (`ID_Equipamento`) REFERENCES `equipamento` (`ID_Equipamento`),
  CONSTRAINT `equipamento_aula_ibfk_2` FOREIGN KEY (`ID_Aula`) REFERENCES `aula` (`ID_Aula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipamento_aula`
--

LOCK TABLES `equipamento_aula` WRITE;
/*!40000 ALTER TABLE `equipamento_aula` DISABLE KEYS */;
INSERT INTO `equipamento_aula` VALUES (1,1,'Halteres','Yoga'),(2,2,'Esteira','Crossfit'),(3,3,'Bicicleta Ergométrica','Pilates');
/*!40000 ALTER TABLE `equipamento_aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrutor`
--

DROP TABLE IF EXISTS `instrutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instrutor` (
  `ID_Instrutor` int NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Especialidade` varchar(100) DEFAULT NULL,
  `Telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID_Instrutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrutor`
--

LOCK TABLES `instrutor` WRITE;
/*!40000 ALTER TABLE `instrutor` DISABLE KEYS */;
INSERT INTO `instrutor` VALUES (1,'Ana Costa','Yoga','(11) 95432-1987'),(2,'Bruno Lima','Crossfit','(11) 96543-2871'),(3,'Clara Souza','Pilates','(11) 97654-3765');
/*!40000 ALTER TABLE `instrutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membro`
--

DROP TABLE IF EXISTS `membro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membro` (
  `ID_Membro` int NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Data_Nascimento` date DEFAULT NULL,
  `Endereco` varchar(200) DEFAULT NULL,
  `Telefone` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Membro`),
  KEY `idx_membro_nome` (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membro`
--

LOCK TABLES `membro` WRITE;
/*!40000 ALTER TABLE `membro` DISABLE KEYS */;
INSERT INTO `membro` VALUES (1,'João Silva','1990-05-15','Rua das Flores, 123','(11) 98765-4321','joao.silva@email.com'),(2,'Maria Oliveira','1985-08-22','Avenida Central, 456','(11) 91234-5678','maria.oliveira@email.com'),(3,'Carlos Santos','1993-03-10','Travessa das Palmeiras, 789','(11) 99876-5432','carlos.santos@email.com');
/*!40000 ALTER TABLE `membro` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `membro_plano`
--

DROP TABLE IF EXISTS `membro_plano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membro_plano` (
  `ID_Membro` int NOT NULL,
  `ID_Plano` int NOT NULL,
  `Nome_membro` varchar(100) DEFAULT NULL,
  `Nome_plano` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Membro`,`ID_Plano`),
  KEY `ID_Plano` (`ID_Plano`),
  CONSTRAINT `membro_plano_ibfk_1` FOREIGN KEY (`ID_Membro`) REFERENCES `membro` (`ID_Membro`),
  CONSTRAINT `membro_plano_ibfk_2` FOREIGN KEY (`ID_Plano`) REFERENCES `plano` (`ID_Plano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membro_plano`
--

LOCK TABLES `membro_plano` WRITE;
/*!40000 ALTER TABLE `membro_plano` DISABLE KEYS */;
INSERT INTO `membro_plano` VALUES (1,1,'João Silva','Plano Básico'),(2,2,'Maria Oliveira','Plano Premium'),(3,3,'Carlos Santos','Plano VIP');
/*!40000 ALTER TABLE `membro_plano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `ID_Pagamento` int NOT NULL,
  `Data_Pagamento` date NOT NULL,
  `Valor` decimal(10,2) NOT NULL,
  `ID_Membro` int NOT NULL,
  `ID_Plano` int NOT NULL,
  PRIMARY KEY (`ID_Pagamento`,`Data_Pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (year(`Data_Pagamento`))
(PARTITION p2024 VALUES LESS THAN (2025) ENGINE = InnoDB,
 PARTITION p2025 VALUES LESS THAN (2026) ENGINE = InnoDB,
 PARTITION p2026 VALUES LESS THAN (2027) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,'2024-05-10',150.00,1,1),(2,'2025-05-10',155.00,2,2),(3,'2026-05-10',160.00,3,3);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plano`
--

DROP TABLE IF EXISTS `plano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plano` (
  `ID_Plano` int NOT NULL,
  `Nome_Plano` varchar(100) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Valor` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Plano`),
  KEY `idx_plano_tipo` (`Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano`
--

LOCK TABLES `plano` WRITE;
/*!40000 ALTER TABLE `plano` DISABLE KEYS */;
INSERT INTO `plano` VALUES (1,'Plano Básico','Mensal',99.90),(2,'Plano Premium','Anual',999.00),(3,'Plano VIP','Semestral',599.50);
/*!40000 ALTER TABLE `plano` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-24 21:10:46
