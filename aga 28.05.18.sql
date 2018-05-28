/*
Navicat MySQL Data Transfer

Source Server         : Vagrant_Lamp
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : aga

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-05-28 05:03:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `
postcode` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of addresses
-- ----------------------------

-- ----------------------------
-- Table structure for baskets_info
-- ----------------------------
DROP TABLE IF EXISTS `baskets_info`;
CREATE TABLE `baskets_info` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `cost` double(10,2) NOT NULL,
  KEY `baskets_info_fk0` (`order_id`),
  CONSTRAINT `baskets_info_fk0` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of baskets_info
-- ----------------------------

-- ----------------------------
-- Table structure for baskets_statuses
-- ----------------------------
DROP TABLE IF EXISTS `baskets_statuses`;
CREATE TABLE `baskets_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of baskets_statuses
-- ----------------------------
INSERT INTO `baskets_statuses` VALUES ('1', 'active', '2017-09-20 19:41:14', null, null);
INSERT INTO `baskets_statuses` VALUES ('2', 'non-active', '2017-12-01 06:32:26', '0000-00-00 00:00:00', null);
INSERT INTO `baskets_statuses` VALUES ('3', '\r\nready', '2017-12-01 06:32:55', null, null);
INSERT INTO `baskets_statuses` VALUES ('4', '\r\nprocessed', '2017-12-01 09:11:35', null, null);
INSERT INTO `baskets_statuses` VALUES ('5', 'hide', '2017-12-01 14:38:10', null, null);

-- ----------------------------
-- Table structure for communications
-- ----------------------------
DROP TABLE IF EXISTS `communications`;
CREATE TABLE `communications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_admin_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of communications
-- ----------------------------
INSERT INTO `communications` VALUES ('1', '3', '1', '2017-08-14 18:31:13', null, null);

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', 'admin', '2017-08-07 08:03:41', '2017-08-07 08:03:41');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2016_01_01_000000_add_voyager_user_fields', '1');
INSERT INTO `migrations` VALUES ('4', '2016_01_01_000000_create_data_types_table', '1');
INSERT INTO `migrations` VALUES ('5', '2016_01_01_000000_create_pages_table', '1');
INSERT INTO `migrations` VALUES ('6', '2016_01_01_000000_create_posts_table', '1');
INSERT INTO `migrations` VALUES ('7', '2016_02_15_204651_create_categories_table', '1');
INSERT INTO `migrations` VALUES ('8', '2016_05_19_173453_create_menu_table', '1');
INSERT INTO `migrations` VALUES ('9', '2016_10_21_190000_create_roles_table', '1');
INSERT INTO `migrations` VALUES ('10', '2016_10_21_190000_create_settings_table', '1');
INSERT INTO `migrations` VALUES ('11', '2016_11_30_135954_create_permission_table', '1');
INSERT INTO `migrations` VALUES ('12', '2016_11_30_141208_create_permission_role_table', '1');
INSERT INTO `migrations` VALUES ('13', '2016_12_26_201236_data_types__add__server_side', '1');
INSERT INTO `migrations` VALUES ('14', '2017_01_13_000000_add_route_to_menu_items_table', '1');
INSERT INTO `migrations` VALUES ('15', '2017_01_14_005015_create_translations_table', '1');
INSERT INTO `migrations` VALUES ('16', '2017_01_15_000000_add_permission_group_id_to_permissions_table', '1');
INSERT INTO `migrations` VALUES ('17', '2017_01_15_000000_create_permission_groups_table', '1');
INSERT INTO `migrations` VALUES ('18', '2017_01_15_000000_make_table_name_nullable_in_permissions_table', '1');
INSERT INTO `migrations` VALUES ('19', '2017_03_06_000000_add_controller_to_data_types_table', '1');
INSERT INTO `migrations` VALUES ('20', '2017_04_21_000000_add_order_to_data_rows_table', '1');
INSERT INTO `migrations` VALUES ('21', '2018_05_24_125701_create_sessions_table', '2');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `sending_id` int(11) NOT NULL,
  `status_id` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_fk0` (`address_id`),
  CONSTRAINT `orders_fk0` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for product_types
-- ----------------------------
DROP TABLE IF EXISTS `product_types`;
CREATE TABLE `product_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_types
-- ----------------------------
INSERT INTO `product_types` VALUES ('1', 'drinkables', '2018-05-25 09:34:04', null, '2017-08-14 08:39:41');
INSERT INTO `product_types` VALUES ('2', 'milky', '2017-08-14 08:43:44', null, '2017-08-14 08:43:44');
INSERT INTO `product_types` VALUES ('3', 'bakery', '2017-11-28 12:39:02', null, '2017-08-14 08:45:05');
INSERT INTO `product_types` VALUES ('4', 'meat', '2017-08-14 08:45:33', null, '2017-08-14 08:45:33');
INSERT INTO `product_types` VALUES ('5', 'domestic', '2017-11-28 14:54:34', null, '2017-08-14 08:46:27');
INSERT INTO `product_types` VALUES ('6', 'vegetables&fruit', '2017-11-28 14:54:48', null, '2017-08-14 08:47:11');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `weight_type` tinyint(4) NOT NULL,
  `weight` double NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `img_path` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name` (`name`,`description`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'Coca-cola', '14.4', '1', '1', null, '2017-08-14 13:09:00', '2017-11-27 17:23:01', 'products/November2017/n1xVHAng0AcsxleUTSdi.jpg', '1');
INSERT INTO `products` VALUES ('2', 'Fanta', '15.8', '1', '1', null, '2017-08-14 09:46:00', '2017-11-27 17:23:18', 'products/November2017/kBxDtRovYFgie1PoNI5m.jpg', '1');
INSERT INTO `products` VALUES ('3', 'Holland cheese', '33.33', '3', '100', null, '2017-11-27 17:24:35', '2017-11-27 17:24:35', 'products/November2017/hFFCYjzdbKacUovceU8y.png', '2');
INSERT INTO `products` VALUES ('4', 'Cherry', '30.9', '2', '1', null, '2017-11-27 17:26:34', '2017-11-27 17:26:34', 'products/November2017/sPHnKuwPjvVpL5FJirpL.jpg', '6');
INSERT INTO `products` VALUES ('5', 'Cheese', '41.11', '3', '100', null, '2017-11-27 17:28:05', '2017-11-27 17:28:05', 'products/November2017/dzfULtEgAkfmnLKMka9A.jpg', '2');
INSERT INTO `products` VALUES ('6', 'H20la', '10.05', '1', '1', null, '2017-11-27 17:29:13', '2017-11-27 17:29:13', 'products/November2017/mjnXxZ8D4yS3vuNhpqL2.jpg', '1');
INSERT INTO `products` VALUES ('8', 'Milk 3,6%', '32', '1', '3', null, '2017-11-27 17:30:41', '2017-11-27 17:30:41', 'products/November2017/NkY5QgiJuRmJOvtNCKam.jpg', '2');
INSERT INTO `products` VALUES ('10', 'potato', '5.5', '2', '1', null, '2017-12-09 07:51:06', '2017-12-09 07:51:06', 'products/December2017/cFkbLitexCwyPIyFSLmm.jpg', '6');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin', 'Administrator', '2017-08-07 08:03:41', '2017-08-07 08:03:41');
INSERT INTO `roles` VALUES ('2', 'user', 'Normal User', '2017-08-07 08:03:41', '2017-08-07 08:03:41');
INSERT INTO `roles` VALUES ('3', 'ShopAdmin', 'Shop Admin', '2017-08-14 09:23:40', '2017-08-14 09:24:52');

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES ('1', '1', '5', '2018-05-22 22:26:31', '2018-06-02 22:27:11', '1', '2018-05-23 22:26:43', null, null);
INSERT INTO `sales` VALUES ('4', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', null, null);

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('QExxxt9TpuBz3cncmkHWPGqUJ8EZgppoNs5zUKj8', null, '10.0.2.2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGhQU3A1ZUZlckNjUHNKYUdmbTdkZ1BvNml2YTd4bHU2VkJ4dmlkRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9zaG9wLmxvYy9iYXNrZXQtZGVsZXRlLW9uZT9kYXRhPTUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '1527472047');

-- ----------------------------
-- Table structure for statuses_log
-- ----------------------------
DROP TABLE IF EXISTS `statuses_log`;
CREATE TABLE `statuses_log` (
  `order_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `started_at` datetime NOT NULL,
  KEY `statuses_log_fk0` (`order_id`),
  CONSTRAINT `statuses_log_fk0` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of statuses_log
-- ----------------------------

-- ----------------------------
-- Table structure for stores
-- ----------------------------
DROP TABLE IF EXISTS `stores`;
CREATE TABLE `stores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stores
-- ----------------------------
INSERT INTO `stores` VALUES ('1', 'АТБ', 'ул. д.', '2017-08-11 13:01:15', '2017-08-11 13:01:15', null);
INSERT INTO `stores` VALUES ('2', 'Маркетропт', 'ул. д.', '2017-08-11 13:03:39', '2017-08-11 13:03:39', null);
INSERT INTO `stores` VALUES ('3', 'Оптовичок', 'ул. д.', '2017-08-11 13:04:11', '2017-08-11 13:04:11', null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', 'Admin', 'admin@admin.com', '', 'users/default.png', '$2y$10$S4iitEfHxIm6dUX0GQ4oA.U13xBnOI4fY8kPd5xq4cWsaOYM4mKQe', 'zGeZhyzI0E10sMjIGCChj8PzPURtNrBPag2MmseeuTuJKcMQtYTJFMdYiKcq', '2017-08-07 08:03:41', '2018-05-16 14:08:40');
INSERT INTO `users` VALUES ('2', '2', 'Gleb', 'gleb.deriyenko@gmail.com', '', 'users/default.png', '$2y$10$S4iitEfHxIm6dUX0GQ4oA.U13xBnOI4fY8kPd5xq4cWsaOYM4mKQe', 'MViF8svmCSvmZ6vNQrjg0xr0zGSBBV1qWwT7o7Y1RPQJuP3ifUH3Ssu9DikN', '2017-08-07 14:24:14', '2017-08-07 14:46:18');
INSERT INTO `users` VALUES ('3', '3', 'Marketopt', 'marketopt@admin.com', '', 'users/default.png', '$2y$10$BUd6MidBLGeh7NxO9t2jiOUU.JsJ2kd3dRuj8ivG/kiYSDV4Qe3qW', null, '2017-08-14 09:19:47', '2017-08-14 09:25:14');
INSERT INTO `users` VALUES ('4', '2', 'bogdan', 'dydka@mail.com', '', 'users/default.png', '$2y$10$r9lpfhcxMSV.KIbzY86g8eDtIs4idhyahypBSXhVXFbMS6FNn2ClW', null, '2017-11-28 10:16:29', '2017-11-28 10:16:29');
INSERT INTO `users` VALUES ('5', '2', 'Karina', 'karina@gmail.com', '', 'users/default.png', '$2y$10$A0njqOymkYPv.MSIDBUYpuslrlBHTFAPFP9npEp0jOANUUnwkuyM.', null, '2017-12-09 07:42:08', '2017-12-09 07:42:08');
INSERT INTO `users` VALUES ('6', null, 'Tester', 'tester@mail.com', '', null, '$2y$10$9qjJpeL8ybPf60VBuxKdB.gatWcdlrxF0AIWWcBhiKtbU5qNrOkEu', 'L8i4jznXBvR1HgQg9LEOFzSjLHWTPAfG6SZ2CiP2lozWoL46En1RaJfvFf3Z', '2018-05-27 22:56:10', '2018-05-27 22:56:10');
INSERT INTO `users` VALUES ('7', null, 'Test', 'test@mail.com', '380972450916', null, '$2y$10$ZF2kVa7CQoDeaFqzJuh50.pqw5qBpQYvqSWoczLZIN4dJ/jkbYhZ6', null, '2018-05-27 22:58:53', '2018-05-27 22:58:53');

-- ----------------------------
-- Table structure for vd_city
-- ----------------------------
DROP TABLE IF EXISTS `vd_city`;
CREATE TABLE `vd_city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `db_rootid` int(11) NOT NULL DEFAULT '0',
  `db_defnamelang` varchar(100) NOT NULL,
  `db_sortindex` int(10) NOT NULL DEFAULT '0',
  `db_timecreation` int(10) unsigned NOT NULL DEFAULT '0',
  `db_timelastedit` int(10) unsigned NOT NULL DEFAULT '0',
  `db_enabled` enum('0','1') NOT NULL DEFAULT '1',
  `db_deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1766762 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vd_city
-- ----------------------------
INSERT INTO `vd_city` VALUES ('3832', '279', 'Бар', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3833', '279', 'Бершадь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3834', '279', 'Браилов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3835', '279', 'Брацлав', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3836', '279', 'Вапнярка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3837', '279', 'Вендичаны', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3838', '279', 'Винница', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3839', '279', 'Вороновица', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3840', '279', 'Гайсин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3841', '279', 'Гнивань', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3842', '279', 'Дашев', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3843', '279', 'Жмеринка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3844', '279', 'Ильинцы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3845', '279', 'Казатин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3846', '279', 'Калиновка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3847', '279', 'Крыжополь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3848', '279', 'Липовец', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3849', '279', 'Литин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3850', '279', 'Могилев-Подольский', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3851', '279', 'Мурованные Куриловцы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3852', '279', 'Немиров', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3853', '279', 'Оратов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3854', '279', 'Песчанка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3855', '279', 'Погребище', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3856', '279', 'Теплик', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3857', '279', 'Томашполь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3858', '279', 'Тростянец', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3859', '279', 'Тульчин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3860', '279', 'Тывров', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3861', '279', 'Хмельник', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3862', '279', 'Чечельник', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3863', '279', 'Шаргород', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3864', '279', 'Ямполь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3865', '280', 'Берестечко', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3866', '280', 'Владимир-Волынский', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3867', '280', 'Голобы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3868', '280', 'Головно', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3869', '280', 'Горохов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3871', '280', 'Иваничи', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3872', '280', 'Камень-Каширский', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3873', '280', 'Киверцы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3874', '280', 'Ковель', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3875', '280', 'Локачи', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3876', '280', 'Луцк', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3877', '280', 'Любешов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3878', '280', 'Любомль', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3879', '280', 'Маневичи', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3880', '280', 'Нововолынск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3881', '280', 'Ратно', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3882', '280', 'Рожище', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3883', '280', 'Старая Выжевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3884', '280', 'Турийск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3885', '281', 'Апостолово', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3886', '281', 'Аулы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3887', '281', 'Брагиновка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3888', '281', 'Васильковка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3889', '281', 'Верхнеднепровск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3890', '281', 'Верховцево', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3891', '281', 'Вольногорск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3892', '281', 'Гвардейское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3894', '281', 'Губиниха', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3895', '281', 'Демурино', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3896', '281', 'Днепродзержинск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3897', '281', 'Днепропетровск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3898', '281', 'Желтые Воды', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('5116', '281', 'Зеленодольск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3900', '281', 'Зеленое', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3901', '281', 'Илларионово', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3902', '281', 'Ингулец', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3903', '281', 'Калинино', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3904', '281', 'Карнауховка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3905', '281', 'Кривой Рог', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3906', '281', 'Кринички', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3907', '281', 'Магдалиновка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3908', '281', 'Марганец', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3909', '281', 'Межевая', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3910', '281', 'Никополь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3911', '281', 'Новомосковск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3912', '281', 'Орджоникидзе', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3913', '281', 'Павлоград', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('5017', '281', 'Першотравенск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3914', '281', 'Петропавловка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3915', '281', 'Покровское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3916', '281', 'Пятихатки', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3917', '281', 'Синельниково', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3918', '281', 'Софиевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3919', '281', 'Томаковка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3920', '281', 'Царичанка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3921', '281', 'Широкое', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3922', '282', 'Авдеевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3923', '282', 'Александровка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3924', '282', 'Алексеево-Дружковка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3925', '282', 'Амвросиевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3926', '282', 'Андреевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3928', '282', 'Артемовск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4174', '282', 'Артемовск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3929', '282', 'Безыменное', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3930', '282', 'Беленькое', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3932', '282', 'Благодатное', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3933', '282', 'Былбасовка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3934', '282', 'Великая Новоселка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3935', '282', 'Войковский', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3936', '282', 'Волноваха', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3937', '282', 'Володарское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3939', '282', 'Горбачево-Михайловка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3940', '282', 'Горловка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3941', '282', 'Гродовка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3942', '282', 'Грузско-Зорянское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3943', '282', 'Дебальцево', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3944', '282', 'Дзержинск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3945', '282', 'Димитров', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3946', '282', 'Доброполье', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3947', '282', 'Докучаевск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3948', '282', 'Донецк', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3949', '282', 'Донецкая', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3950', '282', 'Донское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3951', '282', 'Дробышево', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3952', '282', 'Дружковка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3953', '282', 'Енакиево', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3955', '282', 'Желанное', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3956', '282', 'Зугрэс', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3957', '282', 'Зуевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3958', '282', 'Иловайск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3960', '282', 'Карло-Марксово', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3961', '282', 'Кировск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('5087', '282', 'Константиновка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3962', '282', 'Краматорск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3963', '282', 'Красноармейск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3964', '282', 'Красный Лиман', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('1765574', '282', 'Макеевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3965', '282', 'Макеевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3966', '282', 'Мариуполь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3967', '282', 'Марьинка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3968', '282', 'Новоазовск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3969', '282', 'Новоэкономическое', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3971', '282', 'Селидово', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3972', '282', 'Славянск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3973', '282', 'Снежное', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3959', '282', 'Соледар', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3974', '282', 'Старобешево', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3975', '282', 'Тельманово', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3976', '282', 'Торез', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('5117', '282', 'Угледар', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3977', '282', 'Харцызск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3978', '282', 'Шахтерск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3979', '282', 'Ясиноватая', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3980', '283', 'Андрушевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3981', '283', 'Барановка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3982', '283', 'Белая Криница', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3983', '283', 'Бердичев', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3984', '283', 'Броницкая Гута', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3985', '283', 'Брусилов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3986', '283', 'Быковка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3987', '283', 'Великие Коровинцы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3988', '283', 'Володарск-Волынский', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3989', '283', 'Городница', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3990', '283', 'Гришковцы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3991', '283', 'Дзержинск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3992', '283', 'Довбыш', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3993', '283', 'Емильчино', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3994', '283', 'Житомир', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3995', '283', 'Иванополь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3996', '283', 'Каменный Брод', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3997', '283', 'Коростень', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3998', '283', 'Коростышев', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3999', '283', 'Лугины', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4000', '283', 'Любар', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4001', '283', 'Малин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4002', '283', 'Народичи', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4003', '283', 'Новоград-Волынский', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4004', '283', 'Овруч', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4005', '283', 'Олевск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4006', '283', 'Попельня', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4007', '283', 'Радомышль', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4008', '283', 'Ружин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4009', '283', 'Червоноармейск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4360', '283', 'Червоноармейск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4010', '283', 'Черняхов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4011', '283', 'Чуднов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4012', '284', 'Берегово', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4013', '284', 'Буштына', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4014', '284', 'Великий Березный', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4015', '284', 'Великий Бычков', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4016', '284', 'Виноградов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4017', '284', 'Воловец', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4018', '284', 'Иршава', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4019', '284', 'Межгорье', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4020', '284', 'Мукачево', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4021', '284', 'Перечин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4022', '284', 'Рахов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4023', '284', 'Свалява', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4024', '284', 'Тячев', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4025', '284', 'Ужгород', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4026', '284', 'Хуст', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4027', '284', 'Чоп', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4028', '285', 'Акимовка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4029', '285', 'Андреевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4030', '285', 'Балабино', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4031', '285', 'Бердянск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4032', '285', 'Васильевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4033', '285', 'Веселое', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4034', '285', 'Гуляйполе', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4035', '285', 'Запорожье', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4036', '285', 'Каменка-Днепровская', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4037', '285', 'Каменное', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4038', '285', 'Камыш-Заря', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4039', '285', 'Куйбышево', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4040', '285', 'Мелитополь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4041', '285', 'Михайловка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4042', '285', 'Новониколаевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4043', '285', 'Орехов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4044', '285', 'Пологи', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4045', '285', 'Приазовское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4046', '285', 'Приморск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4047', '285', 'Токмак', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4048', '285', 'Черниговка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4984', '285', 'Энергодар', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4049', '286', 'Богородчаны', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4050', '286', 'Болехов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4051', '286', 'Болшовцы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4052', '286', 'Брошнев-Осада', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4053', '286', 'Букачевцы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4054', '286', 'Бурштын', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4055', '286', 'Бытков', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4056', '286', 'Верховина', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4057', '286', 'Войнилов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4058', '286', 'Ворохта', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4059', '286', 'Выгода', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4060', '286', 'Галич', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4062', '286', 'Городенка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4063', '286', 'Делятин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('1766192', '286', 'Долина', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4064', '286', 'Езуполь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4065', '286', 'Заболотов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4066', '286', 'Ивано-Франковск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4068', '286', 'Калуш', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4069', '286', 'Коломыя', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4070', '286', 'Косов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4071', '286', 'Надворна', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4072', '286', 'Надворная', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4073', '286', 'Рогатин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4074', '286', 'Рожнятов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4075', '286', 'Снятын', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4076', '286', 'Станиславов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4077', '286', 'Тлумач', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4078', '286', 'Тысменица', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4079', '286', 'Яремча', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4080', '287', 'Барышевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4081', '287', 'Белая Церковь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4082', '287', 'Березань', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4083', '287', 'Богуслав', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4084', '287', 'Борисполь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4085', '287', 'Боровая', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4086', '287', 'Бородянка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('5081', '287', 'Боярка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4087', '287', 'Бровары', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4088', '287', 'Васильков', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('1766731', '287', 'Вишневое', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('1766501', '287', 'Вишневое', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('1766729', '287', 'Вишневое', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4089', '287', 'Володарка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4090', '287', 'Ворзель', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('5076', '287', 'Вышгород', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4091', '287', 'Гребенки', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4092', '287', 'Дымер', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4093', '287', 'Згуровка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4094', '287', 'Иванков', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4095', '287', 'Ирпень', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4096', '287', 'Кагарлык', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4097', '287', 'Калиновка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4098', '287', 'Киев', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4100', '287', 'Кодра', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4101', '287', 'Кожанка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4102', '287', 'Козин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4103', '287', 'Макаров', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4104', '287', 'Обухов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4105', '287', 'Переяслав-Хмельницкий', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4106', '287', 'Полесское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4107', '287', 'Ракитное', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4108', '287', 'Сквира', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('5024', '287', 'Славутич', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4109', '287', 'Ставище', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4110', '287', 'Тараща', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4111', '287', 'Тетиев', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4112', '287', 'Фастов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4113', '287', 'Чернобыль', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4114', '287', 'Яготин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4116', '288', 'Александрия', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('1766761', '288', 'Александровка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4117', '288', 'Бобринец', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4118', '288', 'Гайворон', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4119', '288', 'Голованевск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4120', '288', 'Добровеличковка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4121', '288', 'Долинская', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4122', '288', 'Елизаветградка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4123', '288', 'Завалье', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4124', '288', 'Знаменка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4125', '288', 'Знаменка-Вторая', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4126', '288', 'Капитановка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4127', '288', 'Кировоград', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4128', '288', 'Компанеевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4129', '288', 'Малая Виска', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4130', '288', 'Новгородка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4131', '288', 'Новоархангельск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4132', '288', 'Новомиргород', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4133', '288', 'Новоукраинка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4134', '288', 'Ольшанка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4135', '288', 'Онуфриевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4136', '288', 'Петрово', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4137', '288', 'Светловодск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4138', '288', 'Ульяновка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4139', '288', 'Устиновка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4141', '289', 'Алупка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4142', '289', 'Алушта', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('5088', '289', 'Армянск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4912', '289', 'Армянск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4143', '289', 'Багерово', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4145', '289', 'Бахчисарай', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4146', '289', 'Белогорск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4914', '289', 'Береговое', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4915', '289', 'Ботаническое', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4147', '289', 'Гаспра', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4148', '289', 'Гвардейское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4149', '289', 'Гурзуф', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4150', '289', 'Джанкой', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4151', '289', 'Евпатория', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4152', '289', 'Зуя', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4917', '289', 'Кацивели', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4153', '289', 'Керчь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4918', '289', 'Кореиз', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4919', '289', 'Красногвардейск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4155', '289', 'Красногвардейское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4920', '289', 'Краснокаменка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4156', '289', 'Красноперекопск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4921', '289', 'Курпаты', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4157', '289', 'Ленино', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4922', '289', 'Ливадия', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4158', '289', 'Массандра', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4923', '289', 'Мисхор', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4159', '289', 'Нижнегорский', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4924', '289', 'Олива', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4925', '289', 'Оползневое', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4926', '289', 'Парковое', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4160', '289', 'Первомайское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4927', '289', 'Понизовка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4162', '289', 'Саки', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4928', '289', 'Санаторное', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4163', '289', 'Севастополь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4929', '289', 'Симеиз', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4164', '289', 'Симферополь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4165', '289', 'Советский', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4166', '289', 'Судак', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4167', '289', 'Феодосия', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4168', '289', 'Форос', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4169', '289', 'Черноморское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('5052', '289', 'Щёлкино', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4170', '289', 'Ялта', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4171', '290', 'Алексадровск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4172', '290', 'Алчевск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4173', '290', 'Антрацит', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('3927', '290', 'Артемово', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4175', '290', 'Байрачки', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4176', '290', 'Беловодск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4177', '290', 'Белогоровка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4178', '290', 'Белое', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4179', '290', 'Белокуракино', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4180', '290', 'Белолуцк', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4181', '290', 'Бирюково', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4182', '290', 'Боково-Платово', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4183', '290', 'Боровское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4184', '290', 'Брянка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4185', '290', 'Бугаевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4186', '290', 'Вахрушево', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4187', '290', 'Великий Лог', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4188', '290', 'Вергулевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4189', '290', 'Володарск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4190', '290', 'Волчеяровка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4192', '290', 'Врубовка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4193', '290', 'Врубовский', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4194', '290', 'Георгиевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4195', '290', 'Горское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4196', '290', 'Есауловка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4197', '290', 'Зимогорье', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4198', '290', 'Золотое', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4199', '290', 'Зоринск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4200', '290', 'Изварино', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4201', '290', 'Калининский', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4202', '290', 'Калиново', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4204', '290', 'Кировск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('1748298', '290', 'Краснодарський', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4206', '290', 'Краснодон', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4207', '290', 'Красный Луч', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4208', '290', 'Кременная', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4209', '290', 'Лисичанск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4210', '290', 'Луганск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4211', '290', 'Лутугино', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4212', '290', 'Марковка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4213', '290', 'Меловое', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4214', '290', 'Новоайдар', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4215', '290', 'Новопсков', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4216', '290', 'Первомайск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4217', '290', 'Перевальск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4218', '290', 'Попасная', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4219', '290', 'Ровеньки', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4220', '290', 'Рубежное', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4221', '290', 'Сватово', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4222', '290', 'Свердловск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4223', '290', 'Северодонецк', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4224', '290', 'Славяносербск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4225', '290', 'Станично-Луганское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4226', '290', 'Старобельск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4227', '290', 'Стаханов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4228', '290', 'Троицкое', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4229', '291', 'Белз', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4230', '291', 'Бобрка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4231', '291', 'Борислав', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4232', '291', 'Броды', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4233', '291', 'Буск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4234', '291', 'Великие Мосты', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4235', '291', 'Верхнее Синевидное', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4236', '291', 'Винники', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4061', '291', 'Гвоздец', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4237', '291', 'Глиняны', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4239', '291', 'Дашава', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4240', '291', 'Добротвор', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4241', '291', 'Дрогобыч', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4242', '291', 'Жидачов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4244', '291', 'Золочев', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4245', '291', 'Ивано-Франково', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4246', '291', 'Каменка-Бугская', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('1035074', '291', 'Лопушанка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4247', '291', 'Львов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4248', '291', 'Мостиска', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4249', '291', 'Нестеров', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4250', '291', 'Николаев', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('1766197', '291', 'Новояворовск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4251', '291', 'Перемышляны', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4252', '291', 'Пустомыты', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4253', '291', 'Рава Русская', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4254', '291', 'Радехов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4255', '291', 'Самбор', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4256', '291', 'Сколе', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4257', '291', 'Сокаль', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4258', '291', 'Старый Самбор', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4259', '291', 'Стрый', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4260', '291', 'Трускавец', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4261', '291', 'Турка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4262', '291', 'Червоноград', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4263', '291', 'Яворов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4264', '292', 'Александровка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4265', '292', 'Арбузинка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4266', '292', 'Баштанка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4267', '292', 'Березнеговатое', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4268', '292', 'Братское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4270', '292', 'Веселиново', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4271', '292', 'Вознесенск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4272', '292', 'Доманевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4273', '292', 'Еланец', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4274', '292', 'Казанка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4275', '292', 'Кривое Озеро', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4276', '292', 'Николаев', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4277', '292', 'Новая Одесса', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4278', '292', 'Новый Буг', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4279', '292', 'Очаков', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4280', '292', 'Первомайск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4281', '292', 'Снигиревка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('5009', '292', 'Южноукраинск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4282', '293', 'Аккерман', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4283', '293', 'Ананьев', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4284', '293', 'Арциз', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4285', '293', 'Балта', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4286', '293', 'Белгород-Днестровский', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4287', '293', 'Беляевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4288', '293', 'Березино', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4289', '293', 'Березовка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4290', '293', 'Болград', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4291', '293', 'Бородино', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4292', '293', 'Великая Михайловка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4293', '293', 'Великодолининское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4294', '293', 'Вилково', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4295', '293', 'Затишье', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4296', '293', 'Измаил', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4297', '293', 'Ильичевск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4298', '293', 'Килия', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4299', '293', 'Кодыма', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4300', '293', 'Коминтерновское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4301', '293', 'Котовск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4302', '293', 'Красные Окны', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4303', '293', 'Любашевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4304', '293', 'Николаевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4305', '293', 'Овидиополь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4306', '293', 'Одесса', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4307', '293', 'Раздельная', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4308', '293', 'Рени', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4309', '293', 'Саврань', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4310', '293', 'Сарата', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4311', '293', 'Тарутино', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4312', '293', 'Татарбунары', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4313', '293', 'Фрунзовка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4314', '293', 'Ширяево', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('5107', '293', 'Южный', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4315', '294', 'Белики', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4316', '294', 'Великая Багачка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4317', '294', 'Гадяч', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4318', '294', 'Глобино', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4319', '294', 'Гоголево', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4320', '294', 'Градижск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4321', '294', 'Гребенка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4322', '294', 'Диканька', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4324', '294', 'Карловка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4325', '294', 'Кобеляки', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4326', '294', 'Козельщина', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('5095', '294', 'Комсомольск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4327', '294', 'Котельва', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4328', '294', 'Кременчуг', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4329', '294', 'Лохвица', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4330', '294', 'Лубны', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4331', '294', 'Машевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4332', '294', 'Миргород', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4333', '294', 'Новые Санжары', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4334', '294', 'Оржица', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4335', '294', 'Пирянтин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4336', '294', 'Пирятин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4337', '294', 'Полтава', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4338', '294', 'Решетиловка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4339', '294', 'Семеновка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4340', '294', 'Хорол', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4341', '294', 'Чернухи', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4342', '294', 'Чутово', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4343', '294', 'Шишаки', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4344', '295', 'Владимирец', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4345', '295', 'Гоща', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4346', '295', 'Демидовка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4347', '295', 'Дубно', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4348', '295', 'Дубровица', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4349', '295', 'Заречное', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4350', '295', 'Здолбунов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4351', '295', 'Клевань', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4352', '295', 'Клесов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4353', '295', 'Корец', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4354', '295', 'Костополь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4355', '295', 'Кузнецовск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4356', '295', 'Млинов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4357', '295', 'Острог', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4358', '295', 'Ровно', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4359', '295', 'Сарны', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4361', '296', 'Ахтырка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4362', '296', 'Белополье', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4363', '296', 'Бурынь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4364', '296', 'Великая Писаревка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4365', '296', 'Ворожба', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4366', '296', 'Воронеж', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4367', '296', 'Глухов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4368', '296', 'Дружба', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4369', '296', 'Знобь-Новгородское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4370', '296', 'Кириковка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4371', '296', 'Конотоп', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4372', '296', 'Краснополье', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4373', '296', 'Кровелец', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4374', '296', 'Лебедин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4375', '296', 'Липовая Долина', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4376', '296', 'Недригайлов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4377', '296', 'Путивль', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4378', '296', 'Ромны', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4379', '296', 'Середина-Буда', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4380', '296', 'Сумы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4381', '296', 'Тростянец', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4382', '296', 'Шостка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4384', '296', 'Ямполь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4385', '297', 'Бережаны', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4386', '297', 'Борщев', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4387', '297', 'Бучач', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4388', '297', 'Великие Борки', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4389', '297', 'Вишневец', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4390', '297', 'Гримайлов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4391', '297', 'Гусятин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4392', '297', 'Залещики', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4393', '297', 'Заложцы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4394', '297', 'Збараж', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4395', '297', 'Зборов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4396', '297', 'Золотники', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4397', '297', 'Золотой поток', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4398', '297', 'Козлов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4399', '297', 'Козова', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4400', '297', 'Кременец', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4401', '297', 'Лановцы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4402', '297', 'Монастыриска', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4403', '297', 'Подволочиск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4404', '297', 'Теребовля', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4405', '297', 'Тернополь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4406', '297', 'Чортков', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4407', '297', 'Шумск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4408', '298', 'Балаклея', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4409', '298', 'Барвенково', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4410', '298', 'Близнюки', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4411', '298', 'Богодухов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4412', '298', 'Борки', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4413', '298', 'Боровая', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4414', '298', 'Буды', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4415', '298', 'Валки', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4416', '298', 'Великий Бурлук', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4417', '298', 'Волчанск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4419', '298', 'Гуты', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4420', '298', 'Дергачи', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4421', '298', 'Зачепиловка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4422', '298', 'Зидьки', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4418', '298', 'Змиев', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4423', '298', 'Золочев', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4424', '298', 'Изюм', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4425', '298', 'Казачья Лопань', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4426', '298', 'Кегичевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4427', '298', 'Красноград', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4428', '298', 'Краснокутск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4429', '298', 'Купянск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4430', '298', 'Лозовая', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4431', '298', 'Люботин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('5073', '298', 'Мерефа', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4432', '298', 'Новая Водолага', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4433', '298', 'Первомайский', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('5074', '298', 'Песочин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4434', '298', 'Сахновщина', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4435', '298', 'Харьков', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4436', '298', 'Чугуев', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4437', '298', 'Шевченково', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4438', '299', 'Аскания-Нова', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4439', '299', 'Белая Криница', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4440', '299', 'Белозерка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4441', '299', 'Берислав', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4442', '299', 'Великая Александровка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4443', '299', 'Великая Лепетиха', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4444', '299', 'Верхний Рогачик', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4445', '299', 'Высокополье', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4446', '299', 'Геническ', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4447', '299', 'Голая Пристань', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4448', '299', 'Горностаевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4449', '299', 'Днепряны', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4450', '299', 'Каланчак', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4451', '299', 'Калининское', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4452', '299', 'Каховка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4453', '299', 'Нижние Серогозы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4454', '299', 'Новая Каховка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4455', '299', 'Нововоронцовка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4456', '299', 'Новотроицкое', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4457', '299', 'Скадовск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4458', '299', 'Херсон', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4459', '299', 'Цюрупинск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4460', '299', 'Чаплинка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4461', '300', 'Антонины', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4462', '300', 'Базалия', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4463', '300', 'Белогорье', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4464', '300', 'Виньковцы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4465', '300', 'Волочиск', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4466', '300', 'Городок', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4467', '300', 'Грицев', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4468', '300', 'Деражня', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4469', '300', 'Дунаевцы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4470', '300', 'Изяслав', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4471', '300', 'Каменец-Подольский', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4472', '300', 'Красилов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4473', '300', 'Летичев', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4967', '300', 'Нетешин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4474', '300', 'Новая Ушица', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4475', '300', 'Полонное', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4476', '300', 'Славута', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4477', '300', 'Старая Синявка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4478', '300', 'Староконстантинов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4479', '300', 'Теофиполь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4480', '300', 'Хмельницкий', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4481', '300', 'Чемеровцы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4482', '300', 'Шепетовка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4483', '300', 'Ярмолинцы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('1765609', '301', 'Kizliv', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4484', '301', 'Ватутино', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4485', '301', 'Городище', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4486', '301', 'Драбов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4487', '301', 'Ерки', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4488', '301', 'Жашков', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4490', '301', 'Звенигородка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4491', '301', 'Золотоноша', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4492', '301', 'Ирдынь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4493', '301', 'Каменка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4494', '301', 'Катеринополь', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4495', '301', 'Корсунь-Шевченковский', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4496', '301', 'Лысянка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4498', '301', 'Монастырище', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4499', '301', 'Смела', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4500', '301', 'Тальное', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4501', '301', 'Умань', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4502', '301', 'Христиновка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4503', '301', 'Черкассы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4504', '301', 'Чернобай', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4505', '301', 'Чигирин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4506', '301', 'Шпола', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4507', '302', 'Батурин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4508', '302', 'Бахмач', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4509', '302', 'Березна', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4510', '302', 'Бобровица', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4511', '302', 'Борзна', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4512', '302', 'Варва', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4513', '302', 'Вертиевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4514', '302', 'Городня', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4515', '302', 'Замглай', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4516', '302', 'Ичня', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4517', '302', 'Козелец', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4518', '302', 'Короп', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4519', '302', 'Корюковка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4520', '302', 'Куликовка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4521', '302', 'Мена', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4522', '302', 'Нежин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4523', '302', 'Новгород-Северский', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4524', '302', 'Носовка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4525', '302', 'Прилуки', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4526', '302', 'Репки', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4527', '302', 'Семеновка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4528', '302', 'Сосница', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4529', '302', 'Талалаевка', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4530', '302', 'Чернигов', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4531', '302', 'Щорс', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4532', '303', 'Берегомет', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4533', '303', 'Вашковцы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4534', '303', 'Вижница', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4535', '303', 'Герца', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4536', '303', 'Глыбокая', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4537', '303', 'Заставна', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4538', '303', 'Кельменцы', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4539', '303', 'Кицмань', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4540', '303', 'Новоселица', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4541', '303', 'Путила', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4542', '303', 'Сокиряны', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4543', '303', 'Сторожинец', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4544', '303', 'Хотин', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_city` VALUES ('4545', '303', 'Черновцы', '0', '1374134216', '1374134216', '1', '0');

-- ----------------------------
-- Table structure for vd_city_lang
-- ----------------------------
DROP TABLE IF EXISTS `vd_city_lang`;
CREATE TABLE `vd_city_lang` (
  `db_rid` int(10) unsigned NOT NULL,
  `db_lang` varchar(20) NOT NULL,
  `db_namelang` varchar(100) NOT NULL,
  PRIMARY KEY (`db_rid`,`db_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vd_city_lang
-- ----------------------------
INSERT INTO `vd_city_lang` VALUES ('3832', 'ru', 'Бар');
INSERT INTO `vd_city_lang` VALUES ('3833', 'ru', 'Бершадь');
INSERT INTO `vd_city_lang` VALUES ('3834', 'ru', 'Браилов');
INSERT INTO `vd_city_lang` VALUES ('3835', 'ru', 'Брацлав');
INSERT INTO `vd_city_lang` VALUES ('3836', 'ru', 'Вапнярка');
INSERT INTO `vd_city_lang` VALUES ('3837', 'ru', 'Вендичаны');
INSERT INTO `vd_city_lang` VALUES ('3838', 'ru', 'Винница');
INSERT INTO `vd_city_lang` VALUES ('3839', 'ru', 'Вороновица');
INSERT INTO `vd_city_lang` VALUES ('3840', 'ru', 'Гайсин');
INSERT INTO `vd_city_lang` VALUES ('3841', 'ru', 'Гнивань');
INSERT INTO `vd_city_lang` VALUES ('3842', 'ru', 'Дашев');
INSERT INTO `vd_city_lang` VALUES ('3843', 'ru', 'Жмеринка');
INSERT INTO `vd_city_lang` VALUES ('3844', 'ru', 'Ильинцы');
INSERT INTO `vd_city_lang` VALUES ('3845', 'ru', 'Казатин');
INSERT INTO `vd_city_lang` VALUES ('3846', 'ru', 'Калиновка');
INSERT INTO `vd_city_lang` VALUES ('3847', 'ru', 'Крыжополь');
INSERT INTO `vd_city_lang` VALUES ('3848', 'ru', 'Липовец');
INSERT INTO `vd_city_lang` VALUES ('3849', 'ru', 'Литин');
INSERT INTO `vd_city_lang` VALUES ('3850', 'ru', 'Могилев-Подольский');
INSERT INTO `vd_city_lang` VALUES ('3851', 'ru', 'Мурованные Куриловцы');
INSERT INTO `vd_city_lang` VALUES ('3852', 'ru', 'Немиров');
INSERT INTO `vd_city_lang` VALUES ('3853', 'ru', 'Оратов');
INSERT INTO `vd_city_lang` VALUES ('3854', 'ru', 'Песчанка');
INSERT INTO `vd_city_lang` VALUES ('3855', 'ru', 'Погребище');
INSERT INTO `vd_city_lang` VALUES ('3856', 'ru', 'Теплик');
INSERT INTO `vd_city_lang` VALUES ('3857', 'ru', 'Томашполь');
INSERT INTO `vd_city_lang` VALUES ('3858', 'ru', 'Тростянец');
INSERT INTO `vd_city_lang` VALUES ('3859', 'ru', 'Тульчин');
INSERT INTO `vd_city_lang` VALUES ('3860', 'ru', 'Тывров');
INSERT INTO `vd_city_lang` VALUES ('3861', 'ru', 'Хмельник');
INSERT INTO `vd_city_lang` VALUES ('3862', 'ru', 'Чечельник');
INSERT INTO `vd_city_lang` VALUES ('3863', 'ru', 'Шаргород');
INSERT INTO `vd_city_lang` VALUES ('3864', 'ru', 'Ямполь');
INSERT INTO `vd_city_lang` VALUES ('3865', 'ru', 'Берестечко');
INSERT INTO `vd_city_lang` VALUES ('3866', 'ru', 'Владимир-Волынский');
INSERT INTO `vd_city_lang` VALUES ('3867', 'ru', 'Голобы');
INSERT INTO `vd_city_lang` VALUES ('3868', 'ru', 'Головно');
INSERT INTO `vd_city_lang` VALUES ('3869', 'ru', 'Горохов');
INSERT INTO `vd_city_lang` VALUES ('3871', 'ru', 'Иваничи');
INSERT INTO `vd_city_lang` VALUES ('3872', 'ru', 'Камень-Каширский');
INSERT INTO `vd_city_lang` VALUES ('3873', 'ru', 'Киверцы');
INSERT INTO `vd_city_lang` VALUES ('3874', 'ru', 'Ковель');
INSERT INTO `vd_city_lang` VALUES ('3875', 'ru', 'Локачи');
INSERT INTO `vd_city_lang` VALUES ('3876', 'ru', 'Луцк');
INSERT INTO `vd_city_lang` VALUES ('3877', 'ru', 'Любешов');
INSERT INTO `vd_city_lang` VALUES ('3878', 'ru', 'Любомль');
INSERT INTO `vd_city_lang` VALUES ('3879', 'ru', 'Маневичи');
INSERT INTO `vd_city_lang` VALUES ('3880', 'ru', 'Нововолынск');
INSERT INTO `vd_city_lang` VALUES ('3881', 'ru', 'Ратно');
INSERT INTO `vd_city_lang` VALUES ('3882', 'ru', 'Рожище');
INSERT INTO `vd_city_lang` VALUES ('3883', 'ru', 'Старая Выжевка');
INSERT INTO `vd_city_lang` VALUES ('3884', 'ru', 'Турийск');
INSERT INTO `vd_city_lang` VALUES ('3885', 'ru', 'Апостолово');
INSERT INTO `vd_city_lang` VALUES ('3886', 'ru', 'Аулы');
INSERT INTO `vd_city_lang` VALUES ('3887', 'ru', 'Брагиновка');
INSERT INTO `vd_city_lang` VALUES ('3888', 'ru', 'Васильковка');
INSERT INTO `vd_city_lang` VALUES ('3889', 'ru', 'Верхнеднепровск');
INSERT INTO `vd_city_lang` VALUES ('3890', 'ru', 'Верховцево');
INSERT INTO `vd_city_lang` VALUES ('3891', 'ru', 'Вольногорск');
INSERT INTO `vd_city_lang` VALUES ('3892', 'ru', 'Гвардейское');
INSERT INTO `vd_city_lang` VALUES ('3894', 'ru', 'Губиниха');
INSERT INTO `vd_city_lang` VALUES ('3895', 'ru', 'Демурино');
INSERT INTO `vd_city_lang` VALUES ('3896', 'ru', 'Днепродзержинск');
INSERT INTO `vd_city_lang` VALUES ('3897', 'ru', 'Днепропетровск');
INSERT INTO `vd_city_lang` VALUES ('3898', 'ru', 'Желтые Воды');
INSERT INTO `vd_city_lang` VALUES ('5116', 'ru', 'Зеленодольск');
INSERT INTO `vd_city_lang` VALUES ('3900', 'ru', 'Зеленое');
INSERT INTO `vd_city_lang` VALUES ('3901', 'ru', 'Илларионово');
INSERT INTO `vd_city_lang` VALUES ('3902', 'ru', 'Ингулец');
INSERT INTO `vd_city_lang` VALUES ('3903', 'ru', 'Калинино');
INSERT INTO `vd_city_lang` VALUES ('3904', 'ru', 'Карнауховка');
INSERT INTO `vd_city_lang` VALUES ('3905', 'ru', 'Кривой Рог');
INSERT INTO `vd_city_lang` VALUES ('3906', 'ru', 'Кринички');
INSERT INTO `vd_city_lang` VALUES ('3907', 'ru', 'Магдалиновка');
INSERT INTO `vd_city_lang` VALUES ('3908', 'ru', 'Марганец');
INSERT INTO `vd_city_lang` VALUES ('3909', 'ru', 'Межевая');
INSERT INTO `vd_city_lang` VALUES ('3910', 'ru', 'Никополь');
INSERT INTO `vd_city_lang` VALUES ('3911', 'ru', 'Новомосковск');
INSERT INTO `vd_city_lang` VALUES ('3912', 'ru', 'Орджоникидзе');
INSERT INTO `vd_city_lang` VALUES ('3913', 'ru', 'Павлоград');
INSERT INTO `vd_city_lang` VALUES ('5017', 'ru', 'Першотравенск');
INSERT INTO `vd_city_lang` VALUES ('3914', 'ru', 'Петропавловка');
INSERT INTO `vd_city_lang` VALUES ('3915', 'ru', 'Покровское');
INSERT INTO `vd_city_lang` VALUES ('3916', 'ru', 'Пятихатки');
INSERT INTO `vd_city_lang` VALUES ('3917', 'ru', 'Синельниково');
INSERT INTO `vd_city_lang` VALUES ('3918', 'ru', 'Софиевка');
INSERT INTO `vd_city_lang` VALUES ('3919', 'ru', 'Томаковка');
INSERT INTO `vd_city_lang` VALUES ('3920', 'ru', 'Царичанка');
INSERT INTO `vd_city_lang` VALUES ('3921', 'ru', 'Широкое');
INSERT INTO `vd_city_lang` VALUES ('3922', 'ru', 'Авдеевка');
INSERT INTO `vd_city_lang` VALUES ('3923', 'ru', 'Александровка');
INSERT INTO `vd_city_lang` VALUES ('3924', 'ru', 'Алексеево-Дружковка');
INSERT INTO `vd_city_lang` VALUES ('3925', 'ru', 'Амвросиевка');
INSERT INTO `vd_city_lang` VALUES ('3926', 'ru', 'Андреевка');
INSERT INTO `vd_city_lang` VALUES ('3928', 'ru', 'Артемовск');
INSERT INTO `vd_city_lang` VALUES ('4174', 'ru', 'Артемовск');
INSERT INTO `vd_city_lang` VALUES ('3929', 'ru', 'Безыменное');
INSERT INTO `vd_city_lang` VALUES ('3930', 'ru', 'Беленькое');
INSERT INTO `vd_city_lang` VALUES ('3932', 'ru', 'Благодатное');
INSERT INTO `vd_city_lang` VALUES ('3933', 'ru', 'Былбасовка');
INSERT INTO `vd_city_lang` VALUES ('3934', 'ru', 'Великая Новоселка');
INSERT INTO `vd_city_lang` VALUES ('3935', 'ru', 'Войковский');
INSERT INTO `vd_city_lang` VALUES ('3936', 'ru', 'Волноваха');
INSERT INTO `vd_city_lang` VALUES ('3937', 'ru', 'Володарское');
INSERT INTO `vd_city_lang` VALUES ('3939', 'ru', 'Горбачево-Михайловка');
INSERT INTO `vd_city_lang` VALUES ('3940', 'ru', 'Горловка');
INSERT INTO `vd_city_lang` VALUES ('3941', 'ru', 'Гродовка');
INSERT INTO `vd_city_lang` VALUES ('3942', 'ru', 'Грузско-Зорянское');
INSERT INTO `vd_city_lang` VALUES ('3943', 'ru', 'Дебальцево');
INSERT INTO `vd_city_lang` VALUES ('3944', 'ru', 'Дзержинск');
INSERT INTO `vd_city_lang` VALUES ('3945', 'ru', 'Димитров');
INSERT INTO `vd_city_lang` VALUES ('3946', 'ru', 'Доброполье');
INSERT INTO `vd_city_lang` VALUES ('3947', 'ru', 'Докучаевск');
INSERT INTO `vd_city_lang` VALUES ('3948', 'ru', 'Донецк');
INSERT INTO `vd_city_lang` VALUES ('3949', 'ru', 'Донецкая');
INSERT INTO `vd_city_lang` VALUES ('3950', 'ru', 'Донское');
INSERT INTO `vd_city_lang` VALUES ('3951', 'ru', 'Дробышево');
INSERT INTO `vd_city_lang` VALUES ('3952', 'ru', 'Дружковка');
INSERT INTO `vd_city_lang` VALUES ('3953', 'ru', 'Енакиево');
INSERT INTO `vd_city_lang` VALUES ('3955', 'ru', 'Желанное');
INSERT INTO `vd_city_lang` VALUES ('3956', 'ru', 'Зугрэс');
INSERT INTO `vd_city_lang` VALUES ('3957', 'ru', 'Зуевка');
INSERT INTO `vd_city_lang` VALUES ('3958', 'ru', 'Иловайск');
INSERT INTO `vd_city_lang` VALUES ('3960', 'ru', 'Карло-Марксово');
INSERT INTO `vd_city_lang` VALUES ('3961', 'ru', 'Кировск');
INSERT INTO `vd_city_lang` VALUES ('5087', 'ru', 'Константиновка');
INSERT INTO `vd_city_lang` VALUES ('3962', 'ru', 'Краматорск');
INSERT INTO `vd_city_lang` VALUES ('3963', 'ru', 'Красноармейск');
INSERT INTO `vd_city_lang` VALUES ('3964', 'ru', 'Красный Лиман');
INSERT INTO `vd_city_lang` VALUES ('1765574', 'ru', 'Макеевка');
INSERT INTO `vd_city_lang` VALUES ('3965', 'ru', 'Макеевка');
INSERT INTO `vd_city_lang` VALUES ('3966', 'ru', 'Мариуполь');
INSERT INTO `vd_city_lang` VALUES ('3967', 'ru', 'Марьинка');
INSERT INTO `vd_city_lang` VALUES ('3968', 'ru', 'Новоазовск');
INSERT INTO `vd_city_lang` VALUES ('3969', 'ru', 'Новоэкономическое');
INSERT INTO `vd_city_lang` VALUES ('3971', 'ru', 'Селидово');
INSERT INTO `vd_city_lang` VALUES ('3972', 'ru', 'Славянск');
INSERT INTO `vd_city_lang` VALUES ('3973', 'ru', 'Снежное');
INSERT INTO `vd_city_lang` VALUES ('3959', 'ru', 'Соледар');
INSERT INTO `vd_city_lang` VALUES ('3974', 'ru', 'Старобешево');
INSERT INTO `vd_city_lang` VALUES ('3975', 'ru', 'Тельманово');
INSERT INTO `vd_city_lang` VALUES ('3976', 'ru', 'Торез');
INSERT INTO `vd_city_lang` VALUES ('5117', 'ru', 'Угледар');
INSERT INTO `vd_city_lang` VALUES ('3977', 'ru', 'Харцызск');
INSERT INTO `vd_city_lang` VALUES ('3978', 'ru', 'Шахтерск');
INSERT INTO `vd_city_lang` VALUES ('3979', 'ru', 'Ясиноватая');
INSERT INTO `vd_city_lang` VALUES ('3980', 'ru', 'Андрушевка');
INSERT INTO `vd_city_lang` VALUES ('3981', 'ru', 'Барановка');
INSERT INTO `vd_city_lang` VALUES ('3982', 'ru', 'Белая Криница');
INSERT INTO `vd_city_lang` VALUES ('3983', 'ru', 'Бердичев');
INSERT INTO `vd_city_lang` VALUES ('3984', 'ru', 'Броницкая Гута');
INSERT INTO `vd_city_lang` VALUES ('3985', 'ru', 'Брусилов');
INSERT INTO `vd_city_lang` VALUES ('3986', 'ru', 'Быковка');
INSERT INTO `vd_city_lang` VALUES ('3987', 'ru', 'Великие Коровинцы');
INSERT INTO `vd_city_lang` VALUES ('3988', 'ru', 'Володарск-Волынский');
INSERT INTO `vd_city_lang` VALUES ('3989', 'ru', 'Городница');
INSERT INTO `vd_city_lang` VALUES ('3990', 'ru', 'Гришковцы');
INSERT INTO `vd_city_lang` VALUES ('3991', 'ru', 'Дзержинск');
INSERT INTO `vd_city_lang` VALUES ('3992', 'ru', 'Довбыш');
INSERT INTO `vd_city_lang` VALUES ('3993', 'ru', 'Емильчино');
INSERT INTO `vd_city_lang` VALUES ('3994', 'ru', 'Житомир');
INSERT INTO `vd_city_lang` VALUES ('3995', 'ru', 'Иванополь');
INSERT INTO `vd_city_lang` VALUES ('3996', 'ru', 'Каменный Брод');
INSERT INTO `vd_city_lang` VALUES ('3997', 'ru', 'Коростень');
INSERT INTO `vd_city_lang` VALUES ('3998', 'ru', 'Коростышев');
INSERT INTO `vd_city_lang` VALUES ('3999', 'ru', 'Лугины');
INSERT INTO `vd_city_lang` VALUES ('4000', 'ru', 'Любар');
INSERT INTO `vd_city_lang` VALUES ('4001', 'ru', 'Малин');
INSERT INTO `vd_city_lang` VALUES ('4002', 'ru', 'Народичи');
INSERT INTO `vd_city_lang` VALUES ('4003', 'ru', 'Новоград-Волынский');
INSERT INTO `vd_city_lang` VALUES ('4004', 'ru', 'Овруч');
INSERT INTO `vd_city_lang` VALUES ('4005', 'ru', 'Олевск');
INSERT INTO `vd_city_lang` VALUES ('4006', 'ru', 'Попельня');
INSERT INTO `vd_city_lang` VALUES ('4007', 'ru', 'Радомышль');
INSERT INTO `vd_city_lang` VALUES ('4008', 'ru', 'Ружин');
INSERT INTO `vd_city_lang` VALUES ('4009', 'ru', 'Червоноармейск');
INSERT INTO `vd_city_lang` VALUES ('4360', 'ru', 'Червоноармейск');
INSERT INTO `vd_city_lang` VALUES ('4010', 'ru', 'Черняхов');
INSERT INTO `vd_city_lang` VALUES ('4011', 'ru', 'Чуднов');
INSERT INTO `vd_city_lang` VALUES ('4012', 'ru', 'Берегово');
INSERT INTO `vd_city_lang` VALUES ('4013', 'ru', 'Буштына');
INSERT INTO `vd_city_lang` VALUES ('4014', 'ru', 'Великий Березный');
INSERT INTO `vd_city_lang` VALUES ('4015', 'ru', 'Великий Бычков');
INSERT INTO `vd_city_lang` VALUES ('4016', 'ru', 'Виноградов');
INSERT INTO `vd_city_lang` VALUES ('4017', 'ru', 'Воловец');
INSERT INTO `vd_city_lang` VALUES ('4018', 'ru', 'Иршава');
INSERT INTO `vd_city_lang` VALUES ('4019', 'ru', 'Межгорье');
INSERT INTO `vd_city_lang` VALUES ('4020', 'ru', 'Мукачево');
INSERT INTO `vd_city_lang` VALUES ('4021', 'ru', 'Перечин');
INSERT INTO `vd_city_lang` VALUES ('4022', 'ru', 'Рахов');
INSERT INTO `vd_city_lang` VALUES ('4023', 'ru', 'Свалява');
INSERT INTO `vd_city_lang` VALUES ('4024', 'ru', 'Тячев');
INSERT INTO `vd_city_lang` VALUES ('4025', 'ru', 'Ужгород');
INSERT INTO `vd_city_lang` VALUES ('4026', 'ru', 'Хуст');
INSERT INTO `vd_city_lang` VALUES ('4027', 'ru', 'Чоп');
INSERT INTO `vd_city_lang` VALUES ('4028', 'ru', 'Акимовка');
INSERT INTO `vd_city_lang` VALUES ('4029', 'ru', 'Андреевка');
INSERT INTO `vd_city_lang` VALUES ('4030', 'ru', 'Балабино');
INSERT INTO `vd_city_lang` VALUES ('4031', 'ru', 'Бердянск');
INSERT INTO `vd_city_lang` VALUES ('4032', 'ru', 'Васильевка');
INSERT INTO `vd_city_lang` VALUES ('4033', 'ru', 'Веселое');
INSERT INTO `vd_city_lang` VALUES ('4034', 'ru', 'Гуляйполе');
INSERT INTO `vd_city_lang` VALUES ('4035', 'ru', 'Запорожье');
INSERT INTO `vd_city_lang` VALUES ('4036', 'ru', 'Каменка-Днепровская');
INSERT INTO `vd_city_lang` VALUES ('4037', 'ru', 'Каменное');
INSERT INTO `vd_city_lang` VALUES ('4038', 'ru', 'Камыш-Заря');
INSERT INTO `vd_city_lang` VALUES ('4039', 'ru', 'Куйбышево');
INSERT INTO `vd_city_lang` VALUES ('4040', 'ru', 'Мелитополь');
INSERT INTO `vd_city_lang` VALUES ('4041', 'ru', 'Михайловка');
INSERT INTO `vd_city_lang` VALUES ('4042', 'ru', 'Новониколаевка');
INSERT INTO `vd_city_lang` VALUES ('4043', 'ru', 'Орехов');
INSERT INTO `vd_city_lang` VALUES ('4044', 'ru', 'Пологи');
INSERT INTO `vd_city_lang` VALUES ('4045', 'ru', 'Приазовское');
INSERT INTO `vd_city_lang` VALUES ('4046', 'ru', 'Приморск');
INSERT INTO `vd_city_lang` VALUES ('4047', 'ru', 'Токмак');
INSERT INTO `vd_city_lang` VALUES ('4048', 'ru', 'Черниговка');
INSERT INTO `vd_city_lang` VALUES ('4984', 'ru', 'Энергодар');
INSERT INTO `vd_city_lang` VALUES ('4049', 'ru', 'Богородчаны');
INSERT INTO `vd_city_lang` VALUES ('4050', 'ru', 'Болехов');
INSERT INTO `vd_city_lang` VALUES ('4051', 'ru', 'Болшовцы');
INSERT INTO `vd_city_lang` VALUES ('4052', 'ru', 'Брошнев-Осада');
INSERT INTO `vd_city_lang` VALUES ('4053', 'ru', 'Букачевцы');
INSERT INTO `vd_city_lang` VALUES ('4054', 'ru', 'Бурштын');
INSERT INTO `vd_city_lang` VALUES ('4055', 'ru', 'Бытков');
INSERT INTO `vd_city_lang` VALUES ('4056', 'ru', 'Верховина');
INSERT INTO `vd_city_lang` VALUES ('4057', 'ru', 'Войнилов');
INSERT INTO `vd_city_lang` VALUES ('4058', 'ru', 'Ворохта');
INSERT INTO `vd_city_lang` VALUES ('4059', 'ru', 'Выгода');
INSERT INTO `vd_city_lang` VALUES ('4060', 'ru', 'Галич');
INSERT INTO `vd_city_lang` VALUES ('4062', 'ru', 'Городенка');
INSERT INTO `vd_city_lang` VALUES ('4063', 'ru', 'Делятин');
INSERT INTO `vd_city_lang` VALUES ('1766192', 'ru', 'Долина');
INSERT INTO `vd_city_lang` VALUES ('4064', 'ru', 'Езуполь');
INSERT INTO `vd_city_lang` VALUES ('4065', 'ru', 'Заболотов');
INSERT INTO `vd_city_lang` VALUES ('4066', 'ru', 'Ивано-Франковск');
INSERT INTO `vd_city_lang` VALUES ('4068', 'ru', 'Калуш');
INSERT INTO `vd_city_lang` VALUES ('4069', 'ru', 'Коломыя');
INSERT INTO `vd_city_lang` VALUES ('4070', 'ru', 'Косов');
INSERT INTO `vd_city_lang` VALUES ('4071', 'ru', 'Надворна');
INSERT INTO `vd_city_lang` VALUES ('4072', 'ru', 'Надворная');
INSERT INTO `vd_city_lang` VALUES ('4073', 'ru', 'Рогатин');
INSERT INTO `vd_city_lang` VALUES ('4074', 'ru', 'Рожнятов');
INSERT INTO `vd_city_lang` VALUES ('4075', 'ru', 'Снятын');
INSERT INTO `vd_city_lang` VALUES ('4076', 'ru', 'Станиславов');
INSERT INTO `vd_city_lang` VALUES ('4077', 'ru', 'Тлумач');
INSERT INTO `vd_city_lang` VALUES ('4078', 'ru', 'Тысменица');
INSERT INTO `vd_city_lang` VALUES ('4079', 'ru', 'Яремча');
INSERT INTO `vd_city_lang` VALUES ('4080', 'ru', 'Барышевка');
INSERT INTO `vd_city_lang` VALUES ('4081', 'ru', 'Белая Церковь');
INSERT INTO `vd_city_lang` VALUES ('4082', 'ru', 'Березань');
INSERT INTO `vd_city_lang` VALUES ('4083', 'ru', 'Богуслав');
INSERT INTO `vd_city_lang` VALUES ('4084', 'ru', 'Борисполь');
INSERT INTO `vd_city_lang` VALUES ('4085', 'ru', 'Боровая');
INSERT INTO `vd_city_lang` VALUES ('4086', 'ru', 'Бородянка');
INSERT INTO `vd_city_lang` VALUES ('5081', 'ru', 'Боярка');
INSERT INTO `vd_city_lang` VALUES ('4087', 'ru', 'Бровары');
INSERT INTO `vd_city_lang` VALUES ('4088', 'ru', 'Васильков');
INSERT INTO `vd_city_lang` VALUES ('1766731', 'ru', 'Вишневое');
INSERT INTO `vd_city_lang` VALUES ('1766501', 'ru', 'Вишневое');
INSERT INTO `vd_city_lang` VALUES ('1766729', 'ru', 'Вишневое');
INSERT INTO `vd_city_lang` VALUES ('4089', 'ru', 'Володарка');
INSERT INTO `vd_city_lang` VALUES ('4090', 'ru', 'Ворзель');
INSERT INTO `vd_city_lang` VALUES ('5076', 'ru', 'Вышгород');
INSERT INTO `vd_city_lang` VALUES ('4091', 'ru', 'Гребенки');
INSERT INTO `vd_city_lang` VALUES ('4092', 'ru', 'Дымер');
INSERT INTO `vd_city_lang` VALUES ('4093', 'ru', 'Згуровка');
INSERT INTO `vd_city_lang` VALUES ('4094', 'ru', 'Иванков');
INSERT INTO `vd_city_lang` VALUES ('4095', 'ru', 'Ирпень');
INSERT INTO `vd_city_lang` VALUES ('4096', 'ru', 'Кагарлык');
INSERT INTO `vd_city_lang` VALUES ('4097', 'ru', 'Калиновка');
INSERT INTO `vd_city_lang` VALUES ('4098', 'ru', 'Киев');
INSERT INTO `vd_city_lang` VALUES ('4100', 'ru', 'Кодра');
INSERT INTO `vd_city_lang` VALUES ('4101', 'ru', 'Кожанка');
INSERT INTO `vd_city_lang` VALUES ('4102', 'ru', 'Козин');
INSERT INTO `vd_city_lang` VALUES ('4103', 'ru', 'Макаров');
INSERT INTO `vd_city_lang` VALUES ('4104', 'ru', 'Обухов');
INSERT INTO `vd_city_lang` VALUES ('4105', 'ru', 'Переяслав-Хмельницкий');
INSERT INTO `vd_city_lang` VALUES ('4106', 'ru', 'Полесское');
INSERT INTO `vd_city_lang` VALUES ('4107', 'ru', 'Ракитное');
INSERT INTO `vd_city_lang` VALUES ('4108', 'ru', 'Сквира');
INSERT INTO `vd_city_lang` VALUES ('5024', 'ru', 'Славутич');
INSERT INTO `vd_city_lang` VALUES ('4109', 'ru', 'Ставище');
INSERT INTO `vd_city_lang` VALUES ('4110', 'ru', 'Тараща');
INSERT INTO `vd_city_lang` VALUES ('4111', 'ru', 'Тетиев');
INSERT INTO `vd_city_lang` VALUES ('4112', 'ru', 'Фастов');
INSERT INTO `vd_city_lang` VALUES ('4113', 'ru', 'Чернобыль');
INSERT INTO `vd_city_lang` VALUES ('4114', 'ru', 'Яготин');
INSERT INTO `vd_city_lang` VALUES ('4116', 'ru', 'Александрия');
INSERT INTO `vd_city_lang` VALUES ('1766761', 'ru', 'Александровка');
INSERT INTO `vd_city_lang` VALUES ('4117', 'ru', 'Бобринец');
INSERT INTO `vd_city_lang` VALUES ('4118', 'ru', 'Гайворон');
INSERT INTO `vd_city_lang` VALUES ('4119', 'ru', 'Голованевск');
INSERT INTO `vd_city_lang` VALUES ('4120', 'ru', 'Добровеличковка');
INSERT INTO `vd_city_lang` VALUES ('4121', 'ru', 'Долинская');
INSERT INTO `vd_city_lang` VALUES ('4122', 'ru', 'Елизаветградка');
INSERT INTO `vd_city_lang` VALUES ('4123', 'ru', 'Завалье');
INSERT INTO `vd_city_lang` VALUES ('4124', 'ru', 'Знаменка');
INSERT INTO `vd_city_lang` VALUES ('4125', 'ru', 'Знаменка-Вторая');
INSERT INTO `vd_city_lang` VALUES ('4126', 'ru', 'Капитановка');
INSERT INTO `vd_city_lang` VALUES ('4127', 'ru', 'Кировоград');
INSERT INTO `vd_city_lang` VALUES ('4128', 'ru', 'Компанеевка');
INSERT INTO `vd_city_lang` VALUES ('4129', 'ru', 'Малая Виска');
INSERT INTO `vd_city_lang` VALUES ('4130', 'ru', 'Новгородка');
INSERT INTO `vd_city_lang` VALUES ('4131', 'ru', 'Новоархангельск');
INSERT INTO `vd_city_lang` VALUES ('4132', 'ru', 'Новомиргород');
INSERT INTO `vd_city_lang` VALUES ('4133', 'ru', 'Новоукраинка');
INSERT INTO `vd_city_lang` VALUES ('4134', 'ru', 'Ольшанка');
INSERT INTO `vd_city_lang` VALUES ('4135', 'ru', 'Онуфриевка');
INSERT INTO `vd_city_lang` VALUES ('4136', 'ru', 'Петрово');
INSERT INTO `vd_city_lang` VALUES ('4137', 'ru', 'Светловодск');
INSERT INTO `vd_city_lang` VALUES ('4138', 'ru', 'Ульяновка');
INSERT INTO `vd_city_lang` VALUES ('4139', 'ru', 'Устиновка');
INSERT INTO `vd_city_lang` VALUES ('4141', 'ru', 'Алупка');
INSERT INTO `vd_city_lang` VALUES ('4142', 'ru', 'Алушта');
INSERT INTO `vd_city_lang` VALUES ('5088', 'ru', 'Армянск');
INSERT INTO `vd_city_lang` VALUES ('4912', 'ru', 'Армянск');
INSERT INTO `vd_city_lang` VALUES ('4143', 'ru', 'Багерово');
INSERT INTO `vd_city_lang` VALUES ('4145', 'ru', 'Бахчисарай');
INSERT INTO `vd_city_lang` VALUES ('4146', 'ru', 'Белогорск');
INSERT INTO `vd_city_lang` VALUES ('4914', 'ru', 'Береговое');
INSERT INTO `vd_city_lang` VALUES ('4915', 'ru', 'Ботаническое');
INSERT INTO `vd_city_lang` VALUES ('4147', 'ru', 'Гаспра');
INSERT INTO `vd_city_lang` VALUES ('4148', 'ru', 'Гвардейское');
INSERT INTO `vd_city_lang` VALUES ('4149', 'ru', 'Гурзуф');
INSERT INTO `vd_city_lang` VALUES ('4150', 'ru', 'Джанкой');
INSERT INTO `vd_city_lang` VALUES ('4151', 'ru', 'Евпатория');
INSERT INTO `vd_city_lang` VALUES ('4152', 'ru', 'Зуя');
INSERT INTO `vd_city_lang` VALUES ('4917', 'ru', 'Кацивели');
INSERT INTO `vd_city_lang` VALUES ('4153', 'ru', 'Керчь');
INSERT INTO `vd_city_lang` VALUES ('4918', 'ru', 'Кореиз');
INSERT INTO `vd_city_lang` VALUES ('4919', 'ru', 'Красногвардейск');
INSERT INTO `vd_city_lang` VALUES ('4155', 'ru', 'Красногвардейское');
INSERT INTO `vd_city_lang` VALUES ('4920', 'ru', 'Краснокаменка');
INSERT INTO `vd_city_lang` VALUES ('4156', 'ru', 'Красноперекопск');
INSERT INTO `vd_city_lang` VALUES ('4921', 'ru', 'Курпаты');
INSERT INTO `vd_city_lang` VALUES ('4157', 'ru', 'Ленино');
INSERT INTO `vd_city_lang` VALUES ('4922', 'ru', 'Ливадия');
INSERT INTO `vd_city_lang` VALUES ('4158', 'ru', 'Массандра');
INSERT INTO `vd_city_lang` VALUES ('4923', 'ru', 'Мисхор');
INSERT INTO `vd_city_lang` VALUES ('4159', 'ru', 'Нижнегорский');
INSERT INTO `vd_city_lang` VALUES ('4924', 'ru', 'Олива');
INSERT INTO `vd_city_lang` VALUES ('4925', 'ru', 'Оползневое');
INSERT INTO `vd_city_lang` VALUES ('4926', 'ru', 'Парковое');
INSERT INTO `vd_city_lang` VALUES ('4160', 'ru', 'Первомайское');
INSERT INTO `vd_city_lang` VALUES ('4927', 'ru', 'Понизовка');
INSERT INTO `vd_city_lang` VALUES ('4162', 'ru', 'Саки');
INSERT INTO `vd_city_lang` VALUES ('4928', 'ru', 'Санаторное');
INSERT INTO `vd_city_lang` VALUES ('4163', 'ru', 'Севастополь');
INSERT INTO `vd_city_lang` VALUES ('4929', 'ru', 'Симеиз');
INSERT INTO `vd_city_lang` VALUES ('4164', 'ru', 'Симферополь');
INSERT INTO `vd_city_lang` VALUES ('4165', 'ru', 'Советский');
INSERT INTO `vd_city_lang` VALUES ('4166', 'ru', 'Судак');
INSERT INTO `vd_city_lang` VALUES ('4167', 'ru', 'Феодосия');
INSERT INTO `vd_city_lang` VALUES ('4168', 'ru', 'Форос');
INSERT INTO `vd_city_lang` VALUES ('4169', 'ru', 'Черноморское');
INSERT INTO `vd_city_lang` VALUES ('5052', 'ru', 'Щёлкино');
INSERT INTO `vd_city_lang` VALUES ('4170', 'ru', 'Ялта');
INSERT INTO `vd_city_lang` VALUES ('4171', 'ru', 'Алексадровск');
INSERT INTO `vd_city_lang` VALUES ('4172', 'ru', 'Алчевск');
INSERT INTO `vd_city_lang` VALUES ('4173', 'ru', 'Антрацит');
INSERT INTO `vd_city_lang` VALUES ('3927', 'ru', 'Артемово');
INSERT INTO `vd_city_lang` VALUES ('4175', 'ru', 'Байрачки');
INSERT INTO `vd_city_lang` VALUES ('4176', 'ru', 'Беловодск');
INSERT INTO `vd_city_lang` VALUES ('4177', 'ru', 'Белогоровка');
INSERT INTO `vd_city_lang` VALUES ('4178', 'ru', 'Белое');
INSERT INTO `vd_city_lang` VALUES ('4179', 'ru', 'Белокуракино');
INSERT INTO `vd_city_lang` VALUES ('4180', 'ru', 'Белолуцк');
INSERT INTO `vd_city_lang` VALUES ('4181', 'ru', 'Бирюково');
INSERT INTO `vd_city_lang` VALUES ('4182', 'ru', 'Боково-Платово');
INSERT INTO `vd_city_lang` VALUES ('4183', 'ru', 'Боровское');
INSERT INTO `vd_city_lang` VALUES ('4184', 'ru', 'Брянка');
INSERT INTO `vd_city_lang` VALUES ('4185', 'ru', 'Бугаевка');
INSERT INTO `vd_city_lang` VALUES ('4186', 'ru', 'Вахрушево');
INSERT INTO `vd_city_lang` VALUES ('4187', 'ru', 'Великий Лог');
INSERT INTO `vd_city_lang` VALUES ('4188', 'ru', 'Вергулевка');
INSERT INTO `vd_city_lang` VALUES ('4189', 'ru', 'Володарск');
INSERT INTO `vd_city_lang` VALUES ('4190', 'ru', 'Волчеяровка');
INSERT INTO `vd_city_lang` VALUES ('4192', 'ru', 'Врубовка');
INSERT INTO `vd_city_lang` VALUES ('4193', 'ru', 'Врубовский');
INSERT INTO `vd_city_lang` VALUES ('4194', 'ru', 'Георгиевка');
INSERT INTO `vd_city_lang` VALUES ('4195', 'ru', 'Горское');
INSERT INTO `vd_city_lang` VALUES ('4196', 'ru', 'Есауловка');
INSERT INTO `vd_city_lang` VALUES ('4197', 'ru', 'Зимогорье');
INSERT INTO `vd_city_lang` VALUES ('4198', 'ru', 'Золотое');
INSERT INTO `vd_city_lang` VALUES ('4199', 'ru', 'Зоринск');
INSERT INTO `vd_city_lang` VALUES ('4200', 'ru', 'Изварино');
INSERT INTO `vd_city_lang` VALUES ('4201', 'ru', 'Калининский');
INSERT INTO `vd_city_lang` VALUES ('4202', 'ru', 'Калиново');
INSERT INTO `vd_city_lang` VALUES ('4204', 'ru', 'Кировск');
INSERT INTO `vd_city_lang` VALUES ('1748298', 'ru', 'Краснодарський');
INSERT INTO `vd_city_lang` VALUES ('4206', 'ru', 'Краснодон');
INSERT INTO `vd_city_lang` VALUES ('4207', 'ru', 'Красный Луч');
INSERT INTO `vd_city_lang` VALUES ('4208', 'ru', 'Кременная');
INSERT INTO `vd_city_lang` VALUES ('4209', 'ru', 'Лисичанск');
INSERT INTO `vd_city_lang` VALUES ('4210', 'ru', 'Луганск');
INSERT INTO `vd_city_lang` VALUES ('4211', 'ru', 'Лутугино');
INSERT INTO `vd_city_lang` VALUES ('4212', 'ru', 'Марковка');
INSERT INTO `vd_city_lang` VALUES ('4213', 'ru', 'Меловое');
INSERT INTO `vd_city_lang` VALUES ('4214', 'ru', 'Новоайдар');
INSERT INTO `vd_city_lang` VALUES ('4215', 'ru', 'Новопсков');
INSERT INTO `vd_city_lang` VALUES ('4216', 'ru', 'Первомайск');
INSERT INTO `vd_city_lang` VALUES ('4217', 'ru', 'Перевальск');
INSERT INTO `vd_city_lang` VALUES ('4218', 'ru', 'Попасная');
INSERT INTO `vd_city_lang` VALUES ('4219', 'ru', 'Ровеньки');
INSERT INTO `vd_city_lang` VALUES ('4220', 'ru', 'Рубежное');
INSERT INTO `vd_city_lang` VALUES ('4221', 'ru', 'Сватово');
INSERT INTO `vd_city_lang` VALUES ('4222', 'ru', 'Свердловск');
INSERT INTO `vd_city_lang` VALUES ('4223', 'ru', 'Северодонецк');
INSERT INTO `vd_city_lang` VALUES ('4224', 'ru', 'Славяносербск');
INSERT INTO `vd_city_lang` VALUES ('4225', 'ru', 'Станично-Луганское');
INSERT INTO `vd_city_lang` VALUES ('4226', 'ru', 'Старобельск');
INSERT INTO `vd_city_lang` VALUES ('4227', 'ru', 'Стаханов');
INSERT INTO `vd_city_lang` VALUES ('4228', 'ru', 'Троицкое');
INSERT INTO `vd_city_lang` VALUES ('4229', 'ru', 'Белз');
INSERT INTO `vd_city_lang` VALUES ('4230', 'ru', 'Бобрка');
INSERT INTO `vd_city_lang` VALUES ('4231', 'ru', 'Борислав');
INSERT INTO `vd_city_lang` VALUES ('4232', 'ru', 'Броды');
INSERT INTO `vd_city_lang` VALUES ('4233', 'ru', 'Буск');
INSERT INTO `vd_city_lang` VALUES ('4234', 'ru', 'Великие Мосты');
INSERT INTO `vd_city_lang` VALUES ('4235', 'ru', 'Верхнее Синевидное');
INSERT INTO `vd_city_lang` VALUES ('4236', 'ru', 'Винники');
INSERT INTO `vd_city_lang` VALUES ('4061', 'ru', 'Гвоздец');
INSERT INTO `vd_city_lang` VALUES ('4237', 'ru', 'Глиняны');
INSERT INTO `vd_city_lang` VALUES ('4239', 'ru', 'Дашава');
INSERT INTO `vd_city_lang` VALUES ('4240', 'ru', 'Добротвор');
INSERT INTO `vd_city_lang` VALUES ('4241', 'ru', 'Дрогобыч');
INSERT INTO `vd_city_lang` VALUES ('4242', 'ru', 'Жидачов');
INSERT INTO `vd_city_lang` VALUES ('4244', 'ru', 'Золочев');
INSERT INTO `vd_city_lang` VALUES ('4245', 'ru', 'Ивано-Франково');
INSERT INTO `vd_city_lang` VALUES ('4246', 'ru', 'Каменка-Бугская');
INSERT INTO `vd_city_lang` VALUES ('1035074', 'ru', 'Лопушанка');
INSERT INTO `vd_city_lang` VALUES ('4247', 'ru', 'Львов');
INSERT INTO `vd_city_lang` VALUES ('4248', 'ru', 'Мостиска');
INSERT INTO `vd_city_lang` VALUES ('4249', 'ru', 'Нестеров');
INSERT INTO `vd_city_lang` VALUES ('4250', 'ru', 'Николаев');
INSERT INTO `vd_city_lang` VALUES ('1766197', 'ru', 'Новояворовск');
INSERT INTO `vd_city_lang` VALUES ('4251', 'ru', 'Перемышляны');
INSERT INTO `vd_city_lang` VALUES ('4252', 'ru', 'Пустомыты');
INSERT INTO `vd_city_lang` VALUES ('4253', 'ru', 'Рава Русская');
INSERT INTO `vd_city_lang` VALUES ('4254', 'ru', 'Радехов');
INSERT INTO `vd_city_lang` VALUES ('4255', 'ru', 'Самбор');
INSERT INTO `vd_city_lang` VALUES ('4256', 'ru', 'Сколе');
INSERT INTO `vd_city_lang` VALUES ('4257', 'ru', 'Сокаль');
INSERT INTO `vd_city_lang` VALUES ('4258', 'ru', 'Старый Самбор');
INSERT INTO `vd_city_lang` VALUES ('4259', 'ru', 'Стрый');
INSERT INTO `vd_city_lang` VALUES ('4260', 'ru', 'Трускавец');
INSERT INTO `vd_city_lang` VALUES ('4261', 'ru', 'Турка');
INSERT INTO `vd_city_lang` VALUES ('4262', 'ru', 'Червоноград');
INSERT INTO `vd_city_lang` VALUES ('4263', 'ru', 'Яворов');
INSERT INTO `vd_city_lang` VALUES ('4264', 'ru', 'Александровка');
INSERT INTO `vd_city_lang` VALUES ('4265', 'ru', 'Арбузинка');
INSERT INTO `vd_city_lang` VALUES ('4266', 'ru', 'Баштанка');
INSERT INTO `vd_city_lang` VALUES ('4267', 'ru', 'Березнеговатое');
INSERT INTO `vd_city_lang` VALUES ('4268', 'ru', 'Братское');
INSERT INTO `vd_city_lang` VALUES ('4270', 'ru', 'Веселиново');
INSERT INTO `vd_city_lang` VALUES ('4271', 'ru', 'Вознесенск');
INSERT INTO `vd_city_lang` VALUES ('4272', 'ru', 'Доманевка');
INSERT INTO `vd_city_lang` VALUES ('4273', 'ru', 'Еланец');
INSERT INTO `vd_city_lang` VALUES ('4274', 'ru', 'Казанка');
INSERT INTO `vd_city_lang` VALUES ('4275', 'ru', 'Кривое Озеро');
INSERT INTO `vd_city_lang` VALUES ('4276', 'ru', 'Николаев');
INSERT INTO `vd_city_lang` VALUES ('4277', 'ru', 'Новая Одесса');
INSERT INTO `vd_city_lang` VALUES ('4278', 'ru', 'Новый Буг');
INSERT INTO `vd_city_lang` VALUES ('4279', 'ru', 'Очаков');
INSERT INTO `vd_city_lang` VALUES ('4280', 'ru', 'Первомайск');
INSERT INTO `vd_city_lang` VALUES ('4281', 'ru', 'Снигиревка');
INSERT INTO `vd_city_lang` VALUES ('5009', 'ru', 'Южноукраинск');
INSERT INTO `vd_city_lang` VALUES ('4282', 'ru', 'Аккерман');
INSERT INTO `vd_city_lang` VALUES ('4283', 'ru', 'Ананьев');
INSERT INTO `vd_city_lang` VALUES ('4284', 'ru', 'Арциз');
INSERT INTO `vd_city_lang` VALUES ('4285', 'ru', 'Балта');
INSERT INTO `vd_city_lang` VALUES ('4286', 'ru', 'Белгород-Днестровский');
INSERT INTO `vd_city_lang` VALUES ('4287', 'ru', 'Беляевка');
INSERT INTO `vd_city_lang` VALUES ('4288', 'ru', 'Березино');
INSERT INTO `vd_city_lang` VALUES ('4289', 'ru', 'Березовка');
INSERT INTO `vd_city_lang` VALUES ('4290', 'ru', 'Болград');
INSERT INTO `vd_city_lang` VALUES ('4291', 'ru', 'Бородино');
INSERT INTO `vd_city_lang` VALUES ('4292', 'ru', 'Великая Михайловка');
INSERT INTO `vd_city_lang` VALUES ('4293', 'ru', 'Великодолининское');
INSERT INTO `vd_city_lang` VALUES ('4294', 'ru', 'Вилково');
INSERT INTO `vd_city_lang` VALUES ('4295', 'ru', 'Затишье');
INSERT INTO `vd_city_lang` VALUES ('4296', 'ru', 'Измаил');
INSERT INTO `vd_city_lang` VALUES ('4297', 'ru', 'Ильичевск');
INSERT INTO `vd_city_lang` VALUES ('4298', 'ru', 'Килия');
INSERT INTO `vd_city_lang` VALUES ('4299', 'ru', 'Кодыма');
INSERT INTO `vd_city_lang` VALUES ('4300', 'ru', 'Коминтерновское');
INSERT INTO `vd_city_lang` VALUES ('4301', 'ru', 'Котовск');
INSERT INTO `vd_city_lang` VALUES ('4302', 'ru', 'Красные Окны');
INSERT INTO `vd_city_lang` VALUES ('4303', 'ru', 'Любашевка');
INSERT INTO `vd_city_lang` VALUES ('4304', 'ru', 'Николаевка');
INSERT INTO `vd_city_lang` VALUES ('4305', 'ru', 'Овидиополь');
INSERT INTO `vd_city_lang` VALUES ('4306', 'ru', 'Одесса');
INSERT INTO `vd_city_lang` VALUES ('4307', 'ru', 'Раздельная');
INSERT INTO `vd_city_lang` VALUES ('4308', 'ru', 'Рени');
INSERT INTO `vd_city_lang` VALUES ('4309', 'ru', 'Саврань');
INSERT INTO `vd_city_lang` VALUES ('4310', 'ru', 'Сарата');
INSERT INTO `vd_city_lang` VALUES ('4311', 'ru', 'Тарутино');
INSERT INTO `vd_city_lang` VALUES ('4312', 'ru', 'Татарбунары');
INSERT INTO `vd_city_lang` VALUES ('4313', 'ru', 'Фрунзовка');
INSERT INTO `vd_city_lang` VALUES ('4314', 'ru', 'Ширяево');
INSERT INTO `vd_city_lang` VALUES ('5107', 'ru', 'Южный');
INSERT INTO `vd_city_lang` VALUES ('4315', 'ru', 'Белики');
INSERT INTO `vd_city_lang` VALUES ('4316', 'ru', 'Великая Багачка');
INSERT INTO `vd_city_lang` VALUES ('4317', 'ru', 'Гадяч');
INSERT INTO `vd_city_lang` VALUES ('4318', 'ru', 'Глобино');
INSERT INTO `vd_city_lang` VALUES ('4319', 'ru', 'Гоголево');
INSERT INTO `vd_city_lang` VALUES ('4320', 'ru', 'Градижск');
INSERT INTO `vd_city_lang` VALUES ('4321', 'ru', 'Гребенка');
INSERT INTO `vd_city_lang` VALUES ('4322', 'ru', 'Диканька');
INSERT INTO `vd_city_lang` VALUES ('4324', 'ru', 'Карловка');
INSERT INTO `vd_city_lang` VALUES ('4325', 'ru', 'Кобеляки');
INSERT INTO `vd_city_lang` VALUES ('4326', 'ru', 'Козельщина');
INSERT INTO `vd_city_lang` VALUES ('5095', 'ru', 'Комсомольск');
INSERT INTO `vd_city_lang` VALUES ('4327', 'ru', 'Котельва');
INSERT INTO `vd_city_lang` VALUES ('4328', 'ru', 'Кременчуг');
INSERT INTO `vd_city_lang` VALUES ('4329', 'ru', 'Лохвица');
INSERT INTO `vd_city_lang` VALUES ('4330', 'ru', 'Лубны');
INSERT INTO `vd_city_lang` VALUES ('4331', 'ru', 'Машевка');
INSERT INTO `vd_city_lang` VALUES ('4332', 'ru', 'Миргород');
INSERT INTO `vd_city_lang` VALUES ('4333', 'ru', 'Новые Санжары');
INSERT INTO `vd_city_lang` VALUES ('4334', 'ru', 'Оржица');
INSERT INTO `vd_city_lang` VALUES ('4335', 'ru', 'Пирянтин');
INSERT INTO `vd_city_lang` VALUES ('4336', 'ru', 'Пирятин');
INSERT INTO `vd_city_lang` VALUES ('4337', 'ru', 'Полтава');
INSERT INTO `vd_city_lang` VALUES ('4338', 'ru', 'Решетиловка');
INSERT INTO `vd_city_lang` VALUES ('4339', 'ru', 'Семеновка');
INSERT INTO `vd_city_lang` VALUES ('4340', 'ru', 'Хорол');
INSERT INTO `vd_city_lang` VALUES ('4341', 'ru', 'Чернухи');
INSERT INTO `vd_city_lang` VALUES ('4342', 'ru', 'Чутово');
INSERT INTO `vd_city_lang` VALUES ('4343', 'ru', 'Шишаки');
INSERT INTO `vd_city_lang` VALUES ('4344', 'ru', 'Владимирец');
INSERT INTO `vd_city_lang` VALUES ('4345', 'ru', 'Гоща');
INSERT INTO `vd_city_lang` VALUES ('4346', 'ru', 'Демидовка');
INSERT INTO `vd_city_lang` VALUES ('4347', 'ru', 'Дубно');
INSERT INTO `vd_city_lang` VALUES ('4348', 'ru', 'Дубровица');
INSERT INTO `vd_city_lang` VALUES ('4349', 'ru', 'Заречное');
INSERT INTO `vd_city_lang` VALUES ('4350', 'ru', 'Здолбунов');
INSERT INTO `vd_city_lang` VALUES ('4351', 'ru', 'Клевань');
INSERT INTO `vd_city_lang` VALUES ('4352', 'ru', 'Клесов');
INSERT INTO `vd_city_lang` VALUES ('4353', 'ru', 'Корец');
INSERT INTO `vd_city_lang` VALUES ('4354', 'ru', 'Костополь');
INSERT INTO `vd_city_lang` VALUES ('4355', 'ru', 'Кузнецовск');
INSERT INTO `vd_city_lang` VALUES ('4356', 'ru', 'Млинов');
INSERT INTO `vd_city_lang` VALUES ('4357', 'ru', 'Острог');
INSERT INTO `vd_city_lang` VALUES ('4358', 'ru', 'Ровно');
INSERT INTO `vd_city_lang` VALUES ('4359', 'ru', 'Сарны');
INSERT INTO `vd_city_lang` VALUES ('4361', 'ru', 'Ахтырка');
INSERT INTO `vd_city_lang` VALUES ('4362', 'ru', 'Белополье');
INSERT INTO `vd_city_lang` VALUES ('4363', 'ru', 'Бурынь');
INSERT INTO `vd_city_lang` VALUES ('4364', 'ru', 'Великая Писаревка');
INSERT INTO `vd_city_lang` VALUES ('4365', 'ru', 'Ворожба');
INSERT INTO `vd_city_lang` VALUES ('4366', 'ru', 'Воронеж');
INSERT INTO `vd_city_lang` VALUES ('4367', 'ru', 'Глухов');
INSERT INTO `vd_city_lang` VALUES ('4368', 'ru', 'Дружба');
INSERT INTO `vd_city_lang` VALUES ('4369', 'ru', 'Знобь-Новгородское');
INSERT INTO `vd_city_lang` VALUES ('4370', 'ru', 'Кириковка');
INSERT INTO `vd_city_lang` VALUES ('4371', 'ru', 'Конотоп');
INSERT INTO `vd_city_lang` VALUES ('4372', 'ru', 'Краснополье');
INSERT INTO `vd_city_lang` VALUES ('4373', 'ru', 'Кровелец');
INSERT INTO `vd_city_lang` VALUES ('4374', 'ru', 'Лебедин');
INSERT INTO `vd_city_lang` VALUES ('4375', 'ru', 'Липовая Долина');
INSERT INTO `vd_city_lang` VALUES ('4376', 'ru', 'Недригайлов');
INSERT INTO `vd_city_lang` VALUES ('4377', 'ru', 'Путивль');
INSERT INTO `vd_city_lang` VALUES ('4378', 'ru', 'Ромны');
INSERT INTO `vd_city_lang` VALUES ('4379', 'ru', 'Середина-Буда');
INSERT INTO `vd_city_lang` VALUES ('4380', 'ru', 'Сумы');
INSERT INTO `vd_city_lang` VALUES ('4381', 'ru', 'Тростянец');
INSERT INTO `vd_city_lang` VALUES ('4382', 'ru', 'Шостка');
INSERT INTO `vd_city_lang` VALUES ('4384', 'ru', 'Ямполь');
INSERT INTO `vd_city_lang` VALUES ('4385', 'ru', 'Бережаны');
INSERT INTO `vd_city_lang` VALUES ('4386', 'ru', 'Борщев');
INSERT INTO `vd_city_lang` VALUES ('4387', 'ru', 'Бучач');
INSERT INTO `vd_city_lang` VALUES ('4388', 'ru', 'Великие Борки');
INSERT INTO `vd_city_lang` VALUES ('4389', 'ru', 'Вишневец');
INSERT INTO `vd_city_lang` VALUES ('4390', 'ru', 'Гримайлов');
INSERT INTO `vd_city_lang` VALUES ('4391', 'ru', 'Гусятин');
INSERT INTO `vd_city_lang` VALUES ('4392', 'ru', 'Залещики');
INSERT INTO `vd_city_lang` VALUES ('4393', 'ru', 'Заложцы');
INSERT INTO `vd_city_lang` VALUES ('4394', 'ru', 'Збараж');
INSERT INTO `vd_city_lang` VALUES ('4395', 'ru', 'Зборов');
INSERT INTO `vd_city_lang` VALUES ('4396', 'ru', 'Золотники');
INSERT INTO `vd_city_lang` VALUES ('4397', 'ru', 'Золотой поток');
INSERT INTO `vd_city_lang` VALUES ('4398', 'ru', 'Козлов');
INSERT INTO `vd_city_lang` VALUES ('4399', 'ru', 'Козова');
INSERT INTO `vd_city_lang` VALUES ('4400', 'ru', 'Кременец');
INSERT INTO `vd_city_lang` VALUES ('4401', 'ru', 'Лановцы');
INSERT INTO `vd_city_lang` VALUES ('4402', 'ru', 'Монастыриска');
INSERT INTO `vd_city_lang` VALUES ('4403', 'ru', 'Подволочиск');
INSERT INTO `vd_city_lang` VALUES ('4404', 'ru', 'Теребовля');
INSERT INTO `vd_city_lang` VALUES ('4405', 'ru', 'Тернополь');
INSERT INTO `vd_city_lang` VALUES ('4406', 'ru', 'Чортков');
INSERT INTO `vd_city_lang` VALUES ('4407', 'ru', 'Шумск');
INSERT INTO `vd_city_lang` VALUES ('4408', 'ru', 'Балаклея');
INSERT INTO `vd_city_lang` VALUES ('4409', 'ru', 'Барвенково');
INSERT INTO `vd_city_lang` VALUES ('4410', 'ru', 'Близнюки');
INSERT INTO `vd_city_lang` VALUES ('4411', 'ru', 'Богодухов');
INSERT INTO `vd_city_lang` VALUES ('4412', 'ru', 'Борки');
INSERT INTO `vd_city_lang` VALUES ('4413', 'ru', 'Боровая');
INSERT INTO `vd_city_lang` VALUES ('4414', 'ru', 'Буды');
INSERT INTO `vd_city_lang` VALUES ('4415', 'ru', 'Валки');
INSERT INTO `vd_city_lang` VALUES ('4416', 'ru', 'Великий Бурлук');
INSERT INTO `vd_city_lang` VALUES ('4417', 'ru', 'Волчанск');
INSERT INTO `vd_city_lang` VALUES ('4419', 'ru', 'Гуты');
INSERT INTO `vd_city_lang` VALUES ('4420', 'ru', 'Дергачи');
INSERT INTO `vd_city_lang` VALUES ('4421', 'ru', 'Зачепиловка');
INSERT INTO `vd_city_lang` VALUES ('4422', 'ru', 'Зидьки');
INSERT INTO `vd_city_lang` VALUES ('4418', 'ru', 'Змиев');
INSERT INTO `vd_city_lang` VALUES ('4423', 'ru', 'Золочев');
INSERT INTO `vd_city_lang` VALUES ('4424', 'ru', 'Изюм');
INSERT INTO `vd_city_lang` VALUES ('4425', 'ru', 'Казачья Лопань');
INSERT INTO `vd_city_lang` VALUES ('4426', 'ru', 'Кегичевка');
INSERT INTO `vd_city_lang` VALUES ('4427', 'ru', 'Красноград');
INSERT INTO `vd_city_lang` VALUES ('4428', 'ru', 'Краснокутск');
INSERT INTO `vd_city_lang` VALUES ('4429', 'ru', 'Купянск');
INSERT INTO `vd_city_lang` VALUES ('4430', 'ru', 'Лозовая');
INSERT INTO `vd_city_lang` VALUES ('4431', 'ru', 'Люботин');
INSERT INTO `vd_city_lang` VALUES ('5073', 'ru', 'Мерефа');
INSERT INTO `vd_city_lang` VALUES ('4432', 'ru', 'Новая Водолага');
INSERT INTO `vd_city_lang` VALUES ('4433', 'ru', 'Первомайский');
INSERT INTO `vd_city_lang` VALUES ('5074', 'ru', 'Песочин');
INSERT INTO `vd_city_lang` VALUES ('4434', 'ru', 'Сахновщина');
INSERT INTO `vd_city_lang` VALUES ('4435', 'ru', 'Харьков');
INSERT INTO `vd_city_lang` VALUES ('4436', 'ru', 'Чугуев');
INSERT INTO `vd_city_lang` VALUES ('4437', 'ru', 'Шевченково');
INSERT INTO `vd_city_lang` VALUES ('4438', 'ru', 'Аскания-Нова');
INSERT INTO `vd_city_lang` VALUES ('4439', 'ru', 'Белая Криница');
INSERT INTO `vd_city_lang` VALUES ('4440', 'ru', 'Белозерка');
INSERT INTO `vd_city_lang` VALUES ('4441', 'ru', 'Берислав');
INSERT INTO `vd_city_lang` VALUES ('4442', 'ru', 'Великая Александровка');
INSERT INTO `vd_city_lang` VALUES ('4443', 'ru', 'Великая Лепетиха');
INSERT INTO `vd_city_lang` VALUES ('4444', 'ru', 'Верхний Рогачик');
INSERT INTO `vd_city_lang` VALUES ('4445', 'ru', 'Высокополье');
INSERT INTO `vd_city_lang` VALUES ('4446', 'ru', 'Геническ');
INSERT INTO `vd_city_lang` VALUES ('4447', 'ru', 'Голая Пристань');
INSERT INTO `vd_city_lang` VALUES ('4448', 'ru', 'Горностаевка');
INSERT INTO `vd_city_lang` VALUES ('4449', 'ru', 'Днепряны');
INSERT INTO `vd_city_lang` VALUES ('4450', 'ru', 'Каланчак');
INSERT INTO `vd_city_lang` VALUES ('4451', 'ru', 'Калининское');
INSERT INTO `vd_city_lang` VALUES ('4452', 'ru', 'Каховка');
INSERT INTO `vd_city_lang` VALUES ('4453', 'ru', 'Нижние Серогозы');
INSERT INTO `vd_city_lang` VALUES ('4454', 'ru', 'Новая Каховка');
INSERT INTO `vd_city_lang` VALUES ('4455', 'ru', 'Нововоронцовка');
INSERT INTO `vd_city_lang` VALUES ('4456', 'ru', 'Новотроицкое');
INSERT INTO `vd_city_lang` VALUES ('4457', 'ru', 'Скадовск');
INSERT INTO `vd_city_lang` VALUES ('4458', 'ru', 'Херсон');
INSERT INTO `vd_city_lang` VALUES ('4459', 'ru', 'Цюрупинск');
INSERT INTO `vd_city_lang` VALUES ('4460', 'ru', 'Чаплинка');
INSERT INTO `vd_city_lang` VALUES ('4461', 'ru', 'Антонины');
INSERT INTO `vd_city_lang` VALUES ('4462', 'ru', 'Базалия');
INSERT INTO `vd_city_lang` VALUES ('4463', 'ru', 'Белогорье');
INSERT INTO `vd_city_lang` VALUES ('4464', 'ru', 'Виньковцы');
INSERT INTO `vd_city_lang` VALUES ('4465', 'ru', 'Волочиск');
INSERT INTO `vd_city_lang` VALUES ('4466', 'ru', 'Городок');
INSERT INTO `vd_city_lang` VALUES ('4467', 'ru', 'Грицев');
INSERT INTO `vd_city_lang` VALUES ('4468', 'ru', 'Деражня');
INSERT INTO `vd_city_lang` VALUES ('4469', 'ru', 'Дунаевцы');
INSERT INTO `vd_city_lang` VALUES ('4470', 'ru', 'Изяслав');
INSERT INTO `vd_city_lang` VALUES ('4471', 'ru', 'Каменец-Подольский');
INSERT INTO `vd_city_lang` VALUES ('4472', 'ru', 'Красилов');
INSERT INTO `vd_city_lang` VALUES ('4473', 'ru', 'Летичев');
INSERT INTO `vd_city_lang` VALUES ('4967', 'ru', 'Нетешин');
INSERT INTO `vd_city_lang` VALUES ('4474', 'ru', 'Новая Ушица');
INSERT INTO `vd_city_lang` VALUES ('4475', 'ru', 'Полонное');
INSERT INTO `vd_city_lang` VALUES ('4476', 'ru', 'Славута');
INSERT INTO `vd_city_lang` VALUES ('4477', 'ru', 'Старая Синявка');
INSERT INTO `vd_city_lang` VALUES ('4478', 'ru', 'Староконстантинов');
INSERT INTO `vd_city_lang` VALUES ('4479', 'ru', 'Теофиполь');
INSERT INTO `vd_city_lang` VALUES ('4480', 'ru', 'Хмельницкий');
INSERT INTO `vd_city_lang` VALUES ('4481', 'ru', 'Чемеровцы');
INSERT INTO `vd_city_lang` VALUES ('4482', 'ru', 'Шепетовка');
INSERT INTO `vd_city_lang` VALUES ('4483', 'ru', 'Ярмолинцы');
INSERT INTO `vd_city_lang` VALUES ('1765609', 'ru', 'Kizliv');
INSERT INTO `vd_city_lang` VALUES ('4484', 'ru', 'Ватутино');
INSERT INTO `vd_city_lang` VALUES ('4485', 'ru', 'Городище');
INSERT INTO `vd_city_lang` VALUES ('4486', 'ru', 'Драбов');
INSERT INTO `vd_city_lang` VALUES ('4487', 'ru', 'Ерки');
INSERT INTO `vd_city_lang` VALUES ('4488', 'ru', 'Жашков');
INSERT INTO `vd_city_lang` VALUES ('4490', 'ru', 'Звенигородка');
INSERT INTO `vd_city_lang` VALUES ('4491', 'ru', 'Золотоноша');
INSERT INTO `vd_city_lang` VALUES ('4492', 'ru', 'Ирдынь');
INSERT INTO `vd_city_lang` VALUES ('4493', 'ru', 'Каменка');
INSERT INTO `vd_city_lang` VALUES ('4494', 'ru', 'Катеринополь');
INSERT INTO `vd_city_lang` VALUES ('4495', 'ru', 'Корсунь-Шевченковский');
INSERT INTO `vd_city_lang` VALUES ('4496', 'ru', 'Лысянка');
INSERT INTO `vd_city_lang` VALUES ('4498', 'ru', 'Монастырище');
INSERT INTO `vd_city_lang` VALUES ('4499', 'ru', 'Смела');
INSERT INTO `vd_city_lang` VALUES ('4500', 'ru', 'Тальное');
INSERT INTO `vd_city_lang` VALUES ('4501', 'ru', 'Умань');
INSERT INTO `vd_city_lang` VALUES ('4502', 'ru', 'Христиновка');
INSERT INTO `vd_city_lang` VALUES ('4503', 'ru', 'Черкассы');
INSERT INTO `vd_city_lang` VALUES ('4504', 'ru', 'Чернобай');
INSERT INTO `vd_city_lang` VALUES ('4505', 'ru', 'Чигирин');
INSERT INTO `vd_city_lang` VALUES ('4506', 'ru', 'Шпола');
INSERT INTO `vd_city_lang` VALUES ('4507', 'ru', 'Батурин');
INSERT INTO `vd_city_lang` VALUES ('4508', 'ru', 'Бахмач');
INSERT INTO `vd_city_lang` VALUES ('4509', 'ru', 'Березна');
INSERT INTO `vd_city_lang` VALUES ('4510', 'ru', 'Бобровица');
INSERT INTO `vd_city_lang` VALUES ('4511', 'ru', 'Борзна');
INSERT INTO `vd_city_lang` VALUES ('4512', 'ru', 'Варва');
INSERT INTO `vd_city_lang` VALUES ('4513', 'ru', 'Вертиевка');
INSERT INTO `vd_city_lang` VALUES ('4514', 'ru', 'Городня');
INSERT INTO `vd_city_lang` VALUES ('4515', 'ru', 'Замглай');
INSERT INTO `vd_city_lang` VALUES ('4516', 'ru', 'Ичня');
INSERT INTO `vd_city_lang` VALUES ('4517', 'ru', 'Козелец');
INSERT INTO `vd_city_lang` VALUES ('4518', 'ru', 'Короп');
INSERT INTO `vd_city_lang` VALUES ('4519', 'ru', 'Корюковка');
INSERT INTO `vd_city_lang` VALUES ('4520', 'ru', 'Куликовка');
INSERT INTO `vd_city_lang` VALUES ('4521', 'ru', 'Мена');
INSERT INTO `vd_city_lang` VALUES ('4522', 'ru', 'Нежин');
INSERT INTO `vd_city_lang` VALUES ('4523', 'ru', 'Новгород-Северский');
INSERT INTO `vd_city_lang` VALUES ('4524', 'ru', 'Носовка');
INSERT INTO `vd_city_lang` VALUES ('4525', 'ru', 'Прилуки');
INSERT INTO `vd_city_lang` VALUES ('4526', 'ru', 'Репки');
INSERT INTO `vd_city_lang` VALUES ('4527', 'ru', 'Семеновка');
INSERT INTO `vd_city_lang` VALUES ('4528', 'ru', 'Сосница');
INSERT INTO `vd_city_lang` VALUES ('4529', 'ru', 'Талалаевка');
INSERT INTO `vd_city_lang` VALUES ('4530', 'ru', 'Чернигов');
INSERT INTO `vd_city_lang` VALUES ('4531', 'ru', 'Щорс');
INSERT INTO `vd_city_lang` VALUES ('4532', 'ru', 'Берегомет');
INSERT INTO `vd_city_lang` VALUES ('4533', 'ru', 'Вашковцы');
INSERT INTO `vd_city_lang` VALUES ('4534', 'ru', 'Вижница');
INSERT INTO `vd_city_lang` VALUES ('4535', 'ru', 'Герца');
INSERT INTO `vd_city_lang` VALUES ('4536', 'ru', 'Глыбокая');
INSERT INTO `vd_city_lang` VALUES ('4537', 'ru', 'Заставна');
INSERT INTO `vd_city_lang` VALUES ('4538', 'ru', 'Кельменцы');
INSERT INTO `vd_city_lang` VALUES ('4539', 'ru', 'Кицмань');
INSERT INTO `vd_city_lang` VALUES ('4540', 'ru', 'Новоселица');
INSERT INTO `vd_city_lang` VALUES ('4541', 'ru', 'Путила');
INSERT INTO `vd_city_lang` VALUES ('4542', 'ru', 'Сокиряны');
INSERT INTO `vd_city_lang` VALUES ('4543', 'ru', 'Сторожинец');
INSERT INTO `vd_city_lang` VALUES ('4544', 'ru', 'Хотин');
INSERT INTO `vd_city_lang` VALUES ('4545', 'ru', 'Черновцы');
INSERT INTO `vd_city_lang` VALUES ('3844', 'ua', 'Іллінці');
INSERT INTO `vd_city_lang` VALUES ('3832', 'ua', 'Бар');
INSERT INTO `vd_city_lang` VALUES ('3833', 'ua', 'Бершадь');
INSERT INTO `vd_city_lang` VALUES ('3834', 'ua', 'Браїлів');
INSERT INTO `vd_city_lang` VALUES ('3835', 'ua', 'Брацлав');
INSERT INTO `vd_city_lang` VALUES ('3838', 'ua', 'Вінниця');
INSERT INTO `vd_city_lang` VALUES ('3836', 'ua', 'Вапнярка');
INSERT INTO `vd_city_lang` VALUES ('3837', 'ua', 'Вендичани');
INSERT INTO `vd_city_lang` VALUES ('3839', 'ua', 'Вороновиця');
INSERT INTO `vd_city_lang` VALUES ('3840', 'ua', 'Гайсин');
INSERT INTO `vd_city_lang` VALUES ('3841', 'ua', 'Гнівань');
INSERT INTO `vd_city_lang` VALUES ('3842', 'ua', 'Дашів');
INSERT INTO `vd_city_lang` VALUES ('3843', 'ua', 'Жмеринка');
INSERT INTO `vd_city_lang` VALUES ('3846', 'ua', 'Калинівка');
INSERT INTO `vd_city_lang` VALUES ('3845', 'ua', 'Козятин');
INSERT INTO `vd_city_lang` VALUES ('3847', 'ua', 'Крижопіль');
INSERT INTO `vd_city_lang` VALUES ('3849', 'ua', 'Літин');
INSERT INTO `vd_city_lang` VALUES ('3848', 'ua', 'Липовець');
INSERT INTO `vd_city_lang` VALUES ('3850', 'ua', 'Могилів-Подільський');
INSERT INTO `vd_city_lang` VALUES ('3851', 'ua', 'Муровані Курилівці');
INSERT INTO `vd_city_lang` VALUES ('3852', 'ua', 'Немирів');
INSERT INTO `vd_city_lang` VALUES ('3853', 'ua', 'Оратів');
INSERT INTO `vd_city_lang` VALUES ('3854', 'ua', 'Піщанка');
INSERT INTO `vd_city_lang` VALUES ('3855', 'ua', 'Погребище');
INSERT INTO `vd_city_lang` VALUES ('3856', 'ua', 'Теплик');
INSERT INTO `vd_city_lang` VALUES ('3860', 'ua', 'Тиврів');
INSERT INTO `vd_city_lang` VALUES ('3857', 'ua', 'Томашпіль');
INSERT INTO `vd_city_lang` VALUES ('3858', 'ua', 'Тростянець');
INSERT INTO `vd_city_lang` VALUES ('3859', 'ua', 'Тульчин');
INSERT INTO `vd_city_lang` VALUES ('3861', 'ua', 'Хмільник');
INSERT INTO `vd_city_lang` VALUES ('3862', 'ua', 'Чечельник');
INSERT INTO `vd_city_lang` VALUES ('3863', 'ua', 'Шаргород');
INSERT INTO `vd_city_lang` VALUES ('3864', 'ua', 'Ямпіль');
INSERT INTO `vd_city_lang` VALUES ('3871', 'ua', 'Іваничі');
INSERT INTO `vd_city_lang` VALUES ('3865', 'ua', 'Берестечко');
INSERT INTO `vd_city_lang` VALUES ('3866', 'ua', 'Володимир-Волинський');
INSERT INTO `vd_city_lang` VALUES ('3867', 'ua', 'Голоби');
INSERT INTO `vd_city_lang` VALUES ('3868', 'ua', 'Головне');
INSERT INTO `vd_city_lang` VALUES ('3869', 'ua', 'Горохів');
INSERT INTO `vd_city_lang` VALUES ('3873', 'ua', 'Ківерці');
INSERT INTO `vd_city_lang` VALUES ('3872', 'ua', 'Камінь-Каширський');
INSERT INTO `vd_city_lang` VALUES ('3874', 'ua', 'Ковель');
INSERT INTO `vd_city_lang` VALUES ('3875', 'ua', 'Локачі');
INSERT INTO `vd_city_lang` VALUES ('3876', 'ua', 'Луцьк');
INSERT INTO `vd_city_lang` VALUES ('3877', 'ua', 'Любешів');
INSERT INTO `vd_city_lang` VALUES ('3878', 'ua', 'Любомль');
INSERT INTO `vd_city_lang` VALUES ('3879', 'ua', 'Маневичі');
INSERT INTO `vd_city_lang` VALUES ('3880', 'ua', 'Нововолинськ');
INSERT INTO `vd_city_lang` VALUES ('3881', 'ua', 'Ратне');
INSERT INTO `vd_city_lang` VALUES ('3882', 'ua', 'Рожище');
INSERT INTO `vd_city_lang` VALUES ('3883', 'ua', 'Стара Вижівка');
INSERT INTO `vd_city_lang` VALUES ('3884', 'ua', 'Турійськ');
INSERT INTO `vd_city_lang` VALUES ('3901', 'ua', 'Іларіонове');
INSERT INTO `vd_city_lang` VALUES ('3902', 'ua', 'Інгулець');
INSERT INTO `vd_city_lang` VALUES ('3885', 'ua', 'Апостолове');
INSERT INTO `vd_city_lang` VALUES ('3886', 'ua', 'Аули');
INSERT INTO `vd_city_lang` VALUES ('3887', 'ua', 'Брагинівка');
INSERT INTO `vd_city_lang` VALUES ('3891', 'ua', 'Вільногірськ');
INSERT INTO `vd_city_lang` VALUES ('3888', 'ua', 'Васильківка');
INSERT INTO `vd_city_lang` VALUES ('3890', 'ua', 'Верхівцеве');
INSERT INTO `vd_city_lang` VALUES ('3889', 'ua', 'Верхньодніпровськ');
INSERT INTO `vd_city_lang` VALUES ('3892', 'ua', 'Гвардійське');
INSERT INTO `vd_city_lang` VALUES ('3894', 'ua', 'Губиниха');
INSERT INTO `vd_city_lang` VALUES ('3895', 'ua', 'Демурине');
INSERT INTO `vd_city_lang` VALUES ('3896', 'ua', 'Дніпродзержинськ');
INSERT INTO `vd_city_lang` VALUES ('3897', 'ua', 'Дніпропетровськ');
INSERT INTO `vd_city_lang` VALUES ('3898', 'ua', 'Жовті Води');
INSERT INTO `vd_city_lang` VALUES ('3900', 'ua', 'Зелене');
INSERT INTO `vd_city_lang` VALUES ('5116', 'ua', 'Зеленодольськ');
INSERT INTO `vd_city_lang` VALUES ('3903', 'ua', 'Калиніне');
INSERT INTO `vd_city_lang` VALUES ('3904', 'ua', 'Карнаухівка');
INSERT INTO `vd_city_lang` VALUES ('3905', 'ua', 'Кривий Ріг');
INSERT INTO `vd_city_lang` VALUES ('3906', 'ua', 'Кринички');
INSERT INTO `vd_city_lang` VALUES ('3907', 'ua', 'Магдалинівка');
INSERT INTO `vd_city_lang` VALUES ('3908', 'ua', 'Марганець');
INSERT INTO `vd_city_lang` VALUES ('3909', 'ua', 'Межова');
INSERT INTO `vd_city_lang` VALUES ('3910', 'ua', 'Нікополь');
INSERT INTO `vd_city_lang` VALUES ('3911', 'ua', 'Новомосковськ');
INSERT INTO `vd_city_lang` VALUES ('3912', 'ua', 'Орджонікідзе');
INSERT INTO `vd_city_lang` VALUES ('3913', 'ua', 'Павлоград');
INSERT INTO `vd_city_lang` VALUES ('5017', 'ua', 'Першотравенськ');
INSERT INTO `vd_city_lang` VALUES ('3914', 'ua', 'Петропавлівка');
INSERT INTO `vd_city_lang` VALUES ('3915', 'ua', 'Покровське');
INSERT INTO `vd_city_lang` VALUES ('3917', 'ua', 'Синельникове');
INSERT INTO `vd_city_lang` VALUES ('3918', 'ua', 'Софіївка');
INSERT INTO `vd_city_lang` VALUES ('3919', 'ua', 'Томаківка');
INSERT INTO `vd_city_lang` VALUES ('3920', 'ua', 'Царичанка');
INSERT INTO `vd_city_lang` VALUES ('3921', 'ua', 'Широке');
INSERT INTO `vd_city_lang` VALUES ('3953', 'ua', 'Єнакієве');
INSERT INTO `vd_city_lang` VALUES ('3958', 'ua', 'Іловайськ');
INSERT INTO `vd_city_lang` VALUES ('3922', 'ua', 'Авдіївка');
INSERT INTO `vd_city_lang` VALUES ('3925', 'ua', 'Амвросіївка');
INSERT INTO `vd_city_lang` VALUES ('3926', 'ua', 'Андріївка');
INSERT INTO `vd_city_lang` VALUES ('3928', 'ua', 'Артемівськ');
INSERT INTO `vd_city_lang` VALUES ('4174', 'ua', 'Артемівськ');
INSERT INTO `vd_city_lang` VALUES ('3930', 'ua', 'Біленьке');
INSERT INTO `vd_city_lang` VALUES ('3929', 'ua', 'Безіменне');
INSERT INTO `vd_city_lang` VALUES ('3933', 'ua', 'Билбасівка');
INSERT INTO `vd_city_lang` VALUES ('3932', 'ua', 'Благодатне');
INSERT INTO `vd_city_lang` VALUES ('3934', 'ua', 'Велика Новосілка');
INSERT INTO `vd_city_lang` VALUES ('3935', 'ua', 'Войковський');
INSERT INTO `vd_city_lang` VALUES ('3936', 'ua', 'Волноваха');
INSERT INTO `vd_city_lang` VALUES ('3937', 'ua', 'Володарське');
INSERT INTO `vd_city_lang` VALUES ('5117', 'ua', 'Вугледар');
INSERT INTO `vd_city_lang` VALUES ('3939', 'ua', 'Горбачево-Михайлівка');
INSERT INTO `vd_city_lang` VALUES ('3940', 'ua', 'Горлівка');
INSERT INTO `vd_city_lang` VALUES ('3941', 'ua', 'Гродівка');
INSERT INTO `vd_city_lang` VALUES ('3942', 'ua', 'Грузько-Зорянське');
INSERT INTO `vd_city_lang` VALUES ('3943', 'ua', 'Дебальцеве');
INSERT INTO `vd_city_lang` VALUES ('3944', 'ua', 'Дзержинськ');
INSERT INTO `vd_city_lang` VALUES ('3945', 'ua', 'Димитров');
INSERT INTO `vd_city_lang` VALUES ('3946', 'ua', 'Добропілля');
INSERT INTO `vd_city_lang` VALUES ('3947', 'ua', 'Докучаєвськ');
INSERT INTO `vd_city_lang` VALUES ('3948', 'ua', 'Донецьк');
INSERT INTO `vd_city_lang` VALUES ('3949', 'ua', 'Донецьке');
INSERT INTO `vd_city_lang` VALUES ('3950', 'ua', 'Донське');
INSERT INTO `vd_city_lang` VALUES ('3951', 'ua', 'Дробишеве');
INSERT INTO `vd_city_lang` VALUES ('3952', 'ua', 'Дружківка');
INSERT INTO `vd_city_lang` VALUES ('3955', 'ua', 'Желанне');
INSERT INTO `vd_city_lang` VALUES ('3957', 'ua', 'Зуївка');
INSERT INTO `vd_city_lang` VALUES ('3956', 'ua', 'Зугрес');
INSERT INTO `vd_city_lang` VALUES ('3960', 'ua', 'Карло-Марксове');
INSERT INTO `vd_city_lang` VALUES ('3961', 'ua', 'Кировськ');
INSERT INTO `vd_city_lang` VALUES ('5087', 'ua', 'Костянтинівка');
INSERT INTO `vd_city_lang` VALUES ('3962', 'ua', 'Краматорськ');
INSERT INTO `vd_city_lang` VALUES ('3964', 'ua', 'Красний Лиман');
INSERT INTO `vd_city_lang` VALUES ('3963', 'ua', 'Красноармійськ');
INSERT INTO `vd_city_lang` VALUES ('1765574', 'ua', 'Макіївка');
INSERT INTO `vd_city_lang` VALUES ('3965', 'ua', 'Макіївка');
INSERT INTO `vd_city_lang` VALUES ('3966', 'ua', 'Маріуполь');
INSERT INTO `vd_city_lang` VALUES ('3968', 'ua', 'Новоазовськ');
INSERT INTO `vd_city_lang` VALUES ('3969', 'ua', 'Новоекономічне');
INSERT INTO `vd_city_lang` VALUES ('3924', 'ua', 'Олексієво-Дружківка');
INSERT INTO `vd_city_lang` VALUES ('3923', 'ua', 'Олександрівка');
INSERT INTO `vd_city_lang` VALUES ('3971', 'ua', 'Селидове');
INSERT INTO `vd_city_lang` VALUES ('3973', 'ua', 'Сніжне');
INSERT INTO `vd_city_lang` VALUES ('3959', 'ua', 'Соледар');
INSERT INTO `vd_city_lang` VALUES ('3974', 'ua', 'Старобешеве');
INSERT INTO `vd_city_lang` VALUES ('3975', 'ua', 'Тельманове');
INSERT INTO `vd_city_lang` VALUES ('3976', 'ua', 'Торез');
INSERT INTO `vd_city_lang` VALUES ('3977', 'ua', 'Харцизьк');
INSERT INTO `vd_city_lang` VALUES ('3978', 'ua', 'Шахтарськ');
INSERT INTO `vd_city_lang` VALUES ('3979', 'ua', 'Ясинувате');
INSERT INTO `vd_city_lang` VALUES ('3993', 'ua', 'Ємільчине');
INSERT INTO `vd_city_lang` VALUES ('3995', 'ua', 'Іванопіль');
INSERT INTO `vd_city_lang` VALUES ('3980', 'ua', 'Андрушівка');
INSERT INTO `vd_city_lang` VALUES ('3982', 'ua', 'Біла Криниця');
INSERT INTO `vd_city_lang` VALUES ('3981', 'ua', 'Баранівка');
INSERT INTO `vd_city_lang` VALUES ('3983', 'ua', 'Бердичів');
INSERT INTO `vd_city_lang` VALUES ('3986', 'ua', 'Биківка');
INSERT INTO `vd_city_lang` VALUES ('3984', 'ua', 'Броницька Гута');
INSERT INTO `vd_city_lang` VALUES ('3985', 'ua', 'Брусилів');
INSERT INTO `vd_city_lang` VALUES ('3987', 'ua', 'Великі Коровинці');
INSERT INTO `vd_city_lang` VALUES ('3988', 'ua', 'Володарськ-Волинський');
INSERT INTO `vd_city_lang` VALUES ('3989', 'ua', 'Городниця');
INSERT INTO `vd_city_lang` VALUES ('3990', 'ua', 'Гришківці');
INSERT INTO `vd_city_lang` VALUES ('3991', 'ua', 'Дзержинськ');
INSERT INTO `vd_city_lang` VALUES ('3992', 'ua', 'Довбиш');
INSERT INTO `vd_city_lang` VALUES ('3994', 'ua', 'Житомир');
INSERT INTO `vd_city_lang` VALUES ('3997', 'ua', 'Коростень');
INSERT INTO `vd_city_lang` VALUES ('3998', 'ua', 'Коростишів');
INSERT INTO `vd_city_lang` VALUES ('3999', 'ua', 'Лугини');
INSERT INTO `vd_city_lang` VALUES ('4000', 'ua', 'Любар');
INSERT INTO `vd_city_lang` VALUES ('4001', 'ua', 'Малин');
INSERT INTO `vd_city_lang` VALUES ('4002', 'ua', 'Народичі');
INSERT INTO `vd_city_lang` VALUES ('4003', 'ua', 'Новоград-Волинський');
INSERT INTO `vd_city_lang` VALUES ('4004', 'ua', 'Овруч');
INSERT INTO `vd_city_lang` VALUES ('4005', 'ua', 'Олевськ');
INSERT INTO `vd_city_lang` VALUES ('4006', 'ua', 'Попельня');
INSERT INTO `vd_city_lang` VALUES ('4007', 'ua', 'Радомишль');
INSERT INTO `vd_city_lang` VALUES ('4008', 'ua', 'Ружин');
INSERT INTO `vd_city_lang` VALUES ('4009', 'ua', 'Червоноармійськ');
INSERT INTO `vd_city_lang` VALUES ('4360', 'ua', 'Червоноармійськ');
INSERT INTO `vd_city_lang` VALUES ('4010', 'ua', 'Черняхів');
INSERT INTO `vd_city_lang` VALUES ('4011', 'ua', 'Чуднів');
INSERT INTO `vd_city_lang` VALUES ('4018', 'ua', 'Іршава');
INSERT INTO `vd_city_lang` VALUES ('4012', 'ua', 'Берегове');
INSERT INTO `vd_city_lang` VALUES ('4013', 'ua', 'Буштино');
INSERT INTO `vd_city_lang` VALUES ('4014', 'ua', 'Великий Березний');
INSERT INTO `vd_city_lang` VALUES ('4015', 'ua', 'Великий Бичків');
INSERT INTO `vd_city_lang` VALUES ('4016', 'ua', 'Виноградів');
INSERT INTO `vd_city_lang` VALUES ('4017', 'ua', 'Воловець');
INSERT INTO `vd_city_lang` VALUES ('4020', 'ua', 'Мукачеве');
INSERT INTO `vd_city_lang` VALUES ('4021', 'ua', 'Перечин');
INSERT INTO `vd_city_lang` VALUES ('4022', 'ua', 'Рахів');
INSERT INTO `vd_city_lang` VALUES ('4023', 'ua', 'Свалява');
INSERT INTO `vd_city_lang` VALUES ('4024', 'ua', 'Тячів');
INSERT INTO `vd_city_lang` VALUES ('4025', 'ua', 'Ужгород');
INSERT INTO `vd_city_lang` VALUES ('4026', 'ua', 'Хуст');
INSERT INTO `vd_city_lang` VALUES ('4027', 'ua', 'Чоп');
INSERT INTO `vd_city_lang` VALUES ('4029', 'ua', 'Андріївка');
INSERT INTO `vd_city_lang` VALUES ('4030', 'ua', 'Балабине');
INSERT INTO `vd_city_lang` VALUES ('4031', 'ua', 'Бердянськ');
INSERT INTO `vd_city_lang` VALUES ('4032', 'ua', 'Василівка');
INSERT INTO `vd_city_lang` VALUES ('4033', 'ua', 'Веселе');
INSERT INTO `vd_city_lang` VALUES ('4034', 'ua', 'Гуляйполе');
INSERT INTO `vd_city_lang` VALUES ('4984', 'ua', 'Енергодар');
INSERT INTO `vd_city_lang` VALUES ('4035', 'ua', 'Запоріжжя');
INSERT INTO `vd_city_lang` VALUES ('4038', 'ua', 'Комиш-Зоря');
INSERT INTO `vd_city_lang` VALUES ('4039', 'ua', 'Куйбишеве');
INSERT INTO `vd_city_lang` VALUES ('4040', 'ua', 'Мелітополь');
INSERT INTO `vd_city_lang` VALUES ('4041', 'ua', 'Михайлівка');
INSERT INTO `vd_city_lang` VALUES ('4042', 'ua', 'Новомиколаївка');
INSERT INTO `vd_city_lang` VALUES ('4043', 'ua', 'Оріхів');
INSERT INTO `vd_city_lang` VALUES ('4044', 'ua', 'Пологи');
INSERT INTO `vd_city_lang` VALUES ('4045', 'ua', 'Приазовське');
INSERT INTO `vd_city_lang` VALUES ('4046', 'ua', 'Приморськ');
INSERT INTO `vd_city_lang` VALUES ('4047', 'ua', 'Токмак');
INSERT INTO `vd_city_lang` VALUES ('4048', 'ua', 'Чернігівка');
INSERT INTO `vd_city_lang` VALUES ('4028', 'ua', 'Якимівка');
INSERT INTO `vd_city_lang` VALUES ('4064', 'ua', 'Єзупіль');
INSERT INTO `vd_city_lang` VALUES ('4066', 'ua', 'Івано-Франківськ');
INSERT INTO `vd_city_lang` VALUES ('4051', 'ua', 'Більшівці');
INSERT INTO `vd_city_lang` VALUES ('4055', 'ua', 'Битків');
INSERT INTO `vd_city_lang` VALUES ('4049', 'ua', 'Богородчани');
INSERT INTO `vd_city_lang` VALUES ('4050', 'ua', 'Болехів');
INSERT INTO `vd_city_lang` VALUES ('4052', 'ua', 'Брошнів-Осада');
INSERT INTO `vd_city_lang` VALUES ('4053', 'ua', 'Букачівці');
INSERT INTO `vd_city_lang` VALUES ('4054', 'ua', 'Бурштин');
INSERT INTO `vd_city_lang` VALUES ('4056', 'ua', 'Верховина');
INSERT INTO `vd_city_lang` VALUES ('4059', 'ua', 'Вигода');
INSERT INTO `vd_city_lang` VALUES ('4057', 'ua', 'Войнилів');
INSERT INTO `vd_city_lang` VALUES ('4058', 'ua', 'Ворохта');
INSERT INTO `vd_city_lang` VALUES ('4060', 'ua', 'Галич');
INSERT INTO `vd_city_lang` VALUES ('4062', 'ua', 'Городенка');
INSERT INTO `vd_city_lang` VALUES ('4063', 'ua', 'Делятин');
INSERT INTO `vd_city_lang` VALUES ('1766192', 'ua', 'Долина');
INSERT INTO `vd_city_lang` VALUES ('4065', 'ua', 'Заболотів');
INSERT INTO `vd_city_lang` VALUES ('4068', 'ua', 'Калуш');
INSERT INTO `vd_city_lang` VALUES ('4069', 'ua', 'Коломия');
INSERT INTO `vd_city_lang` VALUES ('4070', 'ua', 'Косів');
INSERT INTO `vd_city_lang` VALUES ('4071', 'ua', 'Надвірна');
INSERT INTO `vd_city_lang` VALUES ('4072', 'ua', 'Надвірна');
INSERT INTO `vd_city_lang` VALUES ('4073', 'ua', 'Рогатин');
INSERT INTO `vd_city_lang` VALUES ('4074', 'ua', 'Рожнятів');
INSERT INTO `vd_city_lang` VALUES ('4075', 'ua', 'Снятин');
INSERT INTO `vd_city_lang` VALUES ('4076', 'ua', 'Станіславів');
INSERT INTO `vd_city_lang` VALUES ('4078', 'ua', 'Тисьмениця');
INSERT INTO `vd_city_lang` VALUES ('4077', 'ua', 'Тлумач');
INSERT INTO `vd_city_lang` VALUES ('4079', 'ua', 'Яремче');
INSERT INTO `vd_city_lang` VALUES ('4094', 'ua', 'Іванків');
INSERT INTO `vd_city_lang` VALUES ('4095', 'ua', 'Ірпінь');
INSERT INTO `vd_city_lang` VALUES ('4081', 'ua', 'Біла Церква');
INSERT INTO `vd_city_lang` VALUES ('4080', 'ua', 'Баришівка');
INSERT INTO `vd_city_lang` VALUES ('4082', 'ua', 'Березань');
INSERT INTO `vd_city_lang` VALUES ('4083', 'ua', 'Богуслав');
INSERT INTO `vd_city_lang` VALUES ('4084', 'ua', 'Бориспіль');
INSERT INTO `vd_city_lang` VALUES ('4085', 'ua', 'Борова');
INSERT INTO `vd_city_lang` VALUES ('4086', 'ua', 'Бородянка');
INSERT INTO `vd_city_lang` VALUES ('5081', 'ua', 'Боярка');
INSERT INTO `vd_city_lang` VALUES ('4087', 'ua', 'Бровари');
INSERT INTO `vd_city_lang` VALUES ('4088', 'ua', 'Васильків');
INSERT INTO `vd_city_lang` VALUES ('5076', 'ua', 'Вишгород');
INSERT INTO `vd_city_lang` VALUES ('1766731', 'ua', 'Вишневое');
INSERT INTO `vd_city_lang` VALUES ('1766729', 'ua', 'Вишневое');
INSERT INTO `vd_city_lang` VALUES ('1766501', 'ua', 'Вишневое');
INSERT INTO `vd_city_lang` VALUES ('4089', 'ua', 'Володарка');
INSERT INTO `vd_city_lang` VALUES ('4090', 'ua', 'Ворзель');
INSERT INTO `vd_city_lang` VALUES ('4091', 'ua', 'Гребінки');
INSERT INTO `vd_city_lang` VALUES ('4092', 'ua', 'Димер');
INSERT INTO `vd_city_lang` VALUES ('4093', 'ua', 'Згурівка');
INSERT INTO `vd_city_lang` VALUES ('4096', 'ua', 'Кагарлик');
INSERT INTO `vd_city_lang` VALUES ('4097', 'ua', 'Калинівка');
INSERT INTO `vd_city_lang` VALUES ('4098', 'ua', 'Київ');
INSERT INTO `vd_city_lang` VALUES ('4100', 'ua', 'Кодра');
INSERT INTO `vd_city_lang` VALUES ('4101', 'ua', 'Кожанка');
INSERT INTO `vd_city_lang` VALUES ('4102', 'ua', 'Козин');
INSERT INTO `vd_city_lang` VALUES ('4103', 'ua', 'Макарів');
INSERT INTO `vd_city_lang` VALUES ('4104', 'ua', 'Обухів');
INSERT INTO `vd_city_lang` VALUES ('4105', 'ua', 'Переяслав-Хмельницький');
INSERT INTO `vd_city_lang` VALUES ('4106', 'ua', 'Поліське');
INSERT INTO `vd_city_lang` VALUES ('4107', 'ua', 'Рокитне');
INSERT INTO `vd_city_lang` VALUES ('4108', 'ua', 'Сквира');
INSERT INTO `vd_city_lang` VALUES ('5024', 'ua', 'Славутич');
INSERT INTO `vd_city_lang` VALUES ('4109', 'ua', 'Ставище');
INSERT INTO `vd_city_lang` VALUES ('4110', 'ua', 'Тараща');
INSERT INTO `vd_city_lang` VALUES ('4111', 'ua', 'Тетіїв');
INSERT INTO `vd_city_lang` VALUES ('4112', 'ua', 'Фастів');
INSERT INTO `vd_city_lang` VALUES ('4113', 'ua', 'Чорнобиль');
INSERT INTO `vd_city_lang` VALUES ('4114', 'ua', 'Яготин');
INSERT INTO `vd_city_lang` VALUES ('4151', 'ua', 'Євпаторія');
INSERT INTO `vd_city_lang` VALUES ('4141', 'ua', 'Алупка');
INSERT INTO `vd_city_lang` VALUES ('4142', 'ua', 'Алушта');
INSERT INTO `vd_city_lang` VALUES ('5088', 'ua', 'Армянськ');
INSERT INTO `vd_city_lang` VALUES ('4912', 'ua', 'Армянськ');
INSERT INTO `vd_city_lang` VALUES ('4146', 'ua', 'Білогірськ');
INSERT INTO `vd_city_lang` VALUES ('4143', 'ua', 'Багерове');
INSERT INTO `vd_city_lang` VALUES ('4145', 'ua', 'Бахчисарай');
INSERT INTO `vd_city_lang` VALUES ('4914', 'ua', 'Берегове');
INSERT INTO `vd_city_lang` VALUES ('4915', 'ua', 'Ботанічне');
INSERT INTO `vd_city_lang` VALUES ('4147', 'ua', 'Гаспра');
INSERT INTO `vd_city_lang` VALUES ('4148', 'ua', 'Гвардійське');
INSERT INTO `vd_city_lang` VALUES ('4149', 'ua', 'Гурзуф');
INSERT INTO `vd_city_lang` VALUES ('4150', 'ua', 'Джанкой');
INSERT INTO `vd_city_lang` VALUES ('4152', 'ua', 'Зуя');
INSERT INTO `vd_city_lang` VALUES ('4917', 'ua', 'Кацивелі');
INSERT INTO `vd_city_lang` VALUES ('4153', 'ua', 'Керч');
INSERT INTO `vd_city_lang` VALUES ('4918', 'ua', 'Кореїз');
INSERT INTO `vd_city_lang` VALUES ('4919', 'ua', 'Красногвардійськ');
INSERT INTO `vd_city_lang` VALUES ('4155', 'ua', 'Красногвардійське');
INSERT INTO `vd_city_lang` VALUES ('4156', 'ua', 'Красноперекопськ');
INSERT INTO `vd_city_lang` VALUES ('4921', 'ua', 'Курпати');
INSERT INTO `vd_city_lang` VALUES ('4922', 'ua', 'Лівадія');
INSERT INTO `vd_city_lang` VALUES ('4157', 'ua', 'Леніне');
INSERT INTO `vd_city_lang` VALUES ('4923', 'ua', 'Місхор');
INSERT INTO `vd_city_lang` VALUES ('4158', 'ua', 'Масандра');
INSERT INTO `vd_city_lang` VALUES ('4159', 'ua', 'Нижньогірський');
INSERT INTO `vd_city_lang` VALUES ('4924', 'ua', 'Олива');
INSERT INTO `vd_city_lang` VALUES ('4925', 'ua', 'Оползневе');
INSERT INTO `vd_city_lang` VALUES ('4926', 'ua', 'Паркове');
INSERT INTO `vd_city_lang` VALUES ('4160', 'ua', 'Первомайське');
INSERT INTO `vd_city_lang` VALUES ('4927', 'ua', 'Понизівка');
INSERT INTO `vd_city_lang` VALUES ('4929', 'ua', 'Сімеїз');
INSERT INTO `vd_city_lang` VALUES ('4162', 'ua', 'Саки');
INSERT INTO `vd_city_lang` VALUES ('4928', 'ua', 'Санаторне');
INSERT INTO `vd_city_lang` VALUES ('4163', 'ua', 'Севастополь');
INSERT INTO `vd_city_lang` VALUES ('4164', 'ua', 'Симферополь');
INSERT INTO `vd_city_lang` VALUES ('4165', 'ua', 'Советський');
INSERT INTO `vd_city_lang` VALUES ('4166', 'ua', 'Судак');
INSERT INTO `vd_city_lang` VALUES ('4167', 'ua', 'Феодосія');
INSERT INTO `vd_city_lang` VALUES ('4168', 'ua', 'Форос');
INSERT INTO `vd_city_lang` VALUES ('4169', 'ua', 'Чорноморське');
INSERT INTO `vd_city_lang` VALUES ('5052', 'ua', 'Щолкіне');
INSERT INTO `vd_city_lang` VALUES ('4170', 'ua', 'Ялта');
INSERT INTO `vd_city_lang` VALUES ('4196', 'ua', 'Єсаулівка');
INSERT INTO `vd_city_lang` VALUES ('4200', 'ua', 'Ізварине');
INSERT INTO `vd_city_lang` VALUES ('4172', 'ua', 'Алчевськ');
INSERT INTO `vd_city_lang` VALUES ('4173', 'ua', 'Антрацит');
INSERT INTO `vd_city_lang` VALUES ('3927', 'ua', 'Артемове');
INSERT INTO `vd_city_lang` VALUES ('4178', 'ua', 'Біле');
INSERT INTO `vd_city_lang` VALUES ('4176', 'ua', 'Біловодськ');
INSERT INTO `vd_city_lang` VALUES ('4177', 'ua', 'Білогорівка');
INSERT INTO `vd_city_lang` VALUES ('4179', 'ua', 'Білокуракине');
INSERT INTO `vd_city_lang` VALUES ('4180', 'ua', 'Білолуцьк');
INSERT INTO `vd_city_lang` VALUES ('4181', 'ua', 'Бірюково');
INSERT INTO `vd_city_lang` VALUES ('4175', 'ua', 'Байрачки');
INSERT INTO `vd_city_lang` VALUES ('4182', 'ua', 'Боково-Платове');
INSERT INTO `vd_city_lang` VALUES ('4183', 'ua', 'Борівське');
INSERT INTO `vd_city_lang` VALUES ('4184', 'ua', 'Брянка');
INSERT INTO `vd_city_lang` VALUES ('4185', 'ua', 'Бугаївка');
INSERT INTO `vd_city_lang` VALUES ('4186', 'ua', 'Вахрушеве');
INSERT INTO `vd_city_lang` VALUES ('4187', 'ua', 'Великий Лог');
INSERT INTO `vd_city_lang` VALUES ('4188', 'ua', 'Вергулівка');
INSERT INTO `vd_city_lang` VALUES ('4190', 'ua', 'Вовчоярівка');
INSERT INTO `vd_city_lang` VALUES ('4189', 'ua', 'Володарськ');
INSERT INTO `vd_city_lang` VALUES ('4192', 'ua', 'Врубівка');
INSERT INTO `vd_city_lang` VALUES ('4193', 'ua', 'Врубівський');
INSERT INTO `vd_city_lang` VALUES ('4195', 'ua', 'Гірське');
INSERT INTO `vd_city_lang` VALUES ('4194', 'ua', 'Георгіївка');
INSERT INTO `vd_city_lang` VALUES ('4198', 'ua', 'Золоте');
INSERT INTO `vd_city_lang` VALUES ('4199', 'ua', 'Зоринськ');
INSERT INTO `vd_city_lang` VALUES ('4204', 'ua', 'Кіровськ');
INSERT INTO `vd_city_lang` VALUES ('4201', 'ua', 'Калінінський');
INSERT INTO `vd_city_lang` VALUES ('4202', 'ua', 'Калинове');
INSERT INTO `vd_city_lang` VALUES ('4207', 'ua', 'Красний Луч');
INSERT INTO `vd_city_lang` VALUES ('1748298', 'ua', 'Краснодарський');
INSERT INTO `vd_city_lang` VALUES ('4206', 'ua', 'Краснодон');
INSERT INTO `vd_city_lang` VALUES ('4208', 'ua', 'Кремінна');
INSERT INTO `vd_city_lang` VALUES ('4209', 'ua', 'Лисичанськ');
INSERT INTO `vd_city_lang` VALUES ('4210', 'ua', 'Луганськ');
INSERT INTO `vd_city_lang` VALUES ('4211', 'ua', 'Лутугине');
INSERT INTO `vd_city_lang` VALUES ('4213', 'ua', 'Мілове');
INSERT INTO `vd_city_lang` VALUES ('4212', 'ua', 'Марківка');
INSERT INTO `vd_city_lang` VALUES ('4214', 'ua', 'Новоайдар');
INSERT INTO `vd_city_lang` VALUES ('4215', 'ua', 'Новопсков');
INSERT INTO `vd_city_lang` VALUES ('4171', 'ua', 'Олександрівськ');
INSERT INTO `vd_city_lang` VALUES ('4216', 'ua', 'Первомайськ');
INSERT INTO `vd_city_lang` VALUES ('4217', 'ua', 'Перевальськ');
INSERT INTO `vd_city_lang` VALUES ('4218', 'ua', 'Попасна');
INSERT INTO `vd_city_lang` VALUES ('4219', 'ua', 'Ровеньки');
INSERT INTO `vd_city_lang` VALUES ('4220', 'ua', 'Рубіжне');
INSERT INTO `vd_city_lang` VALUES ('4223', 'ua', 'Сєвєродонецьк');
INSERT INTO `vd_city_lang` VALUES ('4221', 'ua', 'Сватове');
INSERT INTO `vd_city_lang` VALUES ('4222', 'ua', 'Свердловськ');
INSERT INTO `vd_city_lang` VALUES ('4225', 'ua', 'Станично-Луганське');
INSERT INTO `vd_city_lang` VALUES ('4226', 'ua', 'Старобільськ');
INSERT INTO `vd_city_lang` VALUES ('4227', 'ua', 'Стаханов');
INSERT INTO `vd_city_lang` VALUES ('4228', 'ua', 'Троїцьке');
INSERT INTO `vd_city_lang` VALUES ('4245', 'ua', 'Івано-Франкове');
INSERT INTO `vd_city_lang` VALUES ('4230', 'ua', 'Бібрка');
INSERT INTO `vd_city_lang` VALUES ('4229', 'ua', 'Белз');
INSERT INTO `vd_city_lang` VALUES ('4231', 'ua', 'Борислав');
INSERT INTO `vd_city_lang` VALUES ('4232', 'ua', 'Броди');
INSERT INTO `vd_city_lang` VALUES ('4233', 'ua', 'Буськ');
INSERT INTO `vd_city_lang` VALUES ('4234', 'ua', 'Великі Мости');
INSERT INTO `vd_city_lang` VALUES ('4235', 'ua', 'Верхнє Синьовидне');
INSERT INTO `vd_city_lang` VALUES ('4236', 'ua', 'Винники');
INSERT INTO `vd_city_lang` VALUES ('4061', 'ua', 'Гвоздець');
INSERT INTO `vd_city_lang` VALUES ('4237', 'ua', 'Глиняни');
INSERT INTO `vd_city_lang` VALUES ('4239', 'ua', 'Дашава');
INSERT INTO `vd_city_lang` VALUES ('4240', 'ua', 'Добротвір');
INSERT INTO `vd_city_lang` VALUES ('4241', 'ua', 'Дрогобич');
INSERT INTO `vd_city_lang` VALUES ('4242', 'ua', 'Жидачів');
INSERT INTO `vd_city_lang` VALUES ('4244', 'ua', 'Золочів');
INSERT INTO `vd_city_lang` VALUES ('1035074', 'ua', 'Лопушанка');
INSERT INTO `vd_city_lang` VALUES ('4247', 'ua', 'Львів');
INSERT INTO `vd_city_lang` VALUES ('4250', 'ua', 'Миколаїв');
INSERT INTO `vd_city_lang` VALUES ('4248', 'ua', 'Мостиська');
INSERT INTO `vd_city_lang` VALUES ('4249', 'ua', 'Нестерів');
INSERT INTO `vd_city_lang` VALUES ('1766197', 'ua', 'Новояворівськ');
INSERT INTO `vd_city_lang` VALUES ('4251', 'ua', 'Перемишляни');
INSERT INTO `vd_city_lang` VALUES ('4252', 'ua', 'Пустомити');
INSERT INTO `vd_city_lang` VALUES ('4253', 'ua', 'Рава-Руська');
INSERT INTO `vd_city_lang` VALUES ('4254', 'ua', 'Радехів');
INSERT INTO `vd_city_lang` VALUES ('4255', 'ua', 'Самбір');
INSERT INTO `vd_city_lang` VALUES ('4256', 'ua', 'Сколе');
INSERT INTO `vd_city_lang` VALUES ('4257', 'ua', 'Сокаль');
INSERT INTO `vd_city_lang` VALUES ('4258', 'ua', 'Старий Самбір');
INSERT INTO `vd_city_lang` VALUES ('4259', 'ua', 'Стрий');
INSERT INTO `vd_city_lang` VALUES ('4260', 'ua', 'Трускавець');
INSERT INTO `vd_city_lang` VALUES ('4261', 'ua', 'Турка');
INSERT INTO `vd_city_lang` VALUES ('4262', 'ua', 'Червоноград');
INSERT INTO `vd_city_lang` VALUES ('4263', 'ua', 'Яворів');
INSERT INTO `vd_city_lang` VALUES ('4273', 'ua', 'Єланець');
INSERT INTO `vd_city_lang` VALUES ('4265', 'ua', 'Арбузинка');
INSERT INTO `vd_city_lang` VALUES ('4266', 'ua', 'Баштанка');
INSERT INTO `vd_city_lang` VALUES ('4267', 'ua', 'Березнегувате');
INSERT INTO `vd_city_lang` VALUES ('4268', 'ua', 'Братське');
INSERT INTO `vd_city_lang` VALUES ('4270', 'ua', 'Веселинове');
INSERT INTO `vd_city_lang` VALUES ('4271', 'ua', 'Вознесенськ');
INSERT INTO `vd_city_lang` VALUES ('4272', 'ua', 'Доманівка');
INSERT INTO `vd_city_lang` VALUES ('4274', 'ua', 'Казанка');
INSERT INTO `vd_city_lang` VALUES ('4275', 'ua', 'Криве Озеро');
INSERT INTO `vd_city_lang` VALUES ('4276', 'ua', 'Миколаїв');
INSERT INTO `vd_city_lang` VALUES ('4277', 'ua', 'Нова Одеса');
INSERT INTO `vd_city_lang` VALUES ('4278', 'ua', 'Новий Буг');
INSERT INTO `vd_city_lang` VALUES ('4264', 'ua', 'Олександрівка');
INSERT INTO `vd_city_lang` VALUES ('4279', 'ua', 'Очаків');
INSERT INTO `vd_city_lang` VALUES ('4280', 'ua', 'Первомайськ');
INSERT INTO `vd_city_lang` VALUES ('4281', 'ua', 'Снігурівка');
INSERT INTO `vd_city_lang` VALUES ('5009', 'ua', 'Южноукраїнськ');
INSERT INTO `vd_city_lang` VALUES ('4296', 'ua', 'Ізмаїл');
INSERT INTO `vd_city_lang` VALUES ('4297', 'ua', 'Іллічівськ');
INSERT INTO `vd_city_lang` VALUES ('4282', 'ua', 'Аккерман');
INSERT INTO `vd_city_lang` VALUES ('4283', 'ua', 'Ананьїв');
INSERT INTO `vd_city_lang` VALUES ('4284', 'ua', 'Арциз');
INSERT INTO `vd_city_lang` VALUES ('4286', 'ua', 'Білгород-Дністровський');
INSERT INTO `vd_city_lang` VALUES ('4287', 'ua', 'Біляївка');
INSERT INTO `vd_city_lang` VALUES ('4285', 'ua', 'Балта');
INSERT INTO `vd_city_lang` VALUES ('4289', 'ua', 'Березівка');
INSERT INTO `vd_city_lang` VALUES ('4288', 'ua', 'Березине');
INSERT INTO `vd_city_lang` VALUES ('4290', 'ua', 'Болград');
INSERT INTO `vd_city_lang` VALUES ('4291', 'ua', 'Бородине');
INSERT INTO `vd_city_lang` VALUES ('4292', 'ua', 'Велика Михайлівка');
INSERT INTO `vd_city_lang` VALUES ('4293', 'ua', 'Великодолинське');
INSERT INTO `vd_city_lang` VALUES ('4294', 'ua', 'Вилкове');
INSERT INTO `vd_city_lang` VALUES ('4295', 'ua', 'Затишшя');
INSERT INTO `vd_city_lang` VALUES ('4298', 'ua', 'Кілія');
INSERT INTO `vd_city_lang` VALUES ('4299', 'ua', 'Кодима');
INSERT INTO `vd_city_lang` VALUES ('4300', 'ua', 'Комінтернівське');
INSERT INTO `vd_city_lang` VALUES ('4301', 'ua', 'Котовськ');
INSERT INTO `vd_city_lang` VALUES ('4302', 'ua', 'Красні Окни');
INSERT INTO `vd_city_lang` VALUES ('4303', 'ua', 'Любашівка');
INSERT INTO `vd_city_lang` VALUES ('4304', 'ua', 'Миколаївка');
INSERT INTO `vd_city_lang` VALUES ('4305', 'ua', 'Овідіополь');
INSERT INTO `vd_city_lang` VALUES ('4306', 'ua', 'Одеса');
INSERT INTO `vd_city_lang` VALUES ('4308', 'ua', 'Рені');
INSERT INTO `vd_city_lang` VALUES ('4307', 'ua', 'Роздільна');
INSERT INTO `vd_city_lang` VALUES ('4309', 'ua', 'Саврань');
INSERT INTO `vd_city_lang` VALUES ('4310', 'ua', 'Сарата');
INSERT INTO `vd_city_lang` VALUES ('4311', 'ua', 'Тарутине');
INSERT INTO `vd_city_lang` VALUES ('4312', 'ua', 'Татарбунари');
INSERT INTO `vd_city_lang` VALUES ('4313', 'ua', 'Фрунзівка');
INSERT INTO `vd_city_lang` VALUES ('4314', 'ua', 'Ширяєве');
INSERT INTO `vd_city_lang` VALUES ('5107', 'ua', 'Южне');
INSERT INTO `vd_city_lang` VALUES ('4315', 'ua', 'Білики');
INSERT INTO `vd_city_lang` VALUES ('4316', 'ua', 'Велика Багачка');
INSERT INTO `vd_city_lang` VALUES ('4317', 'ua', 'Гадяч');
INSERT INTO `vd_city_lang` VALUES ('4318', 'ua', 'Глобине');
INSERT INTO `vd_city_lang` VALUES ('4319', 'ua', 'Гоголеве');
INSERT INTO `vd_city_lang` VALUES ('4320', 'ua', 'Градіжск');
INSERT INTO `vd_city_lang` VALUES ('4321', 'ua', 'Гребінка');
INSERT INTO `vd_city_lang` VALUES ('4322', 'ua', 'Диканька');
INSERT INTO `vd_city_lang` VALUES ('4324', 'ua', 'Карлівка');
INSERT INTO `vd_city_lang` VALUES ('4325', 'ua', 'Кобеляки');
INSERT INTO `vd_city_lang` VALUES ('4326', 'ua', 'Козельщина');
INSERT INTO `vd_city_lang` VALUES ('5095', 'ua', 'Комсомольськ');
INSERT INTO `vd_city_lang` VALUES ('4327', 'ua', 'Котельва');
INSERT INTO `vd_city_lang` VALUES ('4328', 'ua', 'Кременчук');
INSERT INTO `vd_city_lang` VALUES ('4329', 'ua', 'Лохвиця');
INSERT INTO `vd_city_lang` VALUES ('4330', 'ua', 'Лубни');
INSERT INTO `vd_city_lang` VALUES ('4331', 'ua', 'Машівка');
INSERT INTO `vd_city_lang` VALUES ('4332', 'ua', 'Миргород');
INSERT INTO `vd_city_lang` VALUES ('4333', 'ua', 'Нові Санжари');
INSERT INTO `vd_city_lang` VALUES ('4334', 'ua', 'Оржиця');
INSERT INTO `vd_city_lang` VALUES ('4335', 'ua', 'Пирянтин');
INSERT INTO `vd_city_lang` VALUES ('4336', 'ua', 'Пирятин');
INSERT INTO `vd_city_lang` VALUES ('4337', 'ua', 'Полтава');
INSERT INTO `vd_city_lang` VALUES ('4338', 'ua', 'Решетилівка');
INSERT INTO `vd_city_lang` VALUES ('4339', 'ua', 'Семенівка');
INSERT INTO `vd_city_lang` VALUES ('4340', 'ua', 'Хорол');
INSERT INTO `vd_city_lang` VALUES ('4341', 'ua', 'Чорнухи');
INSERT INTO `vd_city_lang` VALUES ('4342', 'ua', 'Чутове');
INSERT INTO `vd_city_lang` VALUES ('4343', 'ua', 'Шишаки');
INSERT INTO `vd_city_lang` VALUES ('4344', 'ua', 'Володимирець');
INSERT INTO `vd_city_lang` VALUES ('4345', 'ua', 'Гоща');
INSERT INTO `vd_city_lang` VALUES ('4346', 'ua', 'Демидівка');
INSERT INTO `vd_city_lang` VALUES ('4347', 'ua', 'Дубно');
INSERT INTO `vd_city_lang` VALUES ('4348', 'ua', 'Дубровиця');
INSERT INTO `vd_city_lang` VALUES ('4349', 'ua', 'Зарічне');
INSERT INTO `vd_city_lang` VALUES ('4350', 'ua', 'Здолбунів');
INSERT INTO `vd_city_lang` VALUES ('4351', 'ua', 'Клевань');
INSERT INTO `vd_city_lang` VALUES ('4352', 'ua', 'Клесів');
INSERT INTO `vd_city_lang` VALUES ('4353', 'ua', 'Корець');
INSERT INTO `vd_city_lang` VALUES ('4354', 'ua', 'Костопіль');
INSERT INTO `vd_city_lang` VALUES ('4355', 'ua', 'Кузнецовськ');
INSERT INTO `vd_city_lang` VALUES ('4356', 'ua', 'Млинів');
INSERT INTO `vd_city_lang` VALUES ('4357', 'ua', 'Острог');
INSERT INTO `vd_city_lang` VALUES ('4358', 'ua', 'Рівне');
INSERT INTO `vd_city_lang` VALUES ('4359', 'ua', 'Сарни');
INSERT INTO `vd_city_lang` VALUES ('4362', 'ua', 'Білопілля');
INSERT INTO `vd_city_lang` VALUES ('4363', 'ua', 'Буринь');
INSERT INTO `vd_city_lang` VALUES ('4364', 'ua', 'Велика Писарівка');
INSERT INTO `vd_city_lang` VALUES ('4365', 'ua', 'Ворожба');
INSERT INTO `vd_city_lang` VALUES ('4366', 'ua', 'Вороніж');
INSERT INTO `vd_city_lang` VALUES ('4367', 'ua', 'Глухів');
INSERT INTO `vd_city_lang` VALUES ('4368', 'ua', 'Дружба');
INSERT INTO `vd_city_lang` VALUES ('4369', 'ua', 'Зноб-Новгородське');
INSERT INTO `vd_city_lang` VALUES ('4370', 'ua', 'Кириківка');
INSERT INTO `vd_city_lang` VALUES ('4371', 'ua', 'Конотоп');
INSERT INTO `vd_city_lang` VALUES ('4372', 'ua', 'Краснопілля');
INSERT INTO `vd_city_lang` VALUES ('4373', 'ua', 'Кровелець');
INSERT INTO `vd_city_lang` VALUES ('4374', 'ua', 'Лебедин');
INSERT INTO `vd_city_lang` VALUES ('4375', 'ua', 'Липова Долина');
INSERT INTO `vd_city_lang` VALUES ('4376', 'ua', 'Недригайлів');
INSERT INTO `vd_city_lang` VALUES ('4361', 'ua', 'Охтирка');
INSERT INTO `vd_city_lang` VALUES ('4377', 'ua', 'Путивль');
INSERT INTO `vd_city_lang` VALUES ('4378', 'ua', 'Ромни');
INSERT INTO `vd_city_lang` VALUES ('4379', 'ua', 'Середина-Буда');
INSERT INTO `vd_city_lang` VALUES ('4380', 'ua', 'Суми');
INSERT INTO `vd_city_lang` VALUES ('4381', 'ua', 'Тростянець');
INSERT INTO `vd_city_lang` VALUES ('4382', 'ua', 'Шостка');
INSERT INTO `vd_city_lang` VALUES ('4384', 'ua', 'Ямпіль');
INSERT INTO `vd_city_lang` VALUES ('4385', 'ua', 'Бережани');
INSERT INTO `vd_city_lang` VALUES ('4386', 'ua', 'Борщів');
INSERT INTO `vd_city_lang` VALUES ('4387', 'ua', 'Бучач');
INSERT INTO `vd_city_lang` VALUES ('4388', 'ua', 'Великі Бірки');
INSERT INTO `vd_city_lang` VALUES ('4389', 'ua', 'Вишнівець');
INSERT INTO `vd_city_lang` VALUES ('4390', 'ua', 'Гримайлів');
INSERT INTO `vd_city_lang` VALUES ('4391', 'ua', 'Гусятин');
INSERT INTO `vd_city_lang` VALUES ('4393', 'ua', 'Залізці');
INSERT INTO `vd_city_lang` VALUES ('4392', 'ua', 'Заліщики');
INSERT INTO `vd_city_lang` VALUES ('4394', 'ua', 'Збараж');
INSERT INTO `vd_city_lang` VALUES ('4395', 'ua', 'Зборів');
INSERT INTO `vd_city_lang` VALUES ('4397', 'ua', 'Золотий потік');
INSERT INTO `vd_city_lang` VALUES ('4396', 'ua', 'Золотники');
INSERT INTO `vd_city_lang` VALUES ('4398', 'ua', 'Козлів');
INSERT INTO `vd_city_lang` VALUES ('4399', 'ua', 'Козова');
INSERT INTO `vd_city_lang` VALUES ('4400', 'ua', 'Кременець');
INSERT INTO `vd_city_lang` VALUES ('4401', 'ua', 'Ланівці');
INSERT INTO `vd_city_lang` VALUES ('4402', 'ua', 'Монастиріська');
INSERT INTO `vd_city_lang` VALUES ('4403', 'ua', 'Підволочиськ');
INSERT INTO `vd_city_lang` VALUES ('4404', 'ua', 'Теребовля');
INSERT INTO `vd_city_lang` VALUES ('4405', 'ua', 'Тернопіль');
INSERT INTO `vd_city_lang` VALUES ('4406', 'ua', 'Чортків');
INSERT INTO `vd_city_lang` VALUES ('4407', 'ua', 'Шумськ');
INSERT INTO `vd_city_lang` VALUES ('4424', 'ua', 'Ізюм');
INSERT INTO `vd_city_lang` VALUES ('4412', 'ua', 'Бірки');
INSERT INTO `vd_city_lang` VALUES ('4408', 'ua', 'Балаклія');
INSERT INTO `vd_city_lang` VALUES ('4409', 'ua', 'Барвінкове');
INSERT INTO `vd_city_lang` VALUES ('4410', 'ua', 'Близнюки');
INSERT INTO `vd_city_lang` VALUES ('4411', 'ua', 'Богодухів');
INSERT INTO `vd_city_lang` VALUES ('4413', 'ua', 'Борова');
INSERT INTO `vd_city_lang` VALUES ('4414', 'ua', 'Буди');
INSERT INTO `vd_city_lang` VALUES ('4415', 'ua', 'Валки');
INSERT INTO `vd_city_lang` VALUES ('4416', 'ua', 'Великий Бурлук');
INSERT INTO `vd_city_lang` VALUES ('4417', 'ua', 'Вовчанськ');
INSERT INTO `vd_city_lang` VALUES ('4419', 'ua', 'Гути');
INSERT INTO `vd_city_lang` VALUES ('4420', 'ua', 'Дергачі');
INSERT INTO `vd_city_lang` VALUES ('4422', 'ua', 'Зідьки');
INSERT INTO `vd_city_lang` VALUES ('4421', 'ua', 'Зачепилівка');
INSERT INTO `vd_city_lang` VALUES ('4418', 'ua', 'Зміїв');
INSERT INTO `vd_city_lang` VALUES ('4423', 'ua', 'Золочів');
INSERT INTO `vd_city_lang` VALUES ('4426', 'ua', 'Кегичівка');
INSERT INTO `vd_city_lang` VALUES ('4425', 'ua', 'Козача Лопань');
INSERT INTO `vd_city_lang` VALUES ('4427', 'ua', 'Красноград');
INSERT INTO `vd_city_lang` VALUES ('4428', 'ua', 'Краснокутськ');
INSERT INTO `vd_city_lang` VALUES ('4430', 'ua', 'Лозова');
INSERT INTO `vd_city_lang` VALUES ('4431', 'ua', 'Люботин');
INSERT INTO `vd_city_lang` VALUES ('5073', 'ua', 'Мерефа');
INSERT INTO `vd_city_lang` VALUES ('4432', 'ua', 'Нова Водолага');
INSERT INTO `vd_city_lang` VALUES ('5074', 'ua', 'Пісочин');
INSERT INTO `vd_city_lang` VALUES ('4433', 'ua', 'Первомайський');
INSERT INTO `vd_city_lang` VALUES ('4434', 'ua', 'Сахновщина');
INSERT INTO `vd_city_lang` VALUES ('4435', 'ua', 'Харків');
INSERT INTO `vd_city_lang` VALUES ('4436', 'ua', 'Чугуїв');
INSERT INTO `vd_city_lang` VALUES ('4437', 'ua', 'Шевченково');
INSERT INTO `vd_city_lang` VALUES ('4438', 'ua', 'Асканія-Нова');
INSERT INTO `vd_city_lang` VALUES ('4439', 'ua', 'Біла Криниця');
INSERT INTO `vd_city_lang` VALUES ('4440', 'ua', 'Білозерка');
INSERT INTO `vd_city_lang` VALUES ('4441', 'ua', 'Берислав');
INSERT INTO `vd_city_lang` VALUES ('4443', 'ua', 'Велика Лепетиха');
INSERT INTO `vd_city_lang` VALUES ('4442', 'ua', 'Велика Олександрівка');
INSERT INTO `vd_city_lang` VALUES ('4444', 'ua', 'Верхній Рогачик');
INSERT INTO `vd_city_lang` VALUES ('4445', 'ua', 'Високопілля');
INSERT INTO `vd_city_lang` VALUES ('4446', 'ua', 'Геніческ');
INSERT INTO `vd_city_lang` VALUES ('4447', 'ua', 'Гола Пристань');
INSERT INTO `vd_city_lang` VALUES ('4448', 'ua', 'Горностаївка');
INSERT INTO `vd_city_lang` VALUES ('4449', 'ua', 'Дніпряни');
INSERT INTO `vd_city_lang` VALUES ('4451', 'ua', 'Калініське');
INSERT INTO `vd_city_lang` VALUES ('4450', 'ua', 'Каланчак');
INSERT INTO `vd_city_lang` VALUES ('4452', 'ua', 'Каховка');
INSERT INTO `vd_city_lang` VALUES ('4453', 'ua', 'Нижні Сірогози');
INSERT INTO `vd_city_lang` VALUES ('4454', 'ua', 'Нова Каховка');
INSERT INTO `vd_city_lang` VALUES ('4455', 'ua', 'Нововоронцовка');
INSERT INTO `vd_city_lang` VALUES ('4456', 'ua', 'Новотроїцьке');
INSERT INTO `vd_city_lang` VALUES ('4457', 'ua', 'Скадовськ');
INSERT INTO `vd_city_lang` VALUES ('4458', 'ua', 'Херсон');
INSERT INTO `vd_city_lang` VALUES ('4459', 'ua', 'Цурюпинськ');
INSERT INTO `vd_city_lang` VALUES ('4460', 'ua', 'Чаплинка');
INSERT INTO `vd_city_lang` VALUES ('4470', 'ua', 'Ізяслав');
INSERT INTO `vd_city_lang` VALUES ('4461', 'ua', 'Антоніни');
INSERT INTO `vd_city_lang` VALUES ('4463', 'ua', 'Білогірря');
INSERT INTO `vd_city_lang` VALUES ('4462', 'ua', 'Базалія');
INSERT INTO `vd_city_lang` VALUES ('4464', 'ua', 'Віньківці');
INSERT INTO `vd_city_lang` VALUES ('4465', 'ua', 'Волочиськ');
INSERT INTO `vd_city_lang` VALUES ('4466', 'ua', 'Городок');
INSERT INTO `vd_city_lang` VALUES ('4467', 'ua', 'Гриців');
INSERT INTO `vd_city_lang` VALUES ('4468', 'ua', 'Деражня');
INSERT INTO `vd_city_lang` VALUES ('4469', 'ua', 'Дунаївці');
INSERT INTO `vd_city_lang` VALUES ('4472', 'ua', 'Красилів');
INSERT INTO `vd_city_lang` VALUES ('4473', 'ua', 'Летичів');
INSERT INTO `vd_city_lang` VALUES ('4967', 'ua', 'Нетішин');
INSERT INTO `vd_city_lang` VALUES ('4474', 'ua', 'Нова Ушиця');
INSERT INTO `vd_city_lang` VALUES ('4475', 'ua', 'Полонне');
INSERT INTO `vd_city_lang` VALUES ('4476', 'ua', 'Славута');
INSERT INTO `vd_city_lang` VALUES ('4477', 'ua', 'Стара Синявка');
INSERT INTO `vd_city_lang` VALUES ('4478', 'ua', 'Старокостянтинів');
INSERT INTO `vd_city_lang` VALUES ('4479', 'ua', 'Теофіполь');
INSERT INTO `vd_city_lang` VALUES ('4480', 'ua', 'Хмельницький');
INSERT INTO `vd_city_lang` VALUES ('4481', 'ua', 'Чемерівці');
INSERT INTO `vd_city_lang` VALUES ('4482', 'ua', 'Шепетівка');
INSERT INTO `vd_city_lang` VALUES ('4483', 'ua', 'Ярмолинці');
INSERT INTO `vd_city_lang` VALUES ('4487', 'ua', 'Єрки');
INSERT INTO `vd_city_lang` VALUES ('4492', 'ua', 'Ірдинь');
INSERT INTO `vd_city_lang` VALUES ('4484', 'ua', 'Ватутіне');
INSERT INTO `vd_city_lang` VALUES ('4485', 'ua', 'Городище');
INSERT INTO `vd_city_lang` VALUES ('4486', 'ua', 'Драбів');
INSERT INTO `vd_city_lang` VALUES ('4488', 'ua', 'Жашків');
INSERT INTO `vd_city_lang` VALUES ('4490', 'ua', 'Звенигородка');
INSERT INTO `vd_city_lang` VALUES ('4491', 'ua', 'Золотоноша');
INSERT INTO `vd_city_lang` VALUES ('4494', 'ua', 'Катеринопіль');
INSERT INTO `vd_city_lang` VALUES ('1765609', 'ua', 'Кизлiв');
INSERT INTO `vd_city_lang` VALUES ('4495', 'ua', 'Корсунь-Шевченківський');
INSERT INTO `vd_city_lang` VALUES ('4496', 'ua', 'Лисянка');
INSERT INTO `vd_city_lang` VALUES ('4498', 'ua', 'Монастирище');
INSERT INTO `vd_city_lang` VALUES ('4499', 'ua', 'Сміла');
INSERT INTO `vd_city_lang` VALUES ('4500', 'ua', 'Тальне');
INSERT INTO `vd_city_lang` VALUES ('4501', 'ua', 'Умань');
INSERT INTO `vd_city_lang` VALUES ('4502', 'ua', 'Христинівка');
INSERT INTO `vd_city_lang` VALUES ('4503', 'ua', 'Черкаси');
INSERT INTO `vd_city_lang` VALUES ('4505', 'ua', 'Чигирин');
INSERT INTO `vd_city_lang` VALUES ('4504', 'ua', 'Чорнобай');
INSERT INTO `vd_city_lang` VALUES ('4506', 'ua', 'Шпола');
INSERT INTO `vd_city_lang` VALUES ('4516', 'ua', 'Ічня');
INSERT INTO `vd_city_lang` VALUES ('4507', 'ua', 'Батурин');
INSERT INTO `vd_city_lang` VALUES ('4508', 'ua', 'Бахмач');
INSERT INTO `vd_city_lang` VALUES ('4509', 'ua', 'Березна');
INSERT INTO `vd_city_lang` VALUES ('4510', 'ua', 'Бобровиця');
INSERT INTO `vd_city_lang` VALUES ('4511', 'ua', 'Борзна');
INSERT INTO `vd_city_lang` VALUES ('4512', 'ua', 'Варва');
INSERT INTO `vd_city_lang` VALUES ('4513', 'ua', 'Вертіївка');
INSERT INTO `vd_city_lang` VALUES ('4514', 'ua', 'Городня');
INSERT INTO `vd_city_lang` VALUES ('4515', 'ua', 'Замглай');
INSERT INTO `vd_city_lang` VALUES ('4517', 'ua', 'Козелець');
INSERT INTO `vd_city_lang` VALUES ('4518', 'ua', 'Короп');
INSERT INTO `vd_city_lang` VALUES ('4519', 'ua', 'Корюківка');
INSERT INTO `vd_city_lang` VALUES ('4520', 'ua', 'Куликівка');
INSERT INTO `vd_city_lang` VALUES ('4521', 'ua', 'Мена');
INSERT INTO `vd_city_lang` VALUES ('4522', 'ua', 'Ніжин');
INSERT INTO `vd_city_lang` VALUES ('4523', 'ua', 'Новгород-Сіверський');
INSERT INTO `vd_city_lang` VALUES ('4524', 'ua', 'Носівка');
INSERT INTO `vd_city_lang` VALUES ('4525', 'ua', 'Прилуки');
INSERT INTO `vd_city_lang` VALUES ('4526', 'ua', 'Ріпки');
INSERT INTO `vd_city_lang` VALUES ('4527', 'ua', 'Семенівка');
INSERT INTO `vd_city_lang` VALUES ('4528', 'ua', 'Сосниця');
INSERT INTO `vd_city_lang` VALUES ('4529', 'ua', 'Талалаївка');
INSERT INTO `vd_city_lang` VALUES ('4530', 'ua', 'Чернігів');
INSERT INTO `vd_city_lang` VALUES ('4531', 'ua', 'Щорс');
INSERT INTO `vd_city_lang` VALUES ('4532', 'ua', 'Берегомет');
INSERT INTO `vd_city_lang` VALUES ('4533', 'ua', 'Вашківці');
INSERT INTO `vd_city_lang` VALUES ('4534', 'ua', 'Вижниця');
INSERT INTO `vd_city_lang` VALUES ('4535', 'ua', 'Герца');
INSERT INTO `vd_city_lang` VALUES ('4536', 'ua', 'Глибока');
INSERT INTO `vd_city_lang` VALUES ('4537', 'ua', 'Заставна');
INSERT INTO `vd_city_lang` VALUES ('4539', 'ua', 'Кіцмань');
INSERT INTO `vd_city_lang` VALUES ('4538', 'ua', 'Кельменці');
INSERT INTO `vd_city_lang` VALUES ('4540', 'ua', 'Новоселиця');
INSERT INTO `vd_city_lang` VALUES ('4541', 'ua', 'Путила');
INSERT INTO `vd_city_lang` VALUES ('4542', 'ua', 'Сокиряни');
INSERT INTO `vd_city_lang` VALUES ('4543', 'ua', 'Сторожинець');
INSERT INTO `vd_city_lang` VALUES ('4544', 'ua', 'Хотин');
INSERT INTO `vd_city_lang` VALUES ('4545', 'ua', 'Чернівці');
INSERT INTO `vd_city_lang` VALUES ('3916', 'ua', 'П&rsquo;ятихатки');
INSERT INTO `vd_city_lang` VALUES ('3967', 'ua', 'Мар&rsquo;їнка');
INSERT INTO `vd_city_lang` VALUES ('3972', 'ua', 'Слов&rsquo;янськ');
INSERT INTO `vd_city_lang` VALUES ('3996', 'ua', 'Кам&rsquo;яний Брід');
INSERT INTO `vd_city_lang` VALUES ('4019', 'ua', 'Міжгір&rsquo;я');
INSERT INTO `vd_city_lang` VALUES ('4037', 'ua', 'Кам&rsquo;яне');
INSERT INTO `vd_city_lang` VALUES ('4036', 'ua', 'Кам&rsquo;янка-Дніпровська');
INSERT INTO `vd_city_lang` VALUES ('4920', 'ua', 'Краснокам&rsquo;янка');
INSERT INTO `vd_city_lang` VALUES ('4197', 'ua', 'Зимогір&rsquo;я');
INSERT INTO `vd_city_lang` VALUES ('4224', 'ua', 'Слов&rsquo;яносербськ');
INSERT INTO `vd_city_lang` VALUES ('4246', 'ua', 'Кам&rsquo;янка-Бузька');
INSERT INTO `vd_city_lang` VALUES ('4429', 'ua', 'Куп&rsquo;янськ');
INSERT INTO `vd_city_lang` VALUES ('4471', 'ua', 'Кам&rsquo;янець-Подільський');
INSERT INTO `vd_city_lang` VALUES ('4493', 'ua', 'Кам&rsquo;янка');
INSERT INTO `vd_city_lang` VALUES ('3832', 'en', 'Bar');
INSERT INTO `vd_city_lang` VALUES ('3833', 'en', 'Bershad');
INSERT INTO `vd_city_lang` VALUES ('3834', 'en', 'Brailiv');
INSERT INTO `vd_city_lang` VALUES ('3835', 'en', 'Bratslav');
INSERT INTO `vd_city_lang` VALUES ('3862', 'en', 'Chechelnyk');
INSERT INTO `vd_city_lang` VALUES ('3842', 'en', 'Dashiv');
INSERT INTO `vd_city_lang` VALUES ('3840', 'en', 'Haisyn');
INSERT INTO `vd_city_lang` VALUES ('3841', 'en', 'Hnivan');
INSERT INTO `vd_city_lang` VALUES ('3844', 'en', 'Illintsi');
INSERT INTO `vd_city_lang` VALUES ('3846', 'en', 'Kalynivka');
INSERT INTO `vd_city_lang` VALUES ('3861', 'en', 'Khmilnyk');
INSERT INTO `vd_city_lang` VALUES ('3845', 'en', 'Koziatyn');
INSERT INTO `vd_city_lang` VALUES ('3847', 'en', 'Kryzhopil');
INSERT INTO `vd_city_lang` VALUES ('3849', 'en', 'Lityn');
INSERT INTO `vd_city_lang` VALUES ('3848', 'en', 'Lypovets');
INSERT INTO `vd_city_lang` VALUES ('3850', 'en', 'Mohyliv-Podilskyi');
INSERT INTO `vd_city_lang` VALUES ('3851', 'en', 'Murovani Kurylivtsi');
INSERT INTO `vd_city_lang` VALUES ('3852', 'en', 'Nemyriv');
INSERT INTO `vd_city_lang` VALUES ('3853', 'en', 'Orativ');
INSERT INTO `vd_city_lang` VALUES ('3854', 'en', 'Pischanka');
INSERT INTO `vd_city_lang` VALUES ('3855', 'en', 'Pohrebysche');
INSERT INTO `vd_city_lang` VALUES ('3863', 'en', 'Shargorod');
INSERT INTO `vd_city_lang` VALUES ('3856', 'en', 'Teplyk');
INSERT INTO `vd_city_lang` VALUES ('3857', 'en', 'Tomashpil');
INSERT INTO `vd_city_lang` VALUES ('3858', 'en', 'Trostyanets');
INSERT INTO `vd_city_lang` VALUES ('3859', 'en', 'Tulchyn');
INSERT INTO `vd_city_lang` VALUES ('3860', 'en', 'Tyvriv');
INSERT INTO `vd_city_lang` VALUES ('3836', 'en', 'Vapnyarka');
INSERT INTO `vd_city_lang` VALUES ('3837', 'en', 'Vendychany');
INSERT INTO `vd_city_lang` VALUES ('3838', 'en', 'Vinnytsia');
INSERT INTO `vd_city_lang` VALUES ('3839', 'en', 'Voronovytsia');
INSERT INTO `vd_city_lang` VALUES ('3864', 'en', 'Yampil');
INSERT INTO `vd_city_lang` VALUES ('3843', 'en', 'Zhmerynka');
INSERT INTO `vd_city_lang` VALUES ('3865', 'en', 'Berestechko');
INSERT INTO `vd_city_lang` VALUES ('3867', 'en', 'Holoby');
INSERT INTO `vd_city_lang` VALUES ('3868', 'en', 'Holovne');
INSERT INTO `vd_city_lang` VALUES ('3869', 'en', 'Horokhiv');
INSERT INTO `vd_city_lang` VALUES ('3871', 'en', 'Ivanychi');
INSERT INTO `vd_city_lang` VALUES ('3872', 'en', 'Kamin-Kashyrskyi');
INSERT INTO `vd_city_lang` VALUES ('3873', 'en', 'Kivertsi');
INSERT INTO `vd_city_lang` VALUES ('3874', 'en', 'Kovel');
INSERT INTO `vd_city_lang` VALUES ('3878', 'en', 'Liuboml');
INSERT INTO `vd_city_lang` VALUES ('3875', 'en', 'Lokachi');
INSERT INTO `vd_city_lang` VALUES ('3876', 'en', 'Lutsk');
INSERT INTO `vd_city_lang` VALUES ('3877', 'en', 'Lyubeshiv');
INSERT INTO `vd_city_lang` VALUES ('3879', 'en', 'Manevychi');
INSERT INTO `vd_city_lang` VALUES ('3880', 'en', 'Novovolynsk');
INSERT INTO `vd_city_lang` VALUES ('3881', 'en', 'Ratne');
INSERT INTO `vd_city_lang` VALUES ('3882', 'en', 'Rozhysche');
INSERT INTO `vd_city_lang` VALUES ('3883', 'en', 'Stara Vyzhivka');
INSERT INTO `vd_city_lang` VALUES ('3884', 'en', 'Turiisk');
INSERT INTO `vd_city_lang` VALUES ('3866', 'en', 'Volodymyr-Volynskyi');
INSERT INTO `vd_city_lang` VALUES ('3885', 'en', 'Apostolove');
INSERT INTO `vd_city_lang` VALUES ('3886', 'en', 'Auly');
INSERT INTO `vd_city_lang` VALUES ('3887', 'en', 'Brahynivka');
INSERT INTO `vd_city_lang` VALUES ('3895', 'en', 'Demuryne');
INSERT INTO `vd_city_lang` VALUES ('3896', 'en', 'Dniprodzerzhinsk');
INSERT INTO `vd_city_lang` VALUES ('3897', 'en', 'Dnipropetrovsk');
INSERT INTO `vd_city_lang` VALUES ('3894', 'en', 'Hubynykha');
INSERT INTO `vd_city_lang` VALUES ('3892', 'en', 'Hvardiiske');
INSERT INTO `vd_city_lang` VALUES ('3901', 'en', 'Ilarionove');
INSERT INTO `vd_city_lang` VALUES ('3902', 'en', 'Inhulets');
INSERT INTO `vd_city_lang` VALUES ('3903', 'en', 'Kalynine');
INSERT INTO `vd_city_lang` VALUES ('3904', 'en', 'Karnaukhivka');
INSERT INTO `vd_city_lang` VALUES ('3906', 'en', 'Krynychky');
INSERT INTO `vd_city_lang` VALUES ('3905', 'en', 'Kryvyi Rih');
INSERT INTO `vd_city_lang` VALUES ('3907', 'en', 'Mahdalynivka');
INSERT INTO `vd_city_lang` VALUES ('3908', 'en', 'Marhanets');
INSERT INTO `vd_city_lang` VALUES ('3909', 'en', 'Mezhova');
INSERT INTO `vd_city_lang` VALUES ('3910', 'en', 'Nikopol');
INSERT INTO `vd_city_lang` VALUES ('3911', 'en', 'Novomoskovsk');
INSERT INTO `vd_city_lang` VALUES ('3912', 'en', 'Ordzhonikidze');
INSERT INTO `vd_city_lang` VALUES ('3913', 'en', 'Pavlohrad');
INSERT INTO `vd_city_lang` VALUES ('5017', 'en', 'Pershotravensk');
INSERT INTO `vd_city_lang` VALUES ('3914', 'en', 'Petropavlivka');
INSERT INTO `vd_city_lang` VALUES ('3915', 'en', 'Pokrovske');
INSERT INTO `vd_city_lang` VALUES ('3916', 'en', 'Pyatykhatky');
INSERT INTO `vd_city_lang` VALUES ('3921', 'en', 'Shyroke');
INSERT INTO `vd_city_lang` VALUES ('3918', 'en', 'Sofiivka');
INSERT INTO `vd_city_lang` VALUES ('3917', 'en', 'Synelnykove');
INSERT INTO `vd_city_lang` VALUES ('3919', 'en', 'Tomakivka');
INSERT INTO `vd_city_lang` VALUES ('3920', 'en', 'Tsarychanka');
INSERT INTO `vd_city_lang` VALUES ('3888', 'en', 'Vasylkivka');
INSERT INTO `vd_city_lang` VALUES ('3890', 'en', 'Verkhivtseve');
INSERT INTO `vd_city_lang` VALUES ('3889', 'en', 'Verkhnyodniprovsk');
INSERT INTO `vd_city_lang` VALUES ('3891', 'en', 'Vilnohirsk');
INSERT INTO `vd_city_lang` VALUES ('3900', 'en', 'Zelene');
INSERT INTO `vd_city_lang` VALUES ('5116', 'en', 'Zelenodolsk');
INSERT INTO `vd_city_lang` VALUES ('3898', 'en', 'Zhovti Vody');
INSERT INTO `vd_city_lang` VALUES ('3925', 'en', 'Amvrosiivka');
INSERT INTO `vd_city_lang` VALUES ('3926', 'en', 'Andriivka');
INSERT INTO `vd_city_lang` VALUES ('4174', 'en', 'Artemivsk');
INSERT INTO `vd_city_lang` VALUES ('3928', 'en', 'Artemivsk');
INSERT INTO `vd_city_lang` VALUES ('3922', 'en', 'Avdiivka');
INSERT INTO `vd_city_lang` VALUES ('3929', 'en', 'Bezimenne');
INSERT INTO `vd_city_lang` VALUES ('3930', 'en', 'Bilenke');
INSERT INTO `vd_city_lang` VALUES ('3932', 'en', 'Blahodatne');
INSERT INTO `vd_city_lang` VALUES ('3933', 'en', 'Bylbasivka');
INSERT INTO `vd_city_lang` VALUES ('3943', 'en', 'Debaltseve');
INSERT INTO `vd_city_lang` VALUES ('3946', 'en', 'Dobropillya');
INSERT INTO `vd_city_lang` VALUES ('3947', 'en', 'Dokuchaevsk');
INSERT INTO `vd_city_lang` VALUES ('3948', 'en', 'Donetsk');
INSERT INTO `vd_city_lang` VALUES ('3949', 'en', 'Donetske');
INSERT INTO `vd_city_lang` VALUES ('3950', 'en', 'Donske');
INSERT INTO `vd_city_lang` VALUES ('3951', 'en', 'Drobysheve');
INSERT INTO `vd_city_lang` VALUES ('3952', 'en', 'Druzhkivka');
INSERT INTO `vd_city_lang` VALUES ('3945', 'en', 'Dymytrov');
INSERT INTO `vd_city_lang` VALUES ('3944', 'en', 'Dzerzhynsk');
INSERT INTO `vd_city_lang` VALUES ('3939', 'en', 'Horbachevo-Mykhailivka');
INSERT INTO `vd_city_lang` VALUES ('3940', 'en', 'Horlivka');
INSERT INTO `vd_city_lang` VALUES ('3941', 'en', 'Hrodivka');
INSERT INTO `vd_city_lang` VALUES ('3942', 'en', 'Hruzko-Zoryanske');
INSERT INTO `vd_city_lang` VALUES ('3958', 'en', 'Ilovaisk');
INSERT INTO `vd_city_lang` VALUES ('3960', 'en', 'Karlo-Marksove');
INSERT INTO `vd_city_lang` VALUES ('3977', 'en', 'Khartsyzk');
INSERT INTO `vd_city_lang` VALUES ('3961', 'en', 'Kirovsk');
INSERT INTO `vd_city_lang` VALUES ('5087', 'en', 'Kostiantynivka');
INSERT INTO `vd_city_lang` VALUES ('3962', 'en', 'Kramatorsk');
INSERT INTO `vd_city_lang` VALUES ('3963', 'en', 'Krasnoarmiisk');
INSERT INTO `vd_city_lang` VALUES ('3964', 'en', 'Krasnyi Lyman');
INSERT INTO `vd_city_lang` VALUES ('1765574', 'en', 'Makiivka');
INSERT INTO `vd_city_lang` VALUES ('3965', 'en', 'Makiivka');
INSERT INTO `vd_city_lang` VALUES ('3967', 'en', 'Marinka');
INSERT INTO `vd_city_lang` VALUES ('3966', 'en', 'Mariupol');
INSERT INTO `vd_city_lang` VALUES ('3968', 'en', 'Novoazovsk');
INSERT INTO `vd_city_lang` VALUES ('3969', 'en', 'Novoekonomichne');
INSERT INTO `vd_city_lang` VALUES ('3923', 'en', 'Oleksandrivka');
INSERT INTO `vd_city_lang` VALUES ('3924', 'en', 'Oleksievo-Druzhkivka');
INSERT INTO `vd_city_lang` VALUES ('3971', 'en', 'Selydove');
INSERT INTO `vd_city_lang` VALUES ('3978', 'en', 'Shakhtarsk');
INSERT INTO `vd_city_lang` VALUES ('3972', 'en', 'Sloviansk');
INSERT INTO `vd_city_lang` VALUES ('3973', 'en', 'Snizhne');
INSERT INTO `vd_city_lang` VALUES ('3959', 'en', 'Soledar');
INSERT INTO `vd_city_lang` VALUES ('3974', 'en', 'Starobesheve');
INSERT INTO `vd_city_lang` VALUES ('3975', 'en', 'Telmanove');
INSERT INTO `vd_city_lang` VALUES ('3976', 'en', 'Torez');
INSERT INTO `vd_city_lang` VALUES ('3934', 'en', 'Velyka Novosilka');
INSERT INTO `vd_city_lang` VALUES ('3935', 'en', 'Voikovskyi');
INSERT INTO `vd_city_lang` VALUES ('3936', 'en', 'Volnovakha');
INSERT INTO `vd_city_lang` VALUES ('3937', 'en', 'Volodarske');
INSERT INTO `vd_city_lang` VALUES ('5117', 'en', 'Vuhledar');
INSERT INTO `vd_city_lang` VALUES ('3979', 'en', 'Yasynuvata');
INSERT INTO `vd_city_lang` VALUES ('3953', 'en', 'Yenakieve');
INSERT INTO `vd_city_lang` VALUES ('3955', 'en', 'Zhelanne');
INSERT INTO `vd_city_lang` VALUES ('3956', 'en', 'Zuhres');
INSERT INTO `vd_city_lang` VALUES ('3957', 'en', 'Zuivka');
INSERT INTO `vd_city_lang` VALUES ('3980', 'en', 'Andrushivka');
INSERT INTO `vd_city_lang` VALUES ('3981', 'en', 'Baranivka');
INSERT INTO `vd_city_lang` VALUES ('3983', 'en', 'Berdychiv');
INSERT INTO `vd_city_lang` VALUES ('3982', 'en', 'Bila Krynytsia');
INSERT INTO `vd_city_lang` VALUES ('3984', 'en', 'Bronytska Huta');
INSERT INTO `vd_city_lang` VALUES ('3985', 'en', 'Brusyliv');
INSERT INTO `vd_city_lang` VALUES ('3986', 'en', 'Bykivka');
INSERT INTO `vd_city_lang` VALUES ('4010', 'en', 'Cherniakhiv');
INSERT INTO `vd_city_lang` VALUES ('4009', 'en', 'Chervonoarmiisk');
INSERT INTO `vd_city_lang` VALUES ('4360', 'en', 'Chervonoarmiysk');
INSERT INTO `vd_city_lang` VALUES ('4011', 'en', 'Chudniv');
INSERT INTO `vd_city_lang` VALUES ('3992', 'en', 'Dovbysh');
INSERT INTO `vd_city_lang` VALUES ('3991', 'en', 'Dzerzhynsk');
INSERT INTO `vd_city_lang` VALUES ('3989', 'en', 'Horodnytsia');
INSERT INTO `vd_city_lang` VALUES ('3990', 'en', 'Hryshkivtsi');
INSERT INTO `vd_city_lang` VALUES ('3995', 'en', 'Ivanopil');
INSERT INTO `vd_city_lang` VALUES ('3996', 'en', 'Kamyanyi Brid');
INSERT INTO `vd_city_lang` VALUES ('3997', 'en', 'Korosten');
INSERT INTO `vd_city_lang` VALUES ('3998', 'en', 'Korostyshiv');
INSERT INTO `vd_city_lang` VALUES ('3999', 'en', 'Luhyny');
INSERT INTO `vd_city_lang` VALUES ('4000', 'en', 'Lyubar');
INSERT INTO `vd_city_lang` VALUES ('4001', 'en', 'Malyn');
INSERT INTO `vd_city_lang` VALUES ('4002', 'en', 'Narodychi');
INSERT INTO `vd_city_lang` VALUES ('4003', 'en', 'Novohrad-Volynskyi');
INSERT INTO `vd_city_lang` VALUES ('4005', 'en', 'Olevsk');
INSERT INTO `vd_city_lang` VALUES ('4004', 'en', 'Ovruch');
INSERT INTO `vd_city_lang` VALUES ('4006', 'en', 'Popelnya');
INSERT INTO `vd_city_lang` VALUES ('4007', 'en', 'Radomyshl');
INSERT INTO `vd_city_lang` VALUES ('4008', 'en', 'Ruzhyn');
INSERT INTO `vd_city_lang` VALUES ('3987', 'en', 'Velyki Korovyntsi');
INSERT INTO `vd_city_lang` VALUES ('3988', 'en', 'Volodarsk-Volynskyi');
INSERT INTO `vd_city_lang` VALUES ('3993', 'en', 'Yemilchyne');
INSERT INTO `vd_city_lang` VALUES ('3994', 'en', 'Zhytomyr');
INSERT INTO `vd_city_lang` VALUES ('4012', 'en', 'Berehove');
INSERT INTO `vd_city_lang` VALUES ('4013', 'en', 'Bushtyno');
INSERT INTO `vd_city_lang` VALUES ('4027', 'en', 'Chop');
INSERT INTO `vd_city_lang` VALUES ('4018', 'en', 'Irshava');
INSERT INTO `vd_city_lang` VALUES ('4026', 'en', 'Khust');
INSERT INTO `vd_city_lang` VALUES ('4019', 'en', 'Mizhhirya');
INSERT INTO `vd_city_lang` VALUES ('4020', 'en', 'Mukachevo');
INSERT INTO `vd_city_lang` VALUES ('4021', 'en', 'Perechyn');
INSERT INTO `vd_city_lang` VALUES ('4022', 'en', 'Rakhiv');
INSERT INTO `vd_city_lang` VALUES ('4023', 'en', 'Svalyava');
INSERT INTO `vd_city_lang` VALUES ('4024', 'en', 'Tiachiv');
INSERT INTO `vd_city_lang` VALUES ('4025', 'en', 'Uzhhorod');
INSERT INTO `vd_city_lang` VALUES ('4014', 'en', 'Velykyi Bereznyi');
INSERT INTO `vd_city_lang` VALUES ('4015', 'en', 'Velykyi Bychkiv');
INSERT INTO `vd_city_lang` VALUES ('4017', 'en', 'Volovets');
INSERT INTO `vd_city_lang` VALUES ('4016', 'en', 'Vynohradiv');
INSERT INTO `vd_city_lang` VALUES ('4029', 'en', 'Andriivka');
INSERT INTO `vd_city_lang` VALUES ('4030', 'en', 'Balabyne');
INSERT INTO `vd_city_lang` VALUES ('4031', 'en', 'Berdyansk');
INSERT INTO `vd_city_lang` VALUES ('4048', 'en', 'Chernihivka');
INSERT INTO `vd_city_lang` VALUES ('4984', 'en', 'Enerhodar');
INSERT INTO `vd_city_lang` VALUES ('4034', 'en', 'Huliaipole');
INSERT INTO `vd_city_lang` VALUES ('4037', 'en', 'Kamiane');
INSERT INTO `vd_city_lang` VALUES ('4036', 'en', 'Kamianka-Dniprovska');
INSERT INTO `vd_city_lang` VALUES ('4038', 'en', 'Komysh-Zoria');
INSERT INTO `vd_city_lang` VALUES ('4039', 'en', 'Kuibysheve');
INSERT INTO `vd_city_lang` VALUES ('4040', 'en', 'Melitopol');
INSERT INTO `vd_city_lang` VALUES ('4041', 'en', 'Myhailivka');
INSERT INTO `vd_city_lang` VALUES ('4042', 'en', 'Novomykolaivka');
INSERT INTO `vd_city_lang` VALUES ('4043', 'en', 'Orikhiv');
INSERT INTO `vd_city_lang` VALUES ('4044', 'en', 'Polohy');
INSERT INTO `vd_city_lang` VALUES ('4045', 'en', 'Pryazovske');
INSERT INTO `vd_city_lang` VALUES ('4046', 'en', 'Prymorsk');
INSERT INTO `vd_city_lang` VALUES ('4047', 'en', 'Tokmak');
INSERT INTO `vd_city_lang` VALUES ('4032', 'en', 'Vasylivka');
INSERT INTO `vd_city_lang` VALUES ('4033', 'en', 'Vesele');
INSERT INTO `vd_city_lang` VALUES ('4028', 'en', 'Yakymivka');
INSERT INTO `vd_city_lang` VALUES ('4035', 'en', 'Zaporizhia');
INSERT INTO `vd_city_lang` VALUES ('4051', 'en', 'Bilshivtsi');
INSERT INTO `vd_city_lang` VALUES ('4049', 'en', 'Bohorodchany');
INSERT INTO `vd_city_lang` VALUES ('4050', 'en', 'Bolekhiv');
INSERT INTO `vd_city_lang` VALUES ('4052', 'en', 'Broshniv-Osada');
INSERT INTO `vd_city_lang` VALUES ('4053', 'en', 'Bukachivtsi');
INSERT INTO `vd_city_lang` VALUES ('4054', 'en', 'Burshtyn');
INSERT INTO `vd_city_lang` VALUES ('4055', 'en', 'Bytkiv');
INSERT INTO `vd_city_lang` VALUES ('4063', 'en', 'Delyatyn');
INSERT INTO `vd_city_lang` VALUES ('1766192', 'en', 'Dolyna');
INSERT INTO `vd_city_lang` VALUES ('4060', 'en', 'Halych');
INSERT INTO `vd_city_lang` VALUES ('4062', 'en', 'Horodenka');
INSERT INTO `vd_city_lang` VALUES ('4066', 'en', 'Ivano-Frankivsk');
INSERT INTO `vd_city_lang` VALUES ('4068', 'en', 'Kalush');
INSERT INTO `vd_city_lang` VALUES ('4069', 'en', 'Kolomyya');
INSERT INTO `vd_city_lang` VALUES ('4070', 'en', 'Kosiv');
INSERT INTO `vd_city_lang` VALUES ('4071', 'en', 'Nadvirna');
INSERT INTO `vd_city_lang` VALUES ('4072', 'en', 'Nadvirna');
INSERT INTO `vd_city_lang` VALUES ('4073', 'en', 'Rohatyn');
INSERT INTO `vd_city_lang` VALUES ('4074', 'en', 'Rozhnyativ');
INSERT INTO `vd_city_lang` VALUES ('4075', 'en', 'Snyatyn');
INSERT INTO `vd_city_lang` VALUES ('4076', 'en', 'Stanislaviv');
INSERT INTO `vd_city_lang` VALUES ('4077', 'en', 'Tlumach');
INSERT INTO `vd_city_lang` VALUES ('4078', 'en', 'Tysmenytsya');
INSERT INTO `vd_city_lang` VALUES ('4056', 'en', 'Verkhovyna');
INSERT INTO `vd_city_lang` VALUES ('4057', 'en', 'Voinyliv');
INSERT INTO `vd_city_lang` VALUES ('4058', 'en', 'Vorokhta');
INSERT INTO `vd_city_lang` VALUES ('4059', 'en', 'Vyhoda');
INSERT INTO `vd_city_lang` VALUES ('4079', 'en', 'Yaremche');
INSERT INTO `vd_city_lang` VALUES ('4064', 'en', 'Yezupil');
INSERT INTO `vd_city_lang` VALUES ('4065', 'en', 'Zabolotiv');
INSERT INTO `vd_city_lang` VALUES ('4080', 'en', 'Baryshivka');
INSERT INTO `vd_city_lang` VALUES ('4082', 'en', 'Berezan');
INSERT INTO `vd_city_lang` VALUES ('4081', 'en', 'Bila Tserkva');
INSERT INTO `vd_city_lang` VALUES ('4083', 'en', 'Bohuslav');
INSERT INTO `vd_city_lang` VALUES ('4086', 'en', 'Borodyanka');
INSERT INTO `vd_city_lang` VALUES ('4085', 'en', 'Borova');
INSERT INTO `vd_city_lang` VALUES ('4084', 'en', 'Boryspil');
INSERT INTO `vd_city_lang` VALUES ('5081', 'en', 'Boyarka');
INSERT INTO `vd_city_lang` VALUES ('4087', 'en', 'Brovary');
INSERT INTO `vd_city_lang` VALUES ('4113', 'en', 'Chornobyl');
INSERT INTO `vd_city_lang` VALUES ('4092', 'en', 'Dymer');
INSERT INTO `vd_city_lang` VALUES ('4112', 'en', 'Fastiv');
INSERT INTO `vd_city_lang` VALUES ('4091', 'en', 'Hrebinky');
INSERT INTO `vd_city_lang` VALUES ('4095', 'en', 'Irpin');
INSERT INTO `vd_city_lang` VALUES ('4094', 'en', 'Ivankiv');
INSERT INTO `vd_city_lang` VALUES ('4096', 'en', 'Kaharlyk');
INSERT INTO `vd_city_lang` VALUES ('4097', 'en', 'Kalynivka ');
INSERT INTO `vd_city_lang` VALUES ('4098', 'en', 'Kiev');
INSERT INTO `vd_city_lang` VALUES ('4100', 'en', 'Kodra');
INSERT INTO `vd_city_lang` VALUES ('4101', 'en', 'Kozhanka');
INSERT INTO `vd_city_lang` VALUES ('4102', 'en', 'Kozyn');
INSERT INTO `vd_city_lang` VALUES ('4103', 'en', 'Makariv');
INSERT INTO `vd_city_lang` VALUES ('4104', 'en', 'Obukhiv');
INSERT INTO `vd_city_lang` VALUES ('4105', 'en', 'Pereiaslav-Khmelnytskyi');
INSERT INTO `vd_city_lang` VALUES ('4106', 'en', 'Poliske');
INSERT INTO `vd_city_lang` VALUES ('4107', 'en', 'Rokytne');
INSERT INTO `vd_city_lang` VALUES ('4108', 'en', 'Skvyra');
INSERT INTO `vd_city_lang` VALUES ('5024', 'en', 'Slavutych');
INSERT INTO `vd_city_lang` VALUES ('4109', 'en', 'Stavysche');
INSERT INTO `vd_city_lang` VALUES ('4110', 'en', 'Tarashcha');
INSERT INTO `vd_city_lang` VALUES ('4111', 'en', 'Tetiiv');
INSERT INTO `vd_city_lang` VALUES ('4088', 'en', 'Vasylkiv');
INSERT INTO `vd_city_lang` VALUES ('4089', 'en', 'Volodarka');
INSERT INTO `vd_city_lang` VALUES ('4090', 'en', 'Vorzel');
INSERT INTO `vd_city_lang` VALUES ('5076', 'en', 'Vyshhorod');
INSERT INTO `vd_city_lang` VALUES ('4114', 'en', 'Yahotyn');
INSERT INTO `vd_city_lang` VALUES ('4093', 'en', 'Zghurivka');
INSERT INTO `vd_city_lang` VALUES ('1766501', 'en', 'Вишневое');
INSERT INTO `vd_city_lang` VALUES ('1766729', 'en', 'Вишневое');
INSERT INTO `vd_city_lang` VALUES ('1766731', 'en', 'Вишневое');
INSERT INTO `vd_city_lang` VALUES ('4117', 'en', 'Bobrynets');
INSERT INTO `vd_city_lang` VALUES ('4120', 'en', 'Dobrovelychkivka');
INSERT INTO `vd_city_lang` VALUES ('4121', 'en', 'Dolynska');
INSERT INTO `vd_city_lang` VALUES ('4118', 'en', 'Haivoron');
INSERT INTO `vd_city_lang` VALUES ('4119', 'en', 'Holovanivsk');
INSERT INTO `vd_city_lang` VALUES ('4126', 'en', 'Kapitanivka');
INSERT INTO `vd_city_lang` VALUES ('4127', 'en', 'Kirovohrad');
INSERT INTO `vd_city_lang` VALUES ('4128', 'en', 'Kompaniivka');
INSERT INTO `vd_city_lang` VALUES ('4129', 'en', 'Mala Vyska');
INSERT INTO `vd_city_lang` VALUES ('4130', 'en', 'Novhorodka');
INSERT INTO `vd_city_lang` VALUES ('4131', 'en', 'Novoarkhanhelsk');
INSERT INTO `vd_city_lang` VALUES ('4132', 'en', 'Novomyrhorod');
INSERT INTO `vd_city_lang` VALUES ('4133', 'en', 'Novoukrainka');
INSERT INTO `vd_city_lang` VALUES ('4116', 'en', 'Oleksandriya');
INSERT INTO `vd_city_lang` VALUES ('4135', 'en', 'Onufriivka');
INSERT INTO `vd_city_lang` VALUES ('4136', 'en', 'Petrove');
INSERT INTO `vd_city_lang` VALUES ('4137', 'en', 'Svitlovodsk');
INSERT INTO `vd_city_lang` VALUES ('4138', 'en', 'Ulyanovka');
INSERT INTO `vd_city_lang` VALUES ('4139', 'en', 'Ustynivka');
INSERT INTO `vd_city_lang` VALUES ('4134', 'en', 'Vilshanka');
INSERT INTO `vd_city_lang` VALUES ('4122', 'en', 'Yelizavethradka');
INSERT INTO `vd_city_lang` VALUES ('4123', 'en', 'Zavallya');
INSERT INTO `vd_city_lang` VALUES ('4124', 'en', 'Znamyanka');
INSERT INTO `vd_city_lang` VALUES ('4125', 'en', 'Znamyanka Druha');
INSERT INTO `vd_city_lang` VALUES ('1766761', 'en', 'Александровка');
INSERT INTO `vd_city_lang` VALUES ('4141', 'en', 'Alupka');
INSERT INTO `vd_city_lang` VALUES ('4142', 'en', 'Alushta');
INSERT INTO `vd_city_lang` VALUES ('5088', 'en', 'Armyansk');
INSERT INTO `vd_city_lang` VALUES ('4912', 'en', 'Armyansk');
INSERT INTO `vd_city_lang` VALUES ('4143', 'en', 'Baherove');
INSERT INTO `vd_city_lang` VALUES ('4145', 'en', 'Bakhchysaray');
INSERT INTO `vd_city_lang` VALUES ('4914', 'en', 'Berehove');
INSERT INTO `vd_city_lang` VALUES ('4146', 'en', 'Bilohirsk');
INSERT INTO `vd_city_lang` VALUES ('4915', 'en', 'Botanichne');
INSERT INTO `vd_city_lang` VALUES ('4169', 'en', 'Chornomorske');
INSERT INTO `vd_city_lang` VALUES ('4150', 'en', 'Dzhankoy');
INSERT INTO `vd_city_lang` VALUES ('4167', 'en', 'Feodosiya');
INSERT INTO `vd_city_lang` VALUES ('4168', 'en', 'Foros');
INSERT INTO `vd_city_lang` VALUES ('4147', 'en', 'Gaspra');
INSERT INTO `vd_city_lang` VALUES ('4149', 'en', 'Gurzuf');
INSERT INTO `vd_city_lang` VALUES ('4148', 'en', 'Hvardiyske');
INSERT INTO `vd_city_lang` VALUES ('4917', 'en', 'Katsiveli');
INSERT INTO `vd_city_lang` VALUES ('4153', 'en', 'Kerch');
INSERT INTO `vd_city_lang` VALUES ('4918', 'en', 'Koreiz');
INSERT INTO `vd_city_lang` VALUES ('4919', 'en', 'Krasnogvardiysk');
INSERT INTO `vd_city_lang` VALUES ('4155', 'en', 'Krasnogvardiyske');
INSERT INTO `vd_city_lang` VALUES ('4920', 'en', 'Krasnokamyanka');
INSERT INTO `vd_city_lang` VALUES ('4156', 'en', 'Krasnoperekopsk');
INSERT INTO `vd_city_lang` VALUES ('4921', 'en', 'Kurpaty');
INSERT INTO `vd_city_lang` VALUES ('4157', 'en', 'Lenine');
INSERT INTO `vd_city_lang` VALUES ('4922', 'en', 'Livadiya');
INSERT INTO `vd_city_lang` VALUES ('4158', 'en', 'Massandra');
INSERT INTO `vd_city_lang` VALUES ('4923', 'en', 'Miskhor');
INSERT INTO `vd_city_lang` VALUES ('4159', 'en', 'Nyzhnyohirskyi');
INSERT INTO `vd_city_lang` VALUES ('4924', 'en', 'Olyva');
INSERT INTO `vd_city_lang` VALUES ('4925', 'en', 'Opolzneve');
INSERT INTO `vd_city_lang` VALUES ('4926', 'en', 'Parkove');
INSERT INTO `vd_city_lang` VALUES ('4160', 'en', 'Pervomaiske');
INSERT INTO `vd_city_lang` VALUES ('4927', 'en', 'Ponyzivka');
INSERT INTO `vd_city_lang` VALUES ('4162', 'en', 'Saky');
INSERT INTO `vd_city_lang` VALUES ('4928', 'en', 'Sanatorne');
INSERT INTO `vd_city_lang` VALUES ('4163', 'en', 'Sevastopol');
INSERT INTO `vd_city_lang` VALUES ('5052', 'en', 'Shcholkine');
INSERT INTO `vd_city_lang` VALUES ('4929', 'en', 'Simeiz');
INSERT INTO `vd_city_lang` VALUES ('4164', 'en', 'Simferopol');
INSERT INTO `vd_city_lang` VALUES ('4165', 'en', 'Sovetskii');
INSERT INTO `vd_city_lang` VALUES ('4166', 'en', 'Sudak');
INSERT INTO `vd_city_lang` VALUES ('4170', 'en', 'Yalta');
INSERT INTO `vd_city_lang` VALUES ('4151', 'en', 'Yevpatoria  ');
INSERT INTO `vd_city_lang` VALUES ('4152', 'en', 'Zuya');
INSERT INTO `vd_city_lang` VALUES ('4172', 'en', 'Alchevsk');
INSERT INTO `vd_city_lang` VALUES ('4173', 'en', 'Antratsyt');
INSERT INTO `vd_city_lang` VALUES ('3927', 'en', 'Artemove');
INSERT INTO `vd_city_lang` VALUES ('4175', 'en', 'Bairachky');
INSERT INTO `vd_city_lang` VALUES ('4178', 'en', 'Bile');
INSERT INTO `vd_city_lang` VALUES ('4177', 'en', 'Bilohorivka');
INSERT INTO `vd_city_lang` VALUES ('4179', 'en', 'Bilokurakyne');
INSERT INTO `vd_city_lang` VALUES ('4180', 'en', 'Bilolutsk');
INSERT INTO `vd_city_lang` VALUES ('4176', 'en', 'Bilovodsk');
INSERT INTO `vd_city_lang` VALUES ('4181', 'en', 'Biryukovo');
INSERT INTO `vd_city_lang` VALUES ('4182', 'en', 'Bokovo-Platove');
INSERT INTO `vd_city_lang` VALUES ('4183', 'en', 'Borivske');
INSERT INTO `vd_city_lang` VALUES ('4184', 'en', 'Bryanka');
INSERT INTO `vd_city_lang` VALUES ('4185', 'en', 'Buhaivka');
INSERT INTO `vd_city_lang` VALUES ('4194', 'en', 'Heorhiivka');
INSERT INTO `vd_city_lang` VALUES ('4195', 'en', 'Hirske');
INSERT INTO `vd_city_lang` VALUES ('4200', 'en', 'Izvaryne');
INSERT INTO `vd_city_lang` VALUES ('4201', 'en', 'Kalininskii');
INSERT INTO `vd_city_lang` VALUES ('4202', 'en', 'Kalynove');
INSERT INTO `vd_city_lang` VALUES ('4204', 'en', 'Kirovsk');
INSERT INTO `vd_city_lang` VALUES ('4206', 'en', 'Krasnodon');
INSERT INTO `vd_city_lang` VALUES ('4207', 'en', 'Krasnyi Luch');
INSERT INTO `vd_city_lang` VALUES ('4208', 'en', 'Kreminna');
INSERT INTO `vd_city_lang` VALUES ('4210', 'en', 'Luhansk');
INSERT INTO `vd_city_lang` VALUES ('4211', 'en', 'Lutuhyne');
INSERT INTO `vd_city_lang` VALUES ('4209', 'en', 'Lysychansk');
INSERT INTO `vd_city_lang` VALUES ('4212', 'en', 'Markivka');
INSERT INTO `vd_city_lang` VALUES ('4213', 'en', 'Milove');
INSERT INTO `vd_city_lang` VALUES ('4214', 'en', 'Novoaidar');
INSERT INTO `vd_city_lang` VALUES ('4215', 'en', 'Novopskov');
INSERT INTO `vd_city_lang` VALUES ('4171', 'en', 'Oleksandrivsk');
INSERT INTO `vd_city_lang` VALUES ('4217', 'en', 'Perevalsk');
INSERT INTO `vd_city_lang` VALUES ('4216', 'en', 'Pervomaisk');
INSERT INTO `vd_city_lang` VALUES ('4218', 'en', 'Popasna');
INSERT INTO `vd_city_lang` VALUES ('4219', 'en', 'Rovenky');
INSERT INTO `vd_city_lang` VALUES ('4220', 'en', 'Rubizhne');
INSERT INTO `vd_city_lang` VALUES ('4223', 'en', 'Severodonetsk');
INSERT INTO `vd_city_lang` VALUES ('4224', 'en', 'Slovianoserbsk');
INSERT INTO `vd_city_lang` VALUES ('4227', 'en', 'Stakhanov');
INSERT INTO `vd_city_lang` VALUES ('4225', 'en', 'Stanychno-Luhanske');
INSERT INTO `vd_city_lang` VALUES ('4226', 'en', 'Starobilsk');
INSERT INTO `vd_city_lang` VALUES ('4221', 'en', 'Svatove');
INSERT INTO `vd_city_lang` VALUES ('4222', 'en', 'Sverdlovsk');
INSERT INTO `vd_city_lang` VALUES ('4228', 'en', 'Troitske');
INSERT INTO `vd_city_lang` VALUES ('4186', 'en', 'Vakhrusheve');
INSERT INTO `vd_city_lang` VALUES ('4187', 'en', 'Velykyi Loh');
INSERT INTO `vd_city_lang` VALUES ('4188', 'en', 'Vergulivka');
INSERT INTO `vd_city_lang` VALUES ('4189', 'en', 'Volodarsk');
INSERT INTO `vd_city_lang` VALUES ('4190', 'en', 'Vovchoyarivka');
INSERT INTO `vd_city_lang` VALUES ('4192', 'en', 'Vrubivka');
INSERT INTO `vd_city_lang` VALUES ('4193', 'en', 'Vrubivskyi');
INSERT INTO `vd_city_lang` VALUES ('4196', 'en', 'Yesaulivka');
INSERT INTO `vd_city_lang` VALUES ('4198', 'en', 'Zolote');
INSERT INTO `vd_city_lang` VALUES ('4199', 'en', 'Zorynsk');
INSERT INTO `vd_city_lang` VALUES ('4197', 'en', 'Zymohiria');
INSERT INTO `vd_city_lang` VALUES ('1748298', 'en', 'Краснодарський');
INSERT INTO `vd_city_lang` VALUES ('4229', 'en', 'Belz');
INSERT INTO `vd_city_lang` VALUES ('4230', 'en', 'Bibrka');
INSERT INTO `vd_city_lang` VALUES ('4231', 'en', 'Boryslav');
INSERT INTO `vd_city_lang` VALUES ('4232', 'en', 'Brody');
INSERT INTO `vd_city_lang` VALUES ('4233', 'en', 'Busk');
INSERT INTO `vd_city_lang` VALUES ('4262', 'en', 'Chervonograd');
INSERT INTO `vd_city_lang` VALUES ('4239', 'en', 'Dashava');
INSERT INTO `vd_city_lang` VALUES ('4240', 'en', 'Dobrotvir');
INSERT INTO `vd_city_lang` VALUES ('4241', 'en', 'Drohobych');
INSERT INTO `vd_city_lang` VALUES ('4237', 'en', 'Hlynyany');
INSERT INTO `vd_city_lang` VALUES ('4061', 'en', 'Hvozdets');
INSERT INTO `vd_city_lang` VALUES ('4245', 'en', 'Ivano-Frankove');
INSERT INTO `vd_city_lang` VALUES ('4246', 'en', 'Kamianka-Buska');
INSERT INTO `vd_city_lang` VALUES ('4247', 'en', 'Lviv');
INSERT INTO `vd_city_lang` VALUES ('4248', 'en', 'Mostyska');
INSERT INTO `vd_city_lang` VALUES ('4250', 'en', 'Mykolaiv');
INSERT INTO `vd_city_lang` VALUES ('4249', 'en', 'Nesteriv');
INSERT INTO `vd_city_lang` VALUES ('1766197', 'en', 'Novoyavorivsk');
INSERT INTO `vd_city_lang` VALUES ('4251', 'en', 'Peremyshlyany');
INSERT INTO `vd_city_lang` VALUES ('4252', 'en', 'Pustomyty');
INSERT INTO `vd_city_lang` VALUES ('4254', 'en', 'Radekhiv');
INSERT INTO `vd_city_lang` VALUES ('4253', 'en', 'Rava-Ruska');
INSERT INTO `vd_city_lang` VALUES ('4255', 'en', 'Sambir');
INSERT INTO `vd_city_lang` VALUES ('4256', 'en', 'Skole');
INSERT INTO `vd_city_lang` VALUES ('4257', 'en', 'Sokal');
INSERT INTO `vd_city_lang` VALUES ('4258', 'en', 'Staryi Sambir');
INSERT INTO `vd_city_lang` VALUES ('4259', 'en', 'Stryi');
INSERT INTO `vd_city_lang` VALUES ('4260', 'en', 'Truskavets');
INSERT INTO `vd_city_lang` VALUES ('4261', 'en', 'Turka');
INSERT INTO `vd_city_lang` VALUES ('4234', 'en', 'Velyki Mosty');
INSERT INTO `vd_city_lang` VALUES ('4235', 'en', 'Verhnye Synyovydne');
INSERT INTO `vd_city_lang` VALUES ('4236', 'en', 'Vynnyky');
INSERT INTO `vd_city_lang` VALUES ('4263', 'en', 'Yavoriv');
INSERT INTO `vd_city_lang` VALUES ('4242', 'en', 'Zhydachiv');
INSERT INTO `vd_city_lang` VALUES ('4244', 'en', 'Zolochiv');
INSERT INTO `vd_city_lang` VALUES ('1035074', 'en', 'Лопушанка');
INSERT INTO `vd_city_lang` VALUES ('4265', 'en', 'Arbuzynka');
INSERT INTO `vd_city_lang` VALUES ('4266', 'en', 'Bashtanka');
INSERT INTO `vd_city_lang` VALUES ('4267', 'en', 'Bereznehuvate');
INSERT INTO `vd_city_lang` VALUES ('4268', 'en', 'Bratske');
INSERT INTO `vd_city_lang` VALUES ('4272', 'en', 'Domanivka');
INSERT INTO `vd_city_lang` VALUES ('4274', 'en', 'Kazanka');
INSERT INTO `vd_city_lang` VALUES ('4275', 'en', 'Kryve Ozero');
INSERT INTO `vd_city_lang` VALUES ('4276', 'en', 'Mykolaiv');
INSERT INTO `vd_city_lang` VALUES ('4277', 'en', 'Nova Odesa');
INSERT INTO `vd_city_lang` VALUES ('4278', 'en', 'Novyi Bug');
INSERT INTO `vd_city_lang` VALUES ('4279', 'en', 'Ochakiv');
INSERT INTO `vd_city_lang` VALUES ('4264', 'en', 'Oleksandrivka');
INSERT INTO `vd_city_lang` VALUES ('4280', 'en', 'Pervomaisk');
INSERT INTO `vd_city_lang` VALUES ('4281', 'en', 'Snihurivka');
INSERT INTO `vd_city_lang` VALUES ('4270', 'en', 'Veselinove');
INSERT INTO `vd_city_lang` VALUES ('4271', 'en', 'Voznesensk');
INSERT INTO `vd_city_lang` VALUES ('4273', 'en', 'Yelanets');
INSERT INTO `vd_city_lang` VALUES ('5009', 'en', 'Yuzhnoukrainsk');
INSERT INTO `vd_city_lang` VALUES ('4282', 'en', 'Akkerman');
INSERT INTO `vd_city_lang` VALUES ('4283', 'en', 'Ananiv');
INSERT INTO `vd_city_lang` VALUES ('4284', 'en', 'Artsyz');
INSERT INTO `vd_city_lang` VALUES ('4285', 'en', 'Balta');
INSERT INTO `vd_city_lang` VALUES ('4289', 'en', 'Berezivka');
INSERT INTO `vd_city_lang` VALUES ('4288', 'en', 'Berezyne');
INSERT INTO `vd_city_lang` VALUES ('4286', 'en', 'Bilhorod-Dnistrovskyi');
INSERT INTO `vd_city_lang` VALUES ('4287', 'en', 'Bilyaivka');
INSERT INTO `vd_city_lang` VALUES ('4290', 'en', 'Bolhrad');
INSERT INTO `vd_city_lang` VALUES ('4291', 'en', 'Borodine');
INSERT INTO `vd_city_lang` VALUES ('4313', 'en', 'Frunzivka');
INSERT INTO `vd_city_lang` VALUES ('4297', 'en', 'Illichivsk');
INSERT INTO `vd_city_lang` VALUES ('4296', 'en', 'Izmail');
INSERT INTO `vd_city_lang` VALUES ('4298', 'en', 'Kiliya');
INSERT INTO `vd_city_lang` VALUES ('4299', 'en', 'Kodyma');
INSERT INTO `vd_city_lang` VALUES ('4300', 'en', 'Kominternivske');
INSERT INTO `vd_city_lang` VALUES ('4301', 'en', 'Kotovsk');
INSERT INTO `vd_city_lang` VALUES ('4302', 'en', 'Krasni Okny');
INSERT INTO `vd_city_lang` VALUES ('4303', 'en', 'Lyubashivka');
INSERT INTO `vd_city_lang` VALUES ('4304', 'en', 'Mykolaivka');
INSERT INTO `vd_city_lang` VALUES ('4306', 'en', 'Odessa');
INSERT INTO `vd_city_lang` VALUES ('4305', 'en', 'Ovidiopol');
INSERT INTO `vd_city_lang` VALUES ('4308', 'en', 'Reni');
INSERT INTO `vd_city_lang` VALUES ('4307', 'en', 'Rozdilna');
INSERT INTO `vd_city_lang` VALUES ('4310', 'en', 'Sarata');
INSERT INTO `vd_city_lang` VALUES ('4309', 'en', 'Savran');
INSERT INTO `vd_city_lang` VALUES ('4314', 'en', 'Shyryaeve');
INSERT INTO `vd_city_lang` VALUES ('4311', 'en', 'Tarutyne');
INSERT INTO `vd_city_lang` VALUES ('4312', 'en', 'Tatarbunary');
INSERT INTO `vd_city_lang` VALUES ('4292', 'en', 'Velyka Mykhailivka');
INSERT INTO `vd_city_lang` VALUES ('4293', 'en', 'Velykodolynske');
INSERT INTO `vd_city_lang` VALUES ('4294', 'en', 'Vylkove');
INSERT INTO `vd_city_lang` VALUES ('5107', 'en', 'Yuzhne');
INSERT INTO `vd_city_lang` VALUES ('4295', 'en', 'Zatyshshya');
INSERT INTO `vd_city_lang` VALUES ('4315', 'en', 'Bilyky');
INSERT INTO `vd_city_lang` VALUES ('4341', 'en', 'Chornukhy');
INSERT INTO `vd_city_lang` VALUES ('4342', 'en', 'Chutove');
INSERT INTO `vd_city_lang` VALUES ('4322', 'en', 'Dykanka');
INSERT INTO `vd_city_lang` VALUES ('4317', 'en', 'Hadyach');
INSERT INTO `vd_city_lang` VALUES ('4318', 'en', 'Hlobyne');
INSERT INTO `vd_city_lang` VALUES ('4319', 'en', 'Hoholeve');
INSERT INTO `vd_city_lang` VALUES ('4320', 'en', 'Hradizhsk');
INSERT INTO `vd_city_lang` VALUES ('4321', 'en', 'Hrebinka');
INSERT INTO `vd_city_lang` VALUES ('4324', 'en', 'Karlivka');
INSERT INTO `vd_city_lang` VALUES ('4340', 'en', 'Khorol');
INSERT INTO `vd_city_lang` VALUES ('4325', 'en', 'Kobelyaky');
INSERT INTO `vd_city_lang` VALUES ('5095', 'en', 'Komsomolsk');
INSERT INTO `vd_city_lang` VALUES ('4327', 'en', 'Kotelva');
INSERT INTO `vd_city_lang` VALUES ('4326', 'en', 'Kozelshchyna');
INSERT INTO `vd_city_lang` VALUES ('4328', 'en', 'Kremenchuk');
INSERT INTO `vd_city_lang` VALUES ('4329', 'en', 'Lokhvytsya');
INSERT INTO `vd_city_lang` VALUES ('4330', 'en', 'Lubny');
INSERT INTO `vd_city_lang` VALUES ('4331', 'en', 'Mashivka');
INSERT INTO `vd_city_lang` VALUES ('4332', 'en', 'Myrhorod');
INSERT INTO `vd_city_lang` VALUES ('4333', 'en', 'Novi Sanzhary');
INSERT INTO `vd_city_lang` VALUES ('4334', 'en', 'Orzhytsya');
INSERT INTO `vd_city_lang` VALUES ('4337', 'en', 'Poltava');
INSERT INTO `vd_city_lang` VALUES ('4335', 'en', 'Pyryantyn');
INSERT INTO `vd_city_lang` VALUES ('4336', 'en', 'Pyryatyn');
INSERT INTO `vd_city_lang` VALUES ('4338', 'en', 'Reshetylivka');
INSERT INTO `vd_city_lang` VALUES ('4339', 'en', 'Semenivka');
INSERT INTO `vd_city_lang` VALUES ('4343', 'en', 'Shyshaky');
INSERT INTO `vd_city_lang` VALUES ('4316', 'en', 'Velyka Bahachka');
INSERT INTO `vd_city_lang` VALUES ('4346', 'en', 'Demydivka');
INSERT INTO `vd_city_lang` VALUES ('4347', 'en', 'Dubno');
INSERT INTO `vd_city_lang` VALUES ('4348', 'en', 'Dubrovytsya');
INSERT INTO `vd_city_lang` VALUES ('4345', 'en', 'Hoshcha');
INSERT INTO `vd_city_lang` VALUES ('4352', 'en', 'Klesiv');
INSERT INTO `vd_city_lang` VALUES ('4351', 'en', 'Klevan');
INSERT INTO `vd_city_lang` VALUES ('4353', 'en', 'Korets');
INSERT INTO `vd_city_lang` VALUES ('4354', 'en', 'Kostopil');
INSERT INTO `vd_city_lang` VALUES ('4355', 'en', 'Kuznetsovsk');
INSERT INTO `vd_city_lang` VALUES ('4356', 'en', 'Mlyniv');
INSERT INTO `vd_city_lang` VALUES ('4357', 'en', 'Ostroh');
INSERT INTO `vd_city_lang` VALUES ('4358', 'en', 'Rivne');
INSERT INTO `vd_city_lang` VALUES ('4359', 'en', 'Sarny');
INSERT INTO `vd_city_lang` VALUES ('4344', 'en', 'Volodymyrets');
INSERT INTO `vd_city_lang` VALUES ('4349', 'en', 'Zarichne');
INSERT INTO `vd_city_lang` VALUES ('4350', 'en', 'Zdolbuniv');
INSERT INTO `vd_city_lang` VALUES ('4362', 'en', 'Bilopillya');
INSERT INTO `vd_city_lang` VALUES ('4363', 'en', 'Buryn');
INSERT INTO `vd_city_lang` VALUES ('4368', 'en', 'Druzhba');
INSERT INTO `vd_city_lang` VALUES ('4367', 'en', 'Hlukhiv');
INSERT INTO `vd_city_lang` VALUES ('4371', 'en', 'Konotop');
INSERT INTO `vd_city_lang` VALUES ('4372', 'en', 'Krasnopillya');
INSERT INTO `vd_city_lang` VALUES ('4373', 'en', 'Krovelets');
INSERT INTO `vd_city_lang` VALUES ('4370', 'en', 'Kyrykivka');
INSERT INTO `vd_city_lang` VALUES ('4374', 'en', 'Lebedyn');
INSERT INTO `vd_city_lang` VALUES ('4375', 'en', 'Lypova Dolyna');
INSERT INTO `vd_city_lang` VALUES ('4376', 'en', 'Nedryhailiv');
INSERT INTO `vd_city_lang` VALUES ('4361', 'en', 'Okhtyrka');
INSERT INTO `vd_city_lang` VALUES ('4377', 'en', 'Putivl');
INSERT INTO `vd_city_lang` VALUES ('4378', 'en', 'Romny');
INSERT INTO `vd_city_lang` VALUES ('4379', 'en', 'Seredyna-Buda');
INSERT INTO `vd_city_lang` VALUES ('4382', 'en', 'Shostka');
INSERT INTO `vd_city_lang` VALUES ('4380', 'en', 'Sumy');
INSERT INTO `vd_city_lang` VALUES ('4381', 'en', 'Trostyanets');
INSERT INTO `vd_city_lang` VALUES ('4364', 'en', 'Velyka Pysarivka');
INSERT INTO `vd_city_lang` VALUES ('4366', 'en', 'Voronizh');
INSERT INTO `vd_city_lang` VALUES ('4365', 'en', 'Vorozhba');
INSERT INTO `vd_city_lang` VALUES ('4384', 'en', 'Yampil');
INSERT INTO `vd_city_lang` VALUES ('4369', 'en', 'Znob-Novgorodske');
INSERT INTO `vd_city_lang` VALUES ('4385', 'en', 'Berezhany');
INSERT INTO `vd_city_lang` VALUES ('4386', 'en', 'Borshchiv');
INSERT INTO `vd_city_lang` VALUES ('4387', 'en', 'Buchach');
INSERT INTO `vd_city_lang` VALUES ('4406', 'en', 'Chortkiv');
INSERT INTO `vd_city_lang` VALUES ('4390', 'en', 'Hrymailiv');
INSERT INTO `vd_city_lang` VALUES ('4391', 'en', 'Husiatyn');
INSERT INTO `vd_city_lang` VALUES ('4398', 'en', 'Kozliv');
INSERT INTO `vd_city_lang` VALUES ('4399', 'en', 'Kozova');
INSERT INTO `vd_city_lang` VALUES ('4400', 'en', 'Kremenets');
INSERT INTO `vd_city_lang` VALUES ('4401', 'en', 'Lanivtsi');
INSERT INTO `vd_city_lang` VALUES ('4402', 'en', 'Monastyriska');
INSERT INTO `vd_city_lang` VALUES ('4403', 'en', 'Pidvolochysk');
INSERT INTO `vd_city_lang` VALUES ('4407', 'en', 'Shumsk');
INSERT INTO `vd_city_lang` VALUES ('4404', 'en', 'Terebovlya');
INSERT INTO `vd_city_lang` VALUES ('4405', 'en', 'Ternopil');
INSERT INTO `vd_city_lang` VALUES ('4388', 'en', 'Velyki Birky');
INSERT INTO `vd_city_lang` VALUES ('4389', 'en', 'Vyshnivets');
INSERT INTO `vd_city_lang` VALUES ('4392', 'en', 'Zalishchyky');
INSERT INTO `vd_city_lang` VALUES ('4393', 'en', 'Zaliztsi');
INSERT INTO `vd_city_lang` VALUES ('4394', 'en', 'Zbarazh');
INSERT INTO `vd_city_lang` VALUES ('4395', 'en', 'Zboriv');
INSERT INTO `vd_city_lang` VALUES ('4396', 'en', 'Zolotnyky');
INSERT INTO `vd_city_lang` VALUES ('4397', 'en', 'Zolotyi potik');
INSERT INTO `vd_city_lang` VALUES ('4408', 'en', 'Balakliya');
INSERT INTO `vd_city_lang` VALUES ('4409', 'en', 'Barvinkove');
INSERT INTO `vd_city_lang` VALUES ('4412', 'en', 'Birky');
INSERT INTO `vd_city_lang` VALUES ('4410', 'en', 'Blyznyuky');
INSERT INTO `vd_city_lang` VALUES ('4411', 'en', 'Bohodukhiv');
INSERT INTO `vd_city_lang` VALUES ('4413', 'en', 'Borova');
INSERT INTO `vd_city_lang` VALUES ('4414', 'en', 'Budy');
INSERT INTO `vd_city_lang` VALUES ('4436', 'en', 'Chuhuiv');
INSERT INTO `vd_city_lang` VALUES ('4420', 'en', 'Derhachi');
INSERT INTO `vd_city_lang` VALUES ('4419', 'en', 'Huty');
INSERT INTO `vd_city_lang` VALUES ('4424', 'en', 'Izyum');
INSERT INTO `vd_city_lang` VALUES ('4426', 'en', 'Kehychivka');
INSERT INTO `vd_city_lang` VALUES ('4435', 'en', 'Kharkiv');
INSERT INTO `vd_city_lang` VALUES ('4425', 'en', 'Kozacha Lopan');
INSERT INTO `vd_city_lang` VALUES ('4427', 'en', 'Krasnohrad');
INSERT INTO `vd_city_lang` VALUES ('4428', 'en', 'Krasnokutsk');
INSERT INTO `vd_city_lang` VALUES ('4429', 'en', 'Kupyansk');
INSERT INTO `vd_city_lang` VALUES ('4430', 'en', 'Lozova');
INSERT INTO `vd_city_lang` VALUES ('4431', 'en', 'Lyubotyn');
INSERT INTO `vd_city_lang` VALUES ('5073', 'en', 'Merefa');
INSERT INTO `vd_city_lang` VALUES ('4432', 'en', 'Nova Vodolaha');
INSERT INTO `vd_city_lang` VALUES ('4433', 'en', 'Pervomaiskyi');
INSERT INTO `vd_city_lang` VALUES ('5074', 'en', 'Pisochyn');
INSERT INTO `vd_city_lang` VALUES ('4434', 'en', 'Sakhnovshchyna');
INSERT INTO `vd_city_lang` VALUES ('4437', 'en', 'Shevchenkovo');
INSERT INTO `vd_city_lang` VALUES ('4415', 'en', 'Valky');
INSERT INTO `vd_city_lang` VALUES ('4416', 'en', 'Velykyi Burluk');
INSERT INTO `vd_city_lang` VALUES ('4417', 'en', 'Vovchansk');
INSERT INTO `vd_city_lang` VALUES ('4421', 'en', 'Zachepylivka');
INSERT INTO `vd_city_lang` VALUES ('4422', 'en', 'Zidky');
INSERT INTO `vd_city_lang` VALUES ('4418', 'en', 'Zmiiv');
INSERT INTO `vd_city_lang` VALUES ('4423', 'en', 'Zolochiv');
INSERT INTO `vd_city_lang` VALUES ('4438', 'en', 'Askania-Nova');
INSERT INTO `vd_city_lang` VALUES ('4441', 'en', 'Beryslav');
INSERT INTO `vd_city_lang` VALUES ('4439', 'en', 'Bila Krynytsia');
INSERT INTO `vd_city_lang` VALUES ('4440', 'en', 'Bilozerka');
INSERT INTO `vd_city_lang` VALUES ('4460', 'en', 'Chaplynka');
INSERT INTO `vd_city_lang` VALUES ('4449', 'en', 'Dnipryany');
INSERT INTO `vd_city_lang` VALUES ('4446', 'en', 'Henichesk');
INSERT INTO `vd_city_lang` VALUES ('4458', 'en', 'Herson');
INSERT INTO `vd_city_lang` VALUES ('4447', 'en', 'Hola Prystan');
INSERT INTO `vd_city_lang` VALUES ('4448', 'en', 'Hornostaivka');
INSERT INTO `vd_city_lang` VALUES ('4452', 'en', 'Kakhovka');
INSERT INTO `vd_city_lang` VALUES ('4450', 'en', 'Kalanchak');
INSERT INTO `vd_city_lang` VALUES ('4451', 'en', 'Kalininske');
INSERT INTO `vd_city_lang` VALUES ('4454', 'en', 'Nova Kakhovka');
INSERT INTO `vd_city_lang` VALUES ('4456', 'en', 'Novotroitske');
INSERT INTO `vd_city_lang` VALUES ('4455', 'en', 'Novovorontsovka');
INSERT INTO `vd_city_lang` VALUES ('4453', 'en', 'Nyzhni Sirohozy');
INSERT INTO `vd_city_lang` VALUES ('4457', 'en', 'Skadovsk');
INSERT INTO `vd_city_lang` VALUES ('4459', 'en', 'Tsyurupynsk');
INSERT INTO `vd_city_lang` VALUES ('4443', 'en', 'Velyka Lepetykha');
INSERT INTO `vd_city_lang` VALUES ('4442', 'en', 'Velyka Oleksandrivka');
INSERT INTO `vd_city_lang` VALUES ('4444', 'en', 'Verkhnii Rohachyk');
INSERT INTO `vd_city_lang` VALUES ('4445', 'en', 'Vysokopillya');
INSERT INTO `vd_city_lang` VALUES ('4461', 'en', 'Antoniny');
INSERT INTO `vd_city_lang` VALUES ('4462', 'en', 'Bazaliya');
INSERT INTO `vd_city_lang` VALUES ('4463', 'en', 'Bilohirrya');
INSERT INTO `vd_city_lang` VALUES ('4481', 'en', 'Chemerivtsi');
INSERT INTO `vd_city_lang` VALUES ('4468', 'en', 'Derazhnya');
INSERT INTO `vd_city_lang` VALUES ('4469', 'en', 'Dunaivtsi');
INSERT INTO `vd_city_lang` VALUES ('4466', 'en', 'Horodok');
INSERT INTO `vd_city_lang` VALUES ('4467', 'en', 'Hrytsiv');
INSERT INTO `vd_city_lang` VALUES ('4470', 'en', 'Izyaslav');
INSERT INTO `vd_city_lang` VALUES ('4471', 'en', 'Kamyanets-Podilskyi');
INSERT INTO `vd_city_lang` VALUES ('4480', 'en', 'Khmelnytskyi');
INSERT INTO `vd_city_lang` VALUES ('4472', 'en', 'Krasyliv');
INSERT INTO `vd_city_lang` VALUES ('4473', 'en', 'Letychiv');
INSERT INTO `vd_city_lang` VALUES ('4967', 'en', 'Netishyn');
INSERT INTO `vd_city_lang` VALUES ('4474', 'en', 'Nova Ushytsya');
INSERT INTO `vd_city_lang` VALUES ('4475', 'en', 'Polonne');
INSERT INTO `vd_city_lang` VALUES ('4482', 'en', 'Shepetivka');
INSERT INTO `vd_city_lang` VALUES ('4476', 'en', 'Slavuta');
INSERT INTO `vd_city_lang` VALUES ('4477', 'en', 'Stara Synyavka');
INSERT INTO `vd_city_lang` VALUES ('4478', 'en', 'Starokostyantyniv');
INSERT INTO `vd_city_lang` VALUES ('4479', 'en', 'Teofipol');
INSERT INTO `vd_city_lang` VALUES ('4464', 'en', 'Vinkivtsi');
INSERT INTO `vd_city_lang` VALUES ('4465', 'en', 'Volochysk');
INSERT INTO `vd_city_lang` VALUES ('4483', 'en', 'Yarmolyntsi');
INSERT INTO `vd_city_lang` VALUES ('4503', 'en', 'Cherkasy');
INSERT INTO `vd_city_lang` VALUES ('4504', 'en', 'Chornobai');
INSERT INTO `vd_city_lang` VALUES ('4505', 'en', 'Chyhyryn');
INSERT INTO `vd_city_lang` VALUES ('4486', 'en', 'Drabiv');
INSERT INTO `vd_city_lang` VALUES ('4485', 'en', 'Horodyshche');
INSERT INTO `vd_city_lang` VALUES ('4492', 'en', 'Irdyn');
INSERT INTO `vd_city_lang` VALUES ('4493', 'en', 'Kamyanka');
INSERT INTO `vd_city_lang` VALUES ('4494', 'en', 'Katerynopil');
INSERT INTO `vd_city_lang` VALUES ('4502', 'en', 'Khrystynivka');
INSERT INTO `vd_city_lang` VALUES ('1765609', 'en', 'Kizliv');
INSERT INTO `vd_city_lang` VALUES ('4495', 'en', 'Korsun-Shevchenkivskyi');
INSERT INTO `vd_city_lang` VALUES ('4496', 'en', 'Lysyanka');
INSERT INTO `vd_city_lang` VALUES ('4498', 'en', 'Monastyryshche');
INSERT INTO `vd_city_lang` VALUES ('4506', 'en', 'Shpola');
INSERT INTO `vd_city_lang` VALUES ('4499', 'en', 'Smila');
INSERT INTO `vd_city_lang` VALUES ('4500', 'en', 'Talne');
INSERT INTO `vd_city_lang` VALUES ('4501', 'en', 'Uman');
INSERT INTO `vd_city_lang` VALUES ('4484', 'en', 'Vatutine');
INSERT INTO `vd_city_lang` VALUES ('4487', 'en', 'Yerky');
INSERT INTO `vd_city_lang` VALUES ('4488', 'en', 'Zhashkiv');
INSERT INTO `vd_city_lang` VALUES ('4491', 'en', 'Zolotonosha');
INSERT INTO `vd_city_lang` VALUES ('4490', 'en', 'Zvenyhorodka');
INSERT INTO `vd_city_lang` VALUES ('4508', 'en', 'Bakhmach');
INSERT INTO `vd_city_lang` VALUES ('4507', 'en', 'Baturyn');
INSERT INTO `vd_city_lang` VALUES ('4509', 'en', 'Berezna');
INSERT INTO `vd_city_lang` VALUES ('4510', 'en', 'Bobrovytsya');
INSERT INTO `vd_city_lang` VALUES ('4511', 'en', 'Borzna');
INSERT INTO `vd_city_lang` VALUES ('4530', 'en', 'Chernigov');
INSERT INTO `vd_city_lang` VALUES ('4514', 'en', 'Horodnya');
INSERT INTO `vd_city_lang` VALUES ('4516', 'en', 'Ichnya');
INSERT INTO `vd_city_lang` VALUES ('4518', 'en', 'Korop');
INSERT INTO `vd_city_lang` VALUES ('4519', 'en', 'Koryukivka');
INSERT INTO `vd_city_lang` VALUES ('4517', 'en', 'Kozelets');
INSERT INTO `vd_city_lang` VALUES ('4520', 'en', 'Kulykivka');
INSERT INTO `vd_city_lang` VALUES ('4521', 'en', 'Mena');
INSERT INTO `vd_city_lang` VALUES ('4522', 'en', 'Nizhyn');
INSERT INTO `vd_city_lang` VALUES ('4524', 'en', 'Nosivka');
INSERT INTO `vd_city_lang` VALUES ('4523', 'en', 'Novhorod-Siverskyi');
INSERT INTO `vd_city_lang` VALUES ('4525', 'en', 'Pryluky');
INSERT INTO `vd_city_lang` VALUES ('4526', 'en', 'Ripky');
INSERT INTO `vd_city_lang` VALUES ('4527', 'en', 'Semenivka');
INSERT INTO `vd_city_lang` VALUES ('4531', 'en', 'Shchors');
INSERT INTO `vd_city_lang` VALUES ('4528', 'en', 'Sosnytsya');
INSERT INTO `vd_city_lang` VALUES ('4529', 'en', 'Talalaivka');
INSERT INTO `vd_city_lang` VALUES ('4512', 'en', 'Varva');
INSERT INTO `vd_city_lang` VALUES ('4513', 'en', 'Vertiivka');
INSERT INTO `vd_city_lang` VALUES ('4515', 'en', 'Zamhlai');
INSERT INTO `vd_city_lang` VALUES ('4532', 'en', 'Berehomet');
INSERT INTO `vd_city_lang` VALUES ('4545', 'en', 'Chernivtsi');
INSERT INTO `vd_city_lang` VALUES ('4535', 'en', 'Hertsa');
INSERT INTO `vd_city_lang` VALUES ('4536', 'en', 'Hlyboka');
INSERT INTO `vd_city_lang` VALUES ('4538', 'en', 'Kelmentsi');
INSERT INTO `vd_city_lang` VALUES ('4544', 'en', 'Khotyn');
INSERT INTO `vd_city_lang` VALUES ('4539', 'en', 'Kitsman');
INSERT INTO `vd_city_lang` VALUES ('4540', 'en', 'Novoselytsia');
INSERT INTO `vd_city_lang` VALUES ('4541', 'en', 'Putyla');
INSERT INTO `vd_city_lang` VALUES ('4542', 'en', 'Sokyryany');
INSERT INTO `vd_city_lang` VALUES ('4543', 'en', 'Storozhynets');
INSERT INTO `vd_city_lang` VALUES ('4533', 'en', 'Vashkivtsi');
INSERT INTO `vd_city_lang` VALUES ('4534', 'en', 'Vyzhnytsia');
INSERT INTO `vd_city_lang` VALUES ('4537', 'en', 'Zastavna');

-- ----------------------------
-- Table structure for vd_region
-- ----------------------------
DROP TABLE IF EXISTS `vd_region`;
CREATE TABLE `vd_region` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `db_rootid` int(11) NOT NULL DEFAULT '0',
  `db_defnamelang` varchar(100) NOT NULL,
  `db_sortindex` int(10) NOT NULL DEFAULT '0',
  `db_timecreation` int(10) unsigned NOT NULL DEFAULT '0',
  `db_timelastedit` int(10) unsigned NOT NULL DEFAULT '0',
  `db_enabled` enum('0','1') NOT NULL DEFAULT '1',
  `db_deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=376 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vd_region
-- ----------------------------
INSERT INTO `vd_region` VALUES ('279', '62', 'Винницкая обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('280', '62', 'Волынская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('281', '62', 'Днепропетровская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('282', '62', 'Донецкая обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('283', '62', 'Житомирская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('284', '62', 'Закарпатская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('285', '62', 'Запорожская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('286', '62', 'Ивано-Франковская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('287', '62', 'Киевская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('288', '62', 'Кировоградская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('289', '62', 'Крымская Автономная Республика', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('290', '62', 'Луганская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('291', '62', 'Львовская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('292', '62', 'Николаевская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('293', '62', 'Одесская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('294', '62', 'Полтавская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('295', '62', 'Ровенская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('296', '62', 'Сумская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('297', '62', 'Тернопольская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('298', '62', 'Харьковская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('299', '62', 'Херсонская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('300', '62', 'Хмельницкая обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('301', '62', 'Черкасская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('302', '62', 'Черниговская обл.', '0', '1374134216', '1374134216', '1', '0');
INSERT INTO `vd_region` VALUES ('303', '62', 'Черновицкая обл.', '0', '1374134216', '1374134216', '1', '0');

-- ----------------------------
-- Table structure for vd_region_lang
-- ----------------------------
DROP TABLE IF EXISTS `vd_region_lang`;
CREATE TABLE `vd_region_lang` (
  `db_rid` int(10) unsigned NOT NULL,
  `db_lang` varchar(20) NOT NULL,
  `db_namelang` varchar(100) NOT NULL,
  PRIMARY KEY (`db_rid`,`db_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vd_region_lang
-- ----------------------------
INSERT INTO `vd_region_lang` VALUES ('279', 'ru', 'Винницкая обл.');
INSERT INTO `vd_region_lang` VALUES ('280', 'ru', 'Волынская обл.');
INSERT INTO `vd_region_lang` VALUES ('281', 'ru', 'Днепропетровская обл.');
INSERT INTO `vd_region_lang` VALUES ('282', 'ru', 'Донецкая обл.');
INSERT INTO `vd_region_lang` VALUES ('283', 'ru', 'Житомирская обл.');
INSERT INTO `vd_region_lang` VALUES ('284', 'ru', 'Закарпатская обл.');
INSERT INTO `vd_region_lang` VALUES ('285', 'ru', 'Запорожская обл.');
INSERT INTO `vd_region_lang` VALUES ('286', 'ru', 'Ивано-Франковская обл.');
INSERT INTO `vd_region_lang` VALUES ('287', 'ru', 'Киевская обл.');
INSERT INTO `vd_region_lang` VALUES ('288', 'ru', 'Кировоградская обл.');
INSERT INTO `vd_region_lang` VALUES ('289', 'ru', 'Крымская Автономная Республика');
INSERT INTO `vd_region_lang` VALUES ('290', 'ru', 'Луганская обл.');
INSERT INTO `vd_region_lang` VALUES ('291', 'ru', 'Львовская обл.');
INSERT INTO `vd_region_lang` VALUES ('292', 'ru', 'Николаевская обл.');
INSERT INTO `vd_region_lang` VALUES ('293', 'ru', 'Одесская обл.');
INSERT INTO `vd_region_lang` VALUES ('294', 'ru', 'Полтавская обл.');
INSERT INTO `vd_region_lang` VALUES ('295', 'ru', 'Ровенская обл.');
INSERT INTO `vd_region_lang` VALUES ('296', 'ru', 'Сумская обл.');
INSERT INTO `vd_region_lang` VALUES ('297', 'ru', 'Тернопольская обл.');
INSERT INTO `vd_region_lang` VALUES ('298', 'ru', 'Харьковская обл.');
INSERT INTO `vd_region_lang` VALUES ('299', 'ru', 'Херсонская обл.');
INSERT INTO `vd_region_lang` VALUES ('300', 'ru', 'Хмельницкая обл.');
INSERT INTO `vd_region_lang` VALUES ('301', 'ru', 'Черкасская обл.');
INSERT INTO `vd_region_lang` VALUES ('302', 'ru', 'Черниговская обл.');
INSERT INTO `vd_region_lang` VALUES ('303', 'ru', 'Черновицкая обл.');
INSERT INTO `vd_region_lang` VALUES ('286', 'ua', 'Івано-Франківська область');
INSERT INTO `vd_region_lang` VALUES ('279', 'ua', 'Вінницька область');
INSERT INTO `vd_region_lang` VALUES ('280', 'ua', 'Волинська область');
INSERT INTO `vd_region_lang` VALUES ('281', 'ua', 'Дніпропетровська область');
INSERT INTO `vd_region_lang` VALUES ('282', 'ua', 'Донецька область');
INSERT INTO `vd_region_lang` VALUES ('283', 'ua', 'Житомирська область');
INSERT INTO `vd_region_lang` VALUES ('284', 'ua', 'Закарпатська область');
INSERT INTO `vd_region_lang` VALUES ('285', 'ua', 'Запорізька область');
INSERT INTO `vd_region_lang` VALUES ('288', 'ua', 'Кіровоградська область');
INSERT INTO `vd_region_lang` VALUES ('287', 'ua', 'Київська область');
INSERT INTO `vd_region_lang` VALUES ('289', 'ua', 'Кримська Автономна Республіка');
INSERT INTO `vd_region_lang` VALUES ('290', 'ua', 'Луганська область');
INSERT INTO `vd_region_lang` VALUES ('291', 'ua', 'Львівська область');
INSERT INTO `vd_region_lang` VALUES ('292', 'ua', 'Миколаївська область');
INSERT INTO `vd_region_lang` VALUES ('293', 'ua', 'Одеська область');
INSERT INTO `vd_region_lang` VALUES ('294', 'ua', 'Полтавська область');
INSERT INTO `vd_region_lang` VALUES ('295', 'ua', 'Рівненська область');
INSERT INTO `vd_region_lang` VALUES ('296', 'ua', 'Сумська область');
INSERT INTO `vd_region_lang` VALUES ('297', 'ua', 'Тернопільська область');
INSERT INTO `vd_region_lang` VALUES ('298', 'ua', 'Харківська область');
INSERT INTO `vd_region_lang` VALUES ('299', 'ua', 'Херсонська область');
INSERT INTO `vd_region_lang` VALUES ('300', 'ua', 'Хмельницька область');
INSERT INTO `vd_region_lang` VALUES ('301', 'ua', 'Черкаська область');
INSERT INTO `vd_region_lang` VALUES ('303', 'ua', 'Чернівецька область');
INSERT INTO `vd_region_lang` VALUES ('302', 'ua', 'Чернігівська область');
INSERT INTO `vd_region_lang` VALUES ('301', 'en', 'Cherkassy Oblast');
INSERT INTO `vd_region_lang` VALUES ('302', 'en', 'Chernihiv Oblast');
INSERT INTO `vd_region_lang` VALUES ('303', 'en', 'Chernivtsi Oblast');
INSERT INTO `vd_region_lang` VALUES ('281', 'en', 'Dnipropetrovsk Oblast');
INSERT INTO `vd_region_lang` VALUES ('282', 'en', 'Donetsk oblast');
INSERT INTO `vd_region_lang` VALUES ('286', 'en', 'Ivano-Frankivsk Oblast');
INSERT INTO `vd_region_lang` VALUES ('298', 'en', 'Kharkiv Oblast');
INSERT INTO `vd_region_lang` VALUES ('299', 'en', 'Kherson Oblast');
INSERT INTO `vd_region_lang` VALUES ('300', 'en', 'Khmelnytskyi Oblast');
INSERT INTO `vd_region_lang` VALUES ('288', 'en', 'Kirovohrad Oblast');
INSERT INTO `vd_region_lang` VALUES ('289', 'en', 'Krymskaya obl.');
INSERT INTO `vd_region_lang` VALUES ('287', 'en', 'Kyiv Oblast');
INSERT INTO `vd_region_lang` VALUES ('290', 'en', 'Luganskaya obl.');
INSERT INTO `vd_region_lang` VALUES ('291', 'en', 'Lvovskaya obl.');
INSERT INTO `vd_region_lang` VALUES ('292', 'en', 'Mykolaiv oblast');
INSERT INTO `vd_region_lang` VALUES ('293', 'en', 'Odessa Oblast');
INSERT INTO `vd_region_lang` VALUES ('294', 'en', 'Poltava Oblast');
INSERT INTO `vd_region_lang` VALUES ('295', 'en', 'Rivne Oblast');
INSERT INTO `vd_region_lang` VALUES ('296', 'en', 'Sumy Oblast');
INSERT INTO `vd_region_lang` VALUES ('297', 'en', 'Ternopolskaya obl.');
INSERT INTO `vd_region_lang` VALUES ('279', 'en', 'Vinnytsia Oblast');
INSERT INTO `vd_region_lang` VALUES ('280', 'en', 'Volyn Oblast');
INSERT INTO `vd_region_lang` VALUES ('284', 'en', 'Zakarpatskaya obl.');
INSERT INTO `vd_region_lang` VALUES ('285', 'en', 'Zaporozhskaya obl.');
INSERT INTO `vd_region_lang` VALUES ('283', 'en', 'Zhytomyr oblast');

-- ----------------------------
-- Table structure for weight_types
-- ----------------------------
DROP TABLE IF EXISTS `weight_types`;
CREATE TABLE `weight_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of weight_types
-- ----------------------------
INSERT INTO `weight_types` VALUES ('1', 'liter', '2017-08-14 09:13:59', '2017-08-14 09:13:59', null);
INSERT INTO `weight_types` VALUES ('2', 'kg', '2017-08-14 09:15:49', '2017-08-14 09:15:49', null);
INSERT INTO `weight_types` VALUES ('3', 'gram', '2017-08-14 09:16:16', '2017-08-14 09:16:16', null);
INSERT INTO `weight_types` VALUES ('4', 'thing', '2017-08-14 09:17:00', '2017-08-14 09:17:25', null);
SET FOREIGN_KEY_CHECKS=1;
