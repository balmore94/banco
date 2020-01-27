-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: si_banco
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `dui` int(11) NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `dui` (`dui`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,77878,'Balmore','Reyes'),(2,211121,'Balmo','Re'),(3,121215848,'Hola','Adios'),(4,77777,'777','777'),(5,656565,'6565','6565'),(6,2232345,'assa','sasa'),(7,23697,'44','44'),(8,2155887,'787','878'),(9,12,'Balmore','Reyes'),(10,67843465,'sda','dsadsd'),(11,87675,'sadf','afs'),(12,566543,'asd','dsad'),(13,10,'sd','ds'),(14,3456867,'sda','dsa'),(15,909,'as','sa'),(16,67,'as','sa'),(17,78,'as','sa'),(18,33,'33','33'),(19,54,'5','5'),(20,7,'7','7'),(21,6,'6','6'),(23,43,'6','6'),(24,98,'98','98'),(25,66,'666','66'),(27,12999,'7','7'),(28,167,'33','33'),(29,2,'2','2'),(30,76,'76','76');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `id_cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) NOT NULL,
  `monto_inicial` decimal(10,2) NOT NULL,
  `creacion` date NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_cuenta`),
  KEY `fk_client` (`cliente`),
  CONSTRAINT `fk_client` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'Cuenta de Ahorros',200.00,'2020-01-01',201.00,1,1),(2,'sasas',458.00,'2020-01-25',458.00,1,6),(3,'44',44.00,'2020-01-25',45.00,1,7),(4,'87',777.00,'2020-01-26',777.00,1,8),(5,'sa',10.00,'2020-01-26',10.00,1,6),(6,'44',50.00,'2020-01-26',50.00,1,9),(7,'77',78.00,'2020-01-26',78.00,1,9),(8,'33',33.00,'2020-01-26',33.00,1,28),(9,'2',2.00,'2020-01-26',3.00,1,29),(10,'767',76.00,'2020-01-26',60.00,1,30);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_transaccion`
--

DROP TABLE IF EXISTS `tp_transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_transaccion` (
  `id_tp_tra` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_tpt` varchar(65) NOT NULL,
  PRIMARY KEY (`id_tp_tra`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_transaccion`
--

LOCK TABLES `tp_transaccion` WRITE;
/*!40000 ALTER TABLE `tp_transaccion` DISABLE KEYS */;
INSERT INTO `tp_transaccion` VALUES (1,'Abono'),(2,'Retiro');
/*!40000 ALTER TABLE `tp_transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacciones` (
  `id_tra` int(11) NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,2) NOT NULL,
  `fecha_tra` date NOT NULL,
  `tipo` int(11) NOT NULL,
  `cuenta` int(11) NOT NULL,
  PRIMARY KEY (`id_tra`),
  KEY `fk_tptra` (`tipo`),
  KEY `fk_cta` (`cuenta`),
  CONSTRAINT `fk_cta` FOREIGN KEY (`cuenta`) REFERENCES `cuenta` (`id_cuenta`),
  CONSTRAINT `fk_tptra` FOREIGN KEY (`tipo`) REFERENCES `tp_transaccion` (`id_tp_tra`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
INSERT INTO `transacciones` VALUES (1,1.00,'2020-01-26',1,3),(2,1.00,'2020-01-26',1,1),(3,1.00,'2020-01-26',1,10),(4,1.00,'2020-01-26',1,9),(5,3.00,'2020-01-26',1,10),(6,20.00,'2020-01-26',2,10);
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updateSaldo` AFTER INSERT ON `transacciones` FOR EACH ROW BEGIN 
		IF(NEW.tipo = 1) THEN
			UPDATE cuenta SET cuenta.saldo = (cuenta.saldo + NEW.valor) WHERE (cuenta.id_cuenta = NEW.cuenta);
		ELSE
			UPDATE cuenta SET cuenta.saldo = (cuenta.saldo - NEW.valor) WHERE (cuenta.id_cuenta = NEW.cuenta);
		END IF;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'si_banco'
--

--
-- Dumping routines for database 'si_banco'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-26 20:32:04
