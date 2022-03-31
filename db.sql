/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.37-0ubuntu0.18.04.1 : Database - ggtc_staging_cfs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ggtc_staging_cfs` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ggtc_staging_cfs`;

/*Table structure for table `companies` */

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `companies` */

insert  into `companies`(`id`,`name`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Philip Morris','2022-03-30 01:29:53','2022-03-30 01:29:53',NULL),
(2,'British American Tobacco','2022-03-30 01:30:15','2022-03-30 01:30:15',NULL),
(3,'Imperial Brands','2022-03-30 01:30:22','2022-03-30 01:30:22',NULL),
(4,'CNTC','2022-03-30 01:30:27','2022-03-30 01:30:27',NULL),
(5,'Altria Group','2022-03-30 01:30:40','2022-03-30 01:30:40',NULL),
(6,'Japan Tobacco','2022-03-30 01:30:44','2022-03-30 01:30:44',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cost_estimations` */

insert  into `cost_estimations`(`id`,`country_id`,`marine_pollution`,`waste_management`,`partial_cost`,`marine_cost_per_ton`,`waste_cost_per_ton`,`cigarettes_consumed`,`economic_cost`,`economic_cost_currency`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,50000.00,45000.00,150000.00,33000.00,33000.00,100000,150000.00,'ARS','2022-03-30 01:54:53','2022-03-30 01:54:53',NULL),
(2,2,150000.00,154000.00,1500000.00,33000.00,33000.00,900000,660000.00,'BDT','2022-03-30 02:42:08','2022-03-30 02:42:08',NULL),
(3,3,140000.00,160000.00,5220000.00,33000.00,33000.00,50000,80000.00,'BOB','2022-03-30 03:04:55','2022-03-30 03:04:55',NULL),
(4,4,630000.00,650000.00,9500000.00,33000.00,33000.00,700000,560000.00,'BWP','2022-03-30 03:06:12','2022-03-30 03:06:12',NULL),
(5,5,5000000.00,5010000.00,982000000.00,33000.00,33000.00,80000000,80000000.00,'BRL','2022-03-30 03:08:12','2022-03-30 03:08:12',NULL);

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` blob,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `countries` */

insert  into `countries`(`id`,`name`,`iso2`,`iso3`,`flag`,`currency`,`region`,`publish`,`deleted_at`,`created_at`,`updated_at`) values 
(1,'Argentina','AR',NULL,'🇦🇷','ARS','Americas',1,NULL,'2022-03-30 01:30:51','2022-03-30 01:55:03'),
(2,'Bangladesh','BD',NULL,'🇧🇩','BDT','Asia',1,NULL,'2022-03-30 01:30:51','2022-03-30 02:42:13'),
(3,'Bolivia','BO',NULL,'🇧🇴','BOB','Americas',1,NULL,'2022-03-30 01:30:51','2022-03-30 03:04:55'),
(4,'Botswana','BW',NULL,'🇧🇼','BWP','Africa',1,NULL,'2022-03-30 01:30:51','2022-03-30 03:06:12'),
(5,'Brazil','BR',NULL,'🇧🇷','BRL','Americas',1,NULL,'2022-03-30 01:30:51','2022-03-30 03:08:21'),
(6,'Brunei Darussalam','BN','BRN','🇧🇳','BND','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(7,'Burkina Faso','BF','BFA','🇧🇫','XOF','Africa',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(8,'Cambodia','KH','KHM','🇰🇭','KHR','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(9,'Canada','CA','CAN','🇨🇦','CAD','Americas',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(10,'Chile','CL','CHL','🇨🇱','CLP','Americas',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(11,'China','CN','CHN','🇨🇳','CNY','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(12,'Colombia','CO','COL','🇨🇴','COP','Americas',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(13,'Costa Rica','CR','CRI','🇨🇷','CRC','Americas',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(14,'Cote D\'Ivoire','CI','CIV','🇨🇮','XOF','Africa',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(15,'Czech Republic','CZ','CZE','🇨🇿','CZK','Europe',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(16,'Dominican Republic','DO','DOM','🇩🇴','DOP','Americas',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(17,'Ecuador','EC','ECU','🇪🇨','USD','Americas',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(18,'Egypt','EG','EGY','🇪🇬','EGP','Africa',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(19,'El Salvador','SV','SLV','🇸🇻','USD','Americas',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(20,'Ethiopia','ET','ETH','🇪🇹','ETB','Africa',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(21,'Fiji','FJ','FJI','🇫🇯','FJD','Oceania',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(22,'France','FR','FRA','🇫🇷','EUR','Europe',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(23,'Gabon','GA','GAB','🇬🇦','XAF','Africa',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(24,'Georgia','GE','GEO','🇬🇪','GEL','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(25,'Germany','DE','DEU','🇩🇪','EUR','Europe',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(26,'Ghana','GH','GHA','🇬🇭','GHS','Africa',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(27,'Guatemala','GT','GTM','🇬🇹','GTQ','Americas',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(28,'Honduras','HN','HND','🇭🇳','HNL','Americas',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(29,'India','IN','IND','🇮🇳','INR','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(30,'Indonesia','ID','IDN','🇮🇩','IDR','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(31,'Iran','IR','IRN','🇮🇷','IRR','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(32,'Iraq','IQ','IRQ','🇮🇶','IQD','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(33,'Israel','IL','ISR','🇮🇱','ILS','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(34,'Italy','IT','ITA','🇮🇹','EUR','Europe',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(35,'Japan','JP','JPN','🇯🇵','JPY','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(36,'Jordan','JO','JOR','🇯🇴','JOD','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(37,'Kazakhstan','KZ','KAZ','🇰🇿','KZT','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(38,'Kenya','KE','KEN','🇰🇪','KES','Africa',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(39,'South Korea','KR','KOR','🇰🇷','KRW','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(40,'Laos','LA','LAO','🇱🇦','LAK','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(41,'Lebanon','LB','LBN','🇱🇧','LBP','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(42,'Malaysia','MY','MYS','🇲🇾','MYR','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(43,'Maldives','MV','MDV','🇲🇻','MVR','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(44,'Mexico','MX','MEX','🇲🇽','MXN','Americas',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(45,'Mongolia','MN','MNG','🇲🇳','MNT','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(46,'Mozambique','MZ','MOZ','🇲🇿','MZN','Africa',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(47,'Myanmar','MM','MMR','🇲🇲','MMK','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(48,'Nepal','NP','NPL','🇳🇵','NPR','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(49,'New Zealand','NZ','NZL','🇳🇿','NZD','Oceania',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(50,'Nicaragua','NI','NIC','🇳🇮','NIO','Americas',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(51,'Nigeria','NG','NGA','🇳🇬','NGN','Africa',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(52,'Norway','NO','NOR','🇳🇴','NOK','Europe',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(53,'Oman','OM','OMN','🇴🇲','OMR','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(54,'Pakistan','PK','PAK','🇵🇰','PKR','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(55,'Palau','PW','PLW','🇵🇼','USD','Oceania',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(56,'Panama','PA','PAN','🇵🇦','PAB','Americas',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(57,'Paraguay','PY','PRY','🇵🇾','PYG','Americas',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(58,'Peru','PE','PER','🇵🇪','PEN','Americas',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(59,'Philippines','PH','PHL','🇵🇭','PHP','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(60,'Poland','PL','POL','🇵🇱','PLN','Europe',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(61,'Romania','RO','ROU','🇷🇴','RON','Europe',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(62,'Senegal','SN','SEN','🇸🇳','XOF','Africa',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(63,'Solomon Islands','SB','SLB','🇸🇧','SBD','Oceania',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(64,'South Africa','ZA','ZAF','🇿🇦','ZAR','Africa',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(65,'Spain','ES','ESP','🇪🇸','EUR','Europe',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(66,'Sri Lanka','LK','LKA','🇱🇰','LKR','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(67,'Sudan','SD','SDN','🇸🇩','SDG','Africa',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(68,'Switzerland','CH','CHE','🇨🇭','CHF','Europe',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(69,'Tanzania','TZ','TZA','🇹🇿','TZS','Africa',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(70,'Thailand','TH','THA','🇹🇭','THB','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(71,'Netherlands','NL','NLD','🇳🇱','EUR','Europe',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(72,'Turkey','TR','TUR','🇹🇷','TRY','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(73,'United States','US','USA','🇺🇸','USD','Americas',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(74,'Uganda','UG','UGA','🇺🇬','UGX','Africa',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(75,'Ukraine','UA','UKR','🇺🇦','UAH','Europe',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(76,'United Kingdom','GB','GBR','🇬🇧','GBP','Europe',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(77,'Uruguay','UY','URY','🇺🇾','UYU','Americas',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(78,'Venezuela','VE','VEN','🇻🇪','VEF','Americas',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(79,'Vietnam','VN','VNM','🇻🇳','VND','Asia',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51'),
(80,'Zambia','ZM','ZMB','🇿🇲','ZMW','Africa',0,NULL,'2022-03-30 01:30:51','2022-03-30 01:30:51');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_companies` */

insert  into `country_companies`(`id`,`country_id`,`company_id`,`sequence`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,1,1,'2022-03-30 01:54:53','2022-03-30 01:55:03','2022-03-30 01:55:03'),
(2,1,3,2,'2022-03-30 01:54:53','2022-03-30 01:55:03','2022-03-30 01:55:03'),
(3,1,5,3,'2022-03-30 01:54:53','2022-03-30 01:55:03','2022-03-30 01:55:03'),
(4,1,1,1,'2022-03-30 01:55:03','2022-03-30 01:55:03',NULL),
(5,1,3,2,'2022-03-30 01:55:03','2022-03-30 01:55:03',NULL),
(6,1,5,3,'2022-03-30 01:55:03','2022-03-30 01:55:03',NULL),
(7,2,3,1,'2022-03-30 02:42:08','2022-03-30 02:42:13','2022-03-30 02:42:13'),
(8,2,5,2,'2022-03-30 02:42:08','2022-03-30 02:42:13','2022-03-30 02:42:13'),
(9,2,4,3,'2022-03-30 02:42:08','2022-03-30 02:42:13','2022-03-30 02:42:13'),
(10,2,3,1,'2022-03-30 02:42:13','2022-03-30 02:42:13',NULL),
(11,2,5,2,'2022-03-30 02:42:13','2022-03-30 02:42:13',NULL),
(12,2,4,3,'2022-03-30 02:42:13','2022-03-30 02:42:13',NULL),
(13,3,1,1,'2022-03-30 03:04:55','2022-03-30 03:04:55',NULL),
(14,3,3,2,'2022-03-30 03:04:55','2022-03-30 03:04:55',NULL),
(15,3,4,3,'2022-03-30 03:04:55','2022-03-30 03:04:55',NULL),
(16,4,3,1,'2022-03-30 03:06:12','2022-03-30 03:06:12',NULL),
(17,4,2,2,'2022-03-30 03:06:12','2022-03-30 03:06:12',NULL),
(18,4,5,3,'2022-03-30 03:06:12','2022-03-30 03:06:12',NULL),
(19,5,2,1,'2022-03-30 03:08:12','2022-03-30 03:08:21','2022-03-30 03:08:21'),
(20,5,4,2,'2022-03-30 03:08:12','2022-03-30 03:08:21','2022-03-30 03:08:21'),
(21,5,5,3,'2022-03-30 03:08:12','2022-03-30 03:08:21','2022-03-30 03:08:21'),
(22,5,2,1,'2022-03-30 03:08:21','2022-03-30 03:08:21',NULL),
(23,5,4,2,'2022-03-30 03:08:21','2022-03-30 03:08:21',NULL),
(24,5,5,3,'2022-03-30 03:08:21','2022-03-30 03:08:21',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_details` */

insert  into `country_details`(`id`,`country_id`,`death`,`csr_local_examples`,`csr_policy`,`acknowledgement`,`deleted_at`,`created_at`,`updated_at`) values 
(1,1,1000,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>',NULL,'2022-03-30 01:54:53','2022-03-30 01:54:53'),
(2,2,50000,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>',NULL,'2022-03-30 02:42:08','2022-03-30 02:42:08'),
(3,3,60000,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>',NULL,'2022-03-30 03:04:55','2022-03-30 03:04:55'),
(4,4,90000,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>',NULL,'2022-03-30 03:06:12','2022-03-30 03:06:12'),
(5,5,900000,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>',NULL,'2022-03-30 03:08:12','2022-03-30 03:08:12');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_metadata` */

insert  into `country_metadata`(`id`,`country_id`,`meta_title`,`meta_description`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,'Argentina',NULL,'2022-03-30 01:54:53','2022-03-30 01:54:53',NULL),
(2,2,'Bangladesh',NULL,'2022-03-30 02:42:08','2022-03-30 02:42:08',NULL),
(3,3,'Bolivia',NULL,'2022-03-30 03:04:55','2022-03-30 03:04:55',NULL),
(4,4,'Botswana',NULL,'2022-03-30 03:06:12','2022-03-30 03:06:12',NULL),
(5,5,'Brazil',NULL,'2022-03-30 03:08:12','2022-03-30 03:08:12',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_references` */

insert  into `country_references`(`id`,`country_id`,`content`,`sequence`,`created_at`,`updated_at`,`deleted_at`) values 
(1,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-03-30 02:42:08','2022-03-30 02:42:13','2022-03-30 02:42:13'),
(2,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-03-30 02:42:08','2022-03-30 02:42:13','2022-03-30 02:42:13'),
(3,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','3','2022-03-30 02:42:08','2022-03-30 02:42:13','2022-03-30 02:42:13'),
(4,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-03-30 02:42:13','2022-03-30 02:42:13',NULL),
(5,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-03-30 02:42:13','2022-03-30 02:42:13',NULL),
(6,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','3','2022-03-30 02:42:13','2022-03-30 02:42:13',NULL),
(7,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-03-30 03:06:12','2022-03-30 03:06:12',NULL),
(8,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-03-30 03:06:12','2022-03-30 03:06:12',NULL),
(9,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','3','2022-03-30 03:06:12','2022-03-30 03:06:12',NULL),
(10,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','4','2022-03-30 03:06:12','2022-03-30 03:06:12',NULL);

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
(1,'USD',1.00,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(2,'AED',3.67,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(3,'AFN',88.02,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(4,'ALL',110.75,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(5,'AMD',489.63,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(6,'ANG',1.79,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(7,'AOA',450.82,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(8,'ARS',110.46,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(9,'AUD',1.33,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(10,'AWG',1.79,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(11,'AZN',1.69,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(12,'BAM',1.77,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(13,'BBD',2.00,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(14,'BDT',85.46,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(15,'BGN',1.77,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(16,'BHD',0.38,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(17,'BIF',2004.18,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(18,'BMD',1.00,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(19,'BND',1.36,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(20,'BOB',6.85,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(21,'BRL',4.75,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(22,'BSD',1.00,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(23,'BTN',75.68,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(24,'BWP',11.49,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(25,'BYN',3.01,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(26,'BZD',2.00,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(27,'CAD',1.25,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(28,'CDF',1993.90,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(29,'CHF',0.93,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(30,'CLP',778.01,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(31,'CNY',6.37,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(32,'COP',3732.56,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(33,'CRC',656.10,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(34,'CUP',24.00,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(35,'CVE',99.59,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(36,'CZK',22.14,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(37,'DJF',177.72,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(38,'DKK',6.74,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(39,'DOP',54.82,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(40,'DZD',142.63,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(41,'EGP',18.39,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(42,'ERN',15.00,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(43,'ETB',51.14,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(44,'EUR',0.90,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(45,'FJD',2.09,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(46,'FKP',0.76,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(47,'FOK',6.74,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(48,'GBP',0.76,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(49,'GEL',3.13,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(50,'GGP',0.76,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(51,'GHS',8.00,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(52,'GIP',0.76,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(53,'GMD',54.77,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(54,'GNF',8915.07,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(55,'GTQ',7.65,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(56,'GYD',208.82,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(57,'HKD',7.83,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(58,'HNL',24.41,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(59,'HRK',6.80,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(60,'HTG',106.57,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(61,'HUF',333.77,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(62,'IDR',14380.65,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(63,'ILS',3.20,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(64,'IMP',0.76,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(65,'INR',75.68,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(66,'IQD',1456.89,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(67,'IRR',41957.49,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(68,'ISK',128.98,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(69,'JEP',0.76,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(70,'JMD',153.31,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(71,'JOD',0.71,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(72,'JPY',123.05,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(73,'KES',115.16,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(74,'KGS',98.65,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(75,'KHR',4039.24,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(76,'KID',1.33,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(77,'KMF',444.33,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(78,'KRW',1213.85,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(79,'KWD',0.30,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(80,'KYD',0.83,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(81,'KZT',470.56,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(82,'LAK',12847.03,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(83,'LBP',1507.50,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(84,'LKR',289.57,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(85,'LRD',152.33,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(86,'LSL',14.56,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(87,'LYD',4.66,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(88,'MAD',9.45,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(89,'MDL',18.29,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(90,'MGA',3036.03,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(91,'MKD',56.26,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(92,'MMK',1763.60,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(93,'MNT',2924.78,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(94,'MOP',8.07,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(95,'MRU',36.33,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(96,'MUR',44.16,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(97,'MVR',15.40,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(98,'MWK',820.46,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(99,'MXN',19.99,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(100,'MYR',4.21,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(101,'MZN',64.28,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(102,'NAD',14.56,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(103,'NGN',414.80,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(104,'NIO',35.64,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(105,'NOK',8.67,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(106,'NPR',121.09,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(107,'NZD',1.44,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(108,'OMR',0.38,'2022-03-30 01:59:57','2022-03-30 01:59:57',NULL),
(109,'PAB',1.00,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(110,'PEN',3.72,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(111,'PGK',3.51,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(112,'PHP',51.98,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(113,'PKR',181.80,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(114,'PLN',4.21,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(115,'PYG',7024.15,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(116,'QAR',3.64,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(117,'RON',4.46,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(118,'RSD',106.18,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(119,'RUB',87.69,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(120,'RWF',1049.34,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(121,'SAR',3.75,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(122,'SBD',7.87,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(123,'SCR',14.35,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(124,'SDG',445.11,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(125,'SEK',9.34,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(126,'SGD',1.36,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(127,'SHP',0.76,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(128,'SLL',11643.18,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(129,'SOS',577.43,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(130,'SRD',20.61,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(131,'SSP',425.31,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(132,'STN',22.13,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(133,'SYP',2502.56,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(134,'SZL',14.56,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(135,'THB',33.59,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(136,'TJS',12.10,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(137,'TMT',3.50,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(138,'TND',2.79,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(139,'TOP',2.22,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(140,'TRY',14.64,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(141,'TTD',6.76,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(142,'TVD',1.33,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(143,'TWD',28.64,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(144,'TZS',2319.38,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(145,'UAH',29.42,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(146,'UGX',3595.02,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(147,'UYU',41.44,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(148,'UZS',11436.67,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(149,'VES',4.36,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(150,'VND',22837.42,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(151,'VUV',109.93,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(152,'WST',2.55,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(153,'XAF',592.44,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(154,'XCD',2.70,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(155,'XDR',0.73,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(156,'XOF',592.44,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(157,'XPF',107.78,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(158,'YER',249.26,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(159,'ZAR',14.56,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(160,'ZMW',18.02,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL),
(161,'ZWL',138.19,'2022-03-30 01:59:58','2022-03-30 01:59:58',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(19,'2022_03_28_075231_create_currency_rates_table',1);

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
('3a9e5a864d135cf62627d5bf0263e15de1735326b2514a2573e9db6b7b61c664304bde09da0de809',1,1,'GGTC CFS Admin API Access Token','[]',0,'2022-03-30 01:29:25','2022-03-30 01:29:25','2022-09-30 01:29:25'),
('d674be206c5155e6fb66da668c221a60fbb965787a81f1b8d1459c6ade55afc68ded9516c4884b67',1,1,'GGTC CFS Admin API Access Token','[]',0,'2022-03-30 01:37:32','2022-03-30 01:37:32','2022-09-30 01:37:32');

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
(1,NULL,'GGCTCFS Personal Access Client','EZdE2iWBGPnWS0NQvnZAYAxSflHMkEZJB8Zd4boD',NULL,'http://localhost',1,0,0,'2022-03-30 01:28:52','2022-03-30 01:28:52'),
(2,NULL,'GGCTCFS Password Grant Client','p21SdX93lWEPRBSq0bNhrECkuQE0eDRi7vVgqSuL','users','http://localhost',0,1,0,'2022-03-30 01:28:52','2022-03-30 01:28:52');

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
(1,1,'2022-03-30 01:28:52','2022-03-30 01:28:52');

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
(1,'admin',NULL,'cfs','admin','Active','admin@dbm.com',NULL,'$2y$10$Wvc3jaDPKKIYBkx/JIfozeiM0iEIQ/F809RJKoCV8MJQ3rnWtLPgm',NULL,'2022-03-30 01:29:22','2022-03-30 01:29:22',NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
