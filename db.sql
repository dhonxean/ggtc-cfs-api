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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `companies` */

insert  into `companies`(`id`,`name`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Accenture','2022-03-23 06:27:23','2022-03-23 06:27:23',NULL),
(2,'DesignBlue Manila','2022-03-23 06:27:31','2022-03-23 06:27:31',NULL),
(3,'Philip Morris','2022-03-23 06:27:42','2022-03-23 06:27:42',NULL);

/*Table structure for table `cost_estimations` */

DROP TABLE IF EXISTS `cost_estimations`;

CREATE TABLE `cost_estimations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL,
  `marine_pollution` decimal(20,2) DEFAULT NULL,
  `waste_management` decimal(20,2) DEFAULT NULL,
  `partial_cost` decimal(20,2) DEFAULT NULL,
  `marine_cost_per_ton` decimal(20,2) DEFAULT NULL,
  `waste_cost_per_ton` decimal(20,2) DEFAULT NULL,
  `cigarettes_consumed` bigint(20) DEFAULT NULL,
  `economic_cost` decimal(20,2) DEFAULT NULL,
  `economic_cost_currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cost_estimations_country_id_foreign` (`country_id`),
  CONSTRAINT `cost_estimations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cost_estimations` */

insert  into `cost_estimations`(`id`,`country_id`,`marine_pollution`,`waste_management`,`partial_cost`,`marine_cost_per_ton`,`waste_cost_per_ton`,`cigarettes_consumed`,`economic_cost`,`economic_cost_currency`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,199900.22,199900.22,199900.22,199900.22,199900.22,1000000,199900.22,'EUR','2022-03-23 06:34:13','2022-03-23 08:49:38',NULL),
(2,252,2000000.00,2000000.00,30000000.00,33000.00,33000.00,30000,2000000.00,'PHP','2022-03-23 07:16:30','2022-03-23 07:16:30',NULL);

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
(1,'Lorem','LOR',NULL,'🇦🇫','PHP','Asia',1,NULL,'2022-03-23 06:34:13','2022-03-23 07:25:47'),
(2,'Afghanistan','AF','AFG','🇦🇫','AFN','Asia',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(3,'Aland Islands','AX','ALA','🇦🇽','EUR','Europe',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(4,'Albania','AL','ALB','🇦🇱','ALL','Europe',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(5,'Algeria','DZ','DZA','🇩🇿','DZD','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(6,'American Samoa','AS','ASM','🇦🇸','USD','Oceania',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(7,'Andorra','AD','AND','🇦🇩','EUR','Europe',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(8,'Angola','AO','AGO','🇦🇴','AOA','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(9,'Anguilla','AI','AIA','🇦🇮','XCD','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(10,'Antarctica','AQ','ATA','🇦🇶','AAD','Polar',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(11,'Antigua And Barbuda','AG','ATG','🇦🇬','XCD','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(12,'Argentina','AR','ARG','🇦🇷','ARS','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(13,'Armenia','AM','ARM','🇦🇲','AMD','Asia',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(14,'Aruba','AW','ABW','🇦🇼','AWG','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(15,'Australia','AU','AUS','🇦🇺','AUD','Oceania',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(16,'Austria','AT','AUT','🇦🇹','EUR','Europe',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(17,'Azerbaijan','AZ','AZE','🇦🇿','AZN','Asia',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(18,'Bahamas The','BS','BHS','🇧🇸','BSD','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(19,'Bahrain','BH','BHR','🇧🇭','BHD','Asia',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(20,'Bangladesh','BD','BGD','🇧🇩','BDT','Asia',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(21,'Barbados','BB','BRB','🇧🇧','BBD','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(22,'Belarus','BY','BLR','🇧🇾','BYN','Europe',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(23,'Belgium','BE','BEL','🇧🇪','EUR','Europe',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(24,'Belize','BZ','BLZ','🇧🇿','BZD','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(25,'Benin','BJ','BEN','🇧🇯','XOF','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(26,'Bermuda','BM','BMU','🇧🇲','BMD','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(27,'Bhutan','BT','BTN','🇧🇹','BTN','Asia',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(28,'Bolivia','BO','BOL','🇧🇴','BOB','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(29,'Bonaire, Sint Eustatius and Saba','BQ','BES','🇧🇶','USD','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(30,'Bosnia and Herzegovina','BA','BIH','🇧🇦','BAM','Europe',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(31,'Botswana','BW','BWA','🇧🇼','BWP','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(32,'Bouvet Island','BV','BVT','🇧🇻','NOK',NULL,0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(33,'Brazil','BR','BRA','🇧🇷','BRL','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(34,'British Indian Ocean Territory','IO','IOT','🇮🇴','USD','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(35,'Brunei','BN','BRN','🇧🇳','BND','Asia',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(36,'Bulgaria','BG','BGR','🇧🇬','BGN','Europe',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(37,'Burkina Faso','BF','BFA','🇧🇫','XOF','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(38,'Burundi','BI','BDI','🇧🇮','BIF','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(39,'Cambodia','KH','KHM','🇰🇭','KHR','Asia',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(40,'Cameroon','CM','CMR','🇨🇲','XAF','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(41,'Canada','CA','CAN','🇨🇦','CAD','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(42,'Cape Verde','CV','CPV','🇨🇻','CVE','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(43,'Cayman Islands','KY','CYM','🇰🇾','KYD','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(44,'Central African Republic','CF','CAF','🇨🇫','XAF','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(45,'Chad','TD','TCD','🇹🇩','XAF','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(46,'Chile','CL','CHL','🇨🇱','CLP','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(47,'China','CN','CHN','🇨🇳','CNY','Asia',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(48,'Christmas Island','CX','CXR','🇨🇽','AUD','Oceania',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(49,'Cocos (Keeling) Islands','CC','CCK','🇨🇨','AUD','Oceania',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(50,'Colombia','CO','COL','🇨🇴','COP','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(51,'Comoros','KM','COM','🇰🇲','KMF','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(52,'Congo','CG','COG','🇨🇬','XAF','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(53,'Cook Islands','CK','COK','🇨🇰','NZD','Oceania',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(54,'Costa Rica','CR','CRI','🇨🇷','CRC','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(55,'Cote D\'Ivoire (Ivory Coast)','CI','CIV','🇨🇮','XOF','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(56,'Croatia','HR','HRV','🇭🇷','HRK','Europe',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(57,'Cuba','CU','CUB','🇨🇺','CUP','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(58,'Curaçao','CW','CUW','🇨🇼','ANG','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(59,'Cyprus','CY','CYP','🇨🇾','EUR','Europe',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(60,'Czech Republic','CZ','CZE','🇨🇿','CZK','Europe',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(61,'Democratic Republic of the Congo','CD','COD','🇨🇩','CDF','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(62,'Denmark','DK','DNK','🇩🇰','DKK','Europe',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(63,'Djibouti','DJ','DJI','🇩🇯','DJF','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(64,'Dominica','DM','DMA','🇩🇲','XCD','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(65,'Dominican Republic','DO','DOM','🇩🇴','DOP','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(66,'East Timor','TL','TLS','🇹🇱','USD','Asia',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(67,'Ecuador','EC','ECU','🇪🇨','USD','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(68,'Egypt','EG','EGY','🇪🇬','EGP','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(69,'El Salvador','SV','SLV','🇸🇻','USD','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(70,'Equatorial Guinea','GQ','GNQ','🇬🇶','XAF','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(71,'Eritrea','ER','ERI','🇪🇷','ERN','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(72,'Estonia','EE','EST','🇪🇪','EUR','Europe',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(73,'Ethiopia','ET','ETH','🇪🇹','ETB','Africa',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(74,'Falkland Islands','FK','FLK','🇫🇰','FKP','Americas',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(75,'Faroe Islands','FO','FRO','🇫🇴','DKK','Europe',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(76,'Fiji Islands','FJ','FJI','🇫🇯','FJD','Oceania',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(77,'Finland','FI','FIN','🇫🇮','EUR','Europe',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(78,'France','FR','FRA','🇫🇷','EUR','Europe',0,NULL,'2022-03-23 06:36:56','2022-03-23 06:36:56'),
(79,'French Guiana','GF','GUF','🇬🇫','EUR','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(80,'French Polynesia','PF','PYF','🇵🇫','XPF','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(81,'French Southern Territories','TF','ATF','🇹🇫','EUR','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(82,'Gabon','GA','GAB','🇬🇦','XAF','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(83,'Gambia The','GM','GMB','🇬🇲','GMD','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(84,'Georgia','GE','GEO','🇬🇪','GEL','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(85,'Germany','DE','DEU','🇩🇪','EUR','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(86,'Ghana','GH','GHA','🇬🇭','GHS','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(87,'Gibraltar','GI','GIB','🇬🇮','GIP','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(88,'Greece','GR','GRC','🇬🇷','EUR','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(89,'Greenland','GL','GRL','🇬🇱','DKK','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(90,'Grenada','GD','GRD','🇬🇩','XCD','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(91,'Guadeloupe','GP','GLP','🇬🇵','EUR','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(92,'Guam','GU','GUM','🇬🇺','USD','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(93,'Guatemala','GT','GTM','🇬🇹','GTQ','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(94,'Guernsey and Alderney','GG','GGY','🇬🇬','GBP','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(95,'Guinea','GN','GIN','🇬🇳','GNF','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(96,'Guinea-Bissau','GW','GNB','🇬🇼','XOF','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(97,'Guyana','GY','GUY','🇬🇾','GYD','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(98,'Haiti','HT','HTI','🇭🇹','HTG','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(99,'Heard Island and McDonald Islands','HM','HMD','🇭🇲','AUD',NULL,0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(100,'Honduras','HN','HND','🇭🇳','HNL','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(101,'Hong Kong S.A.R.','HK','HKG','🇭🇰','HKD','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(102,'Hungary','HU','HUN','🇭🇺','HUF','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(103,'Iceland','IS','ISL','🇮🇸','ISK','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(104,'India','IN','IND','🇮🇳','INR','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(105,'Indonesia','ID','IDN','🇮🇩','IDR','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(106,'Iran','IR','IRN','🇮🇷','IRR','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(107,'Iraq','IQ','IRQ','🇮🇶','IQD','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(108,'Ireland','IE','IRL','🇮🇪','EUR','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(109,'Israel','IL','ISR','🇮🇱','ILS','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(110,'Italy','IT','ITA','🇮🇹','EUR','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(111,'Jamaica','JM','JAM','🇯🇲','JMD','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(112,'Japan','JP','JPN','🇯🇵','JPY','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(113,'Jersey','JE','JEY','🇯🇪','GBP','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(114,'Jordan','JO','JOR','🇯🇴','JOD','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(115,'Kazakhstan','KZ','KAZ','🇰🇿','KZT','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(116,'Kenya','KE','KEN','🇰🇪','KES','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(117,'Kiribati','KI','KIR','🇰🇮','AUD','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(118,'Kosovo','XK','XKX','🇽🇰','EUR','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(119,'Kuwait','KW','KWT','🇰🇼','KWD','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(120,'Kyrgyzstan','KG','KGZ','🇰🇬','KGS','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(121,'Laos','LA','LAO','🇱🇦','LAK','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(122,'Latvia','LV','LVA','🇱🇻','EUR','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(123,'Lebanon','LB','LBN','🇱🇧','LBP','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(124,'Lesotho','LS','LSO','🇱🇸','LSL','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(125,'Liberia','LR','LBR','🇱🇷','LRD','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(126,'Libya','LY','LBY','🇱🇾','LYD','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(127,'Liechtenstein','LI','LIE','🇱🇮','CHF','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(128,'Lithuania','LT','LTU','🇱🇹','EUR','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(129,'Luxembourg','LU','LUX','🇱🇺','EUR','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(130,'Macau S.A.R.','MO','MAC','🇲🇴','MOP','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(131,'Macedonia','MK','MKD','🇲🇰','MKD','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(132,'Madagascar','MG','MDG','🇲🇬','MGA','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(133,'Malawi','MW','MWI','🇲🇼','MWK','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(134,'Malaysia','MY','MYS','🇲🇾','MYR','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(135,'Maldives','MV','MDV','🇲🇻','MVR','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(136,'Mali','ML','MLI','🇲🇱','XOF','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(137,'Malta','MT','MLT','🇲🇹','EUR','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(138,'Man (Isle of)','IM','IMN','🇮🇲','GBP','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(139,'Marshall Islands','MH','MHL','🇲🇭','USD','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(140,'Martinique','MQ','MTQ','🇲🇶','EUR','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(141,'Mauritania','MR','MRT','🇲🇷','MRO','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(142,'Mauritius','MU','MUS','🇲🇺','MUR','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(143,'Mayotte','YT','MYT','🇾🇹','EUR','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(144,'Mexico','MX','MEX','🇲🇽','MXN','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(145,'Micronesia','FM','FSM','🇫🇲','USD','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(146,'Moldova','MD','MDA','🇲🇩','MDL','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(147,'Monaco','MC','MCO','🇲🇨','EUR','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(148,'Mongolia','MN','MNG','🇲🇳','MNT','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(149,'Montenegro','ME','MNE','🇲🇪','EUR','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(150,'Montserrat','MS','MSR','🇲🇸','XCD','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(151,'Morocco','MA','MAR','🇲🇦','MAD','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(152,'Mozambique','MZ','MOZ','🇲🇿','MZN','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(153,'Myanmar','MM','MMR','🇲🇲','MMK','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(154,'Namibia','NA','NAM','🇳🇦','NAD','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(155,'Nauru','NR','NRU','🇳🇷','AUD','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(156,'Nepal','NP','NPL','🇳🇵','NPR','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(157,'Netherlands','NL','NLD','🇳🇱','EUR','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(158,'New Caledonia','NC','NCL','🇳🇨','XPF','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(159,'New Zealand','NZ','NZL','🇳🇿','NZD','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(160,'Nicaragua','NI','NIC','🇳🇮','NIO','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(161,'Niger','NE','NER','🇳🇪','XOF','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(162,'Nigeria','NG','NGA','🇳🇬','NGN','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(163,'Niue','NU','NIU','🇳🇺','NZD','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(164,'Norfolk Island','NF','NFK','🇳🇫','AUD','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(165,'North Korea','KP','PRK','🇰🇵','KPW','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(166,'Northern Mariana Islands','MP','MNP','🇲🇵','USD','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(167,'Norway','NO','NOR','🇳🇴','NOK','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(168,'Oman','OM','OMN','🇴🇲','OMR','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(169,'Pakistan','PK','PAK','🇵🇰','PKR','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(170,'Palau','PW','PLW','🇵🇼','USD','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(171,'Palestinian Territory Occupied','PS','PSE','🇵🇸','ILS','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(172,'Panama','PA','PAN','🇵🇦','PAB','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(173,'Papua new Guinea','PG','PNG','🇵🇬','PGK','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(174,'Paraguay','PY','PRY','🇵🇾','PYG','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(175,'Peru','PE','PER','🇵🇪','PEN','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(176,'Philippines','PH','PHL','🇵🇭','PHP','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(177,'Pitcairn Island','PN','PCN','🇵🇳','NZD','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(178,'Poland','PL','POL','🇵🇱','PLN','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(179,'Portugal','PT','PRT','🇵🇹','EUR','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(180,'Puerto Rico','PR','PRI','🇵🇷','USD','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(181,'Qatar','QA','QAT','🇶🇦','QAR','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(182,'Reunion','RE','REU','🇷🇪','EUR','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(183,'Romania','RO','ROU','🇷🇴','RON','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(184,'Russia','RU','RUS','🇷🇺','RUB','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(185,'Rwanda','RW','RWA','🇷🇼','RWF','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(186,'Saint Helena','SH','SHN','🇸🇭','SHP','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(187,'Saint Kitts And Nevis','KN','KNA','🇰🇳','XCD','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(188,'Saint Lucia','LC','LCA','🇱🇨','XCD','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(189,'Saint Pierre and Miquelon','PM','SPM','🇵🇲','EUR','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(190,'Saint Vincent And The Grenadines','VC','VCT','🇻🇨','XCD','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(191,'Saint-Barthelemy','BL','BLM','🇧🇱','EUR','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(192,'Saint-Martin (French part)','MF','MAF','🇲🇫','EUR','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(193,'Samoa','WS','WSM','🇼🇸','WST','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(194,'San Marino','SM','SMR','🇸🇲','EUR','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(195,'Sao Tome and Principe','ST','STP','🇸🇹','STD','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(196,'Saudi Arabia','SA','SAU','🇸🇦','SAR','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(197,'Senegal','SN','SEN','🇸🇳','XOF','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(198,'Serbia','RS','SRB','🇷🇸','RSD','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(199,'Seychelles','SC','SYC','🇸🇨','SCR','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(200,'Sierra Leone','SL','SLE','🇸🇱','SLL','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(201,'Singapore','SG','SGP','🇸🇬','SGD','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(202,'Sint Maarten (Dutch part)','SX','SXM','🇸🇽','ANG','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(203,'Slovakia','SK','SVK','🇸🇰','EUR','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(204,'Slovenia','SI','SVN','🇸🇮','EUR','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(205,'Solomon Islands','SB','SLB','🇸🇧','SBD','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(206,'Somalia','SO','SOM','🇸🇴','SOS','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(207,'South Africa','ZA','ZAF','🇿🇦','ZAR','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(208,'South Georgia','GS','SGS','🇬🇸','GBP','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(209,'South Korea','KR','KOR','🇰🇷','KRW','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(210,'South Sudan','SS','SSD','🇸🇸','SSP','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(211,'Spain','ES','ESP','🇪🇸','EUR','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(212,'Sri Lanka','LK','LKA','🇱🇰','LKR','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(213,'Sudan','SD','SDN','🇸🇩','SDG','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(214,'Suriname','SR','SUR','🇸🇷','SRD','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(215,'Svalbard And Jan Mayen Islands','SJ','SJM','🇸🇯','NOK','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(216,'Swaziland','SZ','SWZ','🇸🇿','SZL','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(217,'Sweden','SE','SWE','🇸🇪','SEK','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(218,'Switzerland','CH','CHE','🇨🇭','CHF','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(219,'Syria','SY','SYR','🇸🇾','SYP','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(220,'Taiwan','TW','TWN','🇹🇼','TWD','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(221,'Tajikistan','TJ','TJK','🇹🇯','TJS','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(222,'Tanzania','TZ','TZA','🇹🇿','TZS','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(223,'Thailand','TH','THA','🇹🇭','THB','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(224,'Togo','TG','TGO','🇹🇬','XOF','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(225,'Tokelau','TK','TKL','🇹🇰','NZD','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(226,'Tonga','TO','TON','🇹🇴','TOP','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(227,'Trinidad And Tobago','TT','TTO','🇹🇹','TTD','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(228,'Tunisia','TN','TUN','🇹🇳','TND','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(229,'Turkey','TR','TUR','🇹🇷','TRY','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(230,'Turkmenistan','TM','TKM','🇹🇲','TMT','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(231,'Turks And Caicos Islands','TC','TCA','🇹🇨','USD','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(232,'Tuvalu','TV','TUV','🇹🇻','AUD','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(233,'Uganda','UG','UGA','🇺🇬','UGX','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(234,'Ukraine','UA','UKR','🇺🇦','UAH','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(235,'United Arab Emirates','AE','ARE','🇦🇪','AED','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(236,'United Kingdom','GB','GBR','🇬🇧','GBP','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(237,'United States','US','USA','🇺🇸','USD','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(238,'United States Minor Outlying Islands','UM','UMI','🇺🇲','USD','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(239,'Uruguay','UY','URY','🇺🇾','UYU','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(240,'Uzbekistan','UZ','UZB','🇺🇿','UZS','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(241,'Vanuatu','VU','VUT','🇻🇺','VUV','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(242,'Vatican City State (Holy See)','VA','VAT','🇻🇦','EUR','Europe',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(243,'Venezuela','VE','VEN','🇻🇪','VEF','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(244,'Vietnam','VN','VNM','🇻🇳','VND','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(245,'Virgin Islands (British)','VG','VGB','🇻🇬','USD','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(246,'Virgin Islands (US)','VI','VIR','🇻🇮','USD','Americas',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(247,'Wallis And Futuna Islands','WF','WLF','🇼🇫','XPF','Oceania',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(248,'Western Sahara','EH','ESH','🇪🇭','MAD','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(249,'Yemen','YE','YEM','🇾🇪','YER','Asia',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(250,'Zambia','ZM','ZMB','🇿🇲','ZMW','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(251,'Zimbabwe','ZW','ZWE','🇿🇼','ZWL','Africa',0,NULL,'2022-03-23 06:36:57','2022-03-23 06:36:57'),
(252,'Wano','WAN',NULL,'🇦🇫','PHP','',1,NULL,'2022-03-23 07:16:30','2022-03-23 07:25:04');

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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_companies` */

insert  into `country_companies`(`id`,`country_id`,`company_id`,`sequence`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,1,1,'2022-03-23 06:34:13','2022-03-23 06:37:12','2022-03-23 06:37:12'),
(2,1,2,2,'2022-03-23 06:34:13','2022-03-23 06:37:12','2022-03-23 06:37:12'),
(3,1,1,1,'2022-03-23 06:37:12','2022-03-23 07:25:47','2022-03-23 07:25:47'),
(4,1,2,2,'2022-03-23 06:37:12','2022-03-23 07:25:47','2022-03-23 07:25:47'),
(5,252,3,1,'2022-03-23 07:16:30','2022-03-23 07:22:47','2022-03-23 07:22:47'),
(6,252,2,2,'2022-03-23 07:16:30','2022-03-23 07:22:47','2022-03-23 07:22:47'),
(7,252,1,3,'2022-03-23 07:16:30','2022-03-23 07:22:47','2022-03-23 07:22:47'),
(8,252,3,1,'2022-03-23 07:22:47','2022-03-23 07:22:59','2022-03-23 07:22:59'),
(9,252,2,2,'2022-03-23 07:22:47','2022-03-23 07:22:59','2022-03-23 07:22:59'),
(10,252,1,3,'2022-03-23 07:22:47','2022-03-23 07:22:59','2022-03-23 07:22:59'),
(11,252,3,1,'2022-03-23 07:22:59','2022-03-23 07:23:05','2022-03-23 07:23:05'),
(12,252,2,2,'2022-03-23 07:22:59','2022-03-23 07:23:05','2022-03-23 07:23:05'),
(13,252,1,3,'2022-03-23 07:22:59','2022-03-23 07:23:05','2022-03-23 07:23:05'),
(14,252,3,1,'2022-03-23 07:23:05','2022-03-23 07:23:27','2022-03-23 07:23:27'),
(15,252,2,2,'2022-03-23 07:23:05','2022-03-23 07:23:27','2022-03-23 07:23:27'),
(16,252,1,3,'2022-03-23 07:23:05','2022-03-23 07:23:27','2022-03-23 07:23:27'),
(17,252,3,1,'2022-03-23 07:23:27','2022-03-23 07:23:46','2022-03-23 07:23:46'),
(18,252,2,2,'2022-03-23 07:23:27','2022-03-23 07:23:46','2022-03-23 07:23:46'),
(19,252,1,3,'2022-03-23 07:23:27','2022-03-23 07:23:46','2022-03-23 07:23:46'),
(20,252,3,1,'2022-03-23 07:23:46','2022-03-23 07:23:59','2022-03-23 07:23:59'),
(21,252,2,2,'2022-03-23 07:23:46','2022-03-23 07:23:59','2022-03-23 07:23:59'),
(22,252,1,3,'2022-03-23 07:23:46','2022-03-23 07:23:59','2022-03-23 07:23:59'),
(23,252,3,1,'2022-03-23 07:23:59','2022-03-23 07:24:05','2022-03-23 07:24:05'),
(24,252,2,2,'2022-03-23 07:23:59','2022-03-23 07:24:05','2022-03-23 07:24:05'),
(25,252,1,3,'2022-03-23 07:23:59','2022-03-23 07:24:05','2022-03-23 07:24:05'),
(26,252,3,1,'2022-03-23 07:24:05','2022-03-23 07:24:16','2022-03-23 07:24:16'),
(27,252,2,2,'2022-03-23 07:24:05','2022-03-23 07:24:16','2022-03-23 07:24:16'),
(28,252,1,3,'2022-03-23 07:24:05','2022-03-23 07:24:16','2022-03-23 07:24:16'),
(29,252,3,1,'2022-03-23 07:24:16','2022-03-23 07:25:04','2022-03-23 07:25:04'),
(30,252,2,2,'2022-03-23 07:24:16','2022-03-23 07:25:04','2022-03-23 07:25:04'),
(31,252,1,3,'2022-03-23 07:24:16','2022-03-23 07:25:04','2022-03-23 07:25:04'),
(32,252,3,1,'2022-03-23 07:25:04','2022-03-23 07:25:09','2022-03-23 07:25:09'),
(33,252,2,2,'2022-03-23 07:25:04','2022-03-23 07:25:09','2022-03-23 07:25:09'),
(34,252,1,3,'2022-03-23 07:25:04','2022-03-23 07:25:09','2022-03-23 07:25:09'),
(35,252,3,1,'2022-03-23 07:25:09','2022-03-23 07:25:09',NULL),
(36,252,2,2,'2022-03-23 07:25:09','2022-03-23 07:25:09',NULL),
(37,252,1,3,'2022-03-23 07:25:09','2022-03-23 07:25:09',NULL),
(38,1,1,1,'2022-03-23 07:25:47','2022-03-23 08:49:38','2022-03-23 08:49:38'),
(39,1,2,2,'2022-03-23 07:25:47','2022-03-23 08:49:38','2022-03-23 08:49:38'),
(40,1,1,1,'2022-03-23 08:49:38','2022-03-23 08:50:08','2022-03-23 08:50:08'),
(41,1,2,2,'2022-03-23 08:49:38','2022-03-23 08:50:08','2022-03-23 08:50:08'),
(42,1,1,1,'2022-03-23 08:50:08','2022-03-23 08:51:53','2022-03-23 08:51:53'),
(43,1,2,2,'2022-03-23 08:50:08','2022-03-23 08:51:53','2022-03-23 08:51:53'),
(44,1,1,1,'2022-03-23 08:51:53','2022-03-23 08:54:52','2022-03-23 08:54:52'),
(45,1,2,2,'2022-03-23 08:51:53','2022-03-23 08:54:52','2022-03-23 08:54:52'),
(46,1,1,1,'2022-03-23 08:54:52','2022-03-23 08:55:41','2022-03-23 08:55:41'),
(47,1,2,2,'2022-03-23 08:54:52','2022-03-23 08:55:41','2022-03-23 08:55:41'),
(48,1,1,1,'2022-03-23 08:55:41','2022-03-23 09:03:06','2022-03-23 09:03:06'),
(49,1,2,2,'2022-03-23 08:55:41','2022-03-23 09:03:06','2022-03-23 09:03:06'),
(50,1,1,1,'2022-03-23 09:03:06','2022-03-23 09:03:18','2022-03-23 09:03:18'),
(51,1,2,2,'2022-03-23 09:03:06','2022-03-23 09:03:18','2022-03-23 09:03:18'),
(52,1,1,1,'2022-03-23 09:03:18','2022-03-23 09:03:33','2022-03-23 09:03:33'),
(53,1,2,2,'2022-03-23 09:03:18','2022-03-23 09:03:33','2022-03-23 09:03:33'),
(54,1,1,1,'2022-03-23 09:03:33','2022-03-23 09:03:53','2022-03-23 09:03:53'),
(55,1,2,2,'2022-03-23 09:03:33','2022-03-23 09:03:53','2022-03-23 09:03:53'),
(56,1,1,1,'2022-03-23 09:03:53','2022-03-23 09:04:14','2022-03-23 09:04:14'),
(57,1,2,2,'2022-03-23 09:03:53','2022-03-23 09:04:14','2022-03-23 09:04:14'),
(58,1,1,1,'2022-03-23 09:04:14','2022-03-23 09:15:32','2022-03-23 09:15:32'),
(59,1,2,2,'2022-03-23 09:04:14','2022-03-23 09:15:32','2022-03-23 09:15:32'),
(60,1,1,1,'2022-03-23 09:15:32','2022-03-23 09:27:56','2022-03-23 09:27:56'),
(61,1,2,2,'2022-03-23 09:15:32','2022-03-23 09:27:56','2022-03-23 09:27:56'),
(62,1,1,1,'2022-03-23 09:27:56','2022-03-23 09:28:19','2022-03-23 09:28:19'),
(63,1,2,2,'2022-03-23 09:27:56','2022-03-23 09:28:19','2022-03-23 09:28:19'),
(64,1,1,1,'2022-03-23 09:28:19','2022-03-23 09:28:56','2022-03-23 09:28:56'),
(65,1,2,2,'2022-03-23 09:28:19','2022-03-23 09:28:56','2022-03-23 09:28:56'),
(66,1,1,1,'2022-03-23 09:28:56','2022-03-23 09:40:03','2022-03-23 09:40:03'),
(67,1,2,2,'2022-03-23 09:28:56','2022-03-23 09:40:03','2022-03-23 09:40:03'),
(68,1,1,1,'2022-03-23 09:40:03','2022-03-23 09:44:22','2022-03-23 09:44:22'),
(69,1,2,2,'2022-03-23 09:40:03','2022-03-23 09:44:22','2022-03-23 09:44:22'),
(70,1,1,1,'2022-03-23 09:44:22','2022-03-23 09:46:36','2022-03-23 09:46:36'),
(71,1,2,2,'2022-03-23 09:44:22','2022-03-23 09:46:36','2022-03-23 09:46:36'),
(72,1,1,1,'2022-03-23 09:46:36','2022-03-23 09:46:36',NULL),
(73,1,2,2,'2022-03-23 09:46:36','2022-03-23 09:46:36',NULL);

/*Table structure for table `country_details` */

DROP TABLE IF EXISTS `country_details`;

CREATE TABLE `country_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL,
  `death` bigint(20) DEFAULT NULL,
  `csr_local_examples` text COLLATE utf8mb4_unicode_ci,
  `csr_policy` text COLLATE utf8mb4_unicode_ci,
  `acknowledgement` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_details_country_id_foreign` (`country_id`),
  CONSTRAINT `country_details_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_details` */

insert  into `country_details`(`id`,`country_id`,`death`,`csr_local_examples`,`csr_policy`,`acknowledgement`,`deleted_at`,`created_at`,`updated_at`) values 
(1,1,10000,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p> Lorem ipsum <strong>dolor</strong> sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet</p><p><br></p><p> congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>',NULL,'2022-03-23 06:34:13','2022-03-23 09:28:56'),
(2,252,20000,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>',NULL,'2022-03-23 07:16:30','2022-03-23 07:16:30');

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
(1,1,'Lorem',NULL,'2022-03-23 06:34:13','2022-03-23 06:34:13',NULL),
(2,252,'Wano',NULL,'2022-03-23 07:16:30','2022-03-23 07:23:59',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_references` */

insert  into `country_references`(`id`,`country_id`,`content`,`sequence`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,'lorem ipsum lorem ipsum','1','2022-03-23 06:34:13','2022-03-23 06:37:12','2022-03-23 06:37:12'),
(2,1,'lorem ipsum lorem ipsum','2','2022-03-23 06:34:13','2022-03-23 06:37:12','2022-03-23 06:37:12'),
(3,1,'lorem ipsum lorem ipsum','1','2022-03-23 06:37:12','2022-03-23 07:25:47','2022-03-23 07:25:47'),
(4,1,'lorem ipsum lorem ipsum','2','2022-03-23 06:37:12','2022-03-23 07:25:47','2022-03-23 07:25:47'),
(5,252,'<p><span style=\"color: rgb(55, 65, 81);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</span></p>','1','2022-03-23 07:22:47','2022-03-23 07:22:59','2022-03-23 07:22:59'),
(6,252,'<p><span style=\"color: rgb(55, 65, 81);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</span></p>','1','2022-03-23 07:22:59','2022-03-23 07:23:05','2022-03-23 07:23:05'),
(7,252,'<p><span style=\"color: rgb(55, 65, 81);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</span></p>','1','2022-03-23 07:23:05','2022-03-23 07:23:27','2022-03-23 07:23:27'),
(8,252,'<p><span style=\"color: rgb(55, 65, 81);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</span></p>','1','2022-03-23 07:23:27','2022-03-23 07:23:46','2022-03-23 07:23:46'),
(9,252,'<p><span style=\"color: rgb(55, 65, 81);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</span></p>','1','2022-03-23 07:23:46','2022-03-23 07:23:59','2022-03-23 07:23:59'),
(10,252,'<p><span style=\"color: rgb(55, 65, 81);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</span></p>','1','2022-03-23 07:23:59','2022-03-23 07:24:05','2022-03-23 07:24:05'),
(11,252,'<p><span style=\"color: rgb(55, 65, 81);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</span></p>','1','2022-03-23 07:24:05','2022-03-23 07:24:16','2022-03-23 07:24:16'),
(12,252,'<p><span style=\"color: rgb(55, 65, 81);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</span></p>','1','2022-03-23 07:24:16','2022-03-23 07:25:04','2022-03-23 07:25:04'),
(13,252,'<p><span style=\"color: rgb(55, 65, 81);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</span></p>','1','2022-03-23 07:25:04','2022-03-23 07:25:09','2022-03-23 07:25:09'),
(14,252,'<p><span style=\"color: rgb(55, 65, 81);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</span></p>','1','2022-03-23 07:25:09','2022-03-23 07:25:09',NULL),
(15,1,'lorem ipsum lorem ipsum','1','2022-03-23 07:25:47','2022-03-23 08:49:38','2022-03-23 08:49:38'),
(16,1,'lorem ipsum lorem ipsum','2','2022-03-23 07:25:47','2022-03-23 08:49:38','2022-03-23 08:49:38'),
(17,1,'lorem ipsum lorem ipsum','1','2022-03-23 08:49:38','2022-03-23 08:50:08','2022-03-23 08:50:08'),
(18,1,'lorem ipsum lorem ipsum','2','2022-03-23 08:49:38','2022-03-23 08:50:08','2022-03-23 08:50:08'),
(19,1,'<p><span style=\"color: rgb(55, 65, 81);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</span></p>','1','2022-03-23 08:50:08','2022-03-23 08:51:53','2022-03-23 08:51:53'),
(20,1,'<p><span style=\"color: rgb(55, 65, 81);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</span></p>','2','2022-03-23 08:50:08','2022-03-23 08:51:53','2022-03-23 08:51:53'),
(21,1,'<p><span style=\"color: rgb(55, 65, 81);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</span></p>','1','2022-03-23 08:51:53','2022-03-23 08:54:52','2022-03-23 08:54:52'),
(22,1,'<p><span style=\"color: rgb(55, 65, 81);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</span></p>','2','2022-03-23 08:51:53','2022-03-23 08:54:52','2022-03-23 08:54:52'),
(23,1,'<p><span style=\"color: rgb(55, 65, 81);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</span></p>','1','2022-03-23 08:54:52','2022-03-23 08:55:41','2022-03-23 08:55:41'),
(24,1,'<p><span style=\"color: rgb(55, 65, 81);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</span></p>','2','2022-03-23 08:54:52','2022-03-23 08:55:41','2022-03-23 08:55:41'),
(25,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-03-23 08:55:41','2022-03-23 09:03:06','2022-03-23 09:03:06'),
(26,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-03-23 08:55:41','2022-03-23 09:03:06','2022-03-23 09:03:06'),
(27,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-03-23 09:03:06','2022-03-23 09:03:18','2022-03-23 09:03:18'),
(28,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-03-23 09:03:06','2022-03-23 09:03:18','2022-03-23 09:03:18'),
(29,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-03-23 09:03:18','2022-03-23 09:03:33','2022-03-23 09:03:33'),
(30,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-03-23 09:03:18','2022-03-23 09:03:33','2022-03-23 09:03:33'),
(31,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-03-23 09:03:33','2022-03-23 09:03:53','2022-03-23 09:03:53'),
(32,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-03-23 09:03:33','2022-03-23 09:03:53','2022-03-23 09:03:53'),
(33,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-03-23 09:03:53','2022-03-23 09:04:14','2022-03-23 09:04:14'),
(34,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-03-23 09:03:53','2022-03-23 09:04:14','2022-03-23 09:04:14'),
(35,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-03-23 09:04:14','2022-03-23 09:15:32','2022-03-23 09:15:32'),
(36,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-03-23 09:04:14','2022-03-23 09:15:32','2022-03-23 09:15:32'),
(37,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-03-23 09:15:32','2022-03-23 09:27:56','2022-03-23 09:27:56'),
(38,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-03-23 09:15:32','2022-03-23 09:27:56','2022-03-23 09:27:56'),
(39,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-03-23 09:27:56','2022-03-23 09:28:19','2022-03-23 09:28:19'),
(40,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-03-23 09:27:56','2022-03-23 09:28:19','2022-03-23 09:28:19'),
(41,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-03-23 09:28:19','2022-03-23 09:28:56','2022-03-23 09:28:56'),
(42,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-03-23 09:28:19','2022-03-23 09:28:56','2022-03-23 09:28:56'),
(43,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-03-23 09:28:56','2022-03-23 09:40:03','2022-03-23 09:40:03'),
(44,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-03-23 09:28:56','2022-03-23 09:40:03','2022-03-23 09:40:03'),
(45,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-03-23 09:40:03','2022-03-23 09:44:22','2022-03-23 09:44:22'),
(46,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-03-23 09:40:03','2022-03-23 09:44:22','2022-03-23 09:44:22'),
(47,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','3','2022-03-23 09:40:03','2022-03-23 09:44:22','2022-03-23 09:44:22'),
(48,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','4','2022-03-23 09:40:03','2022-03-23 09:44:22','2022-03-23 09:44:22'),
(49,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','5','2022-03-23 09:40:03','2022-03-23 09:44:22','2022-03-23 09:44:22'),
(50,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-03-23 09:44:22','2022-03-23 09:46:36','2022-03-23 09:46:36'),
(51,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-03-23 09:44:22','2022-03-23 09:46:36','2022-03-23 09:46:36'),
(52,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','3','2022-03-23 09:44:22','2022-03-23 09:46:36','2022-03-23 09:46:36'),
(53,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','4','2022-03-23 09:44:22','2022-03-23 09:46:36','2022-03-23 09:46:36'),
(54,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','5','2022-03-23 09:44:22','2022-03-23 09:46:36','2022-03-23 09:46:36'),
(55,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','6','2022-03-23 09:44:22','2022-03-23 09:46:36','2022-03-23 09:46:36'),
(56,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-03-23 09:46:36','2022-03-23 09:46:36',NULL),
(57,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-03-23 09:46:36','2022-03-23 09:46:36',NULL),
(58,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','3','2022-03-23 09:46:36','2022-03-23 09:46:36',NULL),
(59,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','4','2022-03-23 09:46:36','2022-03-23 09:46:36',NULL),
(60,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','5','2022-03-23 09:46:36','2022-03-23 09:46:36',NULL);

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

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(18,'2022_03_17_054945_create_country_references_table',1);

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
('210d1a79331f477eb7567fe35947911319a6a9f8fde231edb61e13739de20b9265f8a554dbd6f7a7',1,1,'GGTC CFS Admin API Access Token','[]',0,'2022-03-23 06:27:02','2022-03-23 06:27:02','2022-09-23 06:27:02'),
('6ed58faeb3a3723d1d92982b1bd8365eb0dedaa35676343a55570929ab84696c38a3c3a39f43c623',1,1,'GGTC CFS Admin API Access Token','[]',0,'2022-03-23 06:37:53','2022-03-23 06:37:53','2022-09-23 06:37:53');

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
(1,NULL,'GGCTCFS Personal Access Client','JcyEqUb5mX9671zcdd7F9fHAHUWHo3vpHhfmpXiU',NULL,'http://localhost',1,0,0,'2022-03-23 06:26:40','2022-03-23 06:26:40'),
(2,NULL,'GGCTCFS Password Grant Client','gtIlvFK2cqsz4htihb4ecK1st4Tlicrxu1Tq3mtk','users','http://localhost',0,1,0,'2022-03-23 06:26:40','2022-03-23 06:26:40');

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
(1,1,'2022-03-23 06:26:40','2022-03-23 06:26:40');

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
(1,'admin',NULL,'cfs','admin','Active','admin@dbm.com',NULL,'$2y$10$ftX/Y9YlwY6NwnTfRmvh3.tiphFcw6UDMgoRzwEYHrzXVbYu9avwW',NULL,'2022-03-23 06:26:59','2022-03-23 06:26:59',NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
