-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: csc317db
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fk_userId` int unsigned NOT NULL,
  `text` text NOT NULL,
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_postId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `post_id_idx` (`fk_postId`),
  KEY `author_id_idx` (`fk_userId`),
  CONSTRAINT `author_id` FOREIGN KEY (`fk_userId`) REFERENCES `users` (`id`),
  CONSTRAINT `post_id` FOREIGN KEY (`fk_postId`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,10,'1234\n','2023-08-09 12:20:25','2023-08-09 12:20:25',11),(2,10,'hello world!','2023-08-09 12:36:34','2023-08-09 12:36:34',8),(3,10,'Hi','2023-08-09 12:38:54','2023-08-09 12:38:54',11),(4,10,'Hello','2023-08-09 12:39:18','2023-08-09 12:39:18',11),(5,10,'Thank you!','2023-08-09 12:39:53','2023-08-09 12:39:53',11),(6,10,'However, this project may not the best case for the perspective you are presenting, as it stands with today\'s technology trends and capabilities (perhaps limitations as well). I hope some day, doing this style of work proves to be more cost effective, as I would love to see more of this style in hopefully even more ambitious productions.','2023-08-09 12:43:36','2023-08-09 12:43:36',11),(7,10,'This is another comment','2023-08-09 12:46:51','2023-08-09 12:46:51',11),(8,10,'12345','2023-08-09 12:55:21','2023-08-09 12:55:21',11),(9,10,'12345678','2023-08-09 12:56:05','2023-08-09 12:56:05',11),(10,10,'1234567890','2023-08-09 12:56:21','2023-08-09 12:56:21',11),(11,10,'qwertyuio','2023-08-09 13:15:15','2023-08-09 13:15:15',11),(12,10,'qwertyuiop','2023-08-09 13:15:20','2023-08-09 13:15:20',11);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `video` varchar(4096) NOT NULL,
  `thumbnail` varchar(4096) NOT NULL,
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_userId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `post_author_idx` (`fk_userId`),
  CONSTRAINT `post_author` FOREIGN KEY (`fk_userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'post sample video','post video','public\\uploads\\videos\\uploadVideo-1691379115143-502660206.mp4','public/uploads/images/thumbnail-uploadVideo-1691379115143-502660206.png','2023-08-06 20:31:55','2023-08-06 20:31:55',10),(2,'sample video 2','create sample video 2','public\\uploads\\videos\\uploadVideo-1691379223576-191124473.mp4','public/uploads/images/thumbnail-uploadVideo-1691379223576-191124473.png','2023-08-06 20:33:43','2023-08-06 20:33:43',10),(3,'sample video 3','create sample video 3','public\\uploads\\videos\\uploadVideo-1691379245851-563522592.mp4','public/uploads/images/thumbnail-uploadVideo-1691379245851-563522592.png','2023-08-06 20:34:06','2023-08-06 20:34:06',10),(4,'another post','another testing post','public\\uploads\\videos\\uploadVideo-1691394311478-334268469.mp4','public/uploads/images/thumbnail-uploadVideo-1691394311478-334268469.png','2023-08-07 00:45:12','2023-08-07 00:45:12',10),(5,'posting an example','this is a posting example','public\\uploads\\videos\\uploadVideo-1691394471401-461615075.mp4','public/uploads/images/thumbnail-uploadVideo-1691394471401-461615075.png','2023-08-07 00:47:51','2023-08-07 00:47:51',9),(6,'posting another video','anther example video of user 5','public\\uploads\\videos\\uploadVideo-1691394510328-941038349.mp4','public/uploads/images/thumbnail-uploadVideo-1691394510328-941038349.png','2023-08-07 00:48:30','2023-08-07 00:48:30',9),(7,'a video of user 9','user 9 post a video','public\\uploads\\videos\\uploadVideo-1691394563055-611361873.mp4','public/uploads/images/thumbnail-uploadVideo-1691394563055-611361873.png','2023-08-07 00:49:23','2023-08-07 00:49:23',14),(8,'different example of user 9','user 9 creates another video','public\\uploads\\videos\\uploadVideo-1691394599898-257953546.mp4','public/uploads/images/thumbnail-uploadVideo-1691394599898-257953546.png','2023-08-07 00:50:00','2023-08-07 00:50:00',14),(9,'hello video','post to test /create','public\\uploads\\videos\\uploadVideo-1691565669373-42166257.mp4','public/uploads/images/thumbnail-uploadVideo-1691565669373-42166257.png','2023-08-09 00:21:10','2023-08-09 00:21:10',10),(10,'posting another video','second test for /create','public\\uploads\\videos\\uploadVideo-1691566798768-509189596.mp4','public/uploads/images/thumbnail-uploadVideo-1691566798768-509189596.png','2023-08-09 00:39:59','2023-08-09 00:39:59',10),(11,'Tank Game','This is tank game','public\\uploads\\videos\\uploadVideo-1691580691407-306470638.mp4','public/uploads/images/thumbnail-uploadVideo-1691580691407-306470638.png','2023-08-09 04:31:32','2023-08-09 04:31:32',10),(12,'Complete tank game','Another great testing post','public\\uploads\\videos\\uploadVideo-1691610542779-127919195.mp4','public/uploads/images/thumbnail-uploadVideo-1691610542779-127919195.png','2023-08-09 12:49:04','2023-08-09 12:49:04',10),(13,'This is Tank Game','Tank is a two-player maze game in which the players, each controlling a tank, attempt to shoot each other. The maze is a set of blocks set at right angles to each other with an empty square central area all viewed from above; the shape of the maze is not symmetric, and is the same between games.','public\\uploads\\videos\\uploadVideo-1691610612276-294176854.mp4','public/uploads/images/thumbnail-uploadVideo-1691610612276-294176854.png','2023-08-09 12:50:12','2023-08-09 12:50:12',10);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('9xT6Kdc1AMjNsX0EsX2Pna8d6wka8RRY',1691698590,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"user\":{\"userId\":10,\"username\":\"sample\",\"email\":\"sample@mail.com\"}}'),('AXXnTpgfyji4ybJf6tE7PlY7h3eARrtd',1691657630,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('jmBhvC0Gp0-JYnuUEI7TpIqvVT3qQNcg',1691655037,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"error\":[\"Must be logged in to create a comment!\"]}}'),('kGUuZ5nRO0OfW86o5jOa_iCFOCY88qYn',1691654894,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('kWJrTM57HmJKrxRZUnpqxMhESOxzkQxi',1691654597,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('sAtuuaIoTvwA58mzzsNZal7PYVr7QZSC',1691654486,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(128) NOT NULL,
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `usename_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'sample3','sample3@mail.com','$2b$05$CX9K70cciiX/Dkso0W8RT.lCjiiXUr2V0lPoR0XacJmMLhF6mXqke','2023-07-28 02:03:52','2023-07-28 02:03:52'),(7,'sample4','sample4@mail.com','$2b$05$qUmm4fWeNQZhuSH0mQY2O.bsweK5RpYY6eUn7soCTJfwPJyGOpMeG','2023-07-28 02:06:36','2023-07-28 02:06:36'),(9,'sample5','sample5@mail.com','$2b$05$0qpke6Hetl.AWBjGafTwQeX9R9SNcH0QAuPASUqjGAjzYc0Cd4CJa','2023-07-28 02:23:36','2023-07-28 02:23:36'),(10,'sample','sample@mail.com','$2b$05$DvNga29thDWvKoxPAOliSeYSetV8f/YeA/eu1J1uiV.YXrHnen45K','2023-07-28 02:38:17','2023-07-28 02:38:17'),(11,'sample6','sample6@mail.com','[\"123\"]','2023-07-28 20:01:51','2023-07-28 20:01:51'),(12,'sample7','sample7@mail.com','[\"123\"]','2023-07-28 20:06:37','2023-07-28 20:06:37'),(13,'sample8','sample8@mail.com','$2b$05$pmKCWrp0AbeUOkPArVQ61u6RtRQckMfULD0R9L5em.FHle2sVkB12','2023-07-28 20:11:42','2023-07-28 20:11:42'),(14,'sample9','sample9@mail.com','$2b$05$2OHH/MHf8xBmmpsV4eWxiOUUxL3/vnBguigg0CjV8yyq6EXjhHYX.','2023-07-28 22:39:43','2023-07-28 22:39:43'),(15,'sample0','sample0@mail.com','$2b$05$MVxawebMdSCb5VQKJrGuuOErc3r4V3qJcsS9D3SkHIN3KdNbiXOYK','2023-07-29 02:19:19','2023-07-29 02:19:19'),(17,'ljhw','','$2b$05$/0u3IGP9/.9NCjsKOz.Ozu1fSs46YayTOeNZuFuD9YWiXOd150q.y','2023-07-31 04:08:51','2023-07-31 04:08:51'),(18,'mysample','mysample@gmail.com','$2b$05$qdNjS6CTFCDd5VjVhasyuOiN1ClkLjVLLPwX5b6acpPcRPj6X/.7S','2023-08-06 17:46:02','2023-08-06 17:46:02'),(19,'sampleError','sampleError@gmail.com','$2b$05$BH8zIjafM1sTqzgAWNFn.ujcCLhtbT0zsli0edzhyoMCp2qAuQvWK','2023-08-06 17:47:22','2023-08-06 17:47:22'),(20,'testing','testing@gmail.com','$2b$05$sA4c1gTXJbKtE7JdxD0hl.hqMJOPQKjXscua6Dp42gen9lZLm1dAW','2023-08-07 05:48:55','2023-08-07 05:48:55'),(21,'eri','eri@sfsu.edu','$2b$05$ZAZJ/.qOaLmQAVRZqi4j5uy/smiR.09OOFBNMh1.NHkKNx8Vxchvu','2023-08-09 05:16:22','2023-08-09 05:16:22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-09 13:25:08
