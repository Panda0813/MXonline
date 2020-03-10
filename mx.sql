-- MySQL dump 10.13  Distrib 5.7.25, for Win64 (x86_64)
--
-- Host: localhost    Database: mxonline
-- ------------------------------------------------------
-- Server version	5.7.25-log

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add 用户信息',6,'add_userprofile'),(17,'Can change 用户信息',6,'change_userprofile'),(18,'Can delete 用户信息',6,'delete_userprofile'),(19,'Can add 轮播图',7,'add_banner'),(20,'Can change 轮播图',7,'change_banner'),(21,'Can delete 轮播图',7,'delete_banner'),(22,'Can add 邮箱验证码',8,'add_emailverifyrecord'),(23,'Can change 邮箱验证码',8,'change_emailverifyrecord'),(24,'Can delete 邮箱验证码',8,'delete_emailverifyrecord'),(25,'Can add 课程',9,'add_course'),(26,'Can change 课程',9,'change_course'),(27,'Can delete 课程',9,'delete_course'),(28,'Can add 视频',10,'add_video'),(29,'Can change 视频',10,'change_video'),(30,'Can delete 视频',10,'delete_video'),(31,'Can add 章节',11,'add_lesson'),(32,'Can change 章节',11,'change_lesson'),(33,'Can delete 章节',11,'delete_lesson'),(34,'Can add 课程资源',12,'add_courseresource'),(35,'Can change 课程资源',12,'change_courseresource'),(36,'Can delete 课程资源',12,'delete_courseresource'),(37,'Can add 教师',13,'add_teacher'),(38,'Can change 教师',13,'change_teacher'),(39,'Can delete 教师',13,'delete_teacher'),(40,'Can add 城市',14,'add_citydict'),(41,'Can change 城市',14,'change_citydict'),(42,'Can delete 城市',14,'delete_citydict'),(43,'Can add 课程机构',15,'add_courseorg'),(44,'Can change 课程机构',15,'change_courseorg'),(45,'Can delete 课程机构',15,'delete_courseorg'),(46,'Can add 用户咨询',16,'add_userask'),(47,'Can change 用户咨询',16,'change_userask'),(48,'Can delete 用户咨询',16,'delete_userask'),(49,'Can add 用户收藏',17,'add_userfavorite'),(50,'Can change 用户收藏',17,'change_userfavorite'),(51,'Can delete 用户收藏',17,'delete_userfavorite'),(52,'Can add 用户学习课程',18,'add_usercourse'),(53,'Can change 用户学习课程',18,'change_usercourse'),(54,'Can delete 用户学习课程',18,'delete_usercourse'),(55,'Can add 课程评论',19,'add_coursecomment'),(56,'Can change 课程评论',19,'change_coursecomment'),(57,'Can delete 课程评论',19,'delete_coursecomment'),(58,'Can add 用户消息',20,'add_usermessage'),(59,'Can change 用户消息',20,'change_usermessage'),(60,'Can delete 用户消息',20,'delete_usermessage'),(61,'Can view log entry',1,'view_logentry'),(62,'Can view group',3,'view_group'),(63,'Can view permission',2,'view_permission'),(64,'Can view content type',4,'view_contenttype'),(65,'Can view 课程',9,'view_course'),(66,'Can view 课程资源',12,'view_courseresource'),(67,'Can view 章节',11,'view_lesson'),(68,'Can view 视频',10,'view_video'),(69,'Can view 课程评论',19,'view_coursecomment'),(70,'Can view 用户咨询',16,'view_userask'),(71,'Can view 用户学习课程',18,'view_usercourse'),(72,'Can view 用户收藏',17,'view_userfavorite'),(73,'Can view 用户消息',20,'view_usermessage'),(74,'Can view 城市',14,'view_citydict'),(75,'Can view 课程机构',15,'view_courseorg'),(76,'Can view 教师',13,'view_teacher'),(77,'Can view session',5,'view_session'),(78,'Can view 轮播图',7,'view_banner'),(79,'Can view 邮箱验证码',8,'view_emailverifyrecord'),(80,'Can view 用户信息',6,'view_userprofile'),(81,'Can add Bookmark',21,'add_bookmark'),(82,'Can change Bookmark',21,'change_bookmark'),(83,'Can delete Bookmark',21,'delete_bookmark'),(84,'Can add User Setting',22,'add_usersettings'),(85,'Can change User Setting',22,'change_usersettings'),(86,'Can delete User Setting',22,'delete_usersettings'),(87,'Can add User Widget',23,'add_userwidget'),(88,'Can change User Widget',23,'change_userwidget'),(89,'Can delete User Widget',23,'delete_userwidget'),(90,'Can add log entry',24,'add_log'),(91,'Can change log entry',24,'change_log'),(92,'Can delete log entry',24,'delete_log'),(93,'Can view Bookmark',21,'view_bookmark'),(94,'Can view log entry',24,'view_log'),(95,'Can view User Setting',22,'view_usersettings'),(96,'Can view User Widget',23,'view_userwidget'),(97,'Can add captcha store',25,'add_captchastore'),(98,'Can change captcha store',25,'change_captchastore'),(99,'Can delete captcha store',25,'delete_captchastore'),(100,'Can view captcha store',25,'view_captchastore');
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
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (21,'COYY','coyy','d705839a30a25a0b8d6e4d919ea8191c069456ad','2020-03-06 10:04:12.941221'),(22,'BAND','band','08e886988d21d48b93d5c797eeac251980d62dd2','2020-03-06 10:04:25.446478'),(23,'FYAR','fyar','49e305e46589048ec954f4db0a41c87dd0b4c27f','2020-03-06 10:06:17.279306'),(24,'WQDA','wqda','abd0fe7671c8d900b5ebc49b32243525d5ed5246','2020-03-06 10:06:23.397470'),(25,'OZVH','ozvh','55899c9183705ff677b3c4897bdbfe7b28d61b7c','2020-03-06 10:06:47.830841'),(26,'VPRX','vprx','42b1d0bcebf06a849b146e49ff2f3bc5017cdbf4','2020-03-06 10:06:48.744316'),(27,'JGZF','jgzf','dbc8e1405c2697d5dbb4b922ec14fe806e0b57e5','2020-03-06 10:07:18.966919'),(28,'VNIL','vnil','95ff134406fcdbf3ba7f64e7438dd815e5337d4e','2020-03-06 10:07:20.011317'),(29,'FCAQ','fcaq','431c801f4bf911435df81b21c5c1811844d743f0','2020-03-06 10:07:31.025945'),(30,'PWJM','pwjm','458e29ff2ca3ab321db4d8d5aede80b752db21ca','2020-03-06 10:07:36.621754'),(31,'UESB','uesb','e2a9f4a867e3b88bea84320ed0c51f7dd95f2346','2020-03-06 10:07:36.956562'),(32,'PEAK','peak','582e8dea06150f962e118b4bf6383b49657b2c03','2020-03-06 10:07:40.144360'),(33,'MTLU','mtlu','a1a79d1fafab7ae8129154bbd3d9b03d1d6007f8','2020-03-06 10:08:08.455118');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

