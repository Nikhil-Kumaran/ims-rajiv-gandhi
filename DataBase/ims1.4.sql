-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: imsuser
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(10) NOT NULL,
  `country` varchar(10) NOT NULL,
  `lastlogin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gender` varchar(1) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `rid` (`rid`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,1,'nike','12345','Nikhil Kumaran','9962142337','nikhil.kumaran.2011@gmail.com','No:25/35, G2, Nanchil Castle, New colony 2nd street, Adambakkam','CHENNAI','India','2018-07-01 04:56:50','M'),(2,2,'kkv','123','keerthi','9789886933','kkv@gmail.com','SVCE','CHENNAI','India','2018-07-01 05:23:52','M');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `cid` int(11) NOT NULL,
  `cname` varchar(50) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'food'),(2,'electronics'),(3,'stationary');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaints` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `transid` int(11) NOT NULL,
  `ctype` int(11) NOT NULL,
  `cdesc` varchar(700) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `transid` (`transid`),
  KEY `ctype` (`ctype`),
  CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`transid`) REFERENCES `transaction` (`transid`),
  CONSTRAINT `complaints_ibfk_2` FOREIGN KEY (`ctype`) REFERENCES `complaintstatus` (`ctype`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
INSERT INTO `complaints` VALUES (1,5,0,'sadf'),(2,14,0,'product was not came'),(3,10,0,'why you canceled');
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaintstatus`
--

DROP TABLE IF EXISTS `complaintstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaintstatus` (
  `ctype` int(11) NOT NULL,
  `cname` varchar(100) NOT NULL,
  PRIMARY KEY (`ctype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaintstatus`
--

LOCK TABLES `complaintstatus` WRITE;
/*!40000 ALTER TABLE `complaintstatus` DISABLE KEYS */;
INSERT INTO `complaintstatus` VALUES (0,'pending'),(1,'completed');
/*!40000 ALTER TABLE `complaintstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept` (
  `deptid` int(11) NOT NULL AUTO_INCREMENT,
  `deptname` varchar(100) NOT NULL,
  PRIMARY KEY (`deptid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES (1,'Human Resource'),(2,'computer science');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designation` (
  `desid` int(11) NOT NULL AUTO_INCREMENT,
  `desname` varchar(100) NOT NULL,
  PRIMARY KEY (`desid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation`
--

LOCK TABLES `designation` WRITE;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
INSERT INTO `designation` VALUES (1,'lab incharge');
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `tcid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `iname` varchar(50) NOT NULL,
  `ibrand` varchar(50) NOT NULL,
  `iprice` float NOT NULL,
  `iunit` varchar(30) NOT NULL,
  `istock` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `tcid` (`tcid`),
  KEY `cid` (`cid`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`tcid`) REFERENCES `tcategories` (`tcid`),
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `categories` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,3,'Pen','Cello',5,'pieces',68),(2,1,3,'Pencil','Natraja',3,'pieces',50),(3,1,3,'Paper','Natraja',100,'bundle',50),(4,1,3,'scale','cello',10,'pieces',40),(5,1,3,'tape','cello',15,'pieces',10),(6,1,3,'pen','Natraja',10,'pieces',10),(7,1,1,'dd','dd',11,'saf',11);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reasontable`
--

DROP TABLE IF EXISTS `reasontable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reasontable` (
  `rtid` int(11) NOT NULL AUTO_INCREMENT,
  `transid` int(11) NOT NULL,
  `reason` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`rtid`),
  KEY `transid` (`transid`),
  CONSTRAINT `reasontable_ibfk_1` FOREIGN KEY (`transid`) REFERENCES `transaction` (`transid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reasontable`
--

LOCK TABLES `reasontable` WRITE;
/*!40000 ALTER TABLE `reasontable` DISABLE KEYS */;
INSERT INTO `reasontable` VALUES (1,10,'You Have A MEMO');
/*!40000 ALTER TABLE `reasontable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `rid` int(11) NOT NULL,
  `rpermission` varchar(10) NOT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `rpermission` (`rpermission`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'viewonly'),(2,'viewupdate');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcategories`
--

DROP TABLE IF EXISTS `tcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcategories` (
  `tcid` int(11) NOT NULL,
  `tcname` varchar(50) NOT NULL,
  PRIMARY KEY (`tcid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcategories`
--

LOCK TABLES `tcategories` WRITE;
/*!40000 ALTER TABLE `tcategories` DISABLE KEYS */;
INSERT INTO `tcategories` VALUES (1,'consumable'),(2,'nonconsumable');
/*!40000 ALTER TABLE `tcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `transid` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) NOT NULL,
  `ttid` int(11) NOT NULL,
  `custid` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`transid`),
  KEY `iid` (`iid`),
  KEY `custid` (`custid`),
  KEY `ttid` (`ttid`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `items` (`iid`),
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`custid`) REFERENCES `user` (`custid`),
  CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`ttid`) REFERENCES `transactiontype` (`ttid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,1,2,8,'2018-07-04 19:39:26',34),(5,1,1,8,'2018-06-23 13:30:21',23),(6,2,2,8,'2018-07-04 20:53:45',2),(7,2,2,8,'2018-07-04 20:53:42',2),(8,2,5,9,'2018-06-10 04:09:04',98),(9,3,1,8,'2018-06-23 13:30:21',88),(10,1,2,8,'2018-06-23 12:34:52',12),(12,2,1,8,'2018-06-23 18:13:11',20),(13,3,1,8,'2018-06-23 18:13:31',10),(14,3,2,8,'2018-07-04 19:39:08',34),(15,1,3,8,'2018-07-04 19:31:30',2),(16,1,3,8,'2018-07-04 19:29:31',10),(17,1,5,8,'2018-07-04 20:49:46',8);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactiontype`
--

DROP TABLE IF EXISTS `transactiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactiontype` (
  `ttid` int(11) NOT NULL,
  `ttname` varchar(50) NOT NULL,
  PRIMARY KEY (`ttid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactiontype`
--

LOCK TABLES `transactiontype` WRITE;
/*!40000 ALTER TABLE `transactiontype` DISABLE KEYS */;
INSERT INTO `transactiontype` VALUES (1,'requested'),(2,'cancledbyadmin'),(3,'success'),(4,'cancledbyuser'),(5,'incart'),(6,'returned');
/*!40000 ALTER TABLE `transactiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `custid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(250) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(10) NOT NULL,
  `country` varchar(10) NOT NULL,
  `lastlogin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gender` varchar(1) NOT NULL,
  `purchased` int(11) DEFAULT NULL,
  `deptid` int(11) NOT NULL,
  `desid` int(11) NOT NULL,
  PRIMARY KEY (`custid`),
  KEY `deptid` (`deptid`),
  KEY `desid` (`desid`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`deptid`) REFERENCES `dept` (`deptid`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`desid`) REFERENCES `designation` (`desid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (8,'kkv','827ccb0eea8a706c4c34a16891f84e7b','keerthivaasan','9876','sklj@lkfs.ck','sajd,paisouidf','lasjkf','soasfd','2018-06-02 14:51:08','m',0,2,1),(9,'nikhil','827ccb0eea8a706c4c34a16891f84e7b','nikhil','4456789','ljkhgf@lkjhg.fd','ouiytrdvbb','iuytfggh','iuytre','2018-06-10 04:05:26','m',0,1,1),(10,'nattu','202cb962ac59075b964b07152d234b70','Natraj','1234567890','nattu@gmail.com','Anna nagar west','CHENNAI','India','2018-07-01 15:32:18','M',0,1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-05  2:32:24
