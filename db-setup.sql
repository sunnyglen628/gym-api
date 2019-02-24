-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: gym-app-db
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `medical_history`
--

create database  IF NOT EXISTS gymdb;
use  gymdb;
DROP TABLE IF EXISTS `medical_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medical_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medical_issue_date` datetime DEFAULT NULL,
  `issue` varchar(450) NOT NULL,
  `created_on` varchar(45) NOT NULL,
  `created_by` int(11) NOT NULL,
  `sub_member_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_history`
--

LOCK TABLES `medical_history` WRITE;
/*!40000 ALTER TABLE `medical_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `medical_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'sunnyg','f25ccdc45c0f59455ff1280d834eb541','male','sunnyg.bachu@gmail.com');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_member_id` int(11) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(10) NOT NULL,
  `paid_by` int(11) NOT NULL,
  `payment_date` datetime NOT NULL,
  `next_payment_date` datetime DEFAULT NULL,
  `payment_period_start` datetime NOT NULL,
  `payment_period_end` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_plan`
--

DROP TABLE IF EXISTS `payment_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_of_time` int(11) NOT NULL,
  `time_unit` varchar(45) NOT NULL,
  `plan_name` varchar(45) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_plan`
--

LOCK TABLES `payment_plan` WRITE;
/*!40000 ALTER TABLE `payment_plan` DISABLE KEYS */;
INSERT INTO `payment_plan` VALUES (1,1,'years','1 Year',1,'2019-02-23 21:24:46',0),(2,3,'months','3 Months',1,'2019-02-23 21:24:57',0),(3,1,'months','1 Month',1,'2019-02-23 21:25:09',0);
/*!40000 ALTER TABLE `payment_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_best`
--

DROP TABLE IF EXISTS `personal_best`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_best` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `details` varchar(450) NOT NULL,
  `reps` int(11) DEFAULT NULL,
  `kg` int(11) DEFAULT NULL,
  `time` varchar(10) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `sub_member_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_best`
--

LOCK TABLES `personal_best` WRITE;
/*!40000 ALTER TABLE `personal_best` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_best` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_member`
--

DROP TABLE IF EXISTS `sub_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `gender` varchar(7) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `is_delete` tinyint(4) DEFAULT '0',
  `payment_plan` varchar(45) DEFAULT NULL,
  `payment_start_date` datetime NOT NULL,
  `last_payment_date` datetime NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `address` varchar(145) DEFAULT NULL,
  `payment_plan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_member`
--

LOCK TABLES `sub_member` WRITE;
/*!40000 ALTER TABLE `sub_member` DISABLE KEYS */;
INSERT INTO `sub_member` VALUES (1,'Anthony','Jackson','gravida@rbisit.com','male',1,'2019-02-23 21:28:01',0,'1_years_1','2019-02-23 00:00:00','2020-02-23 00:00:00','9876542314','Seattle, Washington',1),(2,'Rooney','Lindsay','rooney@proin.com','female',1,'2019-02-23 21:29:58',0,'3_months_2','2019-02-23 00:00:00','2019-05-23 00:00:00','2063651020','2863  University Street, Washington',2),(3,'Lionel','Mcmillan','lionel@gmail.com','male',1,'2019-02-23 21:31:35',0,'3_months_2','2019-02-23 00:00:00','2019-05-23 00:00:00','432955908','4 Park St.  Stillwater, MN',2),(4,'Edan','Randall','edan@gmail.com','female',1,'2019-02-23 21:32:53',0,'3_months_2','2019-02-23 00:00:00','2019-05-23 00:00:00','422600213','703C San Juan Street  Vineland, NJ',2),(5,'Jasper','Carson','jasper@gmail.com','female',1,'2019-02-23 21:36:00',0,'3_months_2','2019-02-23 00:00:00','2019-05-23 00:00:00','400468921','301 West Elm Street  Park Forest, IL',2),(6,'Reuben','Pacheco','pacheco@manga.com','male',1,'2019-02-23 21:37:40',0,'3_months_2','2019-02-23 00:00:00','2019-05-23 00:00:00','6754234215','9845 NW. 1st Lane  Owatonna, MN',2),(7,'Simon','Carson','simon@erts.com','male',1,'2019-02-23 21:39:03',0,'3_months_2','2019-02-23 00:00:00','2019-05-23 00:00:00','987892321','703C San Juan Street  Vineland, NJ',2),(8,'James','Isabella','james@gmail.com','male',1,'2019-02-23 21:40:50',0,'1_months_3','2019-02-23 00:00:00','2019-03-23 00:00:00','7684523451','301 West Elm Street  Park Forest, IL',3),(9,'Logan','Sophia','sophia@gmail.com','male',1,'2019-02-23 21:41:54',0,'3_months_2','2019-02-23 00:00:00','2019-05-23 00:00:00','26004376','8069 Valley Farms Ave.  Loganville, GA',2),(10,'Benjamin','Mia','mia@gmail.com','female',1,'2019-02-23 21:42:40',0,'1_months_3','2019-02-23 00:00:00','2019-03-23 00:00:00','40047689','9845 NW. 1st Lane  Owatonna, MN',3),(11,'Aiden','Madison','madison@gmail.com','male',1,'2019-02-23 21:43:36',0,'3_months_2','2019-02-23 00:00:00','2019-05-23 00:00:00','6400768901','703C San Juan Street  Vineland, NJ',2),(12,'Joseph','Victoria','sunnyg9693@gmail.com','male',1,'2019-02-23 21:44:47',0,'3_months_2','2019-02-23 00:00:00','2019-05-23 00:00:00','30041237','9149 E. Glenholme St.  Alpharetta, GA',2);
/*!40000 ALTER TABLE `sub_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(145) NOT NULL,
  `category` varchar(10) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assign_to` varchar(450) NOT NULL,
  `assign_by` int(11) NOT NULL,
  `task` varchar(800) NOT NULL,
  `created_on` datetime NOT NULL,
  `task_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'12',1,'<ol>\n	<li>Chest</li>\n	<li>Biceps</li>\n	<li>Triceps</li>\n</ol>\n','2019-02-23 21:48:06','2019-02-23 21:02:00'),(2,'10',1,'<ol>\n	<li>Chest</li>\n	<li>Biceps</li>\n	<li>Triceps</li>\n</ol>\n','2019-02-23 21:48:06','2019-02-23 21:02:00');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-23 21:48:49
