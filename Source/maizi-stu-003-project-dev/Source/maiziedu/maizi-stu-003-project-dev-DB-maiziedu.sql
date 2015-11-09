-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: maiziedu
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add 国家',6,'add_countrydict'),(17,'Can change 国家',6,'change_countrydict'),(18,'Can delete 国家',6,'delete_countrydict'),(19,'Can add 省份',7,'add_provincedict'),(20,'Can change 省份',7,'change_provincedict'),(21,'Can delete 省份',7,'delete_provincedict'),(22,'Can add 城市',8,'add_citydict'),(23,'Can change 城市',8,'change_citydict'),(24,'Can delete 城市',8,'delete_citydict'),(25,'Can add 用户信息',9,'add_userprofile'),(26,'Can change 用户信息',9,'change_userprofile'),(27,'Can delete 用户信息',9,'delete_userprofile'),(28,'Can add captcha store',10,'add_captchastore'),(29,'Can change captcha store',10,'change_captchastore'),(30,'Can delete captcha store',10,'delete_captchastore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (1,'RQMY','rqmy','656db9d1d42d79c72fb655f15289d6fe294138d9','2015-10-18 15:18:37'),(2,'ITUD','itud','8a4b99cab603ef14c004104fe3beaedc52346160','2015-10-18 15:19:09'),(3,'IZDR','izdr','721fa1a5b6c430708b860f41237f93a5529b6acc','2015-10-18 15:33:27'),(4,'NHGW','nhgw','c337ffef616770833f33ee796032e560fca539c0','2015-10-19 05:51:54');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(6,'maiziapp','countrydict'),(7,'maiziapp','provincedict'),(8,'maiziapp','citydict'),(9,'maiziapp','userprofile'),(10,'captcha','captchastore');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-10-12 06:30:00'),(2,'admin','0001_initial','2015-10-12 06:30:00'),(3,'contenttypes','0002_remove_content_type_name','2015-10-12 06:30:00'),(4,'auth','0001_initial','2015-10-12 06:30:00'),(5,'auth','0002_alter_permission_name_max_length','2015-10-12 06:30:00'),(6,'auth','0003_alter_user_email_max_length','2015-10-12 06:30:00'),(7,'auth','0004_alter_user_username_opts','2015-10-12 06:30:00'),(8,'auth','0005_alter_user_last_login_null','2015-10-12 06:30:00'),(9,'auth','0006_require_contenttypes_0002','2015-10-12 06:30:00'),(10,'sessions','0001_initial','2015-10-12 06:30:00'),(11,'captcha','0001_initial','2015-10-18 08:42:43');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('36f8mz2vrq2a7pm708ii9sudihozyrg3','NDFiZDUzMTkzYTMwMzg4ZjdjYjQzYmQ0NTQzYWRmNjYwNTVmN2EzYzp7ImVtYWlsIjoiMzU5NTk4MTlAcXEuY29tIn0=','2015-11-03 07:49:53'),('qlbxg8t3dmihmqq5iivvo9ktn0vop5u1','NGJlOWM4ZGRkOGMxNmJkZDAyN2E0ZjE4ZGQ0NTk3NmIxNDQ5ZmZkOTp7ImNhcHRjaGEiOiJJNzBtIn0=','2015-11-20 09:12:07'),('342ei7rnm5qimzlh5ccd6wzlh5rgopxp','MDVhN2Y2N2I5ZWUxNDMyNWQ5NDhhZmJiZWQ1YjAzNzg3NmFlYjY1Njp7ImNhcHRjaGEiOiJTVVg1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoibWFpemlhcHAuYXV0aC5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWZjNzMxM2YwNmEyYzM1NjI3OTk1NGFhZDViOGQwOWNiNThhMWVjYyIsImVtYWlsIjoid2lsbHkueXVAMmxpLmNjIiwiX2F1dGhfdXNlcl9pZCI6IjU1In0=','2015-11-22 06:07:57');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maiziapp_citydict`
--

DROP TABLE IF EXISTS `maiziapp_citydict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maiziapp_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `province_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maiziapp_citydict_4a5754ed` (`province_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maiziapp_citydict`
--

LOCK TABLES `maiziapp_citydict` WRITE;
/*!40000 ALTER TABLE `maiziapp_citydict` DISABLE KEYS */;
/*!40000 ALTER TABLE `maiziapp_citydict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maiziapp_countrydict`
--

DROP TABLE IF EXISTS `maiziapp_countrydict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maiziapp_countrydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maiziapp_countrydict`
--

LOCK TABLES `maiziapp_countrydict` WRITE;
/*!40000 ALTER TABLE `maiziapp_countrydict` DISABLE KEYS */;
/*!40000 ALTER TABLE `maiziapp_countrydict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maiziapp_provincedict`
--

DROP TABLE IF EXISTS `maiziapp_provincedict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maiziapp_provincedict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maiziapp_provincedict_93bfec8a` (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maiziapp_provincedict`
--

