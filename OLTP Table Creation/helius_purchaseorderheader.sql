CREATE DATABASE  IF NOT EXISTS `helius` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `helius`;
-- MySQL dump 10.13  Distrib 5.5.15, for Win32 (x86)
--
-- Host: localhost    Database: helius
-- ------------------------------------------------------
-- Server version	5.5.15

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
-- Table structure for table `purchaseorderheader`
--

DROP TABLE IF EXISTS `purchaseorderheader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaseorderheader` (
  `PurchaseOrderId` int(10) NOT NULL AUTO_INCREMENT,
  `RevisionNumnber` int(10) DEFAULT NULL,
  `Status` int(10) DEFAULT NULL,
  `EmployeeId` int(10) DEFAULT NULL,
  `VendorId` int(10) DEFAULT NULL,
  `ShipMethodId` int(10) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `ShipDate` datetime DEFAULT NULL,
  `SubTotal` decimal(19,4) DEFAULT NULL,
  `TaxAmt` decimal(19,4) DEFAULT NULL,
  `Freight` decimal(19,4) DEFAULT NULL,
  `TotalDue` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`PurchaseOrderId`),
  KEY `Empl` (`EmployeeId`),
  KEY `Ven` (`VendorId`),
  KEY `ShipMeth` (`ShipMethodId`),
  CONSTRAINT `Empl` FOREIGN KEY (`EmployeeId`) REFERENCES `employee` (`EmployeeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ShipMeth` FOREIGN KEY (`ShipMethodId`) REFERENCES `shipmethod` (`ShipMethodId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ven` FOREIGN KEY (`VendorId`) REFERENCES `vendor` (`VendorId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorderheader`
--

LOCK TABLES `purchaseorderheader` WRITE;
/*!40000 ALTER TABLE `purchaseorderheader` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchaseorderheader` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-10-26  6:57:24
