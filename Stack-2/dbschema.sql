CREATE DATABASE  IF NOT EXISTS `rdportal` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `rdportal`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: rdportal
-- ------------------------------------------------------
-- Server version	5.5.25

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
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature` (
  `Feature_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Feature_Name` varchar(50) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Feature_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
INSERT INTO `feature` VALUES (1,'Dashboard','Dashboard'),(2,'Administration','Administration');
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `Organization_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Organization_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'Raghu Devops','Raghu Devops Portal');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `Role_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Role_Name` varchar(50) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Role_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin','Admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_feature_association`
--

DROP TABLE IF EXISTS `role_feature_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_feature_association` (
  `RF_Association_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Role_Id` int(10) NOT NULL,
  `Feature_Id` int(10) NOT NULL,
  `Sub_Feature_Id` int(10) NOT NULL,
  PRIMARY KEY (`RF_Association_Id`),
  KEY `FKRole_Featu830338` (`Feature_Id`),
  KEY `FKRole_Featu492945` (`Role_Id`),
  CONSTRAINT `FKRole_Featu492945` FOREIGN KEY (`Role_Id`) REFERENCES `role` (`Role_Id`),
  CONSTRAINT `FKRole_Featu830338` FOREIGN KEY (`Feature_Id`) REFERENCES `feature` (`Feature_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_feature_association`
--

LOCK TABLES `role_feature_association` WRITE;
/*!40000 ALTER TABLE `role_feature_association` DISABLE KEYS */;
INSERT INTO `role_feature_association` VALUES (1,1,1,1),(2,1,2,2),(3,1,2,3);
/*!40000 ALTER TABLE `role_feature_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_feature`
--

DROP TABLE IF EXISTS `sub_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_feature` (
  `Sub_Feature_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Sub_Feature_Name` varchar(45) NOT NULL,
  `Sub_Feature_Desc` varchar(100) NOT NULL,
  `Sub_Feature_URL` varchar(100) NOT NULL,
  `Feature_Id` int(10) NOT NULL,
  PRIMARY KEY (`Sub_Feature_Id`),
  KEY `FEATURE_FK_idx` (`Feature_Id`),
  CONSTRAINT `FEATURE_FK` FOREIGN KEY (`Feature_Id`) REFERENCES `feature` (`Feature_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_feature`
--

LOCK TABLES `sub_feature` WRITE;
/*!40000 ALTER TABLE `sub_feature` DISABLE KEYS */;
INSERT INTO `sub_feature` VALUES (1,'Dashboard','Dashboard','#/dashboard',1),(2,'Role','Role','#/role',2),(3,'User','User','#/user',2);
/*!40000 ALTER TABLE `sub_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `User_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Role_Id` int(10) NOT NULL,
  `Fullname` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Dob` varchar(10) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Identity_Number` varchar(50) DEFAULT NULL,
  `User_Type` varchar(50) NOT NULL,
  `Primary_Email` varchar(50) DEFAULT NULL,
  `Alternate_Email` varchar(50) DEFAULT NULL,
  `Primary_Mobile_No` varchar(15) DEFAULT NULL,
  `Alternate_Mobile_No` varchar(15) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Zipcode` int(10) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Created_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Created_By` int(10) NOT NULL,
  `Updated_Date` timestamp NULL DEFAULT NULL,
  `Updated_By` int(10) DEFAULT NULL,
  PRIMARY KEY (`User_Id`),
  KEY `FKUser306250` (`Role_Id`),
  CONSTRAINT `FKUser306250` FOREIGN KEY (`Role_Id`) REFERENCES `role` (`Role_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'admin','admin','YWRtaW4=','20-07-1986','M',NULL,'Internal','test@gmail.com','test@gmail.com','757',NULL,'India','AP','Hyderabad',500072,NULL,'2018-01-08 17:31:41',0,'2017-08-07 18:20:59',9);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_org_association`
--

DROP TABLE IF EXISTS `user_org_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_org_association` (
  `UO_Association_Id` int(10) NOT NULL AUTO_INCREMENT,
  `User_Id` int(10) NOT NULL,
  `Org_Level_Type` varchar(255) NOT NULL,
  `Org_Level_Id` int(10) NOT NULL,
  PRIMARY KEY (`UO_Association_Id`),
  KEY `FKUser_Org_A351348` (`User_Id`),
  CONSTRAINT `FKUser_Org_A351348` FOREIGN KEY (`User_Id`) REFERENCES `user` (`User_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_org_association`
--

LOCK TABLES `user_org_association` WRITE;
/*!40000 ALTER TABLE `user_org_association` DISABLE KEYS */;
INSERT INTO `user_org_association` VALUES (1,1,'Orgnization',1);
/*!40000 ALTER TABLE `user_org_association` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-08 23:19:29