LOCK TABLES `maiziapp_provincedict` WRITE;
/*!40000 ALTER TABLE `maiziapp_provincedict` DISABLE KEYS */;
/*!40000 ALTER TABLE `maiziapp_provincedict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maiziapp_userprofile`
--

DROP TABLE IF EXISTS `maiziapp_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maiziapp_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(30) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `avatar_url` varchar(200) NOT NULL,
  `avatar_thumbnail_url` varchar(200) NOT NULL,
  `qqnumber` varchar(20) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `company_name` varchar(150) NOT NULL,
  `position` varchar(150) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `maiziapp_userprofile_93bfec8a` (`country_id`),
  KEY `maiziapp_userprofile_c7141997` (`city_id`),
  KEY `maiziapp_userprofile_4a5754ed` (`province_id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maiziapp_userprofile`
--

LOCK TABLES `maiziapp_userprofile` WRITE;
/*!40000 ALTER TABLE `maiziapp_userprofile` DISABLE KEYS */;
INSERT INTO `maiziapp_userprofile` VALUES (1,'pbkdf2_sha256$20000$H7HxBSqED8mI$9aHaO9KBWwZU2usWQxkqqN5x+UIWnCms9I93L/8SIxE=','2015-11-08 03:26:40',1,'35959819@qq.com','',1,1,'2015-10-12 06:30:15','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(2,'pbkdf2_sha256$20000$KA184TJiaIK7$Www61RApNaRoz5jTgak8Cg9swgafjmS7odPg1XlHgoc=','2015-10-16 06:53:43',0,'dsddd@ddssd.com','dsddd',0,1,'2015-10-12 06:32:29','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(3,'pbkdf2_sha256$20000$Vr0Ptt1PqfUy$idBrL8CBh4wR8a6sIzc2Pb59SJAe0ld1XRA1fPlio2Q=','2015-10-12 06:42:45',0,'dsddd1@ddssd.com','dsddd1',0,1,'2015-10-12 06:34:47','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(4,'pbkdf2_sha256$20000$Q3oLsPoIXDJ8$N93Z+J33t0EsUUMpPtSezgKoUGG9UsxOu4vpOHRo3WA=','2015-10-16 07:18:21',0,'hehe@hehe.com','hehe',0,1,'2015-10-16 07:10:41','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(5,'pbkdf2_sha256$20000$INBt6VpZT63h$E4LNrqSzqUok0XAurRRGQfLTKXE7mNy8BRgDPDYglMU=','2015-10-16 08:30:23',0,'aa@aa.com','aa',0,1,'2015-10-16 08:30:08','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(55,'pbkdf2_sha256$20000$HTcrNirzkb1M$7ab502hpFyXa/UU9Au+397oZmWR0SX4rkqh5/V32lFc=','2015-11-08 06:07:57',0,'willy.yu@2li.cc','willy.yu',0,1,'2015-11-08 06:05:44','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(7,'pbkdf2_sha256$20000$3aGWUvLawNfG$XbfmOmvMRP0QyCp7zHlQmdrV2Y1vFSsre3f2JULhitA=','2015-10-18 07:00:35',0,'cc@qq.com','cc',0,1,'2015-10-18 07:00:35','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(8,'pbkdf2_sha256$20000$bkxfxBak2aDG$AVfkivlMGYFYcVMdgcArxOUueV+pH0fqS/dYJ8UJkJM=','2015-11-05 06:58:27',0,'abc@abc.com','abc',0,1,'2015-11-05 06:49:59','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(9,'pbkdf2_sha256$20000$AbAhVn2Vf3vN$sfFXseoUqURouc1yX3JPfyM1KiMJClAJVD7MG8s+sLw=','2015-11-05 07:00:52',0,'a@a.com','a',0,1,'2015-11-05 07:00:52','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(10,'pbkdf2_sha256$20000$2DST6HVFI9bd$nCIgUCon1O2Egp9+YtTHFBiuTVIGv/Pp2wr794DpkOg=','2015-11-05 07:06:05',0,'b1@b1.com','b1',0,1,'2015-11-05 07:06:05','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(11,'pbkdf2_sha256$20000$mNSgpOrLOoxJ$gfhNSJ/X+zFjlyhWmcrFIeQao0nYsGkZIMiu5EUZRTo=','2015-11-05 07:07:42',0,'d1@d1.com','d1',0,1,'2015-11-05 07:07:42','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(12,'pbkdf2_sha256$20000$Dm691wt918H9$WK0HWxxHB+vj2jN3epzEauZ5sQGfeasI/vU0CJEsmCY=','2015-11-05 07:08:47',0,'f1@f1.com','f1',0,1,'2015-11-05 07:08:47','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(13,'pbkdf2_sha256$20000$N0u9I3INDrf6$omjNMQXjNo2ufHj+hjsaxj4wHFwUCPYD7iF0B2XTt8Q=','2015-11-05 07:08:58',0,'e1@e1.com','e1',0,1,'2015-11-05 07:08:58','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(14,'pbkdf2_sha256$20000$y6iv8THeUntu$C6twQlAFFh3jfafP2fzILglsa/Z114AE0MXfumpKQhM=','2015-11-05 07:11:01',0,'g1@g1.com','g1',0,1,'2015-11-05 07:11:01','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(15,'pbkdf2_sha256$20000$OKuMCXlADHlf$0HVN4twuxQQicB7pIDsbnn8zp12/9sJ1dvceFRIL5II=','2015-11-05 07:12:26',0,'h1@h1.com','h1',0,1,'2015-11-05 07:12:26','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(16,'pbkdf2_sha256$20000$H7WuiKZ0P8kh$sQ5Irt8PJkmpb13IaQ5aj5tFn94SQEqH1ynKiYFc5tk=','2015-11-05 07:13:57',0,'j1@j1.com','j1',0,1,'2015-11-05 07:13:57','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(17,'pbkdf2_sha256$20000$aPUUITYUURrp$iByDRizIA5TrJhkYowiYn8mvGaDMAxGYepiDS6NYhNs=','2015-11-05 07:14:32',0,'k1@k1.com','k1',0,1,'2015-11-05 07:14:32','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(18,'pbkdf2_sha256$20000$kHdmvi2LAEQO$PTmHsbqdi0Gce9ZCRMtkQaidD7SZx1EE5zRSw/NnGdE=','2015-11-05 07:16:45',0,'q1@q1.com','q1',0,1,'2015-11-05 07:16:45','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(19,'pbkdf2_sha256$20000$Z7JzlVHrnkBJ$stlgbg8HVJ0mPMDBBj/syMKU4gVn0k+psk9VzvuoTLI=','2015-11-05 07:29:18',0,'w1@w1.com','w1',0,1,'2015-11-05 07:28:30','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(20,'pbkdf2_sha256$20000$8OxDi8JovnvF$rA58DgrQS4nWC2iJxply2Gb+DbU/AVxFxHtI+8fkxRg=','2015-11-05 07:29:43',0,'t1@t1.com','t1',0,1,'2015-11-05 07:29:43','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(21,'pbkdf2_sha256$20000$41wQXpyp2Fid$5ZzJlw8HZa/FzcDPCB6HnuYf0Eovs6/Lmswa1gLb57w=','2015-11-05 07:31:22',0,'y1@y1.com','y1',0,1,'2015-11-05 07:31:12','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(22,'pbkdf2_sha256$20000$XA4xfjOZmlqX$T5HeUkxZ5ut8zh3spzONtB6mMqKhLvq2kGL3EvNMHOE=','2015-11-05 07:32:56',0,'zz1@zz1.com','zz1',0,1,'2015-11-05 07:32:56','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(23,'pbkdf2_sha256$20000$4LaWp9UhMAj4$Gg5OgvZkk5oIZc+ffIqRJbrb4Nz5qHUWtv8j1Oul/V4=','2015-11-05 07:35:05',0,'xx1@xx1.com','xx1',0,1,'2015-11-05 07:35:05','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(24,'pbkdf2_sha256$20000$9qmchaDQ1mvA$oYGX1gkLM9Lp7ys4ljytFtJKmdj2G7iOOjrw1mV+Q3s=','2015-11-05 07:35:58',0,'aaa1@aaa1.com','aaa1',0,1,'2015-11-05 07:35:58','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(25,'pbkdf2_sha256$20000$LpTRDAkjupMU$CqPu4iF03671n3Jyy1yHgdVgcwSLf8Blb+SIi8KWTAE=','2015-11-05 07:37:03',0,'bb1@bb1.com','bb1',0,1,'2015-11-05 07:37:03','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(26,'pbkdf2_sha256$20000$3YBZWBAOO7pd$Ip/9+kxVCvNRmr2C54K0HkAX74QU/+o9OXaoaah1eGk=','2015-11-05 07:37:38',0,'cc1@cc1.com','cc1',0,1,'2015-11-05 07:37:38','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(27,'pbkdf2_sha256$20000$fDebjE28ZeXf$6ZyMmE9ketZwf0hTyQUtie4bncTUOOUumQr9GSKnf3Q=','2015-11-05 07:40:35',0,'pp1@pp1.com','pp1',0,1,'2015-11-05 07:40:35','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(28,'pbkdf2_sha256$20000$WMsdkYNeMezp$uUzdYzgxCbovrQq8ZjVzRN0bRzyGDNwdvM/Ybc8cdtA=','2015-11-05 07:41:09',0,'pp2@pp2.com','pp2',0,1,'2015-11-05 07:41:09','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(29,'pbkdf2_sha256$20000$2aqzIZzWf9Et$eM5cc3AyzyRVIsj4Aq6HIZ/f9RtQVe5NyY0We/ZC9AI=','2015-11-05 07:48:56',0,'pp3@pp3.com','pp3',0,1,'2015-11-05 07:48:56','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(30,'pbkdf2_sha256$20000$Z5yHc85sUTPJ$80QxP3WdGK8faeNYrS3zw9NPpqkgJsrBTW3ni6rYbzE=','2015-11-05 07:50:55',0,'pp4@pp4.com','pp4',0,1,'2015-11-05 07:50:55','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(31,'pbkdf2_sha256$20000$HuCP6MuJNxzN$H81zXGQM1u/Qlgz0cStnviRryosUV2SWCKJBZwgvJns=','2015-11-05 07:55:05',0,'ppp5@ppp5.com','ppp5',0,1,'2015-11-05 07:52:30','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(32,'pbkdf2_sha256$20000$CjQJ86HMm9V5$oUfYdsck+WniPzCemNMEAtFfXp4HNrkZst7wFjTBfNo=','2015-11-05 08:12:36',0,'oo2@oo2.com','oo2',0,1,'2015-11-05 08:12:24','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(33,'pbkdf2_sha256$20000$X94uIZzSW7my$rl/aNc5/whWUnF0GDRlKPnneiZWrjN6GerX4ilnUnNs=','2015-11-05 08:13:30',0,'oo3@oo3.com','oo3',0,1,'2015-11-05 08:13:30','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(34,'pbkdf2_sha256$20000$r3zWRkFTfkZm$D78Ki+AIUaeTvggFPy4eZNqQ57ja3Qwvs5ry0Ejd6+g=','2015-11-05 08:43:13',0,'mm1@mm1.com','mm1',0,1,'2015-11-05 08:43:02','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(35,'pbkdf2_sha256$20000$4CtssnpgrpaB$6QU5501AMyj2pqSSbyfHEG9wF5pDLbLPuSG1ea4/ndw=','2015-11-05 09:08:36',0,'pop@pop.com','pop',0,1,'2015-11-05 09:08:36','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(36,'pbkdf2_sha256$20000$JJ96bRZGeOX2$L9hbJwzLqaxFYVq4LwdPdCzVZTnIqC3PxLswX/rRROc=','2015-11-06 05:40:18',0,'bb2@bb2.com','bb2',0,1,'2015-11-06 05:40:06','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(37,'pbkdf2_sha256$20000$94H4DqQ1eLXn$v3TD/UEDSLJpU/PcaaUYrueN4G2PCQUPioYNaE0W9To=','2015-11-06 05:58:25',0,'vv2@vv2.com','vv2',0,1,'2015-11-06 05:58:25','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(38,'pbkdf2_sha256$20000$jzEab8YWSG0J$/mCQZWxJ9uo9uv8tek+1uC3Yuiv6njeVGHPpf/Oyrhk=','2015-11-06 07:02:27',0,'bb5@bb5.com','bb5',0,1,'2015-11-06 07:02:27','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(39,'pbkdf2_sha256$20000$aqpwnlQuu6NT$Yd6sin4kRQzSgOgc5Jwt71/CzEfV5Wtun+mGvHPExXE=','2015-11-06 07:04:16',0,'nn2@nn2.com','nn2',0,1,'2015-11-06 07:04:16','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(40,'pbkdf2_sha256$20000$YsZVe7VSNnPc$CWQ8pNmGLGzL2UaXWLB9Bez9AXxzuThDV2h8GwI3hWY=','2015-11-06 07:07:01',0,'mm3@mm3.com','mm3',0,1,'2015-11-06 07:07:01','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(41,'pbkdf2_sha256$20000$BxKzIa31LAHs$PGkXXU+podfqBUpBA/XkkPb6CjeGYz8MQEImSWJMSAg=','2015-11-08 03:27:52',0,'aa6@aa6.com','aa6',0,1,'2015-11-06 07:08:07','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(42,'pbkdf2_sha256$20000$eVwACDpLgLic$fYzHEo4BXUs+dKAXe6984ZfO2C7fChT5opnUzhkE3rw=','2015-11-06 07:30:12',0,'mm6@mm6.com','mm6',0,1,'2015-11-06 07:30:12','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(43,'pbkdf2_sha256$20000$c51JpWFytfBl$tp6MerRiWhqO2BWa1MaQ6IaFNUVuvFjcZHdRWiA8AF0=','2015-11-06 07:33:24',0,'mm7@mm7.com','mm7',0,1,'2015-11-06 07:33:24','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(44,'pbkdf2_sha256$20000$jG0yEm6h2BUi$YRiLI/YRCH2wKc+jyT2F1VkhCiDjtiPxeh/P26OxyxQ=','2015-11-06 07:37:08',0,'mm9@mm9.com','mm9',0,1,'2015-11-06 07:37:08','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(45,'pbkdf2_sha256$20000$Rc5JpyMVOZVr$dSKZou7Qa/r7dJzu1SUtxzivQ6+qYjsYWv/7pmf5mgA=','2015-11-06 07:40:50',0,'mm10@mm10.com','mm10',0,1,'2015-11-06 07:40:50','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(46,'pbkdf2_sha256$20000$vAQs0D4zQgSf$nFUo4tEiG29zaKW5i7m4rEMbsY4d5kuplmF2FnQxTCU=','2015-11-06 07:48:05',0,'mm17@mm17.com','mm17',0,1,'2015-11-06 07:48:04','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(47,'pbkdf2_sha256$20000$1MAGi40R6VbL$E0zffDYsT+nktsRrhECeog5Wu2Sij7PedPm/JAGsIdQ=','2015-11-06 07:51:36',0,'mm20@mm20.com','mm20',0,1,'2015-11-06 07:51:36','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(48,'pbkdf2_sha256$20000$NY5ghTm4UVwB$uTz3YpVQAcOdWmFZaSCvywp+uqDNBgIORfsQAXBuHiA=','2015-11-06 07:52:36',0,'mm22@mm22.com','mm22',0,1,'2015-11-06 07:52:36','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(49,'pbkdf2_sha256$20000$3rc0uWWWH6K1$TpI4lofbyYTvnVOv8Nn6nzvLk2y+GXEGTQpdkq/Bq4I=','2015-11-06 07:57:42',0,'mm55@mm55.com','mm55',0,1,'2015-11-06 07:57:42','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(50,'pbkdf2_sha256$20000$AyUsBxLWZ8i6$a1l81/xNZLGA+/ul92XN9fDb+l6qn0JHfG9aXROhYYg=','2015-11-06 08:02:01',0,'mm99@mm99.com','mm99',0,1,'2015-11-06 08:02:01','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(51,'pbkdf2_sha256$20000$0Bw6FIotSlN2$rpmPVCD9iCB4VTcHR51orxSSbtmqS42nTfvu51Z0ofo=','2015-11-06 08:05:27',0,'mmm99@mmm99.com','mmm99',0,1,'2015-11-06 08:05:27','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL),(52,'pbkdf2_sha256$20000$NfFLAFDXcSZo$V+kT/TUg764bVdPdrvUep1pWjp4RukC5WxBj2LieBLk=','2015-11-08 05:40:20',0,'2016649677@qq.com','2016649677',0,1,'2015-11-08 05:40:01','avatar/default.png','avatar_thumbnail/default.png','',NULL,'','',NULL,NULL,NULL);
/*!40000 ALTER TABLE `maiziapp_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maiziapp_userprofile_groups`
--

DROP TABLE IF EXISTS `maiziapp_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maiziapp_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userprofile_id` (`userprofile_id`,`group_id`),
  KEY `maiziapp_userprofile_groups_9c2a73e9` (`userprofile_id`),
  KEY `maiziapp_userprofile_groups_0e939a4f` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maiziapp_userprofile_groups`
--

LOCK TABLES `maiziapp_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `maiziapp_userprofile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `maiziapp_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maiziapp_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `maiziapp_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maiziapp_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userprofile_id` (`userprofile_id`,`permission_id`),
  KEY `maiziapp_userprofile_user_permissions_9c2a73e9` (`userprofile_id`),
  KEY `maiziapp_userprofile_user_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maiziapp_userprofile_user_permissions`
--

LOCK TABLES `maiziapp_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `maiziapp_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `maiziapp_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-08 15:13:20
