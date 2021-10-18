#
# TABLE STRUCTURE FOR: friend_requests
#

DROP TABLE IF EXISTS `friend_requests`;

CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  CONSTRAINT `friend_requests_FK` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `updated_at`) VALUES ('11', '11', 'requested', '1976-05-24 18:39:38', '1981-10-22 19:56:58');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `updated_at`) VALUES ('12', '12', 'unfriended', '1977-02-02 10:18:19', '1988-10-14 21:16:38');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `updated_at`) VALUES ('13', '13', 'declined', '1987-12-30 23:58:51', '1974-02-16 22:44:12');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `updated_at`) VALUES ('16', '16', 'declined', '1989-06-24 14:01:09', '2017-07-05 21:30:56');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `updated_at`) VALUES ('18', '18', 'unfriended', '1996-07-12 14:24:55', '1983-08-08 06:25:23');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `updated_at`) VALUES ('19', '19', 'declined', '2009-04-06 17:25:19', '1983-10-04 09:16:57');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `updated_at`) VALUES ('20', '20', 'requested', '2001-08-28 19:15:36', '1984-10-24 14:20:54');


#
# TABLE STRUCTURE FOR: genres
#

DROP TABLE IF EXISTS `genres`;

CREATE TABLE `genres` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `genre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `genres` (`id`, `genre`) VALUES ('1', 'odio');
INSERT INTO `genres` (`id`, `genre`) VALUES ('2', 'voluptatem');
INSERT INTO `genres` (`id`, `genre`) VALUES ('3', 'est');
INSERT INTO `genres` (`id`, `genre`) VALUES ('4', 'fugiat');
INSERT INTO `genres` (`id`, `genre`) VALUES ('5', 'id');
INSERT INTO `genres` (`id`, `genre`) VALUES ('6', 'voluptatibus');
INSERT INTO `genres` (`id`, `genre`) VALUES ('7', 'culpa');
INSERT INTO `genres` (`id`, `genre`) VALUES ('8', 'ipsam');
INSERT INTO `genres` (`id`, `genre`) VALUES ('9', 'qui');
INSERT INTO `genres` (`id`, `genre`) VALUES ('10', 'hic');


#
# TABLE STRUCTURE FOR: genres_products
#

DROP TABLE IF EXISTS `genres_products`;

CREATE TABLE `genres_products` (
  `product_id` bigint(20) unsigned NOT NULL,
  `genres_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`genres_id`),
  KEY `genres_products_FK` (`genres_id`),
  CONSTRAINT `genres_products_FK` FOREIGN KEY (`genres_id`) REFERENCES `genres` (`id`),
  CONSTRAINT `genres_products_FK_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `genres_products` (`product_id`, `genres_id`) VALUES ('1', '1');
INSERT INTO `genres_products` (`product_id`, `genres_id`) VALUES ('2', '2');
INSERT INTO `genres_products` (`product_id`, `genres_id`) VALUES ('3', '3');
INSERT INTO `genres_products` (`product_id`, `genres_id`) VALUES ('4', '4');
INSERT INTO `genres_products` (`product_id`, `genres_id`) VALUES ('5', '5');
INSERT INTO `genres_products` (`product_id`, `genres_id`) VALUES ('6', '6');
INSERT INTO `genres_products` (`product_id`, `genres_id`) VALUES ('7', '7');
INSERT INTO `genres_products` (`product_id`, `genres_id`) VALUES ('8', '8');
INSERT INTO `genres_products` (`product_id`, `genres_id`) VALUES ('9', '9');
INSERT INTO `genres_products` (`product_id`, `genres_id`) VALUES ('10', '10');


#
# TABLE STRUCTURE FOR: library
#

DROP TABLE IF EXISTS `library`;

CREATE TABLE `library` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` bigint(20) unsigned NOT NULL,
  `products_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `library_FK` (`users_id`),
  KEY `library_FK_1` (`products_id`),
  CONSTRAINT `library_FK` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `library_FK_1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `library` (`id`, `users_id`, `products_id`) VALUES ('1', '11', '1');