DROP TABLE IF EXISTS `courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(2) NOT NULL,
  `learn_time` int(11) NOT NULL,
  `student` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `courseorg_id` int(11) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  `youneed_know` varchar(300) NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_courseorg_id_b5f9d1a6_fk_organizat` (`courseorg_id`),
  KEY `courses_course_teacher_id_846fa526_fk_organization_teacher_id` (`teacher_id`),
  CONSTRAINT `courses_course_courseorg_id_b5f9d1a6_fk_organizat` FOREIGN KEY (`courseorg_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (1,'django入门','django入门','django入门','cj',50,0,0,'courses/2020/03/57035ff200014b8a06000338-240-135.jpg',20,'2020-03-05 15:21:44.127670',1,'后端开发','python',NULL,'','',0),(2,'Java入门','北京北京','嘻嘻嘻嘻嘻嘻嘻嘻寻寻寻寻寻','zj',60,0,0,'courses/2020/03/57035ff200014b8a06000338-240-135_dHfj8Nq.jpg',0,'2020-03-06 19:32:50.439257',1,'后端开发','',NULL,'','',0),(3,'Python入门','xxxx','算法的个人和体会突然不听话','zj',100,0,0,'courses/2020/03/540e57300001d6d906000338-240-135_MSIqfvw.jpg',0,'2020-03-06 21:35:55.136283',1,'后端开发','python',NULL,'','',0),(4,'爬虫基础','详细信息','嘻嘻嘻嘻嘻嘻嘻嘻寻寻寻寻寻寻寻','cj',60,0,0,'courses/2020/03/540e57300001d6d906000338-240-135_mvvGYHL_iCwzwzI.jpg',5,'2020-03-06 21:36:23.518363',7,'后端开发','',NULL,'','',1),(5,'数据分析','方法方法付付','方法方法付付付付付付付付','zj',120,0,0,'courses/2020/03/540e57300001d6d906000338-240-135_n0L8vbw.jpg',0,'2020-03-06 21:37:09.630976',1,'后端开发','',NULL,'','',1),(6,'mysql入门','的萨无法为个人','df而非违法违规VR个','gj',180,1,0,'courses/2020/03/mysql.jpg',0,'2020-03-06 21:37:38.790476',7,'后端开发','',NULL,'','',0),(7,'Java进阶','哒哒哒哒哒哒多','的的发生的拖后腿人遇难','cj',30,0,0,'courses/2020/03/57035ff200014b8a06000338-240-135_0nFiBSI.jpg',0,'2020-03-06 21:38:07.884986',1,'后端开发','',NULL,'','',0),(8,'mysql进阶','发生任何一节课例','发给他也让他今天有劲儿python','gj',200,0,0,'courses/2020/03/540e57300001d6d906000338-240-135_MSIqfvw_cJTRGpa.jpg',1,'2020-03-06 21:38:42.822430',6,'后端开发','python',NULL,'xxxx','xxxxx',0),(9,'python高级语言','热儿童','人个人泊松分布人事干部深入风格','gj',150,0,0,'courses/2020/03/540e57300001d6d906000338-240-135_wH52IED.jpg',3,'2020-03-06 21:39:11.594104',1,'后端开发','',NULL,'','',0),(10,'php开发','少时诵诗书所所所','是否如图','cj',40,0,0,'courses/2020/03/540e57300001d6d906000338-240-135.jpg',60,'2020-03-06 21:39:53.453433',6,'后端开发','python',2,'这是django进阶开发','python基础要有',0);
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_courseresource`
--

DROP TABLE IF EXISTS `courses_courseresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_courseresource`
--

LOCK TABLES `courses_courseresource` WRITE;
/*!40000 ALTER TABLE `courses_courseresource` DISABLE KEYS */;
INSERT INTO `courses_courseresource` VALUES (1,'前端页面','course/2020/03/media.zip','2020-03-07 10:06:15.946509',10);
/*!40000 ALTER TABLE `courses_courseresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_lesson`
--

DROP TABLE IF EXISTS `courses_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson`
--

LOCK TABLES `courses_lesson` WRITE;
/*!40000 ALTER TABLE `courses_lesson` DISABLE KEYS */;
INSERT INTO `courses_lesson` VALUES (1,'第一章','2020-03-05 15:22:38.707147',1),(2,'第一章','2020-03-07 09:49:55.951719',10),(3,'第二章','2020-03-07 09:50:37.222098',10),(4,'第三章','2020-03-07 09:50:45.811637',10);
/*!40000 ALTER TABLE `courses_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_video`
--

DROP TABLE IF EXISTS `courses_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `learn_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_video`
--

LOCK TABLES `courses_video` WRITE;
/*!40000 ALTER TABLE `courses_video` DISABLE KEYS */;
INSERT INTO `courses_video` VALUES (1,'1.1 hello','2020-03-07 09:52:25.332790',2,'http://www.imooc.com/video/1430',0),(2,'1.2 基本概念','2020-03-07 09:52:38.610373',2,'http://www.imooc.com/video/1430',0),(3,'2.1 tttt','2020-03-07 09:56:49.845649',3,'http://www.imooc.com/video/1430',0),(4,'2.2 hhhh','2020-03-07 09:57:29.233776',3,'http://www.imooc.com/video/1430',0);
/*!40000 ALTER TABLE `courses_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(25,'captcha','captchastore'),(4,'contenttypes','contenttype'),(9,'courses','course'),(12,'courses','courseresource'),(11,'courses','lesson'),(10,'courses','video'),(19,'operation','coursecomment'),(16,'operation','userask'),(18,'operation','usercourse'),(17,'operation','userfavorite'),(20,'operation','usermessage'),(14,'organization','citydict'),(15,'organization','courseorg'),(13,'organization','teacher'),(5,'sessions','session'),(7,'users','banner'),(8,'users','emailverifyrecord'),(6,'users','userprofile'),(21,'xadmin','bookmark'),(24,'xadmin','log'),(22,'xadmin','usersettings'),(23,'xadmin','userwidget');
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
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-03-05 01:45:50.968500'),(2,'contenttypes','0002_remove_content_type_name','2020-03-05 01:45:52.305622'),(3,'auth','0001_initial','2020-03-05 01:45:57.269591'),(4,'auth','0002_alter_permission_name_max_length','2020-03-05 01:45:58.069200'),(5,'auth','0003_alter_user_email_max_length','2020-03-05 01:45:58.117191'),(6,'auth','0004_alter_user_username_opts','2020-03-05 01:45:58.161166'),(7,'auth','0005_alter_user_last_login_null','2020-03-05 01:45:58.210120'),(8,'auth','0006_require_contenttypes_0002','2020-03-05 01:45:58.326053'),(9,'auth','0007_alter_validators_add_error_messages','2020-03-05 01:45:58.397014'),(10,'auth','0008_alter_user_username_max_length','2020-03-05 01:45:58.440031'),(11,'auth','0009_alter_user_last_name_max_length','2020-03-05 01:45:58.484024'),(12,'users','0001_initial','2020-03-05 01:46:04.893886'),(13,'admin','0001_initial','2020-03-05 01:46:09.112424'),(14,'admin','0002_logentry_remove_auto_add','2020-03-05 01:46:09.184385'),(15,'sessions','0001_initial','2020-03-05 01:46:09.918572'),(16,'courses','0001_initial','2020-03-05 11:19:56.394348'),(17,'operation','0001_initial','2020-03-05 11:20:04.589731'),(18,'organization','0001_initial','2020-03-05 11:20:08.055734'),(19,'users','0002_banner_emailverifyrecord','2020-03-05 11:20:09.036176'),(20,'users','0003_auto_20200305_1320','2020-03-05 13:20:53.320543'),(21,'xadmin','0001_initial','2020-03-05 14:13:48.549535'),(22,'xadmin','0002_log','2020-03-05 14:13:52.167608'),(23,'xadmin','0003_auto_20160715_0100','2020-03-05 14:13:53.543806'),(24,'captcha','0001_initial','2020-03-05 21:25:15.257952'),(25,'operation','0002_auto_20200305_2125','2020-03-05 21:25:15.319922'),(26,'organization','0002_auto_20200305_2125','2020-03-05 21:25:15.390888'),(27,'users','0004_auto_20200305_2125','2020-03-05 21:25:15.455856'),(28,'organization','0003_courseorg_category','2020-03-06 14:03:17.411020'),(29,'organization','0004_auto_20200306_1530','2020-03-06 15:30:57.777390'),(30,'courses','0002_course_courseorg','2020-03-06 19:31:03.215783'),(31,'courses','0003_auto_20200306_1957','2020-03-06 19:57:50.947206'),(32,'operation','0003_auto_20200306_1957','2020-03-06 19:57:58.847810'),(33,'organization','0005_auto_20200306_1957','2020-03-06 19:58:04.114018'),(34,'organization','0006_teacher_image','2020-03-06 20:15:39.465492'),(35,'courses','0004_course_category','2020-03-07 08:46:42.659808'),(36,'courses','0005_course_tag','2020-03-07 09:10:47.611045'),(37,'courses','0006_lesson_url','2020-03-07 09:54:01.998639'),(38,'courses','0007_auto_20200307_0955','2020-03-07 09:55:16.055641'),(39,'courses','0008_video_learn_time','2020-03-07 10:04:42.219640'),(40,'courses','0009_course_teacher','2020-03-07 10:14:15.598797'),(41,'courses','0010_auto_20200307_1019','2020-03-07 10:20:07.449734'),(42,'organization','0007_auto_20200307_1340','2020-03-07 13:41:07.892074'),(43,'organization','0008_auto_20200307_1341','2020-03-07 13:41:36.081875'),(44,'users','0005_auto_20200307_1929','2020-03-07 19:29:22.851683'),(45,'courses','0011_auto_20200307_2119','2020-03-07 21:20:06.155733');
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6wscki4v9w6sh38h5q2yqh6axgbhj6w9','ODFlY2NjZTFjNzYzNjRhNWY4MThlNmI4YzA3MjNiNGVjNDRiOGJiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImUxYWViYzhlOTY1Y2ExYTA1NzRlZWEzOTkyNmZkYzdlNDViNDhkMjYiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdfQ==','2020-03-22 11:02:33.745839');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_coursecomment`
--

DROP TABLE IF EXISTS `operation_coursecomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_coursecomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomment_course_id_ae7551b0_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomment_user_id_8f3ff0f8_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_coursecomment_course_id_ae7551b0_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_coursecomment_user_id_8f3ff0f8_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_coursecomment`
--

LOCK TABLES `operation_coursecomment` WRITE;
/*!40000 ALTER TABLE `operation_coursecomment` DISABLE KEYS */;
INSERT INTO `operation_coursecomment` VALUES (1,'哈哈','2020-03-07 10:46:34.379486',10,1),(2,'讲得不错','2020-03-07 10:53:20.287007',10,1),(3,'再来一次','2020-03-07 10:53:32.002848',10,1);
/*!40000 ALTER TABLE `operation_coursecomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userask`
--

DROP TABLE IF EXISTS `operation_userask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userask`
--

LOCK TABLES `operation_userask` WRITE;
/*!40000 ALTER TABLE `operation_userask` DISABLE KEYS */;
INSERT INTO `operation_userask` VALUES (1,'zzz','12345678912','第一章','2020-03-06 19:11:59.083380'),(2,'第一章','1','1','2020-03-06 19:13:33.252183'),(3,'第一章','11111111','1','2020-03-06 19:13:55.674263'),(4,'第一章','13717273746','1','2020-03-06 19:22:17.989259'),(5,'第一章','13512345234','1111111','2020-03-06 19:22:36.112083'),(6,'西安市','14756456789','多对多','2020-03-06 19:23:43.598227');
/*!40000 ALTER TABLE `operation_userask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usercourse`
--

DROP TABLE IF EXISTS `operation_usercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usercourse`
--

LOCK TABLES `operation_usercourse` WRITE;
/*!40000 ALTER TABLE `operation_usercourse` DISABLE KEYS */;
INSERT INTO `operation_usercourse` VALUES (1,'2020-03-07 08:52:52.188364',10,1);
/*!40000 ALTER TABLE `operation_usercourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userfavorite`
--

DROP TABLE IF EXISTS `operation_userfavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userfavorite`
--

LOCK TABLES `operation_userfavorite` WRITE;
/*!40000 ALTER TABLE `operation_userfavorite` DISABLE KEYS */;
INSERT INTO `operation_userfavorite` VALUES (4,4,2,'2020-03-07 09:23:40.177032',1),(5,10,1,'2020-03-07 09:29:04.759451',1),(8,6,2,'2020-03-07 09:37:32.502200',1),(11,1,2,'2020-03-07 14:37:30.723711',1),(12,2,3,'2020-03-07 14:40:45.018527',1);
/*!40000 ALTER TABLE `operation_userfavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usermessage`
--

DROP TABLE IF EXISTS `operation_usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usermessage`
--

LOCK TABLES `operation_usermessage` WRITE;
/*!40000 ALTER TABLE `operation_usermessage` DISABLE KEYS */;
INSERT INTO `operation_usermessage` VALUES (1,1,'欢迎注册',1,'2020-03-07 20:39:59.927155');
/*!40000 ALTER TABLE `operation_usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_citydict`
--

DROP TABLE IF EXISTS `organization_citydict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_citydict`
--

LOCK TABLES `organization_citydict` WRITE;
/*!40000 ALTER TABLE `organization_citydict` DISABLE KEYS */;
INSERT INTO `organization_citydict` VALUES (1,'北京市','北京北京','2020-03-06 13:45:04.793867'),(2,'上海市','上海市','2020-03-06 13:45:17.181295'),(3,'广州市','广州市','2020-03-06 13:45:24.776674'),(4,'深圳市','深圳市','2020-03-06 13:45:32.762543'),(5,'西安市','西安市','2020-03-06 13:45:42.350434'),(6,'南京市','南京市','2020-03-06 13:59:09.081768');
/*!40000 ALTER TABLE `organization_citydict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_courseorg`
--

DROP TABLE IF EXISTS `organization_courseorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `courses_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_courseo_city_id_4a842f85_fk_organizat` (`city_id`),
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_courseorg`
--

LOCK TABLES `organization_courseorg` WRITE;
/*!40000 ALTER TABLE `organization_courseorg` DISABLE KEYS */;
INSERT INTO `organization_courseorg` VALUES (1,'慕课网','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。',0,0,'org/2020/03/imooc.png','北京市','2020-03-06 13:52:13.628377',1,'pxjg',0,0),(2,'慕课网2','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\r\n慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。',0,0,'org/2020/03/imooc_Gn1sRjp.png','上海市','2020-03-06 13:55:13.222194',2,'gx',0,0),(3,'慕课网3','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\r\n慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。',0,0,'org/2020/03/imooc_klgAUn5.png','广州市','2020-03-06 13:55:52.450164',3,'pxjg',0,0),(4,'慕课网4','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台',0,0,'org/2020/03/imooc_Y2Tonsq.png','深圳市','2020-03-06 13:56:44.375161',4,'pxjg',0,0),(5,'慕课网5','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台',0,0,'org/2020/03/imooc_OO2ykYP.png','西安市','2020-03-06 13:57:11.697250',5,'gr',0,0),(6,'北京大学','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台',2,0,'org/2020/03/bjdx.jpg','北京市','2020-03-06 13:57:35.234824',1,'pxjg',2,0),(7,'清华大学','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台',0,0,'org/2020/03/qhdx-logo.png','北京市','2020-03-06 13:58:03.034831',1,'pxjg',0,0),(8,'慕课网6','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台',0,0,'org/2020/03/imooc_qEaMov1.png','北京市','2020-03-06 13:58:39.387138',1,'gx',0,0),(9,'南京大学','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台',0,0,'org/2020/03/njdx.jpg','南京市','2020-03-06 13:59:16.788527',6,'pxjg',0,0),(10,'慕课网7','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。 慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台',0,0,'org/2020/03/imooc_Gn1sRjp_mrCtUxR.png','上海市','2020-03-06 13:59:45.557278',2,'pxjg',0,0);
/*!40000 ALTER TABLE `organization_courseorg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_teacher`
--

DROP TABLE IF EXISTS `organization_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teacher_org_id_cd000a1a_fk_organizat` (`org_id`),
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_teacher`
--

LOCK TABLES `organization_teacher` WRITE;
/*!40000 ALTER TABLE `organization_teacher` DISABLE KEYS */;
INSERT INTO `organization_teacher` VALUES (1,'edwin',5,'xxx','xxx','xxx',2,0,'2020-03-06 19:27:30.086629',1,'teacher/2020/03/default_middile_1.png',18),(2,'zyw',3,'hhh','aaaa','fadg',3,0,'2020-03-06 19:28:08.827854',1,'teacher/2020/03/default_middile_1.png',18),(3,'大王',6,'大','当多个','多个人工',1,0,'2020-03-06 19:28:36.162790',6,NULL,18);
/*!40000 ALTER TABLE `organization_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_banner`
--

DROP TABLE IF EXISTS `users_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_banner`
--

LOCK TABLES `users_banner` WRITE;
/*!40000 ALTER TABLE `users_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_emailverifyrecord`
--

DROP TABLE IF EXISTS `users_emailverifyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(20) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_emailverifyrecord`
--

LOCK TABLES `users_emailverifyrecord` WRITE;
/*!40000 ALTER TABLE `users_emailverifyrecord` DISABLE KEYS */;
INSERT INTO `users_emailverifyrecord` VALUES (1,'1818','973516255@qq.com','register','2020-03-05 15:05:05.625830'),(2,'9999','xxx@qq.com','forget','2020-03-05 15:08:32.471161'),(3,'DLaOAdllsDoAfdsH','abc123@qq.com','register','2020-03-06 08:41:19.859149'),(4,'lsLHLdHsusUWIsdL','973516255@qq.com','register','2020-03-06 08:46:35.614364'),(5,'sdnsIDIlwOwdLsnL','973516255@qq.com','register','2020-03-06 08:56:39.632760'),(6,'dUIfWUsudeHDdLsa','973516255@qq.com','forget','2020-03-06 10:03:32.939390'),(7,'daDw','1870046964@163.com','update_email','2020-03-07 19:31:08.098977'),(8,'DaLY','18700469641@163.com','update_email','2020-03-07 19:31:37.756222');
/*!40000 ALTER TABLE `users_emailverifyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$100000$NHsadXr1kkAt$mneXQSA4t3X6tUJWCGglMPx47AbhAv3kodtUs1NmYl0=','2020-03-07 21:09:48.138057',1,'zyw','','','18700469641@163.com',1,1,'2020-03-05 13:21:00.000000','zyw','2020-03-01','male','西安市','18700469641','image/2020/03/default_middile_1_20161113172604_856.png'),(4,'pbkdf2_sha256$100000$1pUf9XLQG6PY$u/x26cK6pOrSkXBBGae2T0wdY/u9TdmP1ncF9bEHU2A=','2020-03-06 10:48:41.003532',0,'973516255@qq.com','','','973516255@qq.com',0,1,'2020-03-06 08:56:39.399895','',NULL,'female','',NULL,'image/default.png');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2020-03-05 15:05:05.627830','127.0.0.1','1','EmailVerifyRecord object (1)','create','已添加。',8,1),(2,'2020-03-05 15:08:32.545119','127.0.0.1','2','EmailVerifyRecord object (2)','create','已添加。',8,1),(3,'2020-03-05 15:21:44.176642','127.0.0.1','1','Course object (1)','create','已添加。',9,1),(4,'2020-03-05 15:22:38.733127','127.0.0.1','1','Lesson object (1)','create','已添加。',11,1),(5,'2020-03-06 13:45:04.836872','127.0.0.1','1','CityDict object (1)','create','已添加。',14,1),(6,'2020-03-06 13:45:17.219272','127.0.0.1','2','CityDict object (2)','create','已添加。',14,1),(7,'2020-03-06 13:45:24.820637','127.0.0.1','3','CityDict object (3)','create','已添加。',14,1),(8,'2020-03-06 13:45:32.798522','127.0.0.1','4','CityDict object (4)','create','已添加。',14,1),(9,'2020-03-06 13:45:42.353429','127.0.0.1','5','CityDict object (5)','create','已添加。',14,1),(10,'2020-03-06 13:52:13.649366','127.0.0.1','1','CourseOrg object (1)','create','已添加。',15,1),(11,'2020-03-06 13:55:13.249181','127.0.0.1','2','慕课网2','create','已添加。',15,1),(12,'2020-03-06 13:55:52.461168','127.0.0.1','3','慕课网3','create','已添加。',15,1),(13,'2020-03-06 13:56:44.403143','127.0.0.1','4','慕课网4','create','已添加。',15,1),(14,'2020-03-06 13:57:11.704243','127.0.0.1','5','慕课网5','create','已添加。',15,1),(15,'2020-03-06 13:57:35.330795','127.0.0.1','6','北京大学','create','已添加。',15,1),(16,'2020-03-06 13:58:03.091799','127.0.0.1','7','清华大学','create','已添加。',15,1),(17,'2020-03-06 13:58:39.407125','127.0.0.1','8','慕课网6','create','已添加。',15,1),(18,'2020-03-06 13:59:09.143732','127.0.0.1','6','南京市','create','已添加。',14,1),(19,'2020-03-06 13:59:16.811514','127.0.0.1','9','南京大学','create','已添加。',15,1),(20,'2020-03-06 13:59:45.558278','127.0.0.1','10','慕课网7','create','已添加。',15,1),(21,'2020-03-06 19:27:30.130605','127.0.0.1','1','Teacher object (1)','create','已添加。',13,1),(22,'2020-03-06 19:28:08.844846','127.0.0.1','2','zyw','create','已添加。',13,1),(23,'2020-03-06 19:28:36.195771','127.0.0.1','3','大王','create','已添加。',13,1),(24,'2020-03-06 19:32:04.903726','127.0.0.1','1','django入门','change','修改 courseorg 和 image',9,1),(25,'2020-03-06 19:32:50.441256','127.0.0.1','2','Java入门','create','已添加。',9,1),(26,'2020-03-06 19:33:05.470591','127.0.0.1','2','zyw','change','修改 org',13,1),(27,'2020-03-06 20:16:03.221482','127.0.0.1','1','edwin','change','修改 image',13,1),(28,'2020-03-06 21:35:55.164266','127.0.0.1','3','Python入门','create','已添加。',9,1),(29,'2020-03-06 21:36:23.557342','127.0.0.1','4','爬虫基础','create','已添加。',9,1),(30,'2020-03-06 21:36:45.064948','127.0.0.1','4','爬虫基础','change','修改 learn_time 和 image',9,1),(31,'2020-03-06 21:37:09.688942','127.0.0.1','5','数据分析','create','已添加。',9,1),(32,'2020-03-06 21:37:38.813459','127.0.0.1','6','mysql入门','create','已添加。',9,1),(33,'2020-03-06 21:38:07.897981','127.0.0.1','7','Java进阶','create','已添加。',9,1),(34,'2020-03-06 21:38:42.870398','127.0.0.1','8','mysql进阶','create','已添加。',9,1),(35,'2020-03-06 21:39:11.652069','127.0.0.1','9','python高级语言','create','已添加。',9,1),(36,'2020-03-06 21:39:53.494408','127.0.0.1','10','php开发','create','已添加。',9,1),(37,'2020-03-07 08:52:52.228342','127.0.0.1','1','UserCourse object (1)','create','已添加。',18,1),(38,'2020-03-07 08:53:56.935006','127.0.0.1','1','zyw','change','修改 last_login，nick_name，gender，address 和 image',6,1),(39,'2020-03-07 09:49:55.972707','127.0.0.1','2','Lesson object (2)','create','已添加。',11,1),(40,'2020-03-07 09:50:37.254079','127.0.0.1','3','Lesson object (3)','create','已添加。',11,1),(41,'2020-03-07 09:50:45.853612','127.0.0.1','4','Lesson object (4)','create','已添加。',11,1),(42,'2020-03-07 09:52:25.362773','127.0.0.1','1','Video object (1)','create','已添加。',10,1),(43,'2020-03-07 09:52:38.689328','127.0.0.1','2','Video object (2)','create','已添加。',10,1),(44,'2020-03-07 09:56:02.042219','127.0.0.1','1','Video object (1)','change','修改 url',10,1),(45,'2020-03-07 09:56:49.954585','127.0.0.1','3','Video object (3)','create','已添加。',10,1),(46,'2020-03-07 09:57:29.266756','127.0.0.1','4','Video object (4)','create','已添加。',10,1),(47,'2020-03-07 09:57:46.864857','127.0.0.1','2','Video object (2)','change','修改 url',10,1),(48,'2020-03-07 10:06:16.180374','127.0.0.1','1','CourseResource object (1)','create','已添加。',12,1),(49,'2020-03-07 10:15:28.965929','127.0.0.1','10','php开发','change','修改 teacher 和 image',9,1),(50,'2020-03-07 10:21:23.013317','127.0.0.1','10','php开发','change','修改 image，youneed_know 和 teacher_tell',9,1),(51,'2020-03-07 15:26:26.705334','127.0.0.1','8','mysql进阶','change','修改 detail，image，tag，youneed_know 和 teacher_tell',9,1),(52,'2020-03-07 20:39:59.982123','127.0.0.1','1','UserMessage object (1)','create','已添加。',20,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1),(2,'site-theme','/static/xadmin/css/themes/bootstrap-xadmin.css',1),(3,'courses_course_editform_portal','box-0,lesson_set-group,,',1);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-09 14:22:37
