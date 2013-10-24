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
-- Table structure for table `storecontact`
--

DROP TABLE IF EXISTS `storecontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storecontact` (
  `CustomerId` int(10) NOT NULL,
  `ContactId` int(10) NOT NULL,
  `ContactTypeId` int(10) DEFAULT NULL,
  PRIMARY KEY (`CustomerId`,`ContactId`),
  KEY `Customerr` (`CustomerId`),
  KEY `Contactt` (`ContactId`),
  KEY `ContactTypeIdd` (`ContactTypeId`),
  CONSTRAINT `Contactt` FOREIGN KEY (`ContactId`) REFERENCES `contact` (`ContactId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ContactTypeIdd` FOREIGN KEY (`ContactTypeId`) REFERENCES `contacttype` (`ContactTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Customerr` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storecontact`
--

LOCK TABLES `storecontact` WRITE;
/*!40000 ALTER TABLE `storecontact` DISABLE KEYS */;
/*!40000 ALTER TABLE `storecontact` ENABLE KEYS */;
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