INSERT INTO `library` (`id`, `users_id`, `products_id`) VALUES ('2', '12', '2');
INSERT INTO `library` (`id`, `users_id`, `products_id`) VALUES ('3', '13', '3');
INSERT INTO `library` (`id`, `users_id`, `products_id`) VALUES ('4', '16', '4');
INSERT INTO `library` (`id`, `users_id`, `products_id`) VALUES ('5', '18', '5');
INSERT INTO `library` (`id`, `users_id`, `products_id`) VALUES ('6', '19', '6');
INSERT INTO `library` (`id`, `users_id`, `products_id`) VALUES ('7', '20', '7');
INSERT INTO `library` (`id`, `users_id`, `products_id`) VALUES ('8', '11', '8');
INSERT INTO `library` (`id`, `users_id`, `products_id`) VALUES ('9', '12', '9');
INSERT INTO `library` (`id`, `users_id`, `products_id`) VALUES ('10', '13', '10');


#
# TABLE STRUCTURE FOR: media
#

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `media_type_id` (`media_type_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `media_FK` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`),
  CONSTRAINT `media_FK_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('1', '1', '11', 'Sed possimus sint et doloribus. Labore facilis natus magni voluptatem. Et id sit id qui qui doloribus. Et veniam impedit quisquam voluptas modi.', 'labore', 66858426, 'Duchess, as she could. \'No,\' said Alice. \'Why, you don\'t know the song, \'I\'d have said to herself, as well wait, as she did not get dry very soon. \'Ahem!\' said the Lory hastily. \'I thought you did,\'.', '1983-07-22 17:33:26', '2010-03-27 08:37:06');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('2', '2', '12', 'Sed dolores placeat aspernatur voluptatem explicabo laborum. Animi omnis aperiam quia.', 'suscipit', 634869236, 'Pigeon. \'I\'m NOT a serpent!\' said Alice doubtfully: \'it means--to--make--anything--prettier.\' \'Well, then,\' the Cat went on, \'What HAVE you been doing here?\' \'May it please your Majesty?\' he asked..', '1975-06-15 09:09:17', '2008-04-08 03:58:35');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('3', '3', '13', 'Magni aut et molestias reiciendis vel aperiam. Est esse dolor omnis repellat nobis ut molestiae. Corrupti enim sed ad. Et eum earum dolore quos nesciunt voluptates accusamus.', 'deserunt', 0, 'Alice, jumping up and walking off to other parts of the leaves: \'I should think you\'ll feel it a violent shake at the stick, and held it out to the jury, in a tone of great dismay, and began staring.', '2002-07-20 01:23:41', '1988-07-03 21:55:14');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('4', '4', '16', 'Sed quod eaque est voluptas facere. Natus neque id occaecati qui unde. Voluptatum et ut dolorem mollitia maiores.', 'saepe', 91425, 'Alice went timidly up to the Dormouse, not choosing to notice this last remark that had made out the answer to shillings and pence. \'Take off your hat,\' the King said, for about the twentieth time.', '2002-01-14 20:58:46', '1984-10-01 22:52:55');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('5', '5', '18', 'Dolorem est quo illum libero ducimus omnis molestiae magni. Id unde doloremque id nihil in in repellat. Rerum sunt culpa nesciunt qui nesciunt.', 'quas', 4062, 'I think--\' (for, you see, Miss, we\'re doing our best, afore she comes, to--\' At this moment the King, and the baby--the fire-irons came first; then followed a shower of little cartwheels, and the.', '2019-01-16 18:46:33', '2005-11-25 16:25:25');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('6', '6', '19', 'Accusantium quo sit est eaque doloremque. Laudantium ut accusantium aut dolorum rerum voluptatem magni sapiente. Doloremque qui et saepe debitis. Nobis excepturi cupiditate quia.', 'incidunt', 2158, 'Cheshire Cat,\' said Alice: \'I don\'t think--\' \'Then you shouldn\'t talk,\' said the Mock Turtle. \'Certainly not!\' said Alice very humbly: \'you had got its neck nicely straightened out, and was a body.', '2002-09-27 05:54:44', '1988-01-28 20:20:57');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('7', '7', '20', 'Quam ut dolorem nihil dolorem id. Iure et expedita consequatur neque quia.', 'sint', 16482, 'Bill, I fancy--Who\'s to go after that into a conversation. \'You don\'t know what \"it\" means.\' \'I know what they\'re about!\' \'Read them,\' said the Caterpillar. Here was another long passage, and the.', '1972-09-24 02:26:53', '1990-06-08 11:06:19');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('8', '8', '11', 'Nostrum suscipit provident cumque. Hic architecto aspernatur aut ab. Culpa consequuntur dolorum officiis consequatur fugit.', 'amet', 5, 'He trusts to you to death.\"\' \'You are old,\' said the Caterpillar sternly. \'Explain yourself!\' \'I can\'t go no lower,\' said the King, and the fan, and skurried away into the Dormouse\'s place, and.', '1973-04-22 00:43:08', '1977-08-25 02:54:12');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('9', '9', '12', 'Soluta voluptas qui placeat mollitia et nemo nostrum. Est est iure id laboriosam. Et et asperiores fuga. Quo quas iure dignissimos provident.', 'velit', 5792531, 'French lesson-book. The Mouse did not like to see that queer little toss of her voice, and see that she was beginning to write out a new kind of authority among them, called out, \'First witness!\'.', '2012-01-08 09:35:54', '1984-04-18 10:09:43');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('10', '10', '13', 'Quia velit sed est fuga nobis ducimus et. Autem ut temporibus quod illo deserunt recusandae sed. Voluptatem repellendus exercitationem natus et corporis similique nisi repellendus. Excepturi commodi doloribus tempore sint. Voluptates consequatur et est ipsa ratione.', 'saepe', 255583, 'I think you\'d take a fancy to herself how this same little sister of hers would, in the shade: however, the moment she appeared on the top of it. She went in without knocking, and hurried upstairs,.', '1991-11-02 07:26:34', '2003-02-15 13:48:59');


#
# TABLE STRUCTURE FOR: media_types
#

DROP TABLE IF EXISTS `media_types`;

CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('1', 'iusto', '2006-08-09 09:16:22', '1970-05-31 07:28:42');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('2', 'rem', '2008-05-15 21:07:16', '1974-09-06 21:47:52');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('3', 'consequuntur', '1979-10-16 21:49:30', '2008-06-22 02:38:37');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('4', 'consequatur', '1976-11-10 05:30:56', '1972-03-04 11:06:39');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('5', 'doloribus', '2007-11-03 11:56:13', '2000-07-12 02:52:53');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('6', 'neque', '1992-08-13 18:23:01', '1974-04-04 03:48:48');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('7', 'molestiae', '1993-12-09 18:20:14', '2011-01-25 01:54:23');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('8', 'nesciunt', '2017-11-25 18:58:04', '1984-07-26 01:08:20');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('9', 'rerum', '1992-11-10 17:21:21', '1976-04-03 21:59:04');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('10', 'omnis', '2021-08-13 09:12:41', '2020-03-26 01:06:22');


#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`) USING BTREE,
  KEY `to_user_id` (`to_user_id`) USING BTREE,
  CONSTRAINT `messages_FK` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_FK_1` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('1', '11', '11', 'Quo explicabo quidem aut. Ipsam facilis voluptas saepe maiores. Facilis saepe possimus quia consequatur animi assumenda sed.', '1980-09-01 19:25:26');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('2', '12', '12', 'Fugiat voluptas omnis nesciunt hic totam officiis. Tenetur illum itaque doloremque dolorem ea. Unde sit dolore soluta ut officia in exercitationem. Quia qui qui sit distinctio et.', '2009-11-08 05:41:48');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('3', '13', '13', 'Sit rerum doloremque molestiae voluptatibus ducimus nisi. Fugit ducimus odit architecto ut cumque veniam tempore. Consequatur sunt mollitia excepturi iusto voluptatem.', '1975-09-21 12:17:07');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('4', '16', '16', 'Accusamus reiciendis et aliquid sit. Sapiente sed nostrum molestias quas. Quia qui quibusdam rerum delectus et harum doloremque odit.', '2006-12-05 10:21:00');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('5', '18', '18', 'Sint sit numquam sit maxime in possimus harum. Id perspiciatis voluptatem dolores ratione. Sed impedit est itaque doloribus voluptate. Quaerat quibusdam sunt assumenda vel.', '1997-10-04 16:46:31');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('6', '19', '19', 'Consequatur vel eum fugit aperiam consequatur maiores. Iure illum hic deleniti quidem. Ad eum quia doloremque natus amet et. Aliquam ducimus corporis maiores nulla id reiciendis.', '2006-08-15 20:11:00');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('7', '20', '20', 'Incidunt laudantium eos est error a aut id est. Aperiam velit harum praesentium aperiam aut sunt. Culpa accusamus porro voluptatem delectus magni nihil autem sed. Enim laboriosam eos ut enim consequatur ut.', '1979-04-02 22:35:58');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('8', '11', '11', 'Cumque ut dolore laboriosam repudiandae. Pariatur rerum ab vel quo cupiditate quaerat.', '2013-12-23 13:47:41');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('9', '12', '12', 'Quia at eveniet aspernatur ut rerum. Eos nam atque aliquid fugit vitae enim eum quas. Cum non officiis recusandae dicta enim.', '1999-02-13 01:04:06');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('10', '13', '13', 'Dicta dolore dolorum praesentium quia qui. Ea ea dolore earum dolores rerum ullam veniam. Animi quod cum minus et laudantium maxime.', '1997-11-22 14:26:10');


#
# TABLE STRUCTURE FOR: order_items
#

DROP TABLE IF EXISTS `order_items`;

CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `products_id` bigint(20) unsigned NOT NULL,
  `orders_id` bigint(20) unsigned NOT NULL,
  `order_status_code` enum('Cancelled','Completed') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_FK` (`orders_id`),
  KEY `order_items_FK_1` (`products_id`),
  CONSTRAINT `order_items_FK` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_FK_1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `order_items` (`id`, `products_id`, `orders_id`, `order_status_code`) VALUES ('1', '1', '1', 'Completed');
