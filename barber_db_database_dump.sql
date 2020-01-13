CREATE DATABASE  IF NOT EXISTS `hairsalon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hairsalon`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: hairsalon
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `cust_email` varchar(100) NOT NULL,
  `repeat` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cust_email`),
  UNIQUE KEY `cust_email_UNIQUE` (`cust_email`),
  CONSTRAINT `customers_fk_users` FOREIGN KEY (`cust_email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`cust_email`, `repeat`) VALUES ('a',0),('aaditya.watwe@gmail.com',0),('agapow@msn.com',0),('amcuri@yahoo.ca',0),('amichalo@live.com',1),('atmarks@att.net',0),('atmarks@outlook.com',0),('bader@aol.com',0),('bester@optonline.net',0),('bhima@me.com',0),('breegster@sbcglobal.net',1),('bryam@outlook.com',1),('bwcarty@yahoo.ca',1),('ccohen@live.com',1),('chance@hotmail.com',1),('chinthaka@yahoo.com',1),('credmond@me.com',0),('crypt@yahoo.com',1),('danneng@comcast.net',0),('dhwon@sbcglobal.net',0),('dobey@live.com',0),('dprice@yahoo.ca',0),('erynf@comcast.net',0),('floxy@msn.com',0),('fmtbebuck@verizon.net',0),('fraterk@sbcglobal.net',1),('frosal@hotmail.com',0),('geekoid@outlook.com',0),('geoffr@verizon.net',1),('glenz@aol.com',1),('goldberg@icloud.com',0),('goresky@aol.com',1),('granboul@yahoo.com',0),('gtaylor@msn.com',0),('gtaylor@yahoo.com',0),('hahiss@me.com',0),('hahsler@aol.com',0),('heidrich@yahoo.com',1),('heroine@live.com',0),('hling@icloud.com',0),('inico@msn.com',0),('janusfury@comcast.net',0),('jbailie@yahoo.ca',0),('jcholewa@aol.com',0),('jdhildeb@yahoo.ca',0),('jdray@verizon.net',1),('jimxugle@optonline.net',0),('jonathan@att.net',1),('jramio@outlook.com',1),('kaiser@mac.com',0),('kiddailey@sbcglobal.net',0),('kingma@hotmail.com',1),('kobayasi@aol.com',1),('lamky@icloud.com',0),('marcs@comcast.net',1),('mchugh@mac.com',1),('mddallara@hotmail.com',0),('melnik@live.com',1),('mglee@aol.com',1),('miami@att.net',1),('moinefou@gmail.com',0),('msroth@aol.com',1),('msroth@verizon.net',0),('multiplx@verizon.net',0),('oevans@att.net',0),('osaru@msn.com',1),('osrin@verizon.net',0),('ozawa@live.com',1),('parasite@live.com',1),('rbarreira@yahoo.ca',1),('rkobes@yahoo.ca',0),('roamer@live.com',0),('rtanter@att.net',1),('rtanter@msn.com',0),('sabren@mac.com',0),('sakusha@hotmail.com',0),('sarahs@outlook.com',1),('sblack@yahoo.ca',1),('shaffei@mac.com',1),('shang@icloud.com',0),('shang@yahoo.ca',1),('sherzodr@optonline.net',0),('skaufman@yahoo.com',0),('skoch@yahoo.com',0),('smartfart@outlook.com',1),('sokol@att.net',0),('steve@comcast.net',0),('symbolic@att.net',1),('tezbo@mac.com',0),('tmaek@comcast.net',0),('treit@icloud.com',1),('trygstad@me.com',0),('vertigo@mac.com',1),('warrior@yahoo.ca',0),('webteam@mac.com',1),('whimsy@icloud.com',1),('willg@hotmail.com',0),('xtang@sbcglobal.net',0),('yamla@att.net',1),('yangyan@yahoo.ca',0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_specialty`
--

DROP TABLE IF EXISTS `employee_specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee_specialty` (
  `empl_email` varchar(100) NOT NULL,
  `serv_id` int(11) NOT NULL,
  PRIMARY KEY (`serv_id`,`empl_email`),
  KEY `empl_spec_fk_services_idx` (`serv_id`),
  KEY `empl_spec_fk_employees` (`empl_email`),
  CONSTRAINT `empl_spec_fk_employees` FOREIGN KEY (`empl_email`) REFERENCES `employees` (`empl_email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `empl_spec_fk_services` FOREIGN KEY (`serv_id`) REFERENCES `services` (`serv_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_specialty`
--

LOCK TABLES `employee_specialty` WRITE;
/*!40000 ALTER TABLE `employee_specialty` DISABLE KEYS */;
INSERT INTO `employee_specialty` (`empl_email`, `serv_id`) VALUES ('research@hotmail.com',1),('angel@gmail.com',2),('muadip@live.com',3),('vmalik@aol.com',5),('kenja@hotmail.com',7),('kildjean@hotmail.com',9);
/*!40000 ALTER TABLE `employee_specialty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employees` (
  `empl_email` varchar(100) NOT NULL,
  `empl_ssn` char(10) NOT NULL DEFAULT '0000000000',
  `wage_per_hr` decimal(5,2) NOT NULL,
  PRIMARY KEY (`empl_email`),
  UNIQUE KEY `empl_ssn_UNIQUE` (`empl_ssn`),
  UNIQUE KEY `empl_email_UNIQUE` (`empl_email`),
  CONSTRAINT `employees_fk_users` FOREIGN KEY (`empl_email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`empl_email`, `empl_ssn`, `wage_per_hr`) VALUES ('adamk@msn.com','0000000000',15.00),('angel@gmail.com','9023458756',14.00),('kenja@hotmail.com','2917590483',15.00),('kildjean@hotmail.com','9593810285',15.00),('muadip@live.com','3840185839',14.00),('research@hotmail.com','2918750432',16.00),('vmalik@aol.com','3821749504',15.50);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The unique id for each product',
  `prod_quantity` int(11) NOT NULL,
  PRIMARY KEY (`prod_id`),
  UNIQUE KEY `idproducts_UNIQUE` (`prod_id`),
  CONSTRAINT `products_fk_sellables` FOREIGN KEY (`prod_id`) REFERENCES `sellables` (`sell_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`prod_id`, `prod_quantity`) VALUES (11,50),(12,50),(13,50),(14,50),(15,50),(16,70);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `empl` varchar(100) NOT NULL,
  `cust` varchar(100) NOT NULL,
  `sellable` int(11) NOT NULL,
  PRIMARY KEY (`sale_id`),
  UNIQUE KEY `sale_id_UNIQUE` (`sale_id`) /*!80000 INVISIBLE */,
  KEY `sales_fk_employees_idx` (`empl`),
  KEY `sales_fk_customers_idx` (`cust`),
  KEY `sales_fk_sellables_idx` (`sellable`),
  CONSTRAINT `sales_fk_customers` FOREIGN KEY (`cust`) REFERENCES `customers` (`cust_email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_fk_employees` FOREIGN KEY (`empl`) REFERENCES `employees` (`empl_email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_fk_sellables` FOREIGN KEY (`sellable`) REFERENCES `sellables` (`sell_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` (`sale_id`, `empl`, `cust`, `sellable`) VALUES (1,'angel@gmail.com','symbolic@att.net',1),(2,'research@hotmail.com','whimsy@icloud.com',1),(3,'kildjean@hotmail.com','geekoid@outlook.com',1),(4,'muadip@live.com','sakusha@hotmail.com',2),(5,'kenja@hotmail.com','geoffr@verizon.net',1),(6,'vmalik@aol.com','credmond@me.com',10),(7,'angel@gmail.com','breegster@sbcglobal.net',1),(8,'research@hotmail.com','trygstad@me.com',1),(9,'kildjean@hotmail.com','crypt@yahoo.com',6),(10,'muadip@live.com','sherzodr@optonline.net',1),(11,'kenja@hotmail.com','rkobes@yahoo.ca',8),(12,'vmalik@aol.com','danneng@comcast.net',6),(13,'angel@gmail.com','jonathan@att.net',1),(14,'research@hotmail.com','amcuri@yahoo.ca',1),(15,'kildjean@hotmail.com','atmarks@outlook.com',2),(16,'muadip@live.com','chance@hotmail.com',1),(17,'kenja@hotmail.com','sabren@mac.com',1),(18,'vmalik@aol.com','floxy@msn.com',1),(19,'angel@gmail.com','rtanter@msn.com',6),(20,'research@hotmail.com','glenz@aol.com',1),(21,'kildjean@hotmail.com','rbarreira@yahoo.ca',1),(22,'muadip@live.com','kaiser@mac.com',1),(23,'kenja@hotmail.com','xtang@sbcglobal.net',1),(24,'vmalik@aol.com','shaffei@mac.com',2),(25,'angel@gmail.com','osaru@msn.com',1),(26,'research@hotmail.com','skoch@yahoo.com',7),(27,'kildjean@hotmail.com','yamla@att.net',1),(28,'muadip@live.com','parasite@live.com',2),(29,'kenja@hotmail.com','moinefou@gmail.com',1),(30,'vmalik@aol.com','janusfury@comcast.net',1),(31,'angel@gmail.com','tezbo@mac.com',2),(32,'research@hotmail.com','inico@msn.com',1),(33,'kildjean@hotmail.com','hling@icloud.com',1),(34,'muadip@live.com','frosal@hotmail.com',1),(35,'kenja@hotmail.com','roamer@live.com',1),(36,'vmalik@aol.com','bryam@outlook.com',1),(37,'angel@gmail.com','warrior@yahoo.ca',3),(38,'research@hotmail.com','goresky@aol.com',1),(39,'kildjean@hotmail.com','willg@hotmail.com',1),(40,'muadip@live.com','marcs@comcast.net',3),(41,'kenja@hotmail.com','miami@att.net',1),(42,'vmalik@aol.com','rtanter@att.net',2),(43,'angel@gmail.com','oevans@att.net',1),(44,'research@hotmail.com','heidrich@yahoo.com',2),(45,'kildjean@hotmail.com','yangyan@yahoo.ca',1),(46,'muadip@live.com','dobey@live.com',4),(47,'kenja@hotmail.com','smartfart@outlook.com',3),(48,'vmalik@aol.com','sokol@att.net',1),(49,'angel@gmail.com','dprice@yahoo.ca',1),(50,'research@hotmail.com','goldberg@icloud.com',5),(51,'kildjean@hotmail.com','jcholewa@aol.com',4),(52,'muadip@live.com','tmaek@comcast.net',1),(53,'kenja@hotmail.com','dhwon@sbcglobal.net',3),(54,'vmalik@aol.com','vertigo@mac.com',1),(55,'angel@gmail.com','mddallara@hotmail.com',1),(56,'research@hotmail.com','jimxugle@optonline.net',1),(57,'kildjean@hotmail.com','ozawa@live.com',1),(58,'muadip@live.com','bwcarty@yahoo.ca',1),(59,'kenja@hotmail.com','kingma@hotmail.com',8),(60,'vmalik@aol.com','sblack@yahoo.ca',5),(61,'angel@gmail.com','hahsler@aol.com',1),(62,'research@hotmail.com','atmarks@att.net',4),(63,'kildjean@hotmail.com','mglee@aol.com',7),(64,'muadip@live.com','gtaylor@yahoo.com',1),(65,'kenja@hotmail.com','amichalo@live.com',5),(66,'vmalik@aol.com','lamky@icloud.com',6),(67,'angel@gmail.com','msroth@verizon.net',11),(68,'research@hotmail.com','gtaylor@msn.com',1),(69,'kildjean@hotmail.com','kiddailey@sbcglobal.net',1),(70,'muadip@live.com','fmtbebuck@verizon.net',1),(71,'kenja@hotmail.com','jramio@outlook.com',1),(72,'vmalik@aol.com','jdhildeb@yahoo.ca',1),(73,'angel@gmail.com','melnik@live.com',1),(74,'research@hotmail.com','bader@aol.com',1),(75,'kildjean@hotmail.com','fraterk@sbcglobal.net',1),(76,'muadip@live.com','shang@icloud.com',1),(77,'kenja@hotmail.com','mchugh@mac.com',4),(78,'vmalik@aol.com','heroine@live.com',1),(79,'angel@gmail.com','hahiss@me.com',1),(80,'research@hotmail.com','erynf@comcast.net',5),(81,'kildjean@hotmail.com','sarahs@outlook.com',5),(82,'muadip@live.com','kobayasi@aol.com',5),(83,'kenja@hotmail.com','jdray@verizon.net',1),(84,'vmalik@aol.com','bester@optonline.net',6),(85,'angel@gmail.com','multiplx@verizon.net',1),(86,'research@hotmail.com','msroth@aol.com',1),(87,'kildjean@hotmail.com','skaufman@yahoo.com',4),(88,'muadip@live.com','jbailie@yahoo.ca',1),(89,'kenja@hotmail.com','osrin@verizon.net',2),(90,'vmalik@aol.com','webteam@mac.com',1),(91,'angel@gmail.com','treit@icloud.com',3),(92,'research@hotmail.com','shang@yahoo.ca',9),(93,'kildjean@hotmail.com','ccohen@live.com',1),(94,'muadip@live.com','bhima@me.com',2),(95,'kenja@hotmail.com','chinthaka@yahoo.com',11),(96,'vmalik@aol.com','steve@comcast.net',1),(97,'angel@gmail.com','agapow@msn.com',6),(99,'kildjean@hotmail.com','granboul@yahoo.com',1);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schedule` (
  `sch_date` date NOT NULL,
  `sch_start_time` time NOT NULL,
  `sch_cust` varchar(100) NOT NULL,
  `sch_serv` int(11) NOT NULL,
  `sch_empl` varchar(100) NOT NULL,
  PRIMARY KEY (`sch_date`,`sch_start_time`,`sch_cust`),
  KEY `schedule_fk_customers_idx` (`sch_cust`),
  KEY `schedule_fk_services_idx` (`sch_serv`),
  KEY `schedule_fk_employees_idx` (`sch_empl`),
  CONSTRAINT `schedule_fk_customers` FOREIGN KEY (`sch_cust`) REFERENCES `customers` (`cust_email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schedule_fk_employees` FOREIGN KEY (`sch_empl`) REFERENCES `employees` (`empl_email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schedule_fk_services` FOREIGN KEY (`sch_serv`) REFERENCES `services` (`serv_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` (`sch_date`, `sch_start_time`, `sch_cust`, `sch_serv`, `sch_empl`) VALUES ('2019-05-19','10:00:00','symbolic@att.net',1,'angel@gmail.com'),('2019-05-19','10:30:00','whimsy@icloud.com',1,'research@hotmail.com'),('2019-05-19','11:00:00','geekoid@outlook.com',1,'kildjean@hotmail.com'),('2019-05-19','11:30:00','sakusha@hotmail.com',2,'muadip@live.com'),('2019-05-19','12:00:00','geoffr@verizon.net',1,'kenja@hotmail.com'),('2019-05-19','12:30:00','credmond@me.com',10,'vmalik@aol.com'),('2019-05-19','13:00:00','breegster@sbcglobal.net',1,'angel@gmail.com'),('2019-05-19','13:30:00','trygstad@me.com',1,'research@hotmail.com'),('2019-05-19','14:00:00','crypt@yahoo.com',6,'kildjean@hotmail.com'),('2019-05-19','14:30:00','sherzodr@optonline.net',1,'muadip@live.com'),('2019-05-19','15:00:00','rkobes@yahoo.ca',8,'kenja@hotmail.com'),('2019-05-19','15:30:00','danneng@comcast.net',6,'vmalik@aol.com'),('2019-05-19','15:30:00','jonathan@att.net',1,'angel@gmail.com'),('2019-05-19','16:00:00','rkobes@yahoo.ca',8,'kenja@hotmail.com'),('2019-05-19','16:30:00','danneng@comcast.net',6,'vmalik@aol.com'),('2019-05-19','17:00:00','jonathan@att.net',1,'angel@gmail.com'),('2019-05-20','10:00:00','amcuri@yahoo.ca',1,'research@hotmail.com'),('2019-05-20','10:30:00','atmarks@outlook.com',2,'kildjean@hotmail.com'),('2019-05-20','11:00:00','atmarks@outlook.com',2,'kildjean@hotmail.com'),('2019-05-20','11:00:00','chance@hotmail.com',1,'muadip@live.com'),('2019-05-20','11:30:00','sabren@mac.com',1,'kenja@hotmail.com'),('2019-05-20','12:00:00','chance@hotmail.com',1,'muadip@live.com'),('2019-05-20','12:00:00','floxy@msn.com',1,'vmalik@aol.com'),('2019-05-20','12:30:00','rtanter@msn.com',6,'angel@gmail.com'),('2019-05-20','12:30:00','sabren@mac.com',1,'kenja@hotmail.com'),('2019-05-20','13:00:00','glenz@aol.com',1,'research@hotmail.com'),('2019-05-20','13:30:00','floxy@msn.com',1,'vmalik@aol.com'),('2019-05-20','13:30:00','rbarreira@yahoo.ca',1,'kildjean@hotmail.com'),('2019-05-20','14:00:00','kaiser@mac.com',1,'muadip@live.com'),('2019-05-20','14:00:00','rtanter@msn.com',6,'angel@gmail.com'),('2019-05-20','15:00:00','glenz@aol.com',1,'research@hotmail.com'),('2019-05-20','16:00:00','rbarreira@yahoo.ca',1,'kildjean@hotmail.com'),('2019-05-20','16:30:00','kaiser@mac.com',1,'muadip@live.com'),('2019-05-21','10:00:00','xtang@sbcglobal.net',1,'kenja@hotmail.com'),('2019-05-21','10:30:00','shaffei@mac.com',2,'vmalik@aol.com'),('2019-05-21','11:00:00','osaru@msn.com',1,'angel@gmail.com'),('2019-05-21','11:00:00','shaffei@mac.com',2,'vmalik@aol.com'),('2019-05-21','11:30:00','osaru@msn.com',1,'angel@gmail.com'),('2019-05-21','11:30:00','skoch@yahoo.com',7,'research@hotmail.com'),('2019-05-21','12:00:00','skoch@yahoo.com',7,'research@hotmail.com'),('2019-05-21','12:00:00','yamla@att.net',1,'kildjean@hotmail.com'),('2019-05-21','12:30:00','parasite@live.com',2,'muadip@live.com'),('2019-05-21','12:30:00','yamla@att.net',1,'kildjean@hotmail.com'),('2019-05-21','13:00:00','moinefou@gmail.com',1,'kenja@hotmail.com'),('2019-05-21','13:00:00','parasite@live.com',2,'muadip@live.com'),('2019-05-21','13:30:00','janusfury@comcast.net',1,'vmalik@aol.com'),('2019-05-21','13:30:00','moinefou@gmail.com',1,'kenja@hotmail.com'),('2019-05-21','14:00:00','janusfury@comcast.net',1,'vmalik@aol.com'),('2019-05-21','14:00:00','tezbo@mac.com',2,'angel@gmail.com'),('2019-05-21','14:30:00','inico@msn.com',1,'research@hotmail.com'),('2019-05-21','14:30:00','tezbo@mac.com',2,'angel@gmail.com'),('2019-05-21','15:00:00','hling@icloud.com',1,'kildjean@hotmail.com'),('2019-05-21','15:00:00','inico@msn.com',1,'research@hotmail.com'),('2019-05-21','15:30:00','frosal@hotmail.com',1,'muadip@live.com'),('2019-05-21','16:00:00','hling@icloud.com',1,'kildjean@hotmail.com'),('2019-05-21','16:30:00','frosal@hotmail.com',1,'muadip@live.com'),('2019-05-22','10:00:00','roamer@live.com',1,'kenja@hotmail.com'),('2019-05-22','10:30:00','bryam@outlook.com',1,'vmalik@aol.com'),('2019-05-22','11:00:00','warrior@yahoo.ca',3,'angel@gmail.com'),('2019-05-22','11:30:00','goresky@aol.com',1,'research@hotmail.com'),('2019-05-22','12:00:00','willg@hotmail.com',1,'kildjean@hotmail.com'),('2019-05-22','12:30:00','marcs@comcast.net',3,'muadip@live.com'),('2019-05-22','13:00:00','miami@att.net',1,'kenja@hotmail.com'),('2019-05-22','13:30:00','rtanter@att.net',2,'vmalik@aol.com'),('2019-05-22','14:00:00','oevans@att.net',1,'angel@gmail.com'),('2019-05-22','14:30:00','heidrich@yahoo.com',2,'research@hotmail.com'),('2019-05-22','15:00:00','yangyan@yahoo.ca',1,'kildjean@hotmail.com'),('2019-05-22','15:30:00','dobey@live.com',4,'muadip@live.com'),('2019-05-22','16:00:00','dobey@live.com',4,'muadip@live.com'),('2019-05-23','10:00:00','smartfart@outlook.com',3,'kenja@hotmail.com'),('2019-05-23','10:30:00','sokol@att.net',1,'vmalik@aol.com'),('2019-05-23','11:00:00','dprice@yahoo.ca',1,'angel@gmail.com'),('2019-05-23','11:30:00','dhwon@sbcglobal.net',3,'kenja@hotmail.com'),('2019-05-23','11:30:00','goldberg@icloud.com',5,'research@hotmail.com'),('2019-05-23','12:00:00','jcholewa@aol.com',4,'kildjean@hotmail.com'),('2019-05-23','12:00:00','vertigo@mac.com',1,'vmalik@aol.com'),('2019-05-23','12:30:00','mddallara@hotmail.com',1,'angel@gmail.com'),('2019-05-23','12:30:00','tmaek@comcast.net',1,'muadip@live.com'),('2019-05-23','13:00:00','dhwon@sbcglobal.net',3,'kenja@hotmail.com'),('2019-05-23','13:00:00','jimxugle@optonline.net',1,'research@hotmail.com'),('2019-05-23','13:30:00','ozawa@live.com',1,'kildjean@hotmail.com'),('2019-05-23','13:30:00','vertigo@mac.com',1,'vmalik@aol.com'),('2019-05-23','14:00:00','bwcarty@yahoo.ca',1,'muadip@live.com'),('2019-05-23','14:00:00','mddallara@hotmail.com',1,'angel@gmail.com'),('2019-05-23','14:30:00','jimxugle@optonline.net',1,'research@hotmail.com'),('2019-05-23','14:30:00','kingma@hotmail.com',8,'kenja@hotmail.com'),('2019-05-23','15:00:00','ozawa@live.com',1,'kildjean@hotmail.com'),('2019-05-23','15:00:00','sblack@yahoo.ca',5,'vmalik@aol.com'),('2019-05-23','15:30:00','bwcarty@yahoo.ca',1,'muadip@live.com'),('2019-05-23','15:30:00','hahsler@aol.com',1,'angel@gmail.com'),('2019-05-23','16:00:00','kingma@hotmail.com',8,'kenja@hotmail.com'),('2019-05-23','16:30:00','hahsler@aol.com',1,'angel@gmail.com'),('2019-05-23','16:30:00','sblack@yahoo.ca',5,'vmalik@aol.com'),('2019-05-24','10:00:00','atmarks@att.net',4,'research@hotmail.com'),('2019-05-24','10:30:00','mglee@aol.com',7,'kildjean@hotmail.com'),('2019-05-24','11:00:00','gtaylor@yahoo.com',1,'muadip@live.com'),('2019-05-24','11:30:00','amichalo@live.com',5,'kenja@hotmail.com'),('2019-05-24','11:30:00','lamky@icloud.com',6,'vmalik@aol.com'),('2019-05-24','12:00:00','gtaylor@msn.com',1,'research@hotmail.com'),('2019-05-24','12:00:00','gtaylor@yahoo.com',1,'muadip@live.com'),('2019-05-24','12:30:00','fmtbebuck@verizon.net',1,'muadip@live.com'),('2019-05-24','12:30:00','kiddailey@sbcglobal.net',1,'kildjean@hotmail.com'),('2019-05-24','13:00:00','amichalo@live.com',5,'kenja@hotmail.com'),('2019-05-24','13:00:00','jramio@outlook.com',1,'kenja@hotmail.com'),('2019-05-24','13:30:00','lamky@icloud.com',6,'vmalik@aol.com'),('2019-05-24','15:00:00','gtaylor@msn.com',1,'research@hotmail.com'),('2019-05-24','15:30:00','kiddailey@sbcglobal.net',1,'kildjean@hotmail.com'),('2019-05-24','16:00:00','fmtbebuck@verizon.net',1,'muadip@live.com'),('2019-05-24','16:30:00','jramio@outlook.com',1,'kenja@hotmail.com'),('2019-05-25','10:00:00','jdhildeb@yahoo.ca',1,'vmalik@aol.com'),('2019-05-25','10:30:00','melnik@live.com',1,'angel@gmail.com'),('2019-05-25','11:00:00','bader@aol.com',1,'research@hotmail.com'),('2019-05-25','11:30:00','fraterk@sbcglobal.net',1,'kildjean@hotmail.com'),('2019-05-25','11:30:00','shang@icloud.com',1,'muadip@live.com'),('2019-05-25','12:00:00','heroine@live.com',1,'vmalik@aol.com'),('2019-05-25','12:00:00','mchugh@mac.com',4,'kenja@hotmail.com'),('2019-05-25','12:00:00','shang@icloud.com',1,'muadip@live.com'),('2019-05-25','12:30:00','erynf@comcast.net',5,'research@hotmail.com'),('2019-05-25','12:30:00','hahiss@me.com',1,'angel@gmail.com'),('2019-05-25','12:30:00','mchugh@mac.com',4,'kenja@hotmail.com'),('2019-05-25','13:00:00','sarahs@outlook.com',5,'kildjean@hotmail.com'),('2019-05-25','13:30:00','heroine@live.com',1,'vmalik@aol.com'),('2019-05-25','13:30:00','kobayasi@aol.com',5,'muadip@live.com'),('2019-05-25','14:00:00','hahiss@me.com',1,'angel@gmail.com'),('2019-05-25','14:00:00','jdray@verizon.net',1,'kenja@hotmail.com'),('2019-05-25','14:30:00','bester@optonline.net',6,'vmalik@aol.com'),('2019-05-25','14:30:00','erynf@comcast.net',5,'research@hotmail.com'),('2019-05-25','15:00:00','sarahs@outlook.com',5,'kildjean@hotmail.com'),('2019-05-25','15:30:00','kobayasi@aol.com',5,'muadip@live.com'),('2019-05-25','16:00:00','jdray@verizon.net',1,'kenja@hotmail.com'),('2019-05-25','16:30:00','bester@optonline.net',6,'vmalik@aol.com'),('2019-05-26','10:00:00','multiplx@verizon.net',1,'angel@gmail.com'),('2019-05-26','10:30:00','msroth@aol.com',1,'research@hotmail.com'),('2019-05-26','11:00:00','skaufman@yahoo.com',4,'kildjean@hotmail.com'),('2019-05-26','11:30:00','jbailie@yahoo.ca',1,'muadip@live.com'),('2019-05-26','11:30:00','osrin@verizon.net',2,'kenja@hotmail.com'),('2019-05-26','12:00:00','osrin@verizon.net',2,'kenja@hotmail.com'),('2019-05-26','12:00:00','treit@icloud.com',3,'angel@gmail.com'),('2019-05-26','12:00:00','webteam@mac.com',1,'vmalik@aol.com'),('2019-05-26','12:30:00','ccohen@live.com',1,'kildjean@hotmail.com'),('2019-05-26','12:30:00','shang@yahoo.ca',9,'research@hotmail.com'),('2019-05-26','12:30:00','webteam@mac.com',1,'vmalik@aol.com'),('2019-05-26','13:00:00','bhima@me.com',2,'muadip@live.com'),('2019-05-26','13:00:00','treit@icloud.com',3,'angel@gmail.com'),('2019-05-26','13:30:00','shang@yahoo.ca',9,'research@hotmail.com'),('2019-05-26','14:00:00','ccohen@live.com',1,'kildjean@hotmail.com'),('2019-05-26','14:00:00','steve@comcast.net',1,'vmalik@aol.com'),('2019-05-26','14:30:00','agapow@msn.com',6,'angel@gmail.com'),('2019-05-26','14:30:00','bhima@me.com',2,'muadip@live.com'),('2019-05-26','15:30:00','granboul@yahoo.com',1,'kildjean@hotmail.com'),('2019-05-26','15:30:00','steve@comcast.net',1,'vmalik@aol.com'),('2019-05-26','16:00:00','agapow@msn.com',6,'angel@gmail.com'),('2019-05-26','17:00:00','granboul@yahoo.com',1,'kildjean@hotmail.com');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellables`
--

DROP TABLE IF EXISTS `sellables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sellables` (
  `sell_id` int(11) NOT NULL AUTO_INCREMENT,
  `sell_name` varchar(100) NOT NULL,
  `base_price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`sell_id`),
  UNIQUE KEY `sell_id_UNIQUE` (`sell_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellables`
--

LOCK TABLES `sellables` WRITE;
/*!40000 ALTER TABLE `sellables` DISABLE KEYS */;
INSERT INTO `sellables` (`sell_id`, `sell_name`, `base_price`) VALUES (1,'Regular Haircut',20.00),(2,'Styled Haircut',25.00),(3,'Haircut and Beard',28.00),(4,'Styled Haircut and Beard',28.00),(5,'Kids Haircut',18.00),(6,'Kids Styled Haircut',20.00),(7,'Haircut and Hot Shave',33.00),(8,'Styled Haircut and Hot Shave',35.00),(9,'The Works',45.00),(10,'The Works and Wax',50.00),(11,'Suavecito Original',10.00),(12,'Suavecito Matte',12.00),(13,'Suavecito Strong',12.00),(14,'Elegance Earth',10.00),(15,'Elegance Venus',10.00),(16,'Brickell\'s Shampoo',20.00);
/*!40000 ALTER TABLE `sellables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `services` (
  `serv_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The unique id for each product',
  `serv_duration` int(11) NOT NULL DEFAULT '30',
  PRIMARY KEY (`serv_id`),
  CONSTRAINT `services_fk_sellables` FOREIGN KEY (`serv_id`) REFERENCES `sellables` (`sell_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` (`serv_id`, `serv_duration`) VALUES (1,30),(2,35),(3,35),(4,40),(5,20),(6,30),(7,40),(8,45),(9,60),(10,75);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `email` varchar(100) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`email`, `username`, `password`, `fname`, `lname`) VALUES ('a','a','a','a','a'),('aaditya.watwe@gmail.com','aaditya.watwe','pass','Aaditya','Watwe'),('adamk@msn.com','waitwhatlol','PK4vhg72','Camren ','Austin '),('agapow@msn.com','yesnomaybe','nySJUYRT','Camron ','Rich '),('amcuri@yahoo.ca','diplomasrancidity','g4wA70B0','Karson ','Odom '),('amichalo@live.com','pressurebonk','0THYvga5','Aden ','Kennedy '),('angel@gmail.com','angel10','root','Angel','Fernandez'),('atmarks@att.net','porphyrymute','7QtRO0C1','Braiden ','Rosales '),('atmarks@outlook.com','primpking','0b8M57n0','Stephen ','Wiley '),('bader@aol.com','pretzelhow','jQlmpWpg','Travis ','Bernard '),('bester@optonline.net','appgamer','g2aiD3V2','Dane ','Wolf '),('bhima@me.com','reservepipe','Dzm9gQGb','Spencer ','Smith '),('breegster@sbcglobal.net','undrilledskit','97xS5832','Jorge ','Perkins '),('bryam@outlook.com','lastageportal','1F6GaU18','Alberto ','Rangel '),('bwcarty@yahoo.ca','unpledgedinterface','90s0V3U3','London ','Moran '),('ccohen@live.com','scarlettetucker','0gG0K9A4','Daniel ','Oconnor '),('chance@hotmail.com','sparrowveneering','BldTK4RJ','Ethen ','Greene '),('chinthaka@yahoo.com','troycumbria','5GXzSN4U','Jaydin ','Owen '),('credmond@me.com','driftclennam','PkSJAFIr','Dillon ','Shannon '),('crypt@yahoo.com','circlerephrase','kOlgek3v','Walter ','Andrade '),('danneng@comcast.net','stevedoresquare','6lTBNZSf','Sterling ','Berger '),('dhwon@sbcglobal.net','eskerpogostick','zDcCQc95','Giancarlo ','Reeves '),('dobey@live.com','martingaleundying','3sHjSGU8','Micheal ','Curtis '),('dprice@yahoo.ca','thumbsuproad','9GzIcq3z','John ','Murphy '),('erynf@comcast.net','allowsoftware','mKtJR497','Isaac ','Frazier '),('floxy@msn.com','generationexceeding','37zkp2lN','Jaydan ','Duran '),('fmtbebuck@verizon.net','ruleromp','u5ZB9Sgn','Chaz ','Hale '),('fraterk@sbcglobal.net','bungfarmer','3m2630qm','Jadon ','Yoder '),('frosal@hotmail.com','henchmortality','iSjW4txT','Romeo ','Gates '),('geekoid@outlook.com','aeriegulp','dv6hj3kx','Rhett ','Velez '),('geoffr@verizon.net','pistolsapling','O0scpDyw','Darion ','Prince '),('glenz@aol.com','arrowbodrell','82YZwmcf','Nick ','Woodward '),('goldberg@icloud.com','gangwayendorphin','d9l4vf46','Jayson ','Zamora '),('goresky@aol.com','beammonopoly','roX0NeI8','Francisco ','Fields '),('granboul@yahoo.com','omglikefr','39VAVxLr','Humberto ','Bell '),('gtaylor@msn.com','fitscounting','VA95jCe2','Luka ','Ibarra '),('gtaylor@yahoo.com','shiftdinner','J1b7o1z9','Wayne ','Lloyd '),('hahiss@me.com','hangingquarters','yBUV857W','Hamza ','Dodson '),('hahsler@aol.com','hardcopybear','ZgN259O8','Wade ','Finley '),('heidrich@yahoo.com','gammapuscle','N57wAEmt','Ramon ','Hanna '),('heroine@live.com','vacuousanhydrous','R9h18m3h','Ruben ','Galvan '),('hling@icloud.com','chicagoracket','9Q2vZ1mh','Jaron ','Rios '),('inico@msn.com','initialsprofanity','YFTL8ROv','Trace ','Morgan '),('janusfury@comcast.net','researchreaction','OhCtt95B','Leo ','Morrison '),('jbailie@yahoo.ca','deckexists','qE519SA8','Kael ','Montgomery '),('jcholewa@aol.com','filthycrow','akqWi4xu','Draven ','Parks '),('jdhildeb@yahoo.ca','tresillianby','jFe5jdoq','Derrick ','Stafford '),('jdray@verizon.net','noyouheh','764q4WrQ','Justin ','Davies '),('jimxugle@optonline.net','boscowok','iik5Z35s','Ramiro ','Crawford '),('jonathan@att.net','inningoxfordshire','5hRP4fRf','Damon ','Hines '),('jramio@outlook.com','boxingextrude','wm8bK79N','Blake ','Mendoza '),('kaiser@mac.com','shriekstick','U9PHvqvi','Armando ','Neal '),('kenja@hotmail.com','drowsychiky','Y1cLagq6','Darren','McCarron'),('kiddailey@sbcglobal.net','spreaningpreplan','T87cXgqB','Kyson ','Vazquez '),('kildjean@hotmail.com','minglingammunition','AXdRmz3D','Manny','Roberto'),('kingma@hotmail.com','canningdora','3Y3jO5y7','Amari ','Baxter '),('kobayasi@aol.com','selfwheat','bbjPczJC','Keaton ','Sellers '),('lamky@icloud.com','spermchemical','hqmVC4bx','Carlo ','Figueroa '),('marcs@comcast.net','anniezodiac','52PEiqf5','Andres ','Harris '),('mchugh@mac.com','pantsrepossess','Y8fSI3a1','Lincoln ','Kane '),('mddallara@hotmail.com','rustpandora','kxfsYeYj','Emmanuel ','Matthews '),('melnik@live.com','neckettsmall','y2LNF95r','Kash ','Preston '),('mglee@aol.com','serjeantdemeaning','oT4atcJ0','Jaidyn ','Potter '),('miami@att.net','woatscott','7LPOIcuU','Anthony ','Crane '),('moinefou@gmail.com','nagtennis','prHAv4W8','Tommy ','Weiss '),('msroth@aol.com','stoutemission','2x8TDnP6','Charles ','Short '),('msroth@verizon.net','wimpstock','jQH593k2','Clark ','Holloway '),('muadip@live.com','subsidycane','Z2w16xMT','Johnny','Silva'),('multiplx@verizon.net','heeltirt','094Uzvja','Dereon ','Fernandez '),('oevans@att.net','sportingfiz','8zBUOnb5','Zavier ','Mcgee '),('osaru@msn.com','warlikeflower','3jSs4q7h','Denzel ','Duarte '),('osrin@verizon.net','featsplayer','uxiK5vt4','Andrew ','Ali '),('ozawa@live.com','kumquatnibbles','OpdEVs4Y','Winston ','Flynn '),('parasite@live.com','shellfishidentical','bG6mo092','Toby ','Camacho '),('rbarreira@yahoo.ca','figureheadnijinsky','gE99CC99','Maddox ','Terry '),('research@hotmail.com','bellingtonrawbeef','TC6a5gM5','Dave','Costa'),('rkobes@yahoo.ca','blobhastiness','wwb9oQAL','Emiliano ','Collins '),('roamer@live.com','smonkeysstargazer','0tzJ3R2R','Brady ','Grant '),('rtanter@att.net','boftrhapsody','FusmEZNH','Omari ','Villegas '),('rtanter@msn.com','spraysculling','BqF1Wsle','Corbin ','Valentine '),('sabren@mac.com','supervisegewing','Ad0T4Ghx','Beckham ','Berry '),('sakusha@hotmail.com','totallyprops','H80PrDvH','Patrick ','Harding '),('sarahs@outlook.com','fabjaunty','CBJ07a96','Felix ','Sullivan '),('sblack@yahoo.ca','madagascanunbaked','m4REJnUK','Franco ','Cruz '),('shaffei@mac.com','mumpsimusrickshaw','Z8Rli31B','Gavin ','Harper '),('shang@icloud.com','withtradition','KL1FDxLn','Reynaldo ','Lowe '),('shang@yahoo.ca','preambledesign','pHxU2Nnh','Adam ','Pope '),('sherzodr@optonline.net','zonerecognition','f404Y63g','Arnav ','Barber '),('skaufman@yahoo.com','quibblesulfur','2SPUn3tI','Asher ','Kent '),('skoch@yahoo.com','pushingwarren','r55FigUe','Jesus ','Morris '),('smartfart@outlook.com','jenkinsfizz','hLKvUau9','Levi ','Roberson '),('sokol@att.net','cohesiveshortness','89QXDMR4','Gustavo ','Acevedo '),('steve@comcast.net','hotcold','31sS4kRT','Saul ','Boyd '),('symbolic@att.net','cairostretford','9kzI9R0Y','Remington ','Nelson '),('tezbo@mac.com','enjoyablecointreau','t48428IO','Javion ','Carney '),('tmaek@comcast.net','maficdodgeball','Cdi9VL6Y','Roderick ','Mcmillan '),('treit@icloud.com','operationhoitytoity','CBPQSRJm','Dustin ','Hernandez '),('trygstad@me.com','unknowncrabs','3LMbBU7u','Ty ','Mccarthy '),('vertigo@mac.com','beneficialivanhoe','uq7lV7Lh','Eli ','Good '),('vmalik@aol.com','veggiehawkridge','8icy1Cfn','Juan','Villa'),('warrior@yahoo.ca','headcountfog','CkoGZcA2','Quintin ','Castaneda '),('webteam@mac.com','lawyerbroker','RV8pICc3','Uriel ','Wilcox '),('whimsy@icloud.com','slangmac','854o0WB7','Aaden ','Jimenez '),('willg@hotmail.com','slothspawned','0eWJvyw5','Terrance ','Blankenship '),('xtang@sbcglobal.net','firechargepickwick','IqS6O5YY','Israel ','Lynn '),('yamla@att.net','boonlittle','z4V7UZDS','Keagan ','Morse '),('yangyan@yahoo.ca','donaristocrat','8W0Df2Du','Boston ','Holland ');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hairsalon'
--

--
-- Dumping routines for database 'hairsalon'
--
/*!50003 DROP FUNCTION IF EXISTS `change_specialty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `change_specialty`(empl VARCHAR(100), new_specialty INT) RETURNS tinyint(4)
    DETERMINISTIC
BEGIN
		DECLARE success TINYINT;
        SET success = 0;
        IF (EXISTS(SELECT * FROM employees 
				WHERE employees.empl_email = empl)
			AND EXISTS(SELECT * FROM services 
				WHERE services.serv_id = new_specialty))
			THEN SET success = 1;
		ELSE SET success = 0;
        END IF;
        
		IF (success = 1) THEN 
			UPDATE employee_specialty
            SET employee_specialty.serv_id = new_specialty 
            WHERE employee_specialty.empl_email = empl;
        END IF;
        RETURN success;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `delete_appointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `delete_appointment`( -- attempts to delete the appointment, and returns a 0 or 1 representing its success
	app_date DATE, start_time TIME, cust VARCHAR(100)) RETURNS tinyint(4)
    DETERMINISTIC
BEGIN
		DECLARE success TINYINT;
		DECLARE empl_val VARCHAR(100);

		SET success = 0;
        IF EXISTS(SELECT * FROM `schedule`
			WHERE (sch_date = app_date AND sch_start_time = start_time AND sch_cust = cust))
			THEN SET success = 1;
		ELSE SET success = 0;
        END IF;
                
		IF (success = 1) THEN 
			DELETE FROM `schedule`
			WHERE (sch_date = app_date AND sch_start_time = start_time AND sch_cust = cust);
        END IF;
        RETURN success;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `retrieve_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `retrieve_name`(user_email VARCHAR(100)) RETURNS varchar(90) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
		RETURN (SELECT CONCAT(users.fname, " ", users.lname) 
				FROM users WHERE users.email = user_email GROUP BY users.email);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `valid_appointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `valid_appointment`( -- attempts to add the appointment, and returns a 0 or 1 representing its success
	`date` DATE, start_time TIME, cust VARCHAR(100), serv INT, empl VARCHAR(100)) RETURNS tinyint(4)
    DETERMINISTIC
BEGIN
		DECLARE success TINYINT;

		SET success = 0;
        IF NOT EXISTS(SELECT * FROM `schedule` s 
			WHERE (s.sch_date = `date` AND s.sch_start_time = start_time AND s.sch_cust = cust))
			THEN SET success = 1;
		ELSE SET success = 0;
        END IF;
                
		IF (success = 1) THEN 
			INSERT INTO `schedule` VALUES (`date`, start_time, cust, serv, empl);
        END IF;
        RETURN success;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `valid_delete_sale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `valid_delete_sale`(id INT, employee VARCHAR(100)) RETURNS tinyint(4)
    DETERMINISTIC
BEGIN
		DECLARE success TINYINT;

		SET success = 0;
        IF 	EXISTS(SELECT * FROM sales s
				WHERE (s.sale_id = id AND s.empl = employee))
			THEN SET success = 1;
		ELSE SET success = 0;
        END IF;
                
		IF (success = 1) THEN 
			DELETE FROM sales 
            WHERE sale_id = id;
        END IF;
        RETURN success;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `valid_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `valid_employee`(user_email VARCHAR(100)) RETURNS tinyint(4)
    DETERMINISTIC
BEGIN
		DECLARE success TINYINT;
        SET success = 0;
        IF EXISTS(SELECT * FROM employees e WHERE e.empl_email LIKE user_email)
			THEN SET success = 1;
		ELSE SET success = 0;
        END IF;
        
        RETURN success;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `valid_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `valid_login`( -- attempts to log in with the credentials, and returns a boolean representing its success
	user_email VARCHAR(100), user_pass VARCHAR(60)) RETURNS tinyint(4)
    DETERMINISTIC
BEGIN
		DECLARE success TINYINT;
        SET success = 0;
        IF EXISTS(SELECT * FROM users u WHERE (u.email LIKE user_email AND u.`password` LIKE user_pass))
			THEN SET success = 1;
		ELSE SET success = 0;
        END IF;
        
        RETURN success;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `valid_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `valid_register`( -- attempts to add the new user, and returns a 0 or 1 representing its success
	user_email VARCHAR(100), uname VARCHAR(45), user_pass VARCHAR(60), fname VARCHAR(45), lname VARCHAR(45)) RETURNS tinyint(4)
    DETERMINISTIC
BEGIN
		DECLARE success TINYINT;
        SET success = 0;
        IF NOT EXISTS(SELECT * FROM users u WHERE (u.email LIKE user_email OR u.username LIKE uname))
			THEN SET success = 1;
		ELSE SET success = 0;
        END IF;
        
		IF success = 1 THEN 
			INSERT INTO users VALUES 
            (user_email, uname, user_pass, fname, lname);
            INSERT INTO customers VALUES 
            (user_email, 0);
        END IF;
        RETURN success;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `valid_sale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `valid_sale`(employee VARCHAR(100), customer VARCHAR(100), item_sold INT) RETURNS tinyint(4)
    DETERMINISTIC
BEGIN
		DECLARE success TINYINT;

		SET success = 0;
        IF 	EXISTS(SELECT * FROM customers c
				WHERE (c.cust_email = customer))
			AND EXISTS(SELECT * FROM sellables s
				WHERE (s.sell_id = item_sold))
			THEN SET success = 1;
		ELSE SET success = 0;
        END IF;
                
		IF (success = 1) THEN 
			INSERT INTO sales (empl, cust, sellable)
            VALUES (employee, customer, item_sold);
        END IF;
        RETURN success;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `valid_update_sale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `valid_update_sale`(id INT, employee VARCHAR(100), customer VARCHAR(100), item_sold INT) RETURNS tinyint(4)
    DETERMINISTIC
BEGIN
		DECLARE success TINYINT;

		SET success = 0;
        IF 	(EXISTS(SELECT * FROM sales s
				WHERE (s.sale_id = id AND s.empl = employee))
			AND EXISTS(SELECT * FROM employees e
				WHERE (e.empl_email = employee))
			AND EXISTS(SELECT * FROM customers c
				WHERE (c.cust_email = customer))
			AND EXISTS(SELECT * FROM sellables se
				WHERE (se.sell_id = item_sold)))
			THEN SET success = 1;
		ELSE SET success = 0;
        END IF;
                
		IF (success = 1) THEN 
			UPDATE sales 
            SET empl = employee, cust = customer, sellable = item_sold
            WHERE sale_id = id;
        END IF;
        RETURN success;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_sale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_sale`(id INT)
BEGIN
		DELETE FROM sales WHERE sales.sale_id = id;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fire_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fire_employee`(user_email VARCHAR(100))
BEGIN
		IF EXISTS(SELECT * FROM employees e WHERE e.empl_email = user_email) THEN 
			DELETE FROM users WHERE email = user_email;
		END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `hire_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hire_employee`(user_email VARCHAR(100))
BEGIN
		IF EXISTS(SELECT * FROM customers c WHERE c.cust_email = user_email)
		AND NOT EXISTS (SELECT * FROM employees e WHERE e.empl_email = user_email) THEN 
			INSERT INTO employees(empl_email, wage_per_hr) VALUE (user_email, 15.00);
            INSERT INTO employee_specialty(empl_email, serv_cat_id) VALUE (user_email, 1);
            DELETE FROM customers WHERE customers.cust_email = user_email;
		END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `retrieve_cust_appointments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `retrieve_cust_appointments`(user_email VARCHAR(100))
BEGIN
		SELECT DATE_FORMAT(s.sch_date, "%b %D, %Y") AS sch_date, 
			TIME_FORMAT(s.sch_start_time, "%h:%i %p") AS sch_time,
            CONCAT(u.fname, " ", u.lname), se.sell_name
        FROM `schedule` s, users u, sellables se
		WHERE s.sch_cust = user_email AND s.sch_empl = u.email AND s.sch_serv = se.sell_id;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `retrieve_employees` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `retrieve_employees`()
BEGIN
		SELECT CONCAT(u.fname, " ", u.lname) AS employee_name, s.sell_name AS service, u.email AS email
        FROM users u, employees e, employee_specialty es, sellables s
		WHERE u.email = e.empl_email AND e.empl_email = es.empl_email AND es.serv_id = s.sell_id;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `retrieve_empl_appointments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `retrieve_empl_appointments`(user_email VARCHAR(100))
BEGIN
		SELECT DATE_FORMAT(s.sch_date, "%b %D, %Y") AS sch_date, 
			TIME_FORMAT(s.sch_start_time, "%h:%i %p") AS sch_time,
            CONCAT(u.fname, " ", u.lname), se.sell_name
        FROM `schedule` s, users u, sellables se
		WHERE s.sch_empl = user_email AND s.sch_cust = u.email AND s.sch_serv = se.sell_id;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `retrieve_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `retrieve_products`()
BEGIN
		SELECT s.sell_id, s.sell_name, s.base_price
        FROM products p, sellables s
		WHERE s.sell_id = p.prod_id;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `retrieve_sales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `retrieve_sales`(user_email VARCHAR(100))
BEGIN
		SELECT s.sale_id, CONCAT(u.fname, " ", u.lname), u.email,
			se.sell_name, se.sell_id
        FROM sales s, users u, sellables se
		WHERE s.empl = user_email AND s.cust = u.email AND s.sellable = se.sell_id;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `retrieve_services` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `retrieve_services`()
BEGIN
		SELECT s.sell_id, s.sell_name, s.base_price
        FROM services sr, sellables s
		WHERE s.sell_id = sr.serv_id;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_salary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_salary`(empl VARCHAR(100), new_wage DECIMAL(5, 2))
BEGIN
		IF EXISTS(SELECT * FROM employees e WHERE e.empl_email = empl) THEN 
			UPDATE employees SET wage_per_hr = new_wage;
		END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_sale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_sale`(id INT, employee VARCHAR(100), customer VARCHAR(100), item_sold INT)
BEGIN
		UPDATE sales
		SET empl = employee, cust = customer, sellable = item_sold
        WHERE sales.sale_id = id;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-19 23:14:22
