-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: steam
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint unsigned NOT NULL,
  `target_user_id` bigint unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  CONSTRAINT `friend_requests_FK` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (11,11,'requested','1976-05-24 18:39:38','1981-10-22 19:56:58'),(12,12,'unfriended','1977-02-02 10:18:19','1988-10-14 21:16:38'),(13,13,'declined','1987-12-30 23:58:51','1974-02-16 22:44:12'),(16,16,'declined','1989-06-24 14:01:09','2017-07-05 21:30:56'),(18,18,'unfriended','1996-07-12 14:24:55','1983-08-08 06:25:23'),(19,19,'declined','2009-04-06 17:25:19','1983-10-04 09:16:57'),(20,20,'requested','2001-08-28 19:15:36','1984-10-24 14:20:54');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `genre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'odio'),(2,'voluptatem'),(3,'est'),(4,'fugiat'),(5,'id'),(6,'voluptatibus'),(7,'culpa'),(8,'ipsam'),(9,'qui'),(10,'hic');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres_products`
--

DROP TABLE IF EXISTS `genres_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres_products` (
  `product_id` bigint unsigned NOT NULL,
  `genres_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`genres_id`),
  KEY `genres_products_FK` (`genres_id`),
  CONSTRAINT `genres_products_FK` FOREIGN KEY (`genres_id`) REFERENCES `genres` (`id`),
  CONSTRAINT `genres_products_FK_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres_products`
--

LOCK TABLES `genres_products` WRITE;
/*!40000 ALTER TABLE `genres_products` DISABLE KEYS */;
INSERT INTO `genres_products` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `genres_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `users_id` bigint unsigned NOT NULL,
  `products_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `library_FK` (`users_id`),
  KEY `library_FK_1` (`products_id`),
  CONSTRAINT `library_FK` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `library_FK_1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
INSERT INTO `library` VALUES (1,11,1),(2,12,2),(3,13,3),(4,16,4),(5,18,5),(6,19,6),(7,20,7),(8,11,8),(9,12,9),(10,13,10);
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `media_type_id` (`media_type_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `media_FK` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`),
  CONSTRAINT `media_FK_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,11,'Sed possimus sint et doloribus. Labore facilis natus magni voluptatem. Et id sit id qui qui doloribus. Et veniam impedit quisquam voluptas modi.','labore',66858426,'Duchess, as she could. \'No,\' said Alice. \'Why, you don\'t know the song, \'I\'d have said to herself, as well wait, as she did not get dry very soon. \'Ahem!\' said the Lory hastily. \'I thought you did,\'.','1983-07-22 17:33:26','2010-03-27 08:37:06'),(2,2,12,'Sed dolores placeat aspernatur voluptatem explicabo laborum. Animi omnis aperiam quia.','suscipit',634869236,'Pigeon. \'I\'m NOT a serpent!\' said Alice doubtfully: \'it means--to--make--anything--prettier.\' \'Well, then,\' the Cat went on, \'What HAVE you been doing here?\' \'May it please your Majesty?\' he asked..','1975-06-15 09:09:17','2008-04-08 03:58:35'),(3,3,13,'Magni aut et molestias reiciendis vel aperiam. Est esse dolor omnis repellat nobis ut molestiae. Corrupti enim sed ad. Et eum earum dolore quos nesciunt voluptates accusamus.','deserunt',0,'Alice, jumping up and walking off to other parts of the leaves: \'I should think you\'ll feel it a violent shake at the stick, and held it out to the jury, in a tone of great dismay, and began staring.','2002-07-20 01:23:41','1988-07-03 21:55:14'),(4,4,16,'Sed quod eaque est voluptas facere. Natus neque id occaecati qui unde. Voluptatum et ut dolorem mollitia maiores.','saepe',91425,'Alice went timidly up to the Dormouse, not choosing to notice this last remark that had made out the answer to shillings and pence. \'Take off your hat,\' the King said, for about the twentieth time.','2002-01-14 20:58:46','1984-10-01 22:52:55'),(5,5,18,'Dolorem est quo illum libero ducimus omnis molestiae magni. Id unde doloremque id nihil in in repellat. Rerum sunt culpa nesciunt qui nesciunt.','quas',4062,'I think--\' (for, you see, Miss, we\'re doing our best, afore she comes, to--\' At this moment the King, and the baby--the fire-irons came first; then followed a shower of little cartwheels, and the.','2019-01-16 18:46:33','2005-11-25 16:25:25'),(6,6,19,'Accusantium quo sit est eaque doloremque. Laudantium ut accusantium aut dolorum rerum voluptatem magni sapiente. Doloremque qui et saepe debitis. Nobis excepturi cupiditate quia.','incidunt',2158,'Cheshire Cat,\' said Alice: \'I don\'t think--\' \'Then you shouldn\'t talk,\' said the Mock Turtle. \'Certainly not!\' said Alice very humbly: \'you had got its neck nicely straightened out, and was a body.','2002-09-27 05:54:44','1988-01-28 20:20:57'),(7,7,20,'Quam ut dolorem nihil dolorem id. Iure et expedita consequatur neque quia.','sint',16482,'Bill, I fancy--Who\'s to go after that into a conversation. \'You don\'t know what \"it\" means.\' \'I know what they\'re about!\' \'Read them,\' said the Caterpillar. Here was another long passage, and the.','1972-09-24 02:26:53','1990-06-08 11:06:19'),(8,8,11,'Nostrum suscipit provident cumque. Hic architecto aspernatur aut ab. Culpa consequuntur dolorum officiis consequatur fugit.','amet',5,'He trusts to you to death.\"\' \'You are old,\' said the Caterpillar sternly. \'Explain yourself!\' \'I can\'t go no lower,\' said the King, and the fan, and skurried away into the Dormouse\'s place, and.','1973-04-22 00:43:08','1977-08-25 02:54:12'),(9,9,12,'Soluta voluptas qui placeat mollitia et nemo nostrum. Est est iure id laboriosam. Et et asperiores fuga. Quo quas iure dignissimos provident.','velit',5792531,'French lesson-book. The Mouse did not like to see that queer little toss of her voice, and see that she was beginning to write out a new kind of authority among them, called out, \'First witness!\'.','2012-01-08 09:35:54','1984-04-18 10:09:43'),(10,10,13,'Quia velit sed est fuga nobis ducimus et. Autem ut temporibus quod illo deserunt recusandae sed. Voluptatem repellendus exercitationem natus et corporis similique nisi repellendus. Excepturi commodi doloribus tempore sint. Voluptates consequatur et est ipsa ratione.','saepe',255583,'I think you\'d take a fancy to herself how this same little sister of hers would, in the shade: however, the moment she appeared on the top of it. She went in without knocking, and hurried upstairs,.','1991-11-02 07:26:34','2003-02-15 13:48:59');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'iusto','2006-08-09 09:16:22','1970-05-31 07:28:42'),(2,'rem','2008-05-15 21:07:16','1974-09-06 21:47:52'),(3,'consequuntur','1979-10-16 21:49:30','2008-06-22 02:38:37'),(4,'consequatur','1976-11-10 05:30:56','1972-03-04 11:06:39'),(5,'doloribus','2007-11-03 11:56:13','2000-07-12 02:52:53'),(6,'neque','1992-08-13 18:23:01','1974-04-04 03:48:48'),(7,'molestiae','1993-12-09 18:20:14','2011-01-25 01:54:23'),(8,'nesciunt','2017-11-25 18:58:04','1984-07-26 01:08:20'),(9,'rerum','1992-11-10 17:21:21','1976-04-03 21:59:04'),(10,'omnis','2021-08-13 09:12:41','2020-03-26 01:06:22');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint unsigned NOT NULL,
  `to_user_id` bigint unsigned NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`) USING BTREE,
  KEY `to_user_id` (`to_user_id`) USING BTREE,
  CONSTRAINT `messages_FK` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_FK_1` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,11,11,'Quo explicabo quidem aut. Ipsam facilis voluptas saepe maiores. Facilis saepe possimus quia consequatur animi assumenda sed.','1980-09-01 19:25:26'),(2,12,12,'Fugiat voluptas omnis nesciunt hic totam officiis. Tenetur illum itaque doloremque dolorem ea. Unde sit dolore soluta ut officia in exercitationem. Quia qui qui sit distinctio et.','2009-11-08 05:41:48'),(3,13,13,'Sit rerum doloremque molestiae voluptatibus ducimus nisi. Fugit ducimus odit architecto ut cumque veniam tempore. Consequatur sunt mollitia excepturi iusto voluptatem.','1975-09-21 12:17:07'),(4,16,16,'Accusamus reiciendis et aliquid sit. Sapiente sed nostrum molestias quas. Quia qui quibusdam rerum delectus et harum doloremque odit.','2006-12-05 10:21:00'),(5,18,18,'Sint sit numquam sit maxime in possimus harum. Id perspiciatis voluptatem dolores ratione. Sed impedit est itaque doloribus voluptate. Quaerat quibusdam sunt assumenda vel.','1997-10-04 16:46:31'),(6,19,19,'Consequatur vel eum fugit aperiam consequatur maiores. Iure illum hic deleniti quidem. Ad eum quia doloremque natus amet et. Aliquam ducimus corporis maiores nulla id reiciendis.','2006-08-15 20:11:00'),(7,20,20,'Incidunt laudantium eos est error a aut id est. Aperiam velit harum praesentium aperiam aut sunt. Culpa accusamus porro voluptatem delectus magni nihil autem sed. Enim laboriosam eos ut enim consequatur ut.','1979-04-02 22:35:58'),(8,11,11,'Cumque ut dolore laboriosam repudiandae. Pariatur rerum ab vel quo cupiditate quaerat.','2013-12-23 13:47:41'),(9,12,12,'Quia at eveniet aspernatur ut rerum. Eos nam atque aliquid fugit vitae enim eum quas. Cum non officiis recusandae dicta enim.','1999-02-13 01:04:06'),(10,13,13,'Dicta dolore dolorum praesentium quia qui. Ea ea dolore earum dolores rerum ullam veniam. Animi quod cum minus et laudantium maxime.','1997-11-22 14:26:10');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `products_id` bigint unsigned NOT NULL,
  `orders_id` bigint unsigned NOT NULL,
  `order_status_code` enum('Cancelled','Completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_FK` (`orders_id`),
  KEY `order_items_FK_1` (`products_id`),
  CONSTRAINT `order_items_FK` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_FK_1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,'Completed'),(2,2,2,'Cancelled'),(3,3,3,'Cancelled'),(4,4,4,'Cancelled'),(5,5,5,'Cancelled'),(6,6,6,'Cancelled'),(7,7,7,'Completed'),(8,8,8,'Cancelled'),(9,9,9,'Cancelled'),(10,10,10,'Cancelled');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `users_id` bigint unsigned NOT NULL,
  `order_status_code` enum('Cancelled','Completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_FK` (`users_id`),
  CONSTRAINT `orders_FK` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,11,'Completed'),(2,12,'Completed'),(3,13,'Completed'),(4,16,'Completed'),(5,18,'Completed'),(6,19,'Cancelled'),(7,20,'Completed'),(8,11,'Completed'),(9,12,'Cancelled'),(10,13,'Completed');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type_of_products_id` bigint unsigned NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_price` float NOT NULL,
  `media_id` bigint unsigned NOT NULL,
  `product_description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_FK` (`media_id`),
  KEY `products_FK_1` (`type_of_products_id`),
  CONSTRAINT `products_FK` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `products_FK_1` FOREIGN KEY (`type_of_products_id`) REFERENCES `type_of_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'labore',1160.1,1,'Minima quo exercitationem temporibus quia beatae pariatur. Et aut earum dolor soluta tempora in cupiditate quo. Quae sit provident saepe nam.'),(2,2,'non',55663.5,2,'Vitae et ratione provident quia provident recusandae. In harum nemo sequi atque voluptas aut. Eius velit optio soluta ut voluptates. Adipisci omnis libero suscipit non aut saepe.'),(3,3,'quia',12158800,3,'Non sapiente harum dolores consectetur. Velit laudantium doloremque quos vel aliquam dignissimos et. In omnis et modi laudantium soluta est vel. Nam harum qui quod est ex.'),(4,4,'quidem',6440520,4,'Inventore sed dolorum quo mollitia sed animi rerum. Earum perferendis ut distinctio doloremque aut consectetur mollitia. Enim pariatur deleniti corporis enim minima.'),(5,5,'id',0,5,'Est perferendis impedit ab eligendi odit voluptas. Eius tenetur minima perferendis explicabo aliquam libero vel. Dolorem harum vel inventore inventore. At ut sed possimus unde.'),(6,6,'aut',8.51243,6,'Maiores qui ad iste omnis dicta. Eaque ipsa ut nesciunt et. In repellat nisi sit fugit itaque. Laboriosam voluptate voluptatem unde autem magnam aut tempore.'),(7,7,'rerum',9239.42,7,'Voluptatem nulla nihil sequi quo voluptatem quaerat quidem. Asperiores laudantium sapiente omnis tempore et qui voluptate. Sint velit odio enim voluptatem pariatur exercitationem unde.'),(8,8,'aut',7574.11,8,'Eius consequuntur dolorem vitae omnis ut aut. Quia repudiandae est aliquam. Aliquam suscipit est sunt et atque quasi enim rem.'),(9,9,'voluptate',39594.2,9,'Voluptas aspernatur blanditiis non iure. Ut ut aperiam ea earum. Adipisci sit et sed iste. Sit omnis ut voluptatum mollitia iste aperiam sed.'),(10,10,'explicabo',1741130,10,'Architecto ipsum odio id ut veniam id eum. Quo dolorem eveniet molestias vitae est. Fugit ea tempora autem dolore sunt rerum. Quis quos ipsum veniam ut aut doloremque error.');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `hometown` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `about_me` varchar(250) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `birthday` date DEFAULT NULL,
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `profiles_UN` (`user_id`),
  CONSTRAINT `profiles_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (11,'fugiat','Australia','Martina','Shanahan','et','1993-01-22 09:02:41','1986-11-27','F'),(12,'fuga','Russian Federation','Corene','Abbott','amet','1974-02-02 21:02:04','1989-05-24','M'),(13,'velit','Jordan','Gordon','Muller','temporibus','1985-12-11 00:49:07','1994-09-16','F'),(16,'et','Gambia','Euna','Balistreri','distinctio','1999-08-04 17:52:48','2013-10-15','F'),(18,'nihil','Holy See (Vatican City State)','Ryan','Zulauf','asperiores','2004-03-24 06:46:41','1973-07-01','M'),(19,'itaque','Namibia','Easter','Conroy','in','1975-04-24 13:11:42','1995-09-13','M'),(20,'sapiente','Venezuela','Richmond','Cruickshank','qui','2012-11-30 10:15:30','1979-04-09','F');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_of_products`
--

DROP TABLE IF EXISTS `type_of_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_of_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_products`
--

LOCK TABLES `type_of_products` WRITE;
/*!40000 ALTER TABLE `type_of_products` DISABLE KEYS */;
INSERT INTO `type_of_products` VALUES (1,'autem'),(2,'at'),(3,'et'),(4,'ipsum'),(5,'necessitatibus'),(6,'molestias'),(7,'repellat'),(8,'rem'),(9,'atque'),(10,'voluptatem');
/*!40000 ALTER TABLE `type_of_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(100) NOT NULL,
  `phone` bigint unsigned NOT NULL,
  `login` varchar(200) NOT NULL,
  `wallet` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (11,'haag.haskell@example.org','2ceb4a2dc1fb04deaccf53f21bb6439b762c5594',0,'ut',4),(12,'strosin.katelin@example.org','15f14ccffcab357667c23d78669d19952148bf97',913,'sed',4),(13,'claudia24@example.com','69ecaa041a9a245ab23c8ec89cfe5a301eae3cea',773625,'sapiente',2),(16,'mcdermott.joe@example.org','d7d53d85ded9195ff6c2b2ed6613ac9d11913cf1',297,'illo',5),(18,'daugherty.herbert@example.org','ae36bd53fbbe2fc039a3c3e06125178aaefa9856',5704207807,'quo',6),(19,'wwilliamson@example.com','7fdb4a1dbd7f6d49f6de072f4778191592b42c0d',60,'architecto',1),(20,'ezemlak@example.net','5e9431467f4ef3a0ef062f5bb66429829a8fe48e',1,'et',6);
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

-- Dump completed on 2021-10-07 17:27:07