INSERT INTO `order_items` (`id`, `products_id`, `orders_id`, `order_status_code`) VALUES ('2', '2', '2', 'Cancelled');
INSERT INTO `order_items` (`id`, `products_id`, `orders_id`, `order_status_code`) VALUES ('3', '3', '3', 'Cancelled');
INSERT INTO `order_items` (`id`, `products_id`, `orders_id`, `order_status_code`) VALUES ('4', '4', '4', 'Cancelled');
INSERT INTO `order_items` (`id`, `products_id`, `orders_id`, `order_status_code`) VALUES ('5', '5', '5', 'Cancelled');
INSERT INTO `order_items` (`id`, `products_id`, `orders_id`, `order_status_code`) VALUES ('6', '6', '6', 'Cancelled');
INSERT INTO `order_items` (`id`, `products_id`, `orders_id`, `order_status_code`) VALUES ('7', '7', '7', 'Completed');
INSERT INTO `order_items` (`id`, `products_id`, `orders_id`, `order_status_code`) VALUES ('8', '8', '8', 'Cancelled');
INSERT INTO `order_items` (`id`, `products_id`, `orders_id`, `order_status_code`) VALUES ('9', '9', '9', 'Cancelled');
INSERT INTO `order_items` (`id`, `products_id`, `orders_id`, `order_status_code`) VALUES ('10', '10', '10', 'Cancelled');


