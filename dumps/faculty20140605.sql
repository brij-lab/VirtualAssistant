CREATE DATABASE  IF NOT EXISTS `facultycontact` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `facultycontact`;
-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: facultycontact
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.13.10.1

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
-- Table structure for table `faculty_info`
--

DROP TABLE IF EXISTS `faculty_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_id` int(11) DEFAULT NULL,
  `info` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_info`
--

LOCK TABLES `faculty_info` WRITE;
/*!40000 ALTER TABLE `faculty_info` DISABLE KEYS */;
INSERT INTO `faculty_info` VALUES (1,1,'9701387741',4),(2,1,'1905',6),(3,1,'1177',5);
/*!40000 ALTER TABLE `faculty_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_names`
--

DROP TABLE IF EXISTS `faculty_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_names`
--

LOCK TABLES `faculty_names` WRITE;
/*!40000 ALTER TABLE `faculty_names` DISABLE KEYS */;
INSERT INTO `faculty_names` VALUES (1,'Kishore S. P.');
/*!40000 ALTER TABLE `faculty_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_type`
--

DROP TABLE IF EXISTS `info_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_type` (
  `id` int(11) NOT NULL,
  `value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_type`
--

LOCK TABLES `info_type` WRITE;
/*!40000 ALTER TABLE `info_type` DISABLE KEYS */;
INSERT INTO `info_type` VALUES (1,'phone'),(2,'office'),(3,'residential'),(4,'mobile'),(5,'extension'),(6,'residential extension');
/*!40000 ALTER TABLE `info_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `synonyms`
--

DROP TABLE IF EXISTS `synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonyms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `syn` varchar(200) DEFAULT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `synonyms`
--

LOCK TABLES `synonyms` WRITE;
/*!40000 ALTER TABLE `synonyms` DISABLE KEYS */;
INSERT INTO `synonyms` VALUES (1,'kishore',1),(2,'prahallad',1),(3,'kp',1),(4,'k p',1),(5,'kishore prahallad',1);
/*!40000 ALTER TABLE `synonyms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-05 18:46:23
