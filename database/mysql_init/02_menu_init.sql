-- MySQL dump 10.13  Distrib 5.5.62, for Linux (x86_64)
--
-- Host: training.c1fi4i7efxig.ap-northeast-1.rds.amazonaws.com    Database: training
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-09  5:47:12