#
# TABLE STRUCTURE FOR: orders
#

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` bigint(20) unsigned NOT NULL,
  `order_status_code` enum('Cancelled','Completed') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_FK` (`users_id`),
  CONSTRAINT `orders_FK` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `orders` (`id`, `users_id`, `order_status_code`) VALUES ('1', '11', 'Completed');
INSERT INTO `orders` (`id`, `users_id`, `order_status_code`) VALUES ('2', '12', 'Completed');
INSERT INTO `orders` (`id`, `users_id`, `order_status_code`) VALUES ('3', '13', 'Completed');
INSERT INTO `orders` (`id`, `users_id`, `order_status_code`) VALUES ('4', '16', 'Completed');
INSERT INTO `orders` (`id`, `users_id`, `order_status_code`) VALUES ('5', '18', 'Completed');
INSERT INTO `orders` (`id`, `users_id`, `order_status_code`) VALUES ('6', '19', 'Cancelled');
INSERT INTO `orders` (`id`, `users_id`, `order_status_code`) VALUES ('7', '20', 'Completed');
INSERT INTO `orders` (`id`, `users_id`, `order_status_code`) VALUES ('8', '11', 'Completed');
INSERT INTO `orders` (`id`, `users_id`, `order_status_code`) VALUES ('9', '12', 'Cancelled');
INSERT INTO `orders` (`id`, `users_id`, `order_status_code`) VALUES ('10', '13', 'Completed');


