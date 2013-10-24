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
-- Table structure for table `salesorderheader`
--

DROP TABLE IF EXISTS `salesorderheader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesorderheader` (
  `SalesOrderId` int(10) NOT NULL AUTO_INCREMENT,
  `RevisionNumber` int(10) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `DueDate` datetime DEFAULT NULL,
  `ShipDate` datetime DEFAULT NULL,
  `Status` int(10) DEFAULT NULL,
  `OnlineOrderFlag` tinyint(1) DEFAULT NULL,
  `SalesOrderNumber` varchar(25) DEFAULT NULL,
  `PurchaseOrderNumber` varchar(1024) DEFAULT NULL,
  `AccountNumber` varchar(1024) DEFAULT NULL,
  `CustomerId` int(10) DEFAULT NULL,
  `ContactId` int(10) DEFAULT NULL,
  `SalesPersonId` int(10) DEFAULT NULL,
  `TerritoryId` int(10) DEFAULT NULL,
  `BillToAddressId` int(10) DEFAULT NULL,
  `ShipToAddressId` int(10) DEFAULT NULL,
  `ShipMethodId` int(10) DEFAULT NULL,
  `CreditCardApprovalCode` varchar(15) DEFAULT NULL,
  `CurrencyRateCode` int(10) DEFAULT NULL,
  `SubTotal` decimal(19,4) DEFAULT NULL,
  `TaxAmt` decimal(19,4) DEFAULT NULL,
  `Freight` decimal(19,4) DEFAULT NULL,
  `TotalDue` decimal(19,4) DEFAULT NULL,
  `Comment` varchar(128) DEFAULT NULL,
  `CreditCardId` int(10) DEFAULT NULL,
  PRIMARY KEY (`SalesOrderId`),
  UNIQUE KEY `SalesOrderNumber_UNIQUE` (`SalesOrderNumber`),
  KEY `BillTo` (`BillToAddressId`),
  KEY `ShipTo` (`ShipToAddressId`),
  KEY `ShipMethd` (`ShipMethodId`),
  KEY `Crncy` (`CurrencyRateCode`),
  KEY `Crdt` (`CreditCardId`),
  KEY `Custm` (`CustomerId`),
  KEY `Contc` (`ContactId`),
  KEY `Salsp` (`SalesPersonId`),
  KEY `Teri` (`TerritoryId`),
  CONSTRAINT `BillTo` FOREIGN KEY (`BillToAddressId`) REFERENCES `address` (`AddressId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Contc` FOREIGN KEY (`ContactId`) REFERENCES `contact` (`ContactId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Crdt` FOREIGN KEY (`CreditCardId`) REFERENCES `creditcard` (`CreditCardId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Crncy` FOREIGN KEY (`CurrencyRateCode`) REFERENCES `currencyrate` (`CurrencyRateId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Custm` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Salsp` FOREIGN KEY (`SalesPersonId`) REFERENCES `salesperson` (`SalesPersonId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ShipMethd` FOREIGN KEY (`ShipMethodId`) REFERENCES `shipmethod` (`ShipMethodId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ShipTo` FOREIGN KEY (`ShipToAddressId`) REFERENCES `address` (`AddressId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Teri` FOREIGN KEY (`TerritoryId`) REFERENCES `salesterritory` (`TerritoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesorderheader`
--

LOCK TABLES `salesorderheader` WRITE;
/*!40000 ALTER TABLE `salesorderheader` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesorderheader` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-10-26  6:57:27
