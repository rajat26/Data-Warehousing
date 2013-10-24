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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `ProductId` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) DEFAULT NULL,
  `ProductNumber` varchar(25) DEFAULT NULL,
  `MakeFlag` tinyint(1) DEFAULT NULL,
  `FinishedGoodFlag` tinyint(1) DEFAULT NULL,
  `Color` varchar(15) DEFAULT NULL,
  `SafetyStockLevel` int(10) DEFAULT NULL,
  `RecorderPoint` int(10) DEFAULT NULL,
  `StandardCost` decimal(19,4) DEFAULT NULL,
  `ListPrice` decimal(19,4) DEFAULT NULL,
  `Size` varchar(5) DEFAULT NULL,
  `SizeUnitMeasureCode` char(3) DEFAULT NULL,
  `WeightUnitMeasureCode` char(3) DEFAULT NULL,
  `Weight` decimal(10,0) DEFAULT NULL,
  `DaysToManufacture` int(10) DEFAULT NULL,
  `ProductLine` char(2) DEFAULT NULL,
  `Class` char(2) DEFAULT NULL,
  `Style` char(2) DEFAULT NULL,
  `ProductSubCategoryId` int(10) DEFAULT NULL,
  `ProductModelId` int(10) DEFAULT NULL,
  `SellStartDate` datetime DEFAULT NULL,
  `SellEndDate` datetime DEFAULT NULL,
  `DiscontinueDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ProductId`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  UNIQUE KEY `ProductNumber_UNIQUE` (`ProductNumber`),
  KEY `ProductM` (`ProductModelId`),
  KEY `ProductSub` (`ProductSubCategoryId`),
  KEY `Size` (`SizeUnitMeasureCode`),
  KEY `Weight` (`WeightUnitMeasureCode`),
  CONSTRAINT `ProductM` FOREIGN KEY (`ProductModelId`) REFERENCES `productmodel` (`ProductModelId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ProductSub` FOREIGN KEY (`ProductSubCategoryId`) REFERENCES `productsubcategory` (`ProductSubCategoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Size` FOREIGN KEY (`SizeUnitMeasureCode`) REFERENCES `unitmeasure` (`UnitMeasureCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Weight` FOREIGN KEY (`WeightUnitMeasureCode`) REFERENCES `unitmeasure` (`UnitMeasureCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-10-26  6:57:25
