/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.37-0ubuntu0.18.04.1 : Database - ggtc_cfs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ggtc_cfs` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ggtc_cfs`;

/*Table structure for table `companies` */

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `companies` */

insert  into `companies`(`id`,`name`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Accenture','2022-03-17 09:35:04','2022-03-17 09:35:04',NULL),
(2,'DesignBlue Manila','2022-03-17 09:35:14','2022-03-17 09:35:14',NULL);

/*Table structure for table `cost_estimations` */

DROP TABLE IF EXISTS `cost_estimations`;

CREATE TABLE `cost_estimations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL,
  `low` bigint(20) DEFAULT NULL,
  `average` bigint(20) DEFAULT NULL,
  `high` bigint(20) DEFAULT NULL,
  `consumption` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cost_estimations_country_id_foreign` (`country_id`),
  CONSTRAINT `cost_estimations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cost_estimations` */

insert  into `cost_estimations`(`id`,`country_id`,`low`,`average`,`high`,`consumption`,`created_at`,`updated_at`,`deleted_at`) values 
(1,251,199900,219900,319900,1000,'2022-03-17 09:35:23','2022-03-17 09:35:23',NULL),
(2,252,199900,219900,319900,1000,'2022-03-17 09:35:36','2022-03-17 09:35:36',NULL);

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` blob NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `countries` */

insert  into `countries`(`id`,`name`,`iso2`,`iso3`,`flag`,`currency`,`region`,`publish`,`deleted_at`,`created_at`,`updated_at`) values 
(1,'Afghanistan','AF','AFG','🇦🇫','AFN','Asia',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(2,'Aland Islands','AX','ALA','🇦🇽','EUR','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(3,'Albania','AL','ALB','🇦🇱','ALL','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(4,'Algeria','DZ','DZA','🇩🇿','DZD','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(5,'American Samoa','AS','ASM','🇦🇸','USD','Oceania',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(6,'Andorra','AD','AND','🇦🇩','EUR','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(7,'Angola','AO','AGO','🇦🇴','AOA','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(8,'Anguilla','AI','AIA','🇦🇮','XCD','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(9,'Antarctica','AQ','ATA','🇦🇶','AAD','Polar',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(10,'Antigua And Barbuda','AG','ATG','🇦🇬','XCD','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(11,'Argentina','AR','ARG','🇦🇷','ARS','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(12,'Armenia','AM','ARM','🇦🇲','AMD','Asia',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(13,'Aruba','AW','ABW','🇦🇼','AWG','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(14,'Australia','AU','AUS','🇦🇺','AUD','Oceania',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(15,'Austria','AT','AUT','🇦🇹','EUR','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(16,'Azerbaijan','AZ','AZE','🇦🇿','AZN','Asia',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(17,'Bahamas The','BS','BHS','🇧🇸','BSD','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(18,'Bahrain','BH','BHR','🇧🇭','BHD','Asia',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(19,'Bangladesh','BD','BGD','🇧🇩','BDT','Asia',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(20,'Barbados','BB','BRB','🇧🇧','BBD','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(21,'Belarus','BY','BLR','🇧🇾','BYN','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(22,'Belgium','BE','BEL','🇧🇪','EUR','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(23,'Belize','BZ','BLZ','🇧🇿','BZD','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(24,'Benin','BJ','BEN','🇧🇯','XOF','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(25,'Bermuda','BM','BMU','🇧🇲','BMD','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(26,'Bhutan','BT','BTN','🇧🇹','BTN','Asia',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(27,'Bolivia','BO','BOL','🇧🇴','BOB','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(28,'Bonaire, Sint Eustatius and Saba','BQ','BES','🇧🇶','USD','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(29,'Bosnia and Herzegovina','BA','BIH','🇧🇦','BAM','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(30,'Botswana','BW','BWA','🇧🇼','BWP','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(31,'Bouvet Island','BV','BVT','🇧🇻','NOK',NULL,0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(32,'Brazil','BR','BRA','🇧🇷','BRL','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(33,'British Indian Ocean Territory','IO','IOT','🇮🇴','USD','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(34,'Brunei','BN','BRN','🇧🇳','BND','Asia',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(35,'Bulgaria','BG','BGR','🇧🇬','BGN','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(36,'Burkina Faso','BF','BFA','🇧🇫','XOF','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(37,'Burundi','BI','BDI','🇧🇮','BIF','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(38,'Cambodia','KH','KHM','🇰🇭','KHR','Asia',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(39,'Cameroon','CM','CMR','🇨🇲','XAF','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(40,'Canada','CA','CAN','🇨🇦','CAD','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(41,'Cape Verde','CV','CPV','🇨🇻','CVE','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(42,'Cayman Islands','KY','CYM','🇰🇾','KYD','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(43,'Central African Republic','CF','CAF','🇨🇫','XAF','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(44,'Chad','TD','TCD','🇹🇩','XAF','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(45,'Chile','CL','CHL','🇨🇱','CLP','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(46,'China','CN','CHN','🇨🇳','CNY','Asia',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(47,'Christmas Island','CX','CXR','🇨🇽','AUD','Oceania',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(48,'Cocos (Keeling) Islands','CC','CCK','🇨🇨','AUD','Oceania',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(49,'Colombia','CO','COL','🇨🇴','COP','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(50,'Comoros','KM','COM','🇰🇲','KMF','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(51,'Congo','CG','COG','🇨🇬','XAF','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(52,'Cook Islands','CK','COK','🇨🇰','NZD','Oceania',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(53,'Costa Rica','CR','CRI','🇨🇷','CRC','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(54,'Cote D\'Ivoire (Ivory Coast)','CI','CIV','🇨🇮','XOF','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(55,'Croatia','HR','HRV','🇭🇷','HRK','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(56,'Cuba','CU','CUB','🇨🇺','CUP','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(57,'Curaçao','CW','CUW','🇨🇼','ANG','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(58,'Cyprus','CY','CYP','🇨🇾','EUR','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(59,'Czech Republic','CZ','CZE','🇨🇿','CZK','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(60,'Democratic Republic of the Congo','CD','COD','🇨🇩','CDF','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(61,'Denmark','DK','DNK','🇩🇰','DKK','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(62,'Djibouti','DJ','DJI','🇩🇯','DJF','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(63,'Dominica','DM','DMA','🇩🇲','XCD','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(64,'Dominican Republic','DO','DOM','🇩🇴','DOP','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(65,'East Timor','TL','TLS','🇹🇱','USD','Asia',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(66,'Ecuador','EC','ECU','🇪🇨','USD','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(67,'Egypt','EG','EGY','🇪🇬','EGP','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(68,'El Salvador','SV','SLV','🇸🇻','USD','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(69,'Equatorial Guinea','GQ','GNQ','🇬🇶','XAF','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(70,'Eritrea','ER','ERI','🇪🇷','ERN','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(71,'Estonia','EE','EST','🇪🇪','EUR','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(72,'Ethiopia','ET','ETH','🇪🇹','ETB','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(73,'Falkland Islands','FK','FLK','🇫🇰','FKP','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(74,'Faroe Islands','FO','FRO','🇫🇴','DKK','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(75,'Fiji Islands','FJ','FJI','🇫🇯','FJD','Oceania',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(76,'Finland','FI','FIN','🇫🇮','EUR','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(77,'France','FR','FRA','🇫🇷','EUR','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(78,'French Guiana','GF','GUF','🇬🇫','EUR','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(79,'French Polynesia','PF','PYF','🇵🇫','XPF','Oceania',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(80,'French Southern Territories','TF','ATF','🇹🇫','EUR','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(81,'Gabon','GA','GAB','🇬🇦','XAF','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(82,'Gambia The','GM','GMB','🇬🇲','GMD','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(83,'Georgia','GE','GEO','🇬🇪','GEL','Asia',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(84,'Germany','DE','DEU','🇩🇪','EUR','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(85,'Ghana','GH','GHA','🇬🇭','GHS','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(86,'Gibraltar','GI','GIB','🇬🇮','GIP','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(87,'Greece','GR','GRC','🇬🇷','EUR','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(88,'Greenland','GL','GRL','🇬🇱','DKK','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(89,'Grenada','GD','GRD','🇬🇩','XCD','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(90,'Guadeloupe','GP','GLP','🇬🇵','EUR','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(91,'Guam','GU','GUM','🇬🇺','USD','Oceania',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(92,'Guatemala','GT','GTM','🇬🇹','GTQ','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(93,'Guernsey and Alderney','GG','GGY','🇬🇬','GBP','Europe',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(94,'Guinea','GN','GIN','🇬🇳','GNF','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(95,'Guinea-Bissau','GW','GNB','🇬🇼','XOF','Africa',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(96,'Guyana','GY','GUY','🇬🇾','GYD','Americas',0,NULL,'2022-03-17 09:34:58','2022-03-17 09:34:58'),
(97,'Haiti','HT','HTI','🇭🇹','HTG','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(98,'Heard Island and McDonald Islands','HM','HMD','🇭🇲','AUD',NULL,0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(99,'Honduras','HN','HND','🇭🇳','HNL','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(100,'Hong Kong S.A.R.','HK','HKG','🇭🇰','HKD','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(101,'Hungary','HU','HUN','🇭🇺','HUF','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(102,'Iceland','IS','ISL','🇮🇸','ISK','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(103,'India','IN','IND','🇮🇳','INR','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(104,'Indonesia','ID','IDN','🇮🇩','IDR','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(105,'Iran','IR','IRN','🇮🇷','IRR','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(106,'Iraq','IQ','IRQ','🇮🇶','IQD','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(107,'Ireland','IE','IRL','🇮🇪','EUR','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(108,'Israel','IL','ISR','🇮🇱','ILS','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(109,'Italy','IT','ITA','🇮🇹','EUR','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(110,'Jamaica','JM','JAM','🇯🇲','JMD','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(111,'Japan','JP','JPN','🇯🇵','JPY','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(112,'Jersey','JE','JEY','🇯🇪','GBP','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(113,'Jordan','JO','JOR','🇯🇴','JOD','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(114,'Kazakhstan','KZ','KAZ','🇰🇿','KZT','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(115,'Kenya','KE','KEN','🇰🇪','KES','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(116,'Kiribati','KI','KIR','🇰🇮','AUD','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(117,'Kosovo','XK','XKX','🇽🇰','EUR','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(118,'Kuwait','KW','KWT','🇰🇼','KWD','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(119,'Kyrgyzstan','KG','KGZ','🇰🇬','KGS','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(120,'Laos','LA','LAO','🇱🇦','LAK','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(121,'Latvia','LV','LVA','🇱🇻','EUR','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(122,'Lebanon','LB','LBN','🇱🇧','LBP','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(123,'Lesotho','LS','LSO','🇱🇸','LSL','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(124,'Liberia','LR','LBR','🇱🇷','LRD','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(125,'Libya','LY','LBY','🇱🇾','LYD','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(126,'Liechtenstein','LI','LIE','🇱🇮','CHF','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(127,'Lithuania','LT','LTU','🇱🇹','EUR','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(128,'Luxembourg','LU','LUX','🇱🇺','EUR','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(129,'Macau S.A.R.','MO','MAC','🇲🇴','MOP','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(130,'Macedonia','MK','MKD','🇲🇰','MKD','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(131,'Madagascar','MG','MDG','🇲🇬','MGA','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(132,'Malawi','MW','MWI','🇲🇼','MWK','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(133,'Malaysia','MY','MYS','🇲🇾','MYR','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(134,'Maldives','MV','MDV','🇲🇻','MVR','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(135,'Mali','ML','MLI','🇲🇱','XOF','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(136,'Malta','MT','MLT','🇲🇹','EUR','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(137,'Man (Isle of)','IM','IMN','🇮🇲','GBP','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(138,'Marshall Islands','MH','MHL','🇲🇭','USD','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(139,'Martinique','MQ','MTQ','🇲🇶','EUR','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(140,'Mauritania','MR','MRT','🇲🇷','MRO','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(141,'Mauritius','MU','MUS','🇲🇺','MUR','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(142,'Mayotte','YT','MYT','🇾🇹','EUR','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(143,'Mexico','MX','MEX','🇲🇽','MXN','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(144,'Micronesia','FM','FSM','🇫🇲','USD','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(145,'Moldova','MD','MDA','🇲🇩','MDL','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(146,'Monaco','MC','MCO','🇲🇨','EUR','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(147,'Mongolia','MN','MNG','🇲🇳','MNT','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(148,'Montenegro','ME','MNE','🇲🇪','EUR','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(149,'Montserrat','MS','MSR','🇲🇸','XCD','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(150,'Morocco','MA','MAR','🇲🇦','MAD','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(151,'Mozambique','MZ','MOZ','🇲🇿','MZN','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(152,'Myanmar','MM','MMR','🇲🇲','MMK','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(153,'Namibia','NA','NAM','🇳🇦','NAD','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(154,'Nauru','NR','NRU','🇳🇷','AUD','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(155,'Nepal','NP','NPL','🇳🇵','NPR','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(156,'Netherlands','NL','NLD','🇳🇱','EUR','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(157,'New Caledonia','NC','NCL','🇳🇨','XPF','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(158,'New Zealand','NZ','NZL','🇳🇿','NZD','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(159,'Nicaragua','NI','NIC','🇳🇮','NIO','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(160,'Niger','NE','NER','🇳🇪','XOF','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(161,'Nigeria','NG','NGA','🇳🇬','NGN','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(162,'Niue','NU','NIU','🇳🇺','NZD','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(163,'Norfolk Island','NF','NFK','🇳🇫','AUD','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(164,'North Korea','KP','PRK','🇰🇵','KPW','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(165,'Northern Mariana Islands','MP','MNP','🇲🇵','USD','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(166,'Norway','NO','NOR','🇳🇴','NOK','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(167,'Oman','OM','OMN','🇴🇲','OMR','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(168,'Pakistan','PK','PAK','🇵🇰','PKR','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(169,'Palau','PW','PLW','🇵🇼','USD','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(170,'Palestinian Territory Occupied','PS','PSE','🇵🇸','ILS','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(171,'Panama','PA','PAN','🇵🇦','PAB','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(172,'Papua new Guinea','PG','PNG','🇵🇬','PGK','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(173,'Paraguay','PY','PRY','🇵🇾','PYG','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(174,'Peru','PE','PER','🇵🇪','PEN','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(175,'Philippines','PH','PHL','🇵🇭','PHP','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(176,'Pitcairn Island','PN','PCN','🇵🇳','NZD','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(177,'Poland','PL','POL','🇵🇱','PLN','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(178,'Portugal','PT','PRT','🇵🇹','EUR','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(179,'Puerto Rico','PR','PRI','🇵🇷','USD','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(180,'Qatar','QA','QAT','🇶🇦','QAR','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(181,'Reunion','RE','REU','🇷🇪','EUR','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(182,'Romania','RO','ROU','🇷🇴','RON','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(183,'Russia','RU','RUS','🇷🇺','RUB','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(184,'Rwanda','RW','RWA','🇷🇼','RWF','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(185,'Saint Helena','SH','SHN','🇸🇭','SHP','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(186,'Saint Kitts And Nevis','KN','KNA','🇰🇳','XCD','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(187,'Saint Lucia','LC','LCA','🇱🇨','XCD','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(188,'Saint Pierre and Miquelon','PM','SPM','🇵🇲','EUR','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(189,'Saint Vincent And The Grenadines','VC','VCT','🇻🇨','XCD','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(190,'Saint-Barthelemy','BL','BLM','🇧🇱','EUR','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(191,'Saint-Martin (French part)','MF','MAF','🇲🇫','EUR','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(192,'Samoa','WS','WSM','🇼🇸','WST','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(193,'San Marino','SM','SMR','🇸🇲','EUR','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(194,'Sao Tome and Principe','ST','STP','🇸🇹','STD','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(195,'Saudi Arabia','SA','SAU','🇸🇦','SAR','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(196,'Senegal','SN','SEN','🇸🇳','XOF','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(197,'Serbia','RS','SRB','🇷🇸','RSD','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(198,'Seychelles','SC','SYC','🇸🇨','SCR','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(199,'Sierra Leone','SL','SLE','🇸🇱','SLL','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(200,'Singapore','SG','SGP','🇸🇬','SGD','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(201,'Sint Maarten (Dutch part)','SX','SXM','🇸🇽','ANG','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(202,'Slovakia','SK','SVK','🇸🇰','EUR','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(203,'Slovenia','SI','SVN','🇸🇮','EUR','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(204,'Solomon Islands','SB','SLB','🇸🇧','SBD','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(205,'Somalia','SO','SOM','🇸🇴','SOS','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(206,'South Africa','ZA','ZAF','🇿🇦','ZAR','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(207,'South Georgia','GS','SGS','🇬🇸','GBP','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(208,'South Korea','KR','KOR','🇰🇷','KRW','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(209,'South Sudan','SS','SSD','🇸🇸','SSP','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(210,'Spain','ES','ESP','🇪🇸','EUR','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(211,'Sri Lanka','LK','LKA','🇱🇰','LKR','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(212,'Sudan','SD','SDN','🇸🇩','SDG','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(213,'Suriname','SR','SUR','🇸🇷','SRD','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(214,'Svalbard And Jan Mayen Islands','SJ','SJM','🇸🇯','NOK','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(215,'Swaziland','SZ','SWZ','🇸🇿','SZL','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(216,'Sweden','SE','SWE','🇸🇪','SEK','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(217,'Switzerland','CH','CHE','🇨🇭','CHF','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(218,'Syria','SY','SYR','🇸🇾','SYP','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(219,'Taiwan','TW','TWN','🇹🇼','TWD','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(220,'Tajikistan','TJ','TJK','🇹🇯','TJS','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(221,'Tanzania','TZ','TZA','🇹🇿','TZS','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(222,'Thailand','TH','THA','🇹🇭','THB','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(223,'Togo','TG','TGO','🇹🇬','XOF','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(224,'Tokelau','TK','TKL','🇹🇰','NZD','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(225,'Tonga','TO','TON','🇹🇴','TOP','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(226,'Trinidad And Tobago','TT','TTO','🇹🇹','TTD','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(227,'Tunisia','TN','TUN','🇹🇳','TND','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(228,'Turkey','TR','TUR','🇹🇷','TRY','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(229,'Turkmenistan','TM','TKM','🇹🇲','TMT','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(230,'Turks And Caicos Islands','TC','TCA','🇹🇨','USD','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(231,'Tuvalu','TV','TUV','🇹🇻','AUD','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(232,'Uganda','UG','UGA','🇺🇬','UGX','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(233,'Ukraine','UA','UKR','🇺🇦','UAH','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(234,'United Arab Emirates','AE','ARE','🇦🇪','AED','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(235,'United Kingdom','GB','GBR','🇬🇧','GBP','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(236,'United States','US','USA','🇺🇸','USD','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(237,'United States Minor Outlying Islands','UM','UMI','🇺🇲','USD','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(238,'Uruguay','UY','URY','🇺🇾','UYU','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(239,'Uzbekistan','UZ','UZB','🇺🇿','UZS','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(240,'Vanuatu','VU','VUT','🇻🇺','VUV','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(241,'Vatican City State (Holy See)','VA','VAT','🇻🇦','EUR','Europe',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(242,'Venezuela','VE','VEN','🇻🇪','VEF','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(243,'Vietnam','VN','VNM','🇻🇳','VND','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(244,'Virgin Islands (British)','VG','VGB','🇻🇬','USD','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(245,'Virgin Islands (US)','VI','VIR','🇻🇮','USD','Americas',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(246,'Wallis And Futuna Islands','WF','WLF','🇼🇫','XPF','Oceania',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(247,'Western Sahara','EH','ESH','🇪🇭','MAD','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(248,'Yemen','YE','YEM','🇾🇪','YER','Asia',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(249,'Zambia','ZM','ZMB','🇿🇲','ZMW','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(250,'Zimbabwe','ZW','ZWE','🇿🇼','ZWL','Africa',0,NULL,'2022-03-17 09:34:59','2022-03-17 09:34:59'),
(251,'Test Country','test','test','🇦🇫','AFN','Asia',0,NULL,'2022-03-17 09:35:23','2022-03-17 09:35:23'),
(252,'Lorem','lorem','lorem','🇦🇫','AFN','Asia',0,NULL,'2022-03-17 09:35:36','2022-03-17 09:35:36');

/*Table structure for table `country_companies` */

DROP TABLE IF EXISTS `country_companies`;

CREATE TABLE `country_companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `sequence` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_companies_country_id_foreign` (`country_id`),
  KEY `country_companies_company_id_foreign` (`company_id`),
  CONSTRAINT `country_companies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `country_companies_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_companies` */

insert  into `country_companies`(`id`,`country_id`,`company_id`,`sequence`,`created_at`,`updated_at`,`deleted_at`) values 
(1,251,1,1,'2022-03-17 09:35:23','2022-03-17 09:35:23',NULL),
(2,251,2,2,'2022-03-17 09:35:23','2022-03-17 09:35:23',NULL),
(3,252,1,1,'2022-03-17 09:35:36','2022-03-17 09:35:36',NULL),
(4,252,2,2,'2022-03-17 09:35:36','2022-03-17 09:35:36',NULL);

/*Table structure for table `country_details` */

DROP TABLE IF EXISTS `country_details`;

CREATE TABLE `country_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL,
  `cigarettes_consumed` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `economic_losses` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `policy` text COLLATE utf8mb4_unicode_ci,
  `recommendations` text COLLATE utf8mb4_unicode_ci,
  `acknowledgement` text COLLATE utf8mb4_unicode_ci,
  `threat_to_environment` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_details_country_id_foreign` (`country_id`),
  CONSTRAINT `country_details_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_details` */

insert  into `country_details`(`id`,`country_id`,`cigarettes_consumed`,`economic_losses`,`policy`,`recommendations`,`acknowledgement`,`threat_to_environment`,`deleted_at`,`created_at`,`updated_at`) values 
(1,251,'20.20','000,000M','has a strong conflict\n\n\nPhasellus fermentum malesuada phasellus netus dictum aenean placerat egestas amet. Ornare taciti semper dolor tristique morbi. Sem leo tincidunt aliquet semper eu lectus scelerisque quis. </p><p><br></p><p>Sagittis vivamus mollis nisi mollis enim fermentum laoreet.</p>','lorem ipsum lorem ipsum','lorem ipsum lorem ipsum','Lorem ipsum Lorem ipsum',NULL,'2022-03-17 09:35:23','2022-03-17 09:35:23'),
(2,252,'20.20','000,000M','has a strong conflict\n\n\nPhasellus fermentum malesuada phasellus netus dictum aenean placerat egestas amet. Ornare taciti semper dolor tristique morbi. Sem leo tincidunt aliquet semper eu lectus scelerisque quis. </p><p><br></p><p>Sagittis vivamus mollis nisi mollis enim fermentum laoreet.</p>','lorem ipsum lorem ipsum','lorem ipsum lorem ipsum','Lorem ipsum Lorem ipsum',NULL,'2022-03-17 09:35:36','2022-03-17 09:35:36');

/*Table structure for table `country_metadata` */

DROP TABLE IF EXISTS `country_metadata`;

CREATE TABLE `country_metadata` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_metadata_country_id_foreign` (`country_id`),
  CONSTRAINT `country_metadata_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_metadata` */

insert  into `country_metadata`(`id`,`country_id`,`meta_title`,`meta_description`,`created_at`,`updated_at`,`deleted_at`) values 
(1,251,'Test Country','Lorem ipsum Lorem ipsum','2022-03-17 09:35:23','2022-03-17 09:35:23',NULL),
(2,252,'Lorem','Lorem ipsum Lorem ipsum','2022-03-17 09:35:36','2022-03-17 09:35:36',NULL);

/*Table structure for table `country_recommendations` */

DROP TABLE IF EXISTS `country_recommendations`;

CREATE TABLE `country_recommendations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_recommendations_country_id_foreign` (`country_id`),
  CONSTRAINT `country_recommendations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_recommendations` */

insert  into `country_recommendations`(`id`,`country_id`,`content`,`sequence`,`created_at`,`updated_at`,`deleted_at`) values 
(1,251,'lorem ipsum lorem ipsum','1','2022-03-17 09:35:23','2022-03-17 09:35:23',NULL),
(2,251,'lorem ipsum lorem ipsum','2','2022-03-17 09:35:23','2022-03-17 09:35:23',NULL),
(3,252,'lorem ipsum lorem ipsum','1','2022-03-17 09:35:36','2022-03-17 09:35:36',NULL),
(4,252,'lorem ipsum lorem ipsum','2','2022-03-17 09:35:36','2022-03-17 09:35:36',NULL);

/*Table structure for table `country_references` */

DROP TABLE IF EXISTS `country_references`;

CREATE TABLE `country_references` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_references_country_id_foreign` (`country_id`),
  CONSTRAINT `country_references_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_references` */

insert  into `country_references`(`id`,`country_id`,`content`,`sequence`,`created_at`,`updated_at`,`deleted_at`) values 
(1,251,'lorem ipsum lorem ipsum','1','2022-03-17 09:35:23','2022-03-17 09:35:23',NULL),
(2,251,'lorem ipsum lorem ipsum','2','2022-03-17 09:35:23','2022-03-17 09:35:23',NULL),
(3,252,'lorem ipsum lorem ipsum','1','2022-03-17 09:35:36','2022-03-17 09:35:36',NULL),
(4,252,'lorem ipsum lorem ipsum','2','2022-03-17 09:35:36','2022-03-17 09:35:36',NULL);

/*Table structure for table `country_threat_environments` */

DROP TABLE IF EXISTS `country_threat_environments`;

CREATE TABLE `country_threat_environments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_threat_environments_country_id_foreign` (`country_id`),
  CONSTRAINT `country_threat_environments_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_threat_environments` */

insert  into `country_threat_environments`(`id`,`country_id`,`content`,`sequence`,`created_at`,`updated_at`,`deleted_at`) values 
(1,251,'lorem ipsum lorem ipsum','1','2022-03-17 09:35:23','2022-03-17 09:35:23',NULL),
(2,251,'lorem ipsum lorem ipsum','2','2022-03-17 09:35:23','2022-03-17 09:35:23',NULL),
(3,252,'lorem ipsum lorem ipsum','1','2022-03-17 09:35:36','2022-03-17 09:35:36',NULL),
(4,252,'lorem ipsum lorem ipsum','2','2022-03-17 09:35:36','2022-03-17 09:35:36',NULL);

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `images` */

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_resized` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_mode` enum('dark','light') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `from_import` tinyint(4) NOT NULL DEFAULT '0',
  `caption` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `images` */

/*Table structure for table `marine_wastes` */

DROP TABLE IF EXISTS `marine_wastes`;

CREATE TABLE `marine_wastes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL,
  `cost_1` bigint(20) DEFAULT NULL,
  `cost_year_1` bigint(20) DEFAULT NULL,
  `cost_2` bigint(20) DEFAULT NULL,
  `cost_year_2` bigint(20) DEFAULT NULL,
  `cost_of_collection` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marine_wastes_country_id_foreign` (`country_id`),
  CONSTRAINT `marine_wastes_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `marine_wastes` */

insert  into `marine_wastes`(`id`,`country_id`,`cost_1`,`cost_year_1`,`cost_2`,`cost_year_2`,`cost_of_collection`,`created_at`,`updated_at`,`deleted_at`) values 
(1,251,10000,2010,10000,2025,20000,'2022-03-17 09:35:23','2022-03-17 09:35:23',NULL),
(2,252,10000,2010,10000,2025,20000,'2022-03-17 09:35:36','2022-03-17 09:35:36',NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),
(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),
(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),
(6,'2016_06_01_000004_create_oauth_clients_table',1),
(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),
(8,'2019_08_19_000000_create_failed_jobs_table',1),
(9,'2019_12_14_000001_create_personal_access_tokens_table',1),
(10,'2022_03_10_031516_create_roles_table',1),
(11,'2022_03_10_054511_create_countries_table',1),
(12,'2022_03_11_045955_create_country_details_table',1),
(13,'2022_03_11_073658_create_cost_estimations_table',1),
(14,'2022_03_11_075106_create_images_table',1),
(15,'2022_03_11_075231_create_companies_table',1),
(16,'2022_03_11_094640_create_country_companies_table',1),
(17,'2022_03_14_033832_create_country_metadata_table',1),
(18,'2022_03_17_012936_create_marine_wastes_table',1),
(19,'2022_03_17_013301_create_urban_wastes_table',1),
(20,'2022_03_17_054519_create_country_threat_environments_table',1),
(21,'2022_03_17_054820_create_country_recommendations_table',1),
(22,'2022_03_17_054945_create_country_references_table',1);

/*Table structure for table `oauth_access_tokens` */

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_access_tokens` */

insert  into `oauth_access_tokens`(`id`,`user_id`,`client_id`,`name`,`scopes`,`revoked`,`created_at`,`updated_at`,`expires_at`) values 
('0a6dba7a0000f086a03e0454c00bc03c9bafe73bcea3f0cd306f55a28e0df601e2f604e0ef16c6f0',1,1,'GGTC CFS Admin API Access Token','[]',0,'2022-03-17 09:34:38','2022-03-17 09:34:38','2022-09-17 09:34:38'),
('495f0f8a83438d555976e27d1eb550f906c209d98f9c2ebafc4badbf6da302586c6a60e22b0c3fec',1,1,'GGTC CFS Admin API Access Token','[]',0,'2022-03-17 09:35:46','2022-03-17 09:35:46','2022-09-17 09:35:46');

/*Table structure for table `oauth_auth_codes` */

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_auth_codes` */

/*Table structure for table `oauth_clients` */

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_clients` */

insert  into `oauth_clients`(`id`,`user_id`,`name`,`secret`,`provider`,`redirect`,`personal_access_client`,`password_client`,`revoked`,`created_at`,`updated_at`) values 
(1,NULL,'GGCTCFS Personal Access Client','KfE3agRejPObe8huSehpAvF6DDjz7pMXxz8EK9w8',NULL,'http://localhost',1,0,0,'2022-03-17 09:34:07','2022-03-17 09:34:07'),
(2,NULL,'GGCTCFS Password Grant Client','WiEo9CbL0MS3bmAuoZTM4kLs2h2UaMXkSRPup7sg','users','http://localhost',0,1,0,'2022-03-17 09:34:07','2022-03-17 09:34:07');

/*Table structure for table `oauth_personal_access_clients` */

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_personal_access_clients` */

insert  into `oauth_personal_access_clients`(`id`,`client_id`,`created_at`,`updated_at`) values 
(1,1,'2022-03-17 09:34:07','2022-03-17 09:34:07');

/*Table structure for table `oauth_refresh_tokens` */

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_refresh_tokens` */

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`permissions`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Superadmin',NULL,NULL,NULL,NULL),
(2,'Admin',NULL,NULL,NULL,NULL),
(3,'User',NULL,NULL,NULL,NULL);

/*Table structure for table `urban_wastes` */

DROP TABLE IF EXISTS `urban_wastes`;

CREATE TABLE `urban_wastes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL,
  `cost_1` bigint(20) DEFAULT NULL,
  `cost_year_1` bigint(20) DEFAULT NULL,
  `cost_2` bigint(20) DEFAULT NULL,
  `cost_year_2` bigint(20) DEFAULT NULL,
  `cost_of_collection` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `urban_wastes_country_id_foreign` (`country_id`),
  CONSTRAINT `urban_wastes_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `urban_wastes` */

insert  into `urban_wastes`(`id`,`country_id`,`cost_1`,`cost_year_1`,`cost_2`,`cost_year_2`,`cost_of_collection`,`created_at`,`updated_at`,`deleted_at`) values 
(1,251,10000,2010,10000,2025,20000,'2022-03-17 09:35:23','2022-03-17 09:35:23',NULL),
(2,252,10000,2010,10000,2025,20000,'2022-03-17 09:35:36','2022-03-17 09:35:36',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`first_name`,`middle_name`,`last_name`,`username`,`status`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`deleted_at`,`role_id`) values 
(1,'admin',NULL,'cfs','admin','Active','admin@dbm.com',NULL,'$2y$10$LMnaTagX8.QtlDlJ.8/uZO3Hb1fXlgP5jPV5Bm9abdx7/.ORcxgtO',NULL,'2022-03-17 09:34:28','2022-03-17 09:34:28',NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
