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
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `chatid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `transid` int(11) DEFAULT NULL,
  `chat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `message` varchar(1000) DEFAULT NULL,
  `p_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`chatid`),
  KEY `transid` (`transid`),
  KEY `userid` (`userid`),
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`transid`) REFERENCES `transaction` (`transid`),
  CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`custid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,8,13,'2018-07-21 04:55:48','Hi, how are you?',1),(2,8,13,'2018-07-21 04:56:13','fine, thank you',2),(3,9,8,'2018-07-21 10:28:06','why you canceled ?',1),(4,9,8,'2018-07-21 10:28:40','coz quantity is very large',2),(5,9,8,'2018-07-21 10:29:05','Oh i see',1),(6,8,13,'2018-07-22 07:22:18','is everything ok?',2),(7,9,8,'2018-07-22 09:39:21','so order less quantity',2),(8,8,13,'2018-07-22 12:06:27','yeah fine',1),(9,9,8,'2018-07-22 12:12:29','ok i understood',1),(10,9,8,'2018-07-23 10:05:26','thats good',2);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
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
  `supplierid` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `tcid` (`tcid`),
  KEY `cid` (`cid`),
  KEY `constraint_name` (`supplierid`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`tcid`) REFERENCES `tcategories` (`tcid`),
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `categories` (`cid`),
  CONSTRAINT `suppfkey` FOREIGN KEY (`supplierid`) REFERENCES `suppliers` (`suppid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,3,'Pen','Cello',5,'pieces',35,NULL),(2,1,3,'Pencil','Natraja',3,'pieces',50,NULL),(3,1,3,'Paper','Natraja',100,'bundle',50,NULL),(4,1,3,'scale','cello',10,'pieces',33,NULL),(5,1,3,'tape','cello',15,'pieces',10,NULL),(6,1,3,'pen','Natraja',10,'pieces',7,NULL),(7,1,1,'dd','dd',11,'saf',11,NULL),(8,1,3,'a4 sheet','JK Copier paper',200,'bundle',40,4);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(1500) NOT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'Date and Time : 2018-07-29 13:50:58      Transid : 44       nikhil has added 15 JK Copier paper a4 sheet into cart'),(2,'Date and Time : 2018-07-29 13:53:10      Transid : 44       nikhil has requested for 15 JK Copier paper a4 sheet'),(3,'Date and Time : 2018-07-29 13:56:07      Transid : 44       nikhil has bought 15 JK Copier paper a4 sheet'),(4,'Date and Time : 2018-07-29 13:57:13      Transid : 45       nikhil has requested for a return of 5 JK Copier paper a4 sheet'),(5,'Date and Time : 2018-07-29 13:57:46      Transid : 45       nikhil has successfully returned 5 JK Copier paper a4 sheet'),(6,'Date and Time : 2018-07-29 13:57:46      Transid : 44       nikhil stock has been updated to 10 JK Copier paper a4 sheet');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
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
-- Table structure for table `returnlookup`
--

DROP TABLE IF EXISTS `returnlookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `returnlookup` (
  `lookupid` int(11) NOT NULL AUTO_INCREMENT,
  `transid` int(11) NOT NULL,
  `retid` int(11) NOT NULL,
  PRIMARY KEY (`lookupid`),
  KEY `transid` (`transid`),
  KEY `retid` (`retid`),
  CONSTRAINT `returnlookup_ibfk_1` FOREIGN KEY (`transid`) REFERENCES `transaction` (`transid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `returnlookup_ibfk_2` FOREIGN KEY (`retid`) REFERENCES `transaction` (`transid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returnlookup`
--

LOCK TABLES `returnlookup` WRITE;
/*!40000 ALTER TABLE `returnlookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `returnlookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returnstatus`
--

DROP TABLE IF EXISTS `returnstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `returnstatus` (
  `statusid` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`statusid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returnstatus`
--

LOCK TABLES `returnstatus` WRITE;
/*!40000 ALTER TABLE `returnstatus` DISABLE KEYS */;
INSERT INTO `returnstatus` VALUES (1,'pending'),(2,'accepted'),(3,'rejected');
/*!40000 ALTER TABLE `returnstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returntable`
--

DROP TABLE IF EXISTS `returntable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `returntable` (
  `retid` int(11) NOT NULL AUTO_INCREMENT,
  `transid` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `retstatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`retid`),
  KEY `transid` (`transid`),
  KEY `retstatus` (`retstatus`),
  CONSTRAINT `returntable_ibfk_1` FOREIGN KEY (`transid`) REFERENCES `transaction` (`transid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `returntable_ibfk_2` FOREIGN KEY (`retstatus`) REFERENCES `returnstatus` (`statusid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returntable`
--

LOCK TABLES `returntable` WRITE;
/*!40000 ALTER TABLE `returntable` DISABLE KEYS */;
INSERT INTO `returntable` VALUES (2,17,4,3),(3,18,3,2),(4,5,3,1),(5,27,3,2),(39,38,NULL,NULL);
/*!40000 ALTER TABLE `returntable` ENABLE KEYS */;
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
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `suppid` int(11) NOT NULL AUTO_INCREMENT,
  `suppname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`suppid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'kkv and co'),(2,'nattu and co'),(3,'nikhil and co'),(4,'kousic and co'),(5,'svce and co');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
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
  `location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`transid`),
  KEY `iid` (`iid`),
  KEY `custid` (`custid`),
  KEY `ttid` (`ttid`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `items` (`iid`),
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`custid`) REFERENCES `user` (`custid`),
  CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`ttid`) REFERENCES `transactiontype` (`ttid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,1,2,8,'2018-07-04 19:39:26',34,NULL),(5,1,3,8,'2018-07-20 09:52:50',23,NULL),(6,2,2,8,'2018-07-04 20:53:45',2,NULL),(7,2,2,8,'2018-07-04 20:53:42',2,NULL),(8,2,2,9,'2018-07-21 04:59:35',98,NULL),(9,3,1,8,'2018-06-23 13:30:21',88,NULL),(10,1,2,8,'2018-06-23 12:34:52',12,NULL),(12,2,1,8,'2018-06-23 18:13:11',20,NULL),(13,3,1,8,'2018-06-23 18:13:31',10,NULL),(14,3,2,8,'2018-07-04 19:39:08',34,NULL),(15,1,3,8,'2018-07-04 19:31:30',2,NULL),(16,1,3,8,'2018-07-20 11:05:39',5,NULL),(17,1,3,8,'2018-07-05 13:31:27',8,NULL),(18,4,3,8,'2018-07-20 11:30:20',2,NULL),(19,1,1,8,'2018-07-05 13:22:56',8,NULL),(20,1,5,8,'2018-07-14 07:50:14',10,NULL),(21,4,5,8,'2018-07-14 07:50:25',15,NULL),(22,1,1,8,'2018-07-21 10:11:29',5,NULL),(25,4,5,8,'2018-07-21 05:00:24',8,NULL),(26,4,5,8,'2018-07-21 05:15:06',8,NULL),(27,4,3,9,'2018-07-21 06:14:12',2,NULL),(28,1,3,9,'2018-07-21 05:25:37',2,NULL),(29,6,3,9,'2018-07-21 05:25:39',3,NULL),(31,4,3,8,'2018-07-29 08:01:59',3,NULL),(32,1,3,8,'2018-07-28 15:25:32',5,'room 101'),(37,1,8,8,'2018-07-29 03:28:29',2,NULL),(38,8,3,8,'2018-07-29 04:08:46',5,'room 101'),(39,8,7,8,'2018-07-29 04:08:46',5,NULL),(40,8,3,9,'2018-07-29 04:15:21',7,'lab 101'),(41,8,7,9,'2018-07-29 04:15:21',3,NULL),(42,4,7,8,'2018-07-29 08:01:59',3,NULL),(44,8,3,9,'2018-07-29 08:27:46',10,'lab 101'),(45,8,7,9,'2018-07-29 08:27:46',5,NULL);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger log_insert_new after insert on transaction for each row
begin	
declare transactionid int;
declare uname varchar(100);
declare qty int;
declare transtype int;
declare itemname varchar(100);
declare itembrand varchar(100);
declare itemtime varchar(100);
declare mess varchar(1000);
set transactionid=new.transid;
set transtype=new.ttid;
set uname=(select username from imsuser.user where custid=new.custid);
set qty=new.quantity;
set itemname=(select iname from imsuser.items where iid=new.iid);
set itembrand=(select ibrand from imsuser.items where iid=new.iid);
set itemtime=new.time;
case(transtype)
when 5 then
set mess=concat('Date and Time : ',itemtime,'      Transid : ',transactionid,'       ',uname,' has added ',qty,' ',itembrand,' ',itemname,' into cart');
when 6 then
set mess=concat('Date and Time : ',itemtime,'      Transid : ',transactionid,'       ',uname,' has requested for a return of ',qty,' ',itembrand,' ',itemname);
end case;
insert into log(message) values (mess);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger log_update_new after update on transaction for each row
begin	
declare transactionid int;
declare uname varchar(100);
declare qty int;
declare transtype int;
declare otranstype int;
declare itemname varchar(100);
declare itembrand varchar(100);
declare itemtime varchar(100);
declare mess varchar(1000);
set transactionid=new.transid;
set transtype=new.ttid;
set otranstype=old.ttid;
set uname=(select username from imsuser.user where custid=new.custid);
set qty=new.quantity;
set itemname=(select iname from imsuser.items where iid=new.iid);
set itembrand=(select ibrand from imsuser.items where iid=new.iid);
set itemtime=new.time;
case(transtype)
when 1 then
set mess=concat('Date and Time : ',itemtime,'      Transid : ',transactionid,'       ',uname,' has requested for ',qty,' ',itembrand,' ',itemname);
when 2 then
set mess=concat('Date and Time : ',itemtime,'      Transid : ',transactionid,'       Request for ',qty,' ',itembrand,' ',itemname,' by ',uname,' has been cancelled by admin');
when 3 then
case when (transtype!=otranstype) then
set mess=concat('Date and Time : ',itemtime,'      Transid : ',transactionid,'       ',uname,' has bought ',qty,' ',itembrand,' ',itemname);
else
set mess=concat('Date and Time : ',itemtime,'      Transid : ',transactionid,'       ',uname,' stock has been updated to ',qty,' ',itembrand,' ',itemname);
end case;
when 4 then
set mess=concat('Date and Time : ',itemtime,'      Transid : ',transactionid,'       Request for ',qty,' ',itembrand,' ',itemname,' by ',uname,' has been cancelled by the user');
when 7 then
set mess=concat('Date and Time : ',itemtime,'      Transid : ',transactionid,'       ',uname,' has successfully returned ',qty,' ',itembrand,' ',itemname);
when 8 then
set mess=concat('Date and Time : ',itemtime,'      Transid : ',transactionid,'       Admin has denied ',uname,' request of returning ',qty,' ',itembrand,' ',itemname);
end case;
insert into log(message) values (mess);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `transactiontype` VALUES (1,'requested'),(2,'cancledbyadmin'),(3,'success'),(4,'cancledbyuser'),(5,'incart'),(6,'returnrequest'),(7,'returnsuccess'),(8,'returndenied');
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
  `location` varchar(200) DEFAULT NULL,
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
INSERT INTO `user` VALUES (8,'kkv','827ccb0eea8a706c4c34a16891f84e7b','keerthivaasan','9876','sklj@lkfs.ck','sajd,paisouidf','lasjkf','soasfd','2018-07-28 14:59:24','m',0,2,1,'room 101'),(9,'nikhil','827ccb0eea8a706c4c34a16891f84e7b','nikhil','4456789','ljkhgf@lkjhg.fd','ouiytrdvbb','iuytfggh','iuytre','2018-07-28 14:59:42','m',0,1,1,'lab 101'),(10,'nattu','202cb962ac59075b964b07152d234b70','Natraj','1234567890','nattu@gmail.com','Anna nagar west','CHENNAI','India','2018-07-01 15:32:18','M',0,1,1,NULL);
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

-- Dump completed on 2018-07-29 14:26:31
