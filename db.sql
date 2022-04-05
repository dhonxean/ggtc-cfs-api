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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `companies` */

insert  into `companies`(`id`,`name`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Universal Corporation','2022-04-04 10:14:36','2022-04-04 10:14:36',NULL),
(2,'British American Tobacco','2022-04-04 10:14:36','2022-04-04 10:14:36',NULL),
(3,'Philip Morris','2022-04-04 10:14:36','2022-04-04 10:14:36',NULL),
(4,'Imperial Brands','2022-04-04 10:14:36','2022-04-04 10:14:36',NULL),
(5,'Japan Tobacco','2022-04-04 10:14:36','2022-04-04 10:14:36',NULL),
(6,'Altria Group','2022-04-04 10:14:36','2022-04-04 10:14:36',NULL),
(7,'KT&G','2022-04-04 10:14:36','2022-04-04 10:14:36',NULL),
(8,'Gudang Garam','2022-04-04 10:14:36','2022-04-04 10:14:36',NULL),
(9,'Mighty','2022-04-05 01:49:34','2022-04-05 01:49:34',NULL);

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
  `cigarettes_consumed_unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `economic_cost` decimal(20,2) DEFAULT NULL,
  `economic_cost_currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cigarettes_sticks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cost_estimations_country_id_foreign` (`country_id`),
  CONSTRAINT `cost_estimations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cost_estimations` */

insert  into `cost_estimations`(`id`,`country_id`,`marine_pollution`,`waste_management`,`partial_cost`,`marine_cost_per_ton`,`waste_cost_per_ton`,`cigarettes_consumed`,`cigarettes_consumed_unit`,`economic_cost`,`economic_cost_currency`,`cigarettes_sticks`,`created_at`,`updated_at`,`deleted_at`) values 
(3,1,90000.00,90000.00,95000.00,33000.00,33000.00,900000,'M',900000.00,'ARS','90000','2022-04-05 02:05:21','2022-04-05 02:05:21',NULL),
(4,2,1230000.00,50000.00,900000.00,33000.00,33000.00,90000,'M',80000.00,'BDT','90000','2022-04-05 02:06:50','2022-04-05 09:14:36',NULL),
(5,3,20100.00,9100.00,900000.00,33000.00,33000.00,90000,'MT',900000.00,'BOB','90000','2022-04-05 02:09:43','2022-04-05 02:29:15',NULL),
(6,8,90000.00,90000.00,900000.00,33000.00,33000.00,600000,'M',900000.00,'KHR','80000','2022-04-05 02:12:02','2022-04-05 02:12:02',NULL),
(7,23,303000.00,9000.00,900000.00,33000.00,33000.00,600000,'M',900000.00,'XAF','90000','2022-04-05 02:13:38','2022-04-05 09:07:51',NULL);

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` blob,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `countries` */

insert  into `countries`(`id`,`name`,`iso2`,`iso3`,`flag`,`currency`,`currency_symbol`,`region`,`publish`,`deleted_at`,`created_at`,`updated_at`) values 
(1,'Argentina','AR',NULL,'🇦🇷','ARS','$','Americas',1,NULL,'2022-04-04 10:14:42','2022-04-05 02:05:21'),
(2,'Bangladesh','BD',NULL,'🇧🇩','BDT','৳','Asia',1,NULL,'2022-04-04 10:14:42','2022-04-05 02:06:50'),
(3,'Bolivia','BO',NULL,'🇧🇴','BOB','Bs','Americas',1,NULL,'2022-04-04 10:14:42','2022-04-05 02:09:43'),
(4,'Botswana','BW','BWA','🇧🇼','BWP','P','Africa',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(5,'Brazil','BR','BRA','🇧🇷','BRL','R$','Americas',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(6,'Brunei Darussalam','BN','BRN','🇧🇳','BND','B$','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(7,'Burkina Faso','BF','BFA','🇧🇫','XOF','CFA','Africa',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(8,'Cambodia','KH',NULL,'🇰🇭','KHR','KHR','Asia',1,NULL,'2022-04-04 10:14:42','2022-04-05 02:12:02'),
(9,'Canada','CA','CAN','🇨🇦','CAD','$','Americas',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(10,'Chile','CL','CHL','🇨🇱','CLP','$','Americas',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(11,'China','CN','CHN','🇨🇳','CNY','¥','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(12,'Colombia','CO','COL','🇨🇴','COP','$','Americas',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(13,'Costa Rica','CR','CRI','🇨🇷','CRC','₡','Americas',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(14,'Cote D\'Ivoire','CI','CIV','🇨🇮','XOF','CFA','Africa',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(15,'Czech Republic','CZ','CZE','🇨🇿','CZK','Kč','Europe',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(16,'Dominican Republic','DO','DOM','🇩🇴','DOP','$','Americas',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(17,'Ecuador','EC','ECU','🇪🇨','USD','$','Americas',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(18,'Egypt','EG','EGY','🇪🇬','EGP','ج.م','Africa',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(19,'El Salvador','SV','SLV','🇸🇻','USD','$','Americas',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(20,'Ethiopia','ET','ETH','🇪🇹','ETB','Nkf','Africa',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(21,'Fiji','FJ','FJI','🇫🇯','FJD','FJ$','Oceania',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(22,'France','FR','FRA','🇫🇷','EUR','€','Europe',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(23,'Gabon','GA',NULL,'🇬🇦','XAF','FCFA','Africa',1,NULL,'2022-04-04 10:14:42','2022-04-05 02:13:38'),
(24,'Georgia','GE','GEO','🇬🇪','GEL','ლ','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(25,'Germany','DE','DEU','🇩🇪','EUR','€','Europe',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(26,'Ghana','GH','GHA','🇬🇭','GHS','GH₵','Africa',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(27,'Guatemala','GT','GTM','🇬🇹','GTQ','Q','Americas',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(28,'Honduras','HN','HND','🇭🇳','HNL','L','Americas',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(29,'India','IN','IND','🇮🇳','INR','₹','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(30,'Indonesia','ID','IDN','🇮🇩','IDR','Rp','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(31,'Iran','IR','IRN','🇮🇷','IRR','﷼','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(32,'Iraq','IQ','IRQ','🇮🇶','IQD','د.ع','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(33,'Israel','IL','ISR','🇮🇱','ILS','₪','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(34,'Italy','IT','ITA','🇮🇹','EUR','€','Europe',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(35,'Japan','JP','JPN','🇯🇵','JPY','¥','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(36,'Jordan','JO','JOR','🇯🇴','JOD','ا.د','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(37,'Kazakhstan','KZ','KAZ','🇰🇿','KZT','лв','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(38,'Kenya','KE','KEN','🇰🇪','KES','KSh','Africa',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(39,'South Korea','KR','KOR','🇰🇷','KRW','₩','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(40,'Laos','LA','LAO','🇱🇦','LAK','₭','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(41,'Lebanon','LB','LBN','🇱🇧','LBP','£','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(42,'Malaysia','MY','MYS','🇲🇾','MYR','RM','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(43,'Maldives','MV','MDV','🇲🇻','MVR','Rf','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(44,'Mexico','MX','MEX','🇲🇽','MXN','$','Americas',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(45,'Mongolia','MN','MNG','🇲🇳','MNT','₮','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(46,'Mozambique','MZ','MOZ','🇲🇿','MZN','MT','Africa',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(47,'Myanmar','MM','MMR','🇲🇲','MMK','K','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(48,'Nepal','NP','NPL','🇳🇵','NPR','₨','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(49,'New Zealand','NZ','NZL','🇳🇿','NZD','$','Oceania',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(50,'Nicaragua','NI','NIC','🇳🇮','NIO','C$','Americas',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(51,'Nigeria','NG','NGA','🇳🇬','NGN','₦','Africa',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(52,'Norway','NO','NOR','🇳🇴','NOK','kr','Europe',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(53,'Oman','OM','OMN','🇴🇲','OMR','.ع.ر','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(54,'Pakistan','PK','PAK','🇵🇰','PKR','₨','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(55,'Palau','PW','PLW','🇵🇼','USD','$','Oceania',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(56,'Panama','PA','PAN','🇵🇦','PAB','B/.','Americas',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(57,'Paraguay','PY','PRY','🇵🇾','PYG','₲','Americas',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(58,'Peru','PE','PER','🇵🇪','PEN','S/.','Americas',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(59,'Philippines','PH','PHL','🇵🇭','PHP','₱','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(60,'Poland','PL','POL','🇵🇱','PLN','zł','Europe',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(61,'Romania','RO','ROU','🇷🇴','RON','lei','Europe',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(62,'Senegal','SN','SEN','🇸🇳','XOF','CFA','Africa',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(63,'Solomon Islands','SB','SLB','🇸🇧','SBD','Si$','Oceania',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(64,'South Africa','ZA','ZAF','🇿🇦','ZAR','R','Africa',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(65,'Spain','ES','ESP','🇪🇸','EUR','€','Europe',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(66,'Sri Lanka','LK','LKA','🇱🇰','LKR','Rs','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(67,'Sudan','SD','SDN','🇸🇩','SDG','.س.ج','Africa',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(68,'Switzerland','CH','CHE','🇨🇭','CHF','CHf','Europe',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(69,'Tanzania','TZ','TZA','🇹🇿','TZS','TSh','Africa',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(70,'Thailand','TH','THA','🇹🇭','THB','฿','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(71,'Netherlands','NL','NLD','🇳🇱','EUR','€','Europe',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(72,'Turkey','TR','TUR','🇹🇷','TRY','₺','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(73,'United States','US','USA','🇺🇸','USD','$','Americas',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(74,'Uganda','UG','UGA','🇺🇬','UGX','USh','Africa',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(75,'Ukraine','UA','UKR','🇺🇦','UAH','₴','Europe',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(76,'United Kingdom','GB','GBR','🇬🇧','GBP','£','Europe',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(77,'Uruguay','UY','URY','🇺🇾','UYU','$','Americas',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(78,'Venezuela','VE','VEN','🇻🇪','VEF','Bs','Americas',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(79,'Vietnam','VN','VNM','🇻🇳','VND','₫','Asia',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42'),
(80,'Zambia','ZM','ZMB','🇿🇲','ZMW','ZK','Africa',0,NULL,'2022-04-04 10:14:42','2022-04-04 10:14:42');

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_companies` */

insert  into `country_companies`(`id`,`country_id`,`company_id`,`sequence`,`created_at`,`updated_at`,`deleted_at`) values 
(16,1,3,1,'2022-04-05 02:05:21','2022-04-05 02:05:21',NULL),
(17,1,2,2,'2022-04-05 02:05:21','2022-04-05 02:05:21',NULL),
(18,1,1,3,'2022-04-05 02:05:21','2022-04-05 02:05:21',NULL),
(19,2,2,1,'2022-04-05 02:06:50','2022-04-05 02:07:00','2022-04-05 02:07:00'),
(20,2,1,2,'2022-04-05 02:06:50','2022-04-05 02:07:00','2022-04-05 02:07:00'),
(21,2,3,3,'2022-04-05 02:06:50','2022-04-05 02:07:00','2022-04-05 02:07:00'),
(22,2,2,1,'2022-04-05 02:07:00','2022-04-05 09:12:52','2022-04-05 09:12:52'),
(23,2,1,2,'2022-04-05 02:07:00','2022-04-05 09:12:52','2022-04-05 09:12:52'),
(24,2,3,3,'2022-04-05 02:07:00','2022-04-05 09:12:52','2022-04-05 09:12:52'),
(25,3,3,1,'2022-04-05 02:09:43','2022-04-05 02:28:10','2022-04-05 02:28:10'),
(26,3,4,2,'2022-04-05 02:09:43','2022-04-05 02:28:10','2022-04-05 02:28:10'),
(27,3,5,3,'2022-04-05 02:09:43','2022-04-05 02:28:10','2022-04-05 02:28:10'),
(28,8,5,1,'2022-04-05 02:12:02','2022-04-05 02:12:02',NULL),
(29,8,3,2,'2022-04-05 02:12:02','2022-04-05 02:12:02',NULL),
(30,23,6,1,'2022-04-05 02:13:38','2022-04-05 02:30:07','2022-04-05 02:30:07'),
(31,3,3,1,'2022-04-05 02:28:10','2022-04-05 02:28:27','2022-04-05 02:28:27'),
(32,3,4,2,'2022-04-05 02:28:10','2022-04-05 02:28:27','2022-04-05 02:28:27'),
(33,3,5,3,'2022-04-05 02:28:10','2022-04-05 02:28:27','2022-04-05 02:28:27'),
(34,3,3,1,'2022-04-05 02:28:27','2022-04-05 02:29:15','2022-04-05 02:29:15'),
(35,3,4,2,'2022-04-05 02:28:27','2022-04-05 02:29:15','2022-04-05 02:29:15'),
(36,3,5,3,'2022-04-05 02:28:27','2022-04-05 02:29:15','2022-04-05 02:29:15'),
(37,3,3,1,'2022-04-05 02:29:15','2022-04-05 02:29:15',NULL),
(38,3,4,2,'2022-04-05 02:29:15','2022-04-05 02:29:15',NULL),
(39,3,5,3,'2022-04-05 02:29:15','2022-04-05 02:29:15',NULL),
(40,23,6,1,'2022-04-05 02:30:07','2022-04-05 02:30:19','2022-04-05 02:30:19'),
(41,23,6,1,'2022-04-05 02:30:19','2022-04-05 02:38:48','2022-04-05 02:38:48'),
(42,23,6,1,'2022-04-05 02:38:48','2022-04-05 09:07:51','2022-04-05 09:07:51'),
(43,23,6,1,'2022-04-05 09:07:51','2022-04-05 09:07:51',NULL),
(44,2,2,1,'2022-04-05 09:12:52','2022-04-05 09:14:11','2022-04-05 09:14:11'),
(45,2,1,2,'2022-04-05 09:12:52','2022-04-05 09:14:11','2022-04-05 09:14:11'),
(46,2,3,3,'2022-04-05 09:12:52','2022-04-05 09:14:11','2022-04-05 09:14:11'),
(47,2,2,1,'2022-04-05 09:14:11','2022-04-05 09:14:24','2022-04-05 09:14:24'),
(48,2,1,2,'2022-04-05 09:14:11','2022-04-05 09:14:24','2022-04-05 09:14:24'),
(49,2,3,3,'2022-04-05 09:14:11','2022-04-05 09:14:24','2022-04-05 09:14:24'),
(50,2,2,1,'2022-04-05 09:14:24','2022-04-05 09:14:36','2022-04-05 09:14:36'),
(51,2,1,2,'2022-04-05 09:14:24','2022-04-05 09:14:36','2022-04-05 09:14:36'),
(52,2,3,3,'2022-04-05 09:14:24','2022-04-05 09:14:36','2022-04-05 09:14:36'),
(53,2,2,1,'2022-04-05 09:14:36','2022-04-05 09:14:36',NULL),
(54,2,1,2,'2022-04-05 09:14:36','2022-04-05 09:14:36',NULL),
(55,2,3,3,'2022-04-05 09:14:36','2022-04-05 09:14:36',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_details` */

insert  into `country_details`(`id`,`country_id`,`death`,`csr_local_examples`,`csr_policy`,`acknowledgement`,`deleted_at`,`created_at`,`updated_at`) values 
(3,1,90000,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>',NULL,'2022-04-05 02:05:21','2022-04-05 02:05:21'),
(4,2,80000,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>',NULL,'2022-04-05 02:06:50','2022-04-05 02:06:50'),
(5,3,90000,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>',NULL,'2022-04-05 02:09:43','2022-04-05 02:09:43'),
(6,8,91000,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>',NULL,'2022-04-05 02:12:02','2022-04-05 02:12:02'),
(7,23,900000,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>',NULL,'2022-04-05 02:13:38','2022-04-05 02:13:38');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_metadata` */

insert  into `country_metadata`(`id`,`country_id`,`meta_title`,`meta_description`,`created_at`,`updated_at`,`deleted_at`) values 
(3,1,'Argentina',NULL,'2022-04-05 02:05:21','2022-04-05 02:05:21',NULL),
(4,2,'Bangladesh',NULL,'2022-04-05 02:06:50','2022-04-05 02:06:50',NULL),
(5,3,'Bolivia',NULL,'2022-04-05 02:09:43','2022-04-05 02:09:43',NULL),
(6,8,'Cambodia',NULL,'2022-04-05 02:12:02','2022-04-05 02:12:02',NULL),
(7,23,'Gabon',NULL,'2022-04-05 02:13:38','2022-04-05 02:13:38',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_references` */

insert  into `country_references`(`id`,`country_id`,`content`,`sequence`,`created_at`,`updated_at`,`deleted_at`) values 
(1,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-04-05 02:07:00','2022-04-05 09:12:52','2022-04-05 09:12:52'),
(2,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-04-05 02:07:00','2022-04-05 09:12:52','2022-04-05 09:12:52'),
(3,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','3','2022-04-05 02:07:00','2022-04-05 09:12:52','2022-04-05 09:12:52'),
(4,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-04-05 09:12:52','2022-04-05 09:14:11','2022-04-05 09:14:11'),
(5,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-04-05 09:12:52','2022-04-05 09:14:11','2022-04-05 09:14:11'),
(6,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','3','2022-04-05 09:12:52','2022-04-05 09:14:11','2022-04-05 09:14:11'),
(7,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-04-05 09:14:11','2022-04-05 09:14:24','2022-04-05 09:14:24'),
(8,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-04-05 09:14:11','2022-04-05 09:14:24','2022-04-05 09:14:24'),
(9,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','3','2022-04-05 09:14:11','2022-04-05 09:14:24','2022-04-05 09:14:24'),
(10,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-04-05 09:14:24','2022-04-05 09:14:36','2022-04-05 09:14:36'),
(11,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-04-05 09:14:24','2022-04-05 09:14:36','2022-04-05 09:14:36'),
(12,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','3','2022-04-05 09:14:24','2022-04-05 09:14:36','2022-04-05 09:14:36'),
(13,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-04-05 09:14:36','2022-04-05 09:14:36',NULL),
(14,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-04-05 09:14:36','2022-04-05 09:14:36',NULL),
(15,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','3','2022-04-05 09:14:36','2022-04-05 09:14:36',NULL);

/*Table structure for table `currency_rates` */

DROP TABLE IF EXISTS `currency_rates`;

CREATE TABLE `currency_rates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `currency_rates` */

insert  into `currency_rates`(`id`,`name`,`amount`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'USD',1.00,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(2,'AED',3.67,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(3,'AFN',88.87,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(4,'ALL',109.79,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(5,'AMD',484.71,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(6,'ANG',1.79,'2022-04-04 10:34:35','2022-04-04 10:34:35',NULL),
(7,'AOA',444.66,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(8,'ARS',111.01,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(9,'AUD',1.33,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(10,'AWG',1.79,'2022-04-04 10:34:35','2022-04-04 10:34:35',NULL),
(11,'AZN',1.70,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(12,'BAM',1.77,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(13,'BBD',2.00,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(14,'BDT',85.50,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(15,'BGN',1.77,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(16,'BHD',0.38,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(17,'BIF',2015.37,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(18,'BMD',1.00,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(19,'BND',1.36,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(20,'BOB',6.87,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(21,'BRL',4.72,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(22,'BSD',1.00,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(23,'BTN',76.05,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(24,'BWP',11.50,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(25,'BYN',3.12,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(26,'BZD',2.00,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(27,'CAD',1.25,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(28,'CDF',1997.08,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(29,'CHF',0.93,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(30,'CLP',786.97,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(31,'CNY',6.37,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(32,'COP',3768.88,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(33,'CRC',657.00,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(34,'CUP',24.00,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(35,'CVE',99.89,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(36,'CZK',22.07,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(37,'DJF',177.72,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(38,'DKK',6.76,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(39,'DOP',55.10,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(40,'DZD',143.29,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(41,'EGP',18.28,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(42,'ERN',15.00,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(43,'ETB',51.18,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(44,'EUR',0.91,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(45,'FJD',2.08,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(46,'FKP',0.76,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(47,'FOK',6.76,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(48,'GBP',0.76,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(49,'GEL',3.09,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(50,'GGP',0.76,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(51,'GHS',7.81,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(52,'GIP',0.76,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(53,'GMD',54.80,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(54,'GNF',8946.24,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(55,'GTQ',7.69,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(56,'GYD',209.60,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(57,'HKD',7.84,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(58,'HNL',24.60,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(59,'HRK',6.83,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(60,'HTG',105.92,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(61,'HUF',332.75,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(62,'IDR',14325.76,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(63,'ILS',3.21,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(64,'IMP',0.76,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(65,'INR',75.95,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(66,'IQD',1462.40,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(67,'IRR',42053.36,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(68,'ISK',128.35,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(69,'JEP',0.76,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(70,'JMD',153.58,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(71,'JOD',0.71,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(72,'JPY',122.79,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(73,'KES',115.19,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(74,'KGS',94.59,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(75,'KHR',4057.02,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(76,'KID',1.33,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(77,'KMF',445.67,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(78,'KRW',1217.78,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(79,'KWD',0.30,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(80,'KYD',0.83,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(81,'KZT',473.15,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(82,'LAK',12853.11,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(83,'LBP',1507.50,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(84,'LKR',289.42,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(85,'LRD',152.83,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(86,'LSL',14.64,'2022-04-04 10:34:35','2022-04-04 10:34:36',NULL),
(87,'LYD',4.68,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(88,'MAD',9.57,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(89,'MDL',18.34,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(90,'MGA',3170.75,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(91,'MKD',55.79,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(92,'MMK',1766.76,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(93,'MNT',2954.72,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(94,'MOP',8.08,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(95,'MRU',36.47,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(96,'MUR',43.82,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(97,'MVR',15.39,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(98,'MWK',820.20,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(99,'MXN',19.89,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(100,'MYR',4.18,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(101,'MZN',64.39,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(102,'NAD',14.64,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(103,'NGN',415.72,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(104,'NIO',35.87,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(105,'NOK',8.76,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(106,'NPR',121.68,'2022-04-04 10:34:35','2022-04-04 10:34:37',NULL),
(107,'NZD',1.45,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(108,'OMR',0.38,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(109,'PAB',1.00,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(110,'PEN',3.68,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(111,'PGK',3.52,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(112,'PHP',51.56,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(113,'PKR',184.15,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(114,'PLN',4.19,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(115,'PYG',7005.49,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(116,'QAR',3.64,'2022-04-04 10:34:36','2022-04-04 10:34:36',NULL),
(117,'RON',4.46,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(118,'RSD',106.52,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(119,'RUB',82.78,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(120,'RWF',1046.94,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(121,'SAR',3.75,'2022-04-04 10:34:36','2022-04-04 10:34:36',NULL),
(122,'SBD',7.91,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(123,'SCR',14.38,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(124,'SDG',446.06,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(125,'SEK',9.37,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(126,'SGD',1.36,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(127,'SHP',0.76,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(128,'SLL',11827.24,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(129,'SOS',579.57,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(130,'SRD',20.75,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(131,'SSP',426.05,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(132,'STN',22.19,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(133,'SYP',2509.13,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(134,'SZL',14.64,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(135,'THB',33.57,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(136,'TJS',12.96,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(137,'TMT',3.50,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(138,'TND',2.90,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(139,'TOP',2.26,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(140,'TRY',14.70,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(141,'TTD',6.79,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(142,'TVD',1.33,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(143,'TWD',28.57,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(144,'TZS',2317.07,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(145,'UAH',29.22,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(146,'UGX',3571.48,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(147,'UYU',41.31,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(148,'UZS',11353.33,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(149,'VES',4.38,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(150,'VND',22842.74,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(151,'VUV',112.99,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(152,'WST',2.57,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(153,'XAF',594.23,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(154,'XCD',2.70,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(155,'XDR',0.73,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(156,'XOF',594.23,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(157,'XPF',108.10,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(158,'YER',250.22,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(159,'ZAR',14.64,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(160,'ZMW',17.86,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL),
(161,'ZWL',141.29,'2022-04-04 10:34:36','2022-04-04 10:34:37',NULL);

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

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(18,'2022_03_17_054945_create_country_references_table',1),
(19,'2022_03_28_075231_create_currency_rates_table',1),
(20,'2022_04_04_022510_create_jobs_table',1);

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
('4ef538ae67c6eea16ba16603d7129e8a1798941b3c1e778f12e6df29c0ce271a7da1d9d3c69d045a',1,1,'GGTC CFS Admin API Access Token','[]',0,'2022-04-04 10:14:53','2022-04-04 10:14:53','2022-10-04 10:14:53'),
('eacacaca3bbacfa52617bab50e593d05baad657bac6bec637f5978bae4a8a5251d0b9bd490a503f6',1,1,'GGTC CFS Admin API Access Token','[]',0,'2022-04-04 10:14:17','2022-04-04 10:14:17','2022-10-04 10:14:17');

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
(1,NULL,'GGCTCFS Personal Access Client','b4rKTmcfsKEGzqOXvgPVfXFybJ20V0E6uCrKXcwX',NULL,'http://localhost',1,0,0,'2022-04-04 10:13:42','2022-04-04 10:13:42'),
(2,NULL,'GGCTCFS Password Grant Client','5DChhUPywojuSDkOfpDs5yunisOEEs4JKhlneDmU','users','http://localhost',0,1,0,'2022-04-04 10:13:42','2022-04-04 10:13:42');

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
(1,1,'2022-04-04 10:13:42','2022-04-04 10:13:42');

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
(1,'admin',NULL,'cfs','admin','Active','admin@dbm.com',NULL,'$2y$10$U0Vzb0Ea.muUivrc3PLmnuMy7q1Ev3VvYKE2cwOz7pLznYRElOKGe',NULL,'2022-04-04 10:14:15','2022-04-04 10:14:15',NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
