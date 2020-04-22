-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: training
-- ------------------------------------------------------
-- Server version	5.7.29

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'pushup'),(2,'squat'),(3,'pullup'),(4,'leg_raise'),(5,'bridge'),(6,'handstand_pushup');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(32) NOT NULL,
  `category_id` int(11) NOT NULL,
  `step` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'wall_pushup',1,1),(2,'incline_pushup',1,2),(3,'kneeling_pushup',1,3),(4,'half_pushup',1,4),(5,'full_pushup',1,5),(6,'close_pushup',1,6),(7,'uneven_pushup_L',1,7),(8,'uneven_pushup_R',1,7),(9,'half_onearm_pushup_L',1,8),(10,'half_onearm_pushup_R',1,8),(11,'lever_pushup_L',1,9),(12,'lever_pushup_R',1,9),(13,'onearm_pushup_L',1,10),(14,'onearm_pushup_R',1,10),(15,'shoulderstand_squat',2,1),(16,'jackknife_squat',2,2),(17,'supported_squat',2,3),(18,'half_squat',2,4),(19,'full_squat',2,5),(20,'close_squat',2,6),(21,'uneven_squat_L',2,7),(22,'uneven_squat_R',2,7),(23,'half_oneleg_squat_L',2,8),(24,'half_oneleg_squat_R',2,8),(25,'assisted_oneleg_squat_L',2,9),(26,'assisted_oneleg_squat_R',2,9),(27,'oneleg_squat_L',2,10),(28,'oneleg_squat_R',2,10),(29,'vertical_pull',3,1),(30,'horizontal_pull',3,2),(31,'jackknife_pull',3,3),(32,'half_pullup',3,4),(33,'full_pullup',3,5),(34,'close_pullup',3,6),(35,'uneven_pullup_L',3,7),(36,'uneven_pullup_R',3,7),(37,'half_onearm_pullup_L',3,8),(38,'half_onearm_pullup_R',3,8),(39,'assisted_onearm_pullup_L',3,9),(40,'assisted_onearm_pullup_R',3,9),(41,'onearm_pullup_L',3,10),(42,'onearm_pullup_R',3,10),(43,'knee_tuck',4,1),(44,'flat_knee_raise',4,2),(45,'flat_bent_legraise',4,3),(46,'flat_frog_raise',4,4),(47,'flat_straight_legraise',4,5),(48,'hanging_knee_raise',4,6),(49,'hanging_bent_legraise',4,7),(50,'hanging_frog_raise',4,8),(51,'partial_straight_legraise',4,9),(52,'hanging_straight_legraise',4,10),(53,'short_bridge',5,1),(54,'straight_bridge',5,2),(55,'angled_bridge',5,3),(56,'head_bridge',5,4),(57,'half_bridge',5,5),(58,'full_bridge',5,6),(59,'wallwalking_bridge_down',5,7),(60,'wallwalking_bridge_up',5,8),(61,'closing_bridge',5,9),(62,'stand_to_stand_bridge',5,10),(63,'wall_headstand',6,1),(64,'crow_stand',6,2),(65,'wall_handstand',6,3),(66,'half_stand_pushup',6,4),(67,'handstand_pushup',6,5),(68,'close_handstand_pushup',6,6),(69,'uneven_handstand_pushup_L',6,7),(70,'uneven_handstand_pushup_R',6,7),(71,'half_onearm_handstand_pushup_L',6,8),(72,'half_onearm_handstand_pushup_R',6,8),(73,'lever_handstand_pushup_L',6,9),(74,'lever_handstand_pushup_R',6,9),(75,'onearm_handstand_pushup_L',6,10),(76,'onearm_handstand_pushup_R',6,10);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `menu_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=566 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (1,'2019-06-09',30,10),(2,'2019-06-09',30,21),(3,'2019-06-09',30,15),(4,'2019-06-09',20,20),(5,'2019-06-09',21,15),(6,'2019-06-09',22,18),(7,'2019-06-11',53,50),(8,'2019-06-11',53,50),(9,'2019-06-11',53,50),(10,'2019-06-11',65,60),(11,'2019-06-11',65,40),(12,'2019-06-16',48,10),(13,'2019-06-16',48,10),(14,'2019-06-16',6,10),(15,'2019-06-16',9,15),(16,'2019-06-16',10,15),(17,'2019-06-16',9,15),(18,'2019-06-16',10,15),(19,'2019-06-20',22,19),(20,'2019-06-20',21,16),(21,'2019-06-20',22,4),(22,'2019-06-20',21,11),(23,'2019-06-20',30,16),(24,'2019-06-20',30,16),(25,'2019-06-20',30,12),(31,'2019-06-23',65,90),(33,'2019-06-23',0,20),(34,'2019-06-23',0,20),(35,'2019-06-23',54,20),(36,'2019-06-23',54,20),(39,'2019-06-26',48,5),(40,'2019-06-26',48,10),(41,'2019-06-26',48,11),(42,'2019-06-26',10,20),(43,'2019-06-26',9,20),(44,'2019-06-26',10,10),(45,'2019-06-26',9,10),(46,'2019-07-01',30,10),(47,'2019-07-01',65,60),(48,'2019-07-01',30,24),(50,'2019-07-01',30,18),(51,'2019-07-01',30,17),(52,'2019-07-01',22,15),(53,'2019-07-01',21,10),(54,'2019-07-03',65,60),(55,'2019-07-03',65,60),(56,'2019-07-03',65,60),(57,'2019-07-04',54,20),(58,'2019-07-04',54,25),(59,'2019-07-04',54,30),(60,'2019-07-07',6,10),(61,'2019-07-07',6,10),(62,'2019-07-07',10,20),(63,'2019-07-07',10,20),(64,'2019-07-07',9,20),(65,'2019-07-07',9,15),(66,'2019-07-08',30,10),(67,'2019-07-08',30,20),(68,'2019-07-08',30,15),(69,'2019-07-15',5,20),(70,'2019-07-15',5,20),(71,'2019-07-15',19,30),(72,'2019-07-15',19,30),(73,'2019-07-16',65,60),(74,'2019-07-16',65,60),(75,'2019-07-17',48,15),(76,'2019-07-17',48,15),(77,'2019-07-18',54,40),(78,'2019-07-18',54,40),(79,'2019-07-18',54,40),(80,'2019-07-22',30,15),(81,'2019-07-22',30,20),(82,'2019-07-22',30,20),(83,'2019-07-23',55,8),(84,'2019-07-24',65,60),(85,'2019-07-24',65,60),(86,'2019-07-25',49,5),(87,'2019-07-25',49,5),(88,'2019-07-25',49,10),(89,'2019-07-26',19,10),(90,'2019-07-26',19,10),(91,'2019-07-26',21,15),(92,'2019-07-26',22,10),(93,'2019-07-26',21,8),(94,'2019-07-26',22,5),(95,'2019-07-27',5,10),(96,'2019-07-27',5,10),(97,'2019-07-27',9,20),(98,'2019-07-27',10,20),(99,'2019-07-27',9,20),(100,'2019-07-27',10,20),(101,'2019-07-27',9,20),(102,'2019-07-27',10,20),(103,'2019-07-29',30,10),(104,'2019-07-29',29,20),(105,'2019-07-29',30,18),(106,'2019-07-30',55,15),(107,'2019-07-30',55,15),(108,'2019-07-31',65,70),(109,'2019-07-31',65,48),(110,'2019-08-01',49,10),(111,'2019-08-01',49,10),(112,'2019-08-01',49,6),(113,'2019-08-02',19,10),(114,'2019-08-02',19,10),(115,'2019-08-02',21,10),(116,'2019-08-02',22,3),(117,'2019-08-04',5,10),(118,'2019-08-04',5,10),(119,'2019-08-04',9,10),(120,'2019-08-04',9,10),(121,'2019-08-04',10,10),(122,'2019-08-04',10,10),(123,'2019-08-04',11,5),(124,'2019-08-04',12,5),(125,'2019-08-05',30,24),(126,'2019-08-05',30,20),(127,'2019-08-05',30,14),(128,'2019-08-07',55,20),(129,'2019-08-07',55,20),(130,'2019-08-07',65,60),(131,'2019-08-07',65,60),(132,'2019-08-08',49,15),(133,'2019-08-08',49,15),(134,'2019-08-09',19,30),(135,'2019-08-09',19,30),(136,'2019-08-09',21,7),(137,'2019-08-09',22,9),(138,'2019-08-19',30,20),(139,'2019-08-19',30,17),(140,'2019-08-19',30,20),(141,'2019-08-20',55,30),(142,'2019-08-20',55,30),(143,'2019-08-20',55,17),(144,'2019-08-22',65,60),(145,'2019-08-22',65,70),(146,'2019-08-22',51,10),(147,'2019-08-22',51,5),(148,'2019-08-22',51,10),(151,'2019-08-24',19,10),(152,'2019-08-24',19,10),(153,'2019-08-24',21,5),(154,'2019-08-24',22,5),(155,'2019-08-24',21,5),(156,'2019-08-24',22,5),(157,'2019-08-25',11,6),(158,'2019-08-25',12,6),(159,'2019-08-25',11,7),(160,'2019-08-25',12,6),(161,'2019-08-26',30,20),(162,'2019-08-26',30,21),(163,'2019-08-26',30,9),(164,'2019-08-28',55,15),(165,'2019-08-29',65,75),(166,'2019-08-29',51,15),(167,'2019-08-29',51,15),(168,'2019-09-03',5,20),(169,'2019-09-03',19,30),(170,'2019-09-03',33,3),(171,'2019-09-03',33,3),(172,'2019-09-03',47,5),(173,'2019-09-14',5,20),(174,'2019-09-14',5,20),(175,'2019-09-14',19,30),(176,'2019-09-14',19,30),(177,'2019-09-14',47,20),(178,'2019-09-14',47,20),(179,'2019-09-15',33,3),(180,'2019-09-15',57,8),(181,'2019-09-16',30,11),(182,'2019-09-16',30,15),(183,'2019-09-16',30,11),(184,'2019-09-17',55,20),(185,'2019-09-17',55,21),(186,'2019-09-18',65,80),(187,'2019-09-24',52,5),(188,'2019-09-24',52,5),(189,'2019-09-24',52,5),(190,'2019-09-26',55,10),(191,'2019-09-26',55,15),(192,'2019-09-26',55,10),(193,'2019-09-27',5,10),(194,'2019-09-27',12,5),(195,'2019-09-27',11,5),(196,'2019-09-27',12,5),(197,'2019-09-27',11,5),(198,'2019-09-28',65,90),(199,'2019-10-01',30,21),(200,'2019-10-01',30,20),(201,'2019-10-01',55,20),(202,'2019-10-01',55,20),(203,'2019-10-03',65,50),(204,'2019-10-03',65,60),(205,'2019-10-05',52,10),(206,'2019-10-05',52,4),(207,'2019-10-05',52,2),(208,'2019-10-05',12,7),(209,'2019-10-05',11,3),(210,'2019-10-05',12,8),(211,'2019-10-05',11,7),(212,'2019-10-05',20,20),(213,'2019-10-05',20,20),(214,'2019-10-07',30,22),(215,'2019-10-07',30,21),(216,'2019-10-08',55,25),(217,'2019-10-08',55,25),(218,'2019-10-09',65,75),(219,'2019-10-09',65,80),(220,'2019-10-10',52,10),(222,'2019-10-10',52,10),(223,'2019-10-11',19,10),(224,'2019-10-11',19,10),(225,'2019-10-12',19,10),(226,'2019-10-12',20,10),(227,'2019-10-12',20,10),(228,'2019-10-12',21,5),(229,'2019-10-12',22,5),(230,'2019-10-12',21,5),(231,'2019-10-12',22,5),(232,'2019-10-12',5,10),(233,'2019-10-12',6,10),(234,'2019-10-12',12,6),(235,'2019-10-12',11,6),(236,'2019-10-12',11,7),(237,'2019-10-12',12,7),(238,'2019-10-14',29,20),(239,'2019-10-14',30,10),(240,'2019-10-14',30,10),(241,'2019-10-14',30,17),(242,'2019-10-15',53,25),(243,'2019-10-15',54,20),(244,'2019-10-15',55,30),(245,'2019-10-15',55,30),(246,'2019-10-15',55,30),(247,'2019-10-16',63,60),(248,'2019-10-16',64,30),(249,'2019-10-16',65,48),(250,'2019-10-16',65,60),(251,'2019-10-17',47,10),(252,'2019-10-17',48,10),(253,'2019-10-28',30,10),(254,'2019-10-28',29,20),(255,'2019-10-28',30,17),(256,'2019-10-29',56,8),(257,'2019-11-09',5,10),(258,'2019-11-09',6,10),(259,'2019-11-09',11,5),(260,'2019-11-09',12,5),(261,'2019-11-10',19,10),(262,'2019-11-10',20,10),(263,'2019-11-10',21,5),(264,'2019-11-10',22,5),(265,'2019-11-10',21,10),(266,'2019-11-10',22,10),(267,'2019-11-11',47,10),(268,'2019-11-11',48,10),(269,'2019-11-11',52,10),(270,'2019-11-11',52,10),(271,'2019-11-11',65,30),(272,'2019-11-11',65,55),(273,'2019-11-12',54,20),(274,'2019-11-12',55,15),(275,'2019-11-12',56,15),(276,'2019-11-12',56,15),(277,'2019-11-13',29,20),(278,'2019-11-13',30,11),(279,'2019-11-13',30,15),(280,'2019-11-13',30,16),(281,'2019-11-16',5,10),(282,'2019-11-16',6,10),(283,'2019-11-16',11,5),(284,'2019-11-16',12,5),(285,'2019-11-20',19,10),(286,'2019-11-20',20,10),(287,'2019-11-20',21,5),(288,'2019-11-20',22,5),(289,'2019-11-20',21,5),(290,'2019-11-20',22,5),(291,'2019-11-20',65,60),(292,'2019-11-20',65,60),(293,'2019-11-25',29,20),(294,'2019-11-25',30,15),(295,'2019-11-25',30,16),(296,'2019-11-26',54,20),(297,'2019-11-26',55,15),(298,'2019-11-26',56,15),(299,'2019-11-26',56,15),(300,'2019-11-27',65,70),(301,'2019-11-30',5,10),(302,'2019-11-30',6,10),(303,'2019-11-30',12,10),(304,'2019-11-30',11,10),(305,'2019-11-30',12,10),(306,'2019-11-30',11,10),(307,'2019-12-01',19,10),(308,'2019-12-01',20,10),(309,'2019-12-01',22,5),(310,'2019-12-01',21,5),(311,'2019-12-01',22,10),(312,'2019-12-01',21,10),(313,'2019-12-02',47,10),(314,'2019-12-02',48,10),(315,'2019-12-02',52,11),(316,'2019-12-02',52,10),(317,'2019-12-03',65,71),(318,'2019-12-07',54,20),(319,'2019-12-07',55,15),(320,'2019-12-07',56,20),(321,'2019-12-09',29,20),(322,'2019-12-09',30,10),(323,'2019-12-09',30,16),(324,'2019-12-09',30,15),(325,'2019-12-10',54,20),(326,'2019-12-10',55,15),(327,'2019-12-10',56,17),(328,'2019-12-10',56,16),(329,'2019-12-11',65,75),(330,'2019-12-12',47,10),(331,'2019-12-12',48,10),(332,'2019-12-12',52,13),(333,'2019-12-12',52,10),(334,'2019-12-14',19,10),(335,'2019-12-14',20,10),(336,'2019-12-14',21,10),(337,'2019-12-14',22,10),(338,'2019-12-15',5,10),(339,'2019-12-15',6,10),(340,'2019-12-15',11,8),(341,'2019-12-15',12,8),(342,'2019-12-16',29,20),(343,'2019-12-16',30,20),(344,'2019-12-16',30,13),(345,'2019-12-25',54,20),(346,'2019-12-25',55,15),(347,'2019-12-25',56,15),(348,'2019-12-25',56,15),(349,'2019-12-26',65,90),(350,'2020-01-04',5,10),(351,'2020-01-04',6,10),(352,'2020-01-04',11,5),(353,'2020-01-04',12,5),(354,'2020-01-05',19,10),(355,'2020-01-05',20,10),(356,'2020-01-05',21,10),(357,'2020-01-05',22,10),(358,'2020-01-06',65,50),(359,'2020-01-06',65,60),(360,'2020-01-07',54,20),(361,'2020-01-07',55,15),(362,'2020-01-07',56,25),(363,'2020-01-07',56,25),(364,'2020-01-08',47,10),(365,'2020-01-08',48,5),(366,'2020-01-08',52,11),(367,'2020-01-08',52,7),(368,'2020-01-09',29,10),(369,'2020-01-09',29,10),(370,'2020-01-09',30,17),(371,'2020-01-09',30,17),(372,'2020-01-11',5,10),(373,'2020-01-11',6,10),(374,'2020-01-11',12,7),(375,'2020-01-11',11,8),(376,'2020-01-11',12,5),(377,'2020-01-11',11,8),(378,'2020-01-13',19,10),(379,'2020-01-13',20,10),(380,'2020-01-13',22,10),(381,'2020-01-13',21,10),(382,'2020-01-13',22,10),(383,'2020-01-13',21,10),(384,'2020-01-14',47,10),(385,'2020-01-14',48,10),(386,'2020-01-14',52,10),(387,'2020-01-14',52,11),(388,'2020-01-14',65,70),(389,'2020-01-15',56,15),(390,'2020-01-15',57,8),(391,'2020-01-16',29,20),(392,'2020-01-16',30,20),(393,'2020-01-16',30,17),(394,'2020-01-18',29,20),(395,'2020-01-18',30,21),(396,'2020-01-18',30,20),(397,'2020-01-19',56,15),(398,'2020-01-19',57,15),(399,'2020-01-19',57,15),(400,'2020-01-20',65,90),(401,'2020-01-21',47,10),(402,'2020-01-21',52,10),(403,'2020-01-21',52,7),(404,'2020-01-22',19,10),(405,'2020-01-22',21,7),(406,'2020-01-22',22,7),(407,'2020-01-23',12,10),(408,'2020-01-23',5,10),(409,'2020-01-23',6,10),(410,'2020-01-23',11,10),(411,'2020-01-23',11,3),(412,'2020-01-23',12,3),(413,'2020-02-04',56,15),(414,'2020-02-04',57,16),(415,'2020-02-03',65,69),(416,'2020-02-03',65,69),(417,'2020-02-05',5,10),(418,'2020-02-05',6,10),(419,'2020-02-05',11,5),(420,'2020-02-05',12,5),(421,'2020-02-05',11,6),(422,'2020-02-05',12,6),(424,'2020-02-09',20,10),(425,'2020-02-09',19,10),(426,'2020-02-09',21,5),(427,'2020-02-09',22,5),(428,'2020-02-10',65,90),(429,'2020-02-11',47,10),(430,'2020-02-11',47,20),(431,'2020-02-12',30,19),(432,'2020-02-12',30,15),(433,'2020-02-13',57,20),(434,'2020-02-13',57,20),(435,'2020-02-13',56,15),(436,'2020-02-18',5,10),(437,'2020-02-18',6,10),(438,'2020-02-18',11,8),(440,'2020-02-18',12,3),(441,'2020-02-20',19,10),(442,'2020-02-20',20,10),(443,'2020-02-20',21,6),(444,'2020-02-20',22,6),(445,'2020-02-20',21,5),(446,'2020-02-20',22,5),(447,'2020-02-20',47,10),(448,'2020-02-20',52,5),(449,'2020-02-20',52,5),(450,'2020-02-23',56,15),(451,'2020-02-23',58,6),(452,'2020-02-23',65,30),(453,'2020-02-23',65,45),(454,'2020-02-24',30,12),(455,'2020-02-24',30,18),(456,'2020-02-24',30,14),(457,'2020-02-26',58,10),(458,'2020-02-26',58,10),(459,'2020-02-27',65,88),(460,'2020-03-01',47,10),(461,'2020-03-01',52,5),(462,'2020-03-01',52,11),(463,'2020-03-01',52,6),(464,'2020-03-04',19,10),(465,'2020-03-04',20,10),(466,'2020-03-04',21,5),(467,'2020-03-04',22,5),(468,'2020-03-04',21,10),(469,'2020-03-04',5,10),(470,'2020-03-04',6,10),(471,'2020-03-04',11,10),(472,'2020-03-04',12,10),(473,'2020-03-04',11,10),(474,'2020-03-04',12,10),(475,'2020-03-08',30,18),(476,'2020-03-08',30,20),(477,'2020-03-08',58,15),(478,'2020-03-08',58,15),(479,'2020-03-10',65,30),(480,'2020-03-10',65,60),(481,'2020-03-10',65,60),(482,'2020-03-11',47,10),(483,'2020-03-11',52,11),(484,'2020-03-11',52,9),(486,'2020-03-12',19,10),(487,'2020-03-12',20,10),(488,'2020-03-12',21,10),(489,'2020-03-12',22,10),(490,'2020-03-12',21,5),(491,'2020-03-12',22,5),(492,'2020-03-15',5,10),(493,'2020-03-15',6,10),(494,'2020-03-17',5,10),(495,'2020-03-17',6,10),(496,'2020-03-17',11,10),(497,'2020-03-17',12,10),(498,'2020-03-17',11,10),(499,'2020-03-17',12,10),(500,'2020-03-18',30,10),(501,'2020-03-18',30,15),(502,'2020-03-19',58,10),(503,'2020-03-19',59,3),(504,'2020-04-11',5,10),(505,'2020-04-11',6,10),(506,'2020-04-11',11,10),(507,'2020-04-11',12,10),(509,'2020-04-17',19,10),(510,'2020-04-17',20,10),(511,'2020-04-17',21,5),(512,'2020-04-17',22,5),(513,'2020-04-17',21,5),(514,'2020-04-17',22,5),(515,'2020-03-24',65,80),(516,'2020-03-24',65,80),(517,'2020-04-21',5,10),(518,'2020-04-21',6,10),(520,'2020-04-21',11,16),(521,'2020-04-21',12,11),(522,'2020-04-21',11,5),(523,'2020-04-16',47,10),(524,'2020-04-21',12,5),(525,'2020-04-10',19,10),(526,'2020-04-10',20,10),(527,'2020-04-10',21,7),(528,'2020-04-10',22,7),(529,'2020-04-13',31,5),(530,'2020-04-13',31,5),(531,'2020-04-16',52,5),(532,'2020-04-16',52,10),(533,'2020-04-16',52,5),(534,'2020-04-15',65,10),(535,'2020-04-15',65,10),(536,'2020-04-14',58,10),(537,'2020-04-14',59,6),(538,'2020-04-14',59,6),(539,'2020-04-09',47,10),(540,'2020-04-09',52,5),(541,'2020-04-09',52,7),(542,'2020-04-09',52,10),(543,'2020-04-09',52,8),(544,'2020-04-08',65,30),(545,'2020-04-08',65,75),(546,'2020-04-08',66,5),(547,'2020-04-07',58,10),(548,'2020-04-07',59,6),(549,'2020-04-03',30,10),(550,'2020-04-03',30,15),(551,'2020-04-03',30,20),(552,'2020-04-01',5,10),(553,'2020-04-01',6,10),(554,'2020-04-01',11,7),(555,'2020-04-01',12,7),(556,'2020-03-31',5,10),(557,'2020-03-31',6,10),(558,'2020-03-30',19,10),(559,'2020-03-30',20,10),(560,'2020-03-30',21,5),(561,'2020-03-30',22,5),(562,'2020-03-30',5,10),(563,'2020-03-30',47,10),(564,'2020-03-30',52,5),(565,'2020-03-30',52,10);
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-22 13:17:43