#
# TABLE STRUCTURE FOR: products
#

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_of_products_id` bigint(20) unsigned NOT NULL,
  `product_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` float NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_FK` (`media_id`),
  KEY `products_FK_1` (`type_of_products_id`),
  CONSTRAINT `products_FK` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `products_FK_1` FOREIGN KEY (`type_of_products_id`) REFERENCES `type_of_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `products` (`id`, `type_of_products_id`, `product_name`, `product_price`, `media_id`, `product_description`) VALUES ('1', '1', 'labore', '1160.1', '1', 'Minima quo exercitationem temporibus quia beatae pariatur. Et aut earum dolor soluta tempora in cupiditate quo. Quae sit provident saepe nam.');
INSERT INTO `products` (`id`, `type_of_products_id`, `product_name`, `product_price`, `media_id`, `product_description`) VALUES ('2', '2', 'non', '55663.5', '2', 'Vitae et ratione provident quia provident recusandae. In harum nemo sequi atque voluptas aut. Eius velit optio soluta ut voluptates. Adipisci omnis libero suscipit non aut saepe.');
INSERT INTO `products` (`id`, `type_of_products_id`, `product_name`, `product_price`, `media_id`, `product_description`) VALUES ('3', '3', 'quia', '12158800', '3', 'Non sapiente harum dolores consectetur. Velit laudantium doloremque quos vel aliquam dignissimos et. In omnis et modi laudantium soluta est vel. Nam harum qui quod est ex.');
INSERT INTO `products` (`id`, `type_of_products_id`, `product_name`, `product_price`, `media_id`, `product_description`) VALUES ('4', '4', 'quidem', '6440520', '4', 'Inventore sed dolorum quo mollitia sed animi rerum. Earum perferendis ut distinctio doloremque aut consectetur mollitia. Enim pariatur deleniti corporis enim minima.');
INSERT INTO `products` (`id`, `type_of_products_id`, `product_name`, `product_price`, `media_id`, `product_description`) VALUES ('5', '5', 'id', '0', '5', 'Est perferendis impedit ab eligendi odit voluptas. Eius tenetur minima perferendis explicabo aliquam libero vel. Dolorem harum vel inventore inventore. At ut sed possimus unde.');
INSERT INTO `products` (`id`, `type_of_products_id`, `product_name`, `product_price`, `media_id`, `product_description`) VALUES ('6', '6', 'aut', '8.51243', '6', 'Maiores qui ad iste omnis dicta. Eaque ipsa ut nesciunt et. In repellat nisi sit fugit itaque. Laboriosam voluptate voluptatem unde autem magnam aut tempore.');
INSERT INTO `products` (`id`, `type_of_products_id`, `product_name`, `product_price`, `media_id`, `product_description`) VALUES ('7', '7', 'rerum', '9239.42', '7', 'Voluptatem nulla nihil sequi quo voluptatem quaerat quidem. Asperiores laudantium sapiente omnis tempore et qui voluptate. Sint velit odio enim voluptatem pariatur exercitationem unde.');
INSERT INTO `products` (`id`, `type_of_products_id`, `product_name`, `product_price`, `media_id`, `product_description`) VALUES ('8', '8', 'aut', '7574.11', '8', 'Eius consequuntur dolorem vitae omnis ut aut. Quia repudiandae est aliquam. Aliquam suscipit est sunt et atque quasi enim rem.');
INSERT INTO `products` (`id`, `type_of_products_id`, `product_name`, `product_price`, `media_id`, `product_description`) VALUES ('9', '9', 'voluptate', '39594.2', '9', 'Voluptas aspernatur blanditiis non iure. Ut ut aperiam ea earum. Adipisci sit et sed iste. Sit omnis ut voluptatum mollitia iste aperiam sed.');
INSERT INTO `products` (`id`, `type_of_products_id`, `product_name`, `product_price`, `media_id`, `product_description`) VALUES ('10', '10', 'explicabo', '1741130', '10', 'Architecto ipsum odio id ut veniam id eum. Quo dolorem eveniet molestias vitae est. Fugit ea tempora autem dolore sunt rerum. Quis quos ipsum veniam ut aut doloremque error.');


#
# TABLE STRUCTURE FOR: profiles
#

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_me` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `birthday` date DEFAULT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `profiles_UN` (`user_id`),
  CONSTRAINT `profiles_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `profiles` (`user_id`, `nickname`, `hometown`, `firstname`, `lastname`, `about_me`, `created_at`, `birthday`, `gender`) VALUES ('11', 'fugiat', 'Australia', 'Martina', 'Shanahan', 'et', '1993-01-22 09:02:41', '1986-11-27', 'F');
INSERT INTO `profiles` (`user_id`, `nickname`, `hometown`, `firstname`, `lastname`, `about_me`, `created_at`, `birthday`, `gender`) VALUES ('12', 'fuga', 'Russian Federation', 'Corene', 'Abbott', 'amet', '1974-02-02 21:02:04', '1989-05-24', 'M');
INSERT INTO `profiles` (`user_id`, `nickname`, `hometown`, `firstname`, `lastname`, `about_me`, `created_at`, `birthday`, `gender`) VALUES ('13', 'velit', 'Jordan', 'Gordon', 'Muller', 'temporibus', '1985-12-11 00:49:07', '1994-09-16', 'F');
INSERT INTO `profiles` (`user_id`, `nickname`, `hometown`, `firstname`, `lastname`, `about_me`, `created_at`, `birthday`, `gender`) VALUES ('16', 'et', 'Gambia', 'Euna', 'Balistreri', 'distinctio', '1999-08-04 17:52:48', '2013-10-15', 'F');
INSERT INTO `profiles` (`user_id`, `nickname`, `hometown`, `firstname`, `lastname`, `about_me`, `created_at`, `birthday`, `gender`) VALUES ('18', 'nihil', 'Holy See (Vatican City State)', 'Ryan', 'Zulauf', 'asperiores', '2004-03-24 06:46:41', '1973-07-01', 'M');
INSERT INTO `profiles` (`user_id`, `nickname`, `hometown`, `firstname`, `lastname`, `about_me`, `created_at`, `birthday`, `gender`) VALUES ('19', 'itaque', 'Namibia', 'Easter', 'Conroy', 'in', '1975-04-24 13:11:42', '1995-09-13', 'M');
INSERT INTO `profiles` (`user_id`, `nickname`, `hometown`, `firstname`, `lastname`, `about_me`, `created_at`, `birthday`, `gender`) VALUES ('20', 'sapiente', 'Venezuela', 'Richmond', 'Cruickshank', 'qui', '2012-11-30 10:15:30', '1979-04-09', 'F');


#
# TABLE STRUCTURE FOR: type_of_products
#

DROP TABLE IF EXISTS `type_of_products`;

CREATE TABLE `type_of_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `type_of_products` (`id`, `type`) VALUES ('1', 'autem');
INSERT INTO `type_of_products` (`id`, `type`) VALUES ('2', 'at');
INSERT INTO `type_of_products` (`id`, `type`) VALUES ('3', 'et');
INSERT INTO `type_of_products` (`id`, `type`) VALUES ('4', 'ipsum');
INSERT INTO `type_of_products` (`id`, `type`) VALUES ('5', 'necessitatibus');
INSERT INTO `type_of_products` (`id`, `type`) VALUES ('6', 'molestias');
INSERT INTO `type_of_products` (`id`, `type`) VALUES ('7', 'repellat');
INSERT INTO `type_of_products` (`id`, `type`) VALUES ('8', 'rem');
INSERT INTO `type_of_products` (`id`, `type`) VALUES ('9', 'atque');
INSERT INTO `type_of_products` (`id`, `type`) VALUES ('10', 'voluptatem');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(20) unsigned NOT NULL,
  `login` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wallet` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `email`, `password_hash`, `phone`, `login`, `wallet`) VALUES ('11', 'haag.haskell@example.org', '2ceb4a2dc1fb04deaccf53f21bb6439b762c5594', '0', 'ut', '4');
INSERT INTO `users` (`id`, `email`, `password_hash`, `phone`, `login`, `wallet`) VALUES ('12', 'strosin.katelin@example.org', '15f14ccffcab357667c23d78669d19952148bf97', '913', 'sed', '4');
INSERT INTO `users` (`id`, `email`, `password_hash`, `phone`, `login`, `wallet`) VALUES ('13', 'claudia24@example.com', '69ecaa041a9a245ab23c8ec89cfe5a301eae3cea', '773625', 'sapiente', '2');
INSERT INTO `users` (`id`, `email`, `password_hash`, `phone`, `login`, `wallet`) VALUES ('16', 'mcdermott.joe@example.org', 'd7d53d85ded9195ff6c2b2ed6613ac9d11913cf1', '297', 'illo', '5');
INSERT INTO `users` (`id`, `email`, `password_hash`, `phone`, `login`, `wallet`) VALUES ('18', 'daugherty.herbert@example.org', 'ae36bd53fbbe2fc039a3c3e06125178aaefa9856', '5704207807', 'quo', '6');
INSERT INTO `users` (`id`, `email`, `password_hash`, `phone`, `login`, `wallet`) VALUES ('19', 'wwilliamson@example.com', '7fdb4a1dbd7f6d49f6de072f4778191592b42c0d', '60', 'architecto', '1');
INSERT INTO `users` (`id`, `email`, `password_hash`, `phone`, `login`, `wallet`) VALUES ('20', 'ezemlak@example.net', '5e9431467f4ef3a0ef062f5bb66429829a8fe48e', '1', 'et', '6');


