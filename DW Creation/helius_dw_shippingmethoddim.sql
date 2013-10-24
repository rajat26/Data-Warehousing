CREATE DATABASE  IF NOT EXISTS `helius_dw` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `helius_dw`;
-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: localhost    Database: helius_dw
-- ------------------------------------------------------
-- Server version	5.5.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `shippingmethoddim`
--

DROP TABLE IF EXISTS `shippingmethoddim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shippingmethoddim` (
  `ShipMethodKey` bigint(20) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `ShippingMethodId` int(11) DEFAULT NULL,
  `Name` varchar(250) DEFAULT NULL,
  `ShipBase` decimal(19,4) DEFAULT NULL,
  `ShipRate` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`ShipMethodKey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippingmethoddim`
--

LOCK TABLES `shippingmethoddim` WRITE;
/*!40000 ALTER TABLE `shippingmethoddim` DISABLE KEYS */;
INSERT INTO `shippingmethoddim` VALUES (0,1,NULL,NULL,NULL,NULL,NULL,NULL),(1,1,'2011-11-22 22:17:45','2199-12-31 23:59:59',3,'Air',19.9900,4.9900),(2,1,'2011-11-22 22:17:45','2199-12-31 23:59:59',1,'Standard',4.9900,0.9900),(3,1,'2011-11-22 22:17:45','2199-12-31 23:59:59',2,'Express',9.9900,1.9900);
/*!40000 ALTER TABLE `shippingmethoddim` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-11-23 20:55:34
