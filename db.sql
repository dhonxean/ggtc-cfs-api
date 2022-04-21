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
(1,'Japan Tobacco1','2022-04-18 03:56:56','2022-04-18 03:56:56',NULL),
(2,'China National Tobacco Corporation','2022-04-18 06:01:44','2022-04-18 06:01:44',NULL),
(3,'British American Tobacco','2022-04-18 06:01:53','2022-04-18 06:01:53',NULL),
(4,'Philip Morris International','2022-04-18 06:02:02','2022-04-18 06:02:02',NULL),
(5,'Imperial','2022-04-18 06:02:12','2022-04-18 06:02:12',NULL),
(6,'Japan Tobacco Inc','2022-04-18 06:02:23','2022-04-18 06:02:23',NULL),
(7,'Altria','2022-04-18 06:02:34','2022-04-18 06:02:34',NULL),
(8,'Philip Morris','2022-04-21 03:36:44','2022-04-21 03:36:44',NULL),
(9,'Mighty','2022-04-21 03:36:44','2022-04-21 03:36:44',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cost_estimations` */

insert  into `cost_estimations`(`id`,`country_id`,`marine_pollution`,`waste_management`,`partial_cost`,`marine_cost_per_ton`,`waste_cost_per_ton`,`cigarettes_consumed`,`cigarettes_consumed_unit`,`economic_cost`,`economic_cost_currency`,`cigarettes_sticks`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,183000.00,1840000.00,41500000.00,33000.00,33000.00,15000000,'M',18000000.00,'USD','1900000','2022-04-18 06:03:52','2022-04-18 06:03:52',NULL),
(2,2,3000000.00,3000000.00,30000000000.00,33000.00,33000.00,900000,'M',80000.00,'BDT','900000','2022-04-18 07:48:18','2022-04-18 07:48:18',NULL),
(3,81,90000.00,80000.00,9000000.00,33000.00,33000.00,10000,'M',9000000.00,'PHP','90000','2022-04-21 03:36:44','2022-04-21 03:36:44',NULL),
(4,82,90000.00,80000.00,9000000.00,33000.00,33000.00,10000,'M',9000000.00,'PHP','90000','2022-04-21 03:37:43','2022-04-21 03:37:43',NULL);

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
(1,'Argentina','AR',NULL,'🇦🇷','8','$','Americas',1,NULL,'2022-04-18 05:01:54','2022-04-18 06:03:52'),
(2,'Bangladesh','BD',NULL,'🇧🇩','14','৳','Asia',1,NULL,'2022-04-18 05:01:54','2022-04-18 07:48:28'),
(3,'Bolivia','BO','BOL','🇧🇴','20','Bs.','Americas',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(4,'Botswana','BW','BWA','🇧🇼','24','P','Africa',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(5,'Brazil','BR','BRA','🇧🇷','21','R$','Americas',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(6,'Brunei Darussalam','BN','BRN','🇧🇳','19','B$','Asia',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(7,'Burkina Faso','BF','BFA','🇧🇫','156','CFA','Africa',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(8,'Cambodia','KH','KHM','🇰🇭','75','KHR','Asia',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(9,'Canada','CA','CAN','🇨🇦','27','$','Americas',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(10,'Chile','CL','CHL','🇨🇱','30','$','Americas',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(11,'China','CN','CHN','🇨🇳','31','¥','Asia',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(12,'Colombia','CO','COL','🇨🇴','32','$','Americas',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(13,'Costa Rica','CR','CRI','🇨🇷','33','₡','Americas',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(14,'Cote D\'Ivoire','CI','CIV','🇨🇮','156','CFA','Africa',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(15,'Czech Republic','CZ','CZE','🇨🇿','36','Kč','Europe',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(16,'Dominican Republic','DO','DOM','🇩🇴','39','$','Americas',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(17,'Ecuador','EC','ECU','🇪🇨','1','$','Americas',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(18,'Egypt','EG','EGY','🇪🇬','41','ج.م','Africa',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(19,'El Salvador','SV','SLV','🇸🇻','1','$','Americas',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(20,'Ethiopia','ET','ETH','🇪🇹','43','Nkf','Africa',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(21,'Fiji','FJ','FJI','🇫🇯','45','FJ$','Oceania',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(22,'France','FR','FRA','🇫🇷','44','€','Europe',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(23,'Gabon','GA','GAB','🇬🇦','153','FCFA','Africa',0,NULL,'2022-04-18 05:01:54','2022-04-18 05:01:54'),
(24,'Georgia','GE','GEO','🇬🇪','49','ლ','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(25,'Germany','DE','DEU','🇩🇪','44','€','Europe',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(26,'Ghana','GH','GHA','🇬🇭','51','GH₵','Africa',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(27,'Guatemala','GT','GTM','🇬🇹','55','Q','Americas',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(28,'Honduras','HN','HND','🇭🇳','58','L','Americas',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(29,'India','IN','IND','🇮🇳','65','₹','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(30,'Indonesia','ID','IDN','🇮🇩','62','Rp','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(31,'Iran','IR','IRN','🇮🇷','67','﷼','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(32,'Iraq','IQ','IRQ','🇮🇶','66','د.ع','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(33,'Israel','IL','ISR','🇮🇱','63','₪','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(34,'Italy','IT','ITA','🇮🇹','44','€','Europe',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(35,'Japan','JP','JPN','🇯🇵','72','¥','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(36,'Jordan','JO','JOR','🇯🇴','71','ا.د','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(37,'Kazakhstan','KZ','KAZ','🇰🇿','81','лв','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(38,'Kenya','KE','KEN','🇰🇪','73','KSh','Africa',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(39,'South Korea','KR','KOR','🇰🇷','78','₩','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(40,'Laos','LA','LAO','🇱🇦','82','₭','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(41,'Lebanon','LB','LBN','🇱🇧','83','£','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(42,'Malaysia','MY','MYS','🇲🇾','100','RM','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(43,'Maldives','MV','MDV','🇲🇻','97','Rf','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(44,'Mexico','MX','MEX','🇲🇽','99','$','Americas',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(45,'Mongolia','MN','MNG','🇲🇳','93','₮','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(46,'Mozambique','MZ','MOZ','🇲🇿','101','MT','Africa',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(47,'Myanmar','MM','MMR','🇲🇲','92','K','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(48,'Nepal','NP','NPL','🇳🇵','106','₨','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(49,'New Zealand','NZ','NZL','🇳🇿','107','$','Oceania',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(50,'Nicaragua','NI','NIC','🇳🇮','104','C$','Americas',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(51,'Nigeria','NG','NGA','🇳🇬','103','₦','Africa',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(52,'Norway','NO','NOR','🇳🇴','105','kr','Europe',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(53,'Oman','OM','OMN','🇴🇲','108','.ع.ر','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(54,'Pakistan','PK','PAK','🇵🇰','113','₨','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(55,'Palau','PW','PLW','🇵🇼','1','$','Oceania',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(56,'Panama','PA','PAN','🇵🇦','109','B/.','Americas',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(57,'Paraguay','PY','PRY','🇵🇾','115','₲','Americas',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(58,'Peru','PE','PER','🇵🇪','110','S/.','Americas',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(59,'Philippines','PH','PHL','🇵🇭','112','₱','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(60,'Poland','PL','POL','🇵🇱','114','zł','Europe',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(61,'Romania','RO','ROU','🇷🇴','117','lei','Europe',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(62,'Senegal','SN','SEN','🇸🇳','156','CFA','Africa',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(63,'Solomon Islands','SB','SLB','🇸🇧','122','Si$','Oceania',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(64,'South Africa','ZA','ZAF','🇿🇦','159','R','Africa',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(65,'Spain','ES','ESP','🇪🇸','44','€','Europe',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(66,'Sri Lanka','LK','LKA','🇱🇰','84','Rs','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(67,'Sudan','SD','SDN','🇸🇩','124','.س.ج','Africa',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(68,'Switzerland','CH','CHE','🇨🇭','29','CHf','Europe',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(69,'Tanzania','TZ','TZA','🇹🇿','144','TSh','Africa',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(70,'Thailand','TH','THA','🇹🇭','135','฿','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(71,'Netherlands','NL','NLD','🇳🇱','44','€','Europe',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(72,'Turkey','TR','TUR','🇹🇷','140','₺','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(73,'United States','US','USA','🇺🇸','1','$','Americas',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(74,'Uganda','UG','UGA','🇺🇬','146','USh','Africa',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(75,'Ukraine','UA','UKR','🇺🇦','145','₴','Europe',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(76,'United Kingdom','GB','GBR','🇬🇧','48','£','Europe',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(77,'Uruguay','UY','URY','🇺🇾','147','$','Americas',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(78,'Venezuela','VE','VEN','🇻🇪',NULL,'Bs','Americas',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(79,'Vietnam','VN','VNM','🇻🇳','150','₫','Asia',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(80,'Zambia','ZM','ZMB','🇿🇲','160','ZK','Africa',0,NULL,'2022-04-18 05:01:55','2022-04-18 05:01:55'),
(81,'Test','TES',NULL,NULL,'112','P','Asia',0,'2022-04-21 11:39:22','2022-04-21 03:36:44','2022-04-21 03:36:44'),
(82,'Test','TEST',NULL,NULL,'164','P','Asia',0,'2022-04-21 11:38:01','2022-04-21 03:37:43','2022-04-21 03:37:43');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_companies` */

insert  into `country_companies`(`id`,`country_id`,`company_id`,`sequence`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,4,1,'2022-04-18 06:03:52','2022-04-21 05:49:40','2022-04-21 05:49:40'),
(2,2,1,1,'2022-04-18 07:48:18','2022-04-18 07:48:28','2022-04-18 07:48:28'),
(3,2,1,1,'2022-04-18 07:48:28','2022-04-18 07:48:28',NULL),
(4,81,8,1,'2022-04-21 03:36:44','2022-04-21 03:36:44',NULL),
(5,81,3,2,'2022-04-21 03:36:44','2022-04-21 03:36:44',NULL),
(6,81,9,3,'2022-04-21 03:36:44','2022-04-21 03:36:44',NULL),
(7,82,8,1,'2022-04-21 03:37:43','2022-04-21 03:37:43',NULL),
(8,82,3,2,'2022-04-21 03:37:43','2022-04-21 03:37:43',NULL),
(9,82,9,3,'2022-04-21 03:37:43','2022-04-21 03:37:43',NULL),
(10,1,4,1,'2022-04-21 05:49:40','2022-04-21 05:49:40',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_details` */

insert  into `country_details`(`id`,`country_id`,`death`,`csr_local_examples`,`csr_policy`,`acknowledgement`,`deleted_at`,`created_at`,`updated_at`) values 
(1,1,1000000,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>',NULL,'2022-04-18 06:03:52','2022-04-18 06:03:52'),
(2,2,80000,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>',NULL,'2022-04-18 07:48:18','2022-04-18 07:48:18'),
(3,81,90000,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.\n\n\n','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.\n\n\n','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.\n\n\n',NULL,'2022-04-21 03:36:44','2022-04-21 03:36:44'),
(4,82,90000,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.\n\n\n','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.\n\n\n','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.\n\n\n',NULL,'2022-04-21 03:37:43','2022-04-21 03:37:43');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_metadata` */

insert  into `country_metadata`(`id`,`country_id`,`meta_title`,`meta_description`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,'Argentina',NULL,'2022-04-18 06:03:52','2022-04-18 06:03:52',NULL),
(2,2,'Bangladesh',NULL,'2022-04-18 07:48:18','2022-04-18 07:48:18',NULL),
(3,81,'Test','','2022-04-21 03:36:44','2022-04-21 03:36:44',NULL),
(4,82,'Test','','2022-04-21 03:37:43','2022-04-21 03:37:43',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `country_references` */

insert  into `country_references`(`id`,`country_id`,`content`,`sequence`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','1','2022-04-21 05:49:40','2022-04-21 05:49:40',NULL),
(2,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Proin tortor purus platea sit eu id nisi litora libero. Neque vulputate consequat ac amet augue blandit maximus aliquet congue. Pharetra vestibulum posuere ornare faucibus fusce dictumst orci aenean eu facilisis ut volutpat commodo senectus purus himenaeos fames primis convallis nisi.</p>','2','2022-04-21 05:49:40','2022-04-21 05:49:40',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `currency_rates` */

insert  into `currency_rates`(`id`,`name`,`amount`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'USD',1.00,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(2,'AED',3.67,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(3,'AFN',87.80,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(4,'ALL',111.91,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(5,'AMD',471.47,'2022-04-18 03:57:32','2022-04-18 03:57:32',NULL),
(6,'ANG',1.79,'2022-04-18 03:57:32','2022-04-18 03:57:32',NULL),
(7,'AOA',423.81,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(8,'ARS',113.11,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(9,'AUD',1.35,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(10,'AWG',1.79,'2022-04-18 03:57:32','2022-04-18 03:57:32',NULL),
(11,'AZN',1.70,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(12,'BAM',1.81,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(13,'BBD',2.00,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(14,'BDT',85.37,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(15,'BGN',1.81,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(16,'BHD',0.38,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(17,'BIF',2019.77,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(18,'BMD',1.00,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(19,'BND',1.36,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(20,'BOB',6.87,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(21,'BRL',4.70,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(22,'BSD',1.00,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(23,'BTN',76.38,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(24,'BWP',11.57,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(25,'BYN',3.14,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(26,'BZD',2.00,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(27,'CAD',1.26,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(28,'CDF',1997.78,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(29,'CHF',0.94,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(30,'CLP',814.52,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(31,'CNY',6.38,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(32,'COP',3721.45,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(33,'CRC',656.11,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(34,'CUP',24.00,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(35,'CVE',102.02,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(36,'CZK',22.60,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(37,'DJF',177.72,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(38,'DKK',6.90,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(39,'DOP',55.01,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(40,'DZD',143.80,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(41,'EGP',18.43,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(42,'ERN',15.00,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(43,'ETB',51.40,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(44,'EUR',0.93,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(45,'FJD',2.09,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(46,'FKP',0.77,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(47,'FOK',6.90,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(48,'GBP',0.77,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(49,'GEL',3.07,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(50,'GGP',0.77,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(51,'GHS',7.73,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(52,'GIP',0.77,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(53,'GMD',53.89,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(54,'GNF',8896.58,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(55,'GTQ',7.66,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(56,'GYD',208.98,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(57,'HKD',7.85,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(58,'HNL',24.48,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(59,'HRK',6.97,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(60,'HTG',107.49,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(61,'HUF',347.32,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(62,'IDR',14296.49,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(63,'ILS',3.22,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(64,'IMP',0.77,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(65,'INR',76.30,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(66,'IQD',1457.02,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(67,'IRR',42029.34,'2022-04-18 03:57:32','2022-04-18 03:57:33',NULL),
(68,'ISK',129.57,'2022-04-18 03:57:32','2022-04-18 03:57:34',NULL),
(69,'JEP',0.77,'2022-04-18 03:57:32','2022-04-18 03:57:34',NULL),
(70,'JMD',154.61,'2022-04-18 03:57:32','2022-04-18 03:57:34',NULL),
(71,'JOD',0.71,'2022-04-18 03:57:32','2022-04-18 03:57:34',NULL),
(72,'JPY',126.74,'2022-04-18 03:57:32','2022-04-18 03:57:34',NULL),
(73,'KES',115.52,'2022-04-18 03:57:32','2022-04-18 03:57:34',NULL),
(74,'KGS',84.49,'2022-04-18 03:57:32','2022-04-18 03:57:34',NULL),
(75,'KHR',4037.03,'2022-04-18 03:57:32','2022-04-18 03:57:34',NULL),
(76,'KID',1.35,'2022-04-18 03:57:32','2022-04-18 03:57:34',NULL),
(77,'KMF',455.17,'2022-04-18 03:57:32','2022-04-18 03:57:34',NULL),
(78,'KRW',1227.26,'2022-04-18 03:57:32','2022-04-18 03:57:34',NULL),
(79,'KWD',0.30,'2022-04-18 03:57:32','2022-04-18 03:57:34',NULL),
(80,'KYD',0.83,'2022-04-18 03:57:32','2022-04-18 03:57:34',NULL),
(81,'KZT',454.51,'2022-04-18 03:57:32','2022-04-18 03:57:34',NULL),
(82,'LAK',13002.01,'2022-04-18 03:57:32','2022-04-18 03:57:34',NULL),
(83,'LBP',1507.50,'2022-04-18 03:57:32','2022-04-18 03:57:34',NULL),
(84,'LKR',314.18,'2022-04-18 03:57:32','2022-04-18 03:57:34',NULL),
(85,'LRD',152.38,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(86,'LSL',14.62,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(87,'LYD',4.69,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(88,'MAD',9.68,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(89,'MDL',18.44,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(90,'MGA',3997.23,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(91,'MKD',56.95,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(92,'MMK',1833.88,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(93,'MNT',3032.78,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(94,'MOP',8.09,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(95,'MRU',36.36,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(96,'MUR',41.66,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(97,'MVR',15.39,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(98,'MWK',816.66,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(99,'MXN',19.99,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(100,'MYR',4.20,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(101,'MZN',64.26,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(102,'NAD',14.62,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(103,'NGN',414.62,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(104,'NIO',35.74,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(105,'NOK',8.81,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(106,'NPR',122.21,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(107,'NZD',1.48,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(108,'OMR',0.38,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(109,'PAB',1.00,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(110,'PEN',3.73,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(111,'PGK',3.51,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(112,'PHP',52.16,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(113,'PKR',181.05,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(114,'PLN',4.27,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(115,'PYG',6888.78,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(116,'QAR',3.64,'2022-04-18 03:57:33','2022-04-18 03:57:33',NULL),
(117,'RON',4.55,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(118,'RSD',108.88,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(119,'RUB',81.32,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(120,'RWF',1045.02,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(121,'SAR',3.75,'2022-04-18 03:57:33','2022-04-18 03:57:33',NULL),
(122,'SBD',7.89,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(123,'SCR',14.38,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(124,'SDG',445.61,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(125,'SEK',9.57,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(126,'SGD',1.36,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(127,'SHP',0.77,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(128,'SLL',12122.54,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(129,'SOS',577.50,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(130,'SRD',20.72,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(131,'SSP',425.95,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(132,'STN',22.67,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(133,'SYP',2512.51,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(134,'SZL',14.62,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(135,'THB',33.73,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(136,'TJS',12.50,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(137,'TMT',3.50,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(138,'TND',2.95,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(139,'TOP',2.23,'2022-04-18 03:57:33','2022-04-18 03:57:33',NULL),
(140,'TRY',14.62,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(141,'TTD',6.79,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(142,'TVD',1.35,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(143,'TWD',28.99,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(144,'TZS',2322.79,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(145,'UAH',29.43,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(146,'UGX',3519.36,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(147,'UYU',41.61,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(148,'UZS',11274.98,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(149,'VES',4.43,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(150,'VND',22921.13,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(151,'VUV',111.70,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(152,'WST',2.56,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(153,'XAF',606.89,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(154,'XCD',2.70,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(155,'XDR',0.73,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(156,'XOF',606.89,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(157,'XPF',110.41,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(158,'YER',250.15,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(159,'ZAR',14.62,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(160,'ZMW',17.40,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(161,'ZWL',150.17,'2022-04-18 03:57:33','2022-04-18 03:57:34',NULL),
(162,'TES',2333.22,'2022-04-18 06:38:36','2022-04-18 06:58:00','2022-04-18 06:58:00'),
(163,'TES1',222.32,'2022-04-18 06:55:43','2022-04-18 06:57:55','2022-04-18 06:57:55'),
(164,'TESTT',1.00,'2022-04-21 03:37:43','2022-04-21 03:37:43',NULL);

/*Table structure for table `dynamic_translations` */

DROP TABLE IF EXISTS `dynamic_translations`;

CREATE TABLE `dynamic_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL,
  `language_id` bigint(20) unsigned NOT NULL,
  `csr_policy` text COLLATE utf8mb4_unicode_ci,
  `csr_local_examples` text COLLATE utf8mb4_unicode_ci,
  `csr_acknowledgement` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dynamic_translations_country_id_foreign` (`country_id`),
  KEY `dynamic_translations_language_id_foreign` (`language_id`),
  CONSTRAINT `dynamic_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dynamic_translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `dynamic_translations` */

insert  into `dynamic_translations`(`id`,`country_id`,`language_id`,`csr_policy`,`csr_local_examples`,`csr_acknowledgement`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,7,NULL,NULL,NULL,'2022-04-19 03:51:57','2022-04-19 03:55:22',NULL),
(2,1,2,NULL,NULL,NULL,'2022-04-19 03:52:16','2022-04-19 03:52:16',NULL),
(3,2,93,'<p>Eto ay ibang lingwahe</p>','<p>Eto ay ibang lingwahe</p>','<p>Eto ay ibang lingwahe</p>','2022-04-19 05:04:25','2022-04-19 05:04:25',NULL),
(4,2,135,'<p>これは別の言語です</p>','<p>これは別の言語です</p>','<p>これは別の言語です</p>','2022-04-19 05:05:18','2022-04-19 05:05:18',NULL),
(5,1,93,'<p>Eto ay ibang lingwahe</p>','<p>Eto ay ibang lingwahe</p>','<p>Eto ay ibang lingwahe</p>','2022-04-19 07:28:00','2022-04-19 07:28:00',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `images` */

insert  into `images`(`id`,`parent_id`,`model`,`category`,`title`,`alt`,`path`,`path_resized`,`file_name`,`file_mode`,`sequence`,`from_import`,`caption`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,'language','flag','georgia flag','georgia-flag','uploads/language/2022-04-20/2022-04-20_07-12-24-425671.png','uploads/language/2022-04-20/2022-04-20_07-12-24-425671_resized.png','georgia.png',NULL,0,0,NULL,'2022-04-20 07:12:24','2022-04-20 07:12:24',NULL),
(2,2,'language','flag','ethiopia flag','ethiopia-flag','uploads/language/2022-04-20/2022-04-20_07-13-15-561308.png','uploads/language/2022-04-20/2022-04-20_07-13-15-561308_resized.png','ethiopia.png',NULL,0,0,NULL,'2022-04-20 07:13:15','2022-04-20 07:13:15',NULL),
(3,3,'language','flag','zambia flag','zambia-flag','uploads/language/2022-04-20/2022-04-20_07-14-11-789830.png','uploads/language/2022-04-20/2022-04-20_07-14-11-789830_resized.png','zambia.png',NULL,0,0,NULL,'2022-04-20 07:14:11','2022-04-20 07:14:11',NULL),
(4,4,'language','flag','ghana flag','ghana-flag','uploads/language/2022-04-20/2022-04-20_07-14-41-895429.png','uploads/language/2022-04-20/2022-04-20_07-14-41-895429_resized.png','ghana.png',NULL,0,0,NULL,'2022-04-20 07:14:41','2022-04-20 07:14:41',NULL),
(5,5,'language','flag','albania flag','albania-flag','uploads/language/2022-04-20/2022-04-20_07-15-08-587915.png','uploads/language/2022-04-20/2022-04-20_07-15-08-587915_resized.png','albania.png',NULL,0,0,NULL,'2022-04-20 07:15:08','2022-04-20 07:15:08',NULL),
(6,6,'language','flag','ethiopia flag','ethiopia-flag','uploads/language/2022-04-20/2022-04-20_07-15-49-475180.png','uploads/language/2022-04-20/2022-04-20_07-15-49-475180_resized.png','ethiopia.png',NULL,0,0,NULL,'2022-04-20 07:15:49','2022-04-20 07:15:49',NULL),
(7,7,'language','flag','algeria flag','algeria-flag','uploads/language/2022-04-20/2022-04-20_07-16-26-687061.png','uploads/language/2022-04-20/2022-04-20_07-16-26-687061_resized.png','algeria.png',NULL,0,0,NULL,'2022-04-20 07:16:26','2022-04-20 07:16:26',NULL),
(8,8,'language','flag','uae flag','uae-flag','uploads/language/2022-04-20/2022-04-20_07-17-00-959859.png','uploads/language/2022-04-20/2022-04-20_07-17-00-959859_resized.png','united_arab_emirates.png',NULL,0,0,NULL,'2022-04-20 07:17:01','2022-04-20 07:17:01',NULL),
(9,93,'language','flag','ph flag','ph-flag','uploads/language/2022-04-20/2022-04-20_07-20-40-900443.png','uploads/language/2022-04-20/2022-04-20_07-20-40-900443_resized.png','philippines.png',NULL,0,0,NULL,'2022-04-20 07:20:41','2022-04-20 07:20:41',NULL);

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

/*Table structure for table `languages` */

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `languages` */

insert  into `languages`(`id`,`name`,`code`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Abkhazian','ab','2022-04-18 07:24:40','2022-04-18 07:24:40',NULL),
(2,'Afar','aa','2022-04-18 07:24:40','2022-04-18 07:24:40',NULL),
(3,'Afrikaans','af','2022-04-18 07:24:40','2022-04-18 07:24:40',NULL),
(4,'Akan','ak','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(5,'Albanian','sq','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(6,'Amharic','am','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(7,'Arabic','ar','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(8,'Arabic (AE)','ar-ae','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(9,'Arabic (BH)','ar-bh','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(10,'Arabic (DZ)','ar-dz','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(11,'Arabic (EG)','ar-eg','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(12,'Arabic (IQ)','ar-iq','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(13,'Arabic (JO)','ar-jo','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(14,'Arabic (KW)','ar-kw','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(15,'Arabic (LB)','ar-lb','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(16,'Arabic (LY)','ar-ly','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(17,'Arabic (MA)','ar-ma','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(18,'Arabic (OM)','ar-om','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(19,'Arabic (QA)','ar-qa','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(20,'Arabic (SA)','ar-sa','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(21,'Arabic (SY)','ar-sy','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(22,'Arabic (TN)','ar-tn','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(23,'Arabic (YE)','ar-ye','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(24,'Aragonese','an','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(25,'Armenian','hy','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(26,'Assamese','as','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(27,'Asturian','ast','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(28,'Avaric','av','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(29,'Avestan','ae','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(30,'Aymara','ay','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(31,'Azerbaijani','az','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(32,'Azerbaijani (Cyrillic)','az-cyrl','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(33,'Bambara','bm','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(34,'Bashkir','ba','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(35,'Basque','eu','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(36,'Belarusian','be','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(37,'Bengali','bn','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(38,'Bihari languages','bh','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(39,'Bislama','bi','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(40,'Bosnian','bs','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(41,'Breton','br','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(42,'Bulgarian','bg','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(43,'Burmese','my','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(44,'Catalan','ca','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(45,'Cebuano','ceb','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(46,'Chamorro','ch','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(47,'Chechen','ce','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(48,'Chichewa','ny','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(49,'Chinese','zh-CN','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(50,'Chinese (HK)','zh-hk','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(51,'Chinese (MO)','zh-mo','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(52,'Chinese (SG)','zh-sg','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(53,'Chinese (simplified)','zh-Hans','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(54,'Chinese (traditional)','zh-Hant','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(55,'Chinese (TW)','zh-TW','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(56,'Church Slavic','cu','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(57,'Chuvash','cv','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(58,'Cornish','kw','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(59,'Corsican','co','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(60,'Cree','cr','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(61,'Croatian','hr','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(62,'Czech','cs','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(63,'Danish','da','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(64,'Dari','prs','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(65,'Divehi','dv','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(66,'Dutch','nl','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(67,'Dzongkha','dz','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(68,'English','en','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(69,'English (AU)','en-au','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(70,'English (BZ)','en-bz','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(71,'English (CA)','en-ca','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(72,'English (GH)','en-gh','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(73,'English (HK)','en-hk','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(74,'English (IE)','en-ie','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(75,'English (IN)','en-in','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(76,'English (JM)','en-jm','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(77,'English (KE)','en-ke','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(78,'English (MU)','en-mu','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(79,'English (NG)','en-ng','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(80,'English (NZ)','en-nz','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(81,'English (PH)','en-ph','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(82,'English (SG)','en-sg','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(83,'English (TT)','en-tt','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(84,'English (UK)','en-gb','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(85,'English (US)','en-us','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(86,'English (ZA)','en-za','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(87,'English (ZW)','en-zw','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(88,'Esperanto','eo','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(89,'Estonian','et','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(90,'Ewe','ee','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(91,'Faroese','fo','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(92,'Fijian','fj','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(93,'Filipino','fil','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(94,'Finnish','fi','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(95,'Flemish','nl-be','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(96,'French','fr','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(97,'French (BE)','fr-be','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(98,'French (CA)','fr-ca','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(99,'French (CH)','fr-ch','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(100,'French (LU)','fr-lu','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(101,'French (MC)','fr-mc','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(102,'Fulah','ff','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(103,'Galician','gl','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(104,'Ganda','lg','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(105,'Georgian','ka','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(106,'German','de','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(107,'German (AT)','de-at','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(108,'German (BE)','de-be','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(109,'German (CH)','de-ch','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(110,'German (LI)','de-li','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(111,'German (LU)','de-lu','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(112,'Greek','el','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(113,'Guarani','gn','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(114,'Gujarati','gu','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(115,'Haitian Creole','ht','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(116,'Hausa','ha','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(117,'Hawaiian','haw','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(118,'Hebrew','he','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(119,'Herero','hz','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(120,'Hindi','hi','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(121,'Hiri Motu','ho','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(122,'Hungarian','hu','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(123,'Icelandic','is','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(124,'Ido','io','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(125,'Igbo','ig','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(126,'Indonesian','id','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(127,'Interlingua','ia','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(128,'Interlingue','ie','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(129,'Inuktitut','iu','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(130,'Inupiaq','ik','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(131,'Irish','ga','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(132,'Italian','it','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(133,'Italian (CH)','it-ch','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(134,'Jamaican Patois','jam','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(135,'Japanese','ja','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(136,'Javanese','jv','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(137,'Kabyle','kab','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(138,'Kalaallisut','kl','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(139,'Kannada','kn','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(140,'Kanuri','kr','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(141,'Kashmiri','ks','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(142,'Kazakh','kk','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(143,'Khmer','km','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(144,'Kikuyu; Gikuyu','ki','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(145,'Kinyarwanda','rw','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(146,'Kirghiz','ky','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(147,'Komi','kv','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(148,'Kongo','kg','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(149,'Korean','ko','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(150,'Kuanyama; Kwanyama','kj','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(151,'Kurdish','ku','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(152,'Lao','lo','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(153,'Latin','la','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(154,'Latvian','lv','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(155,'Limburgish','li','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(156,'Lingala','ln','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(157,'Lithuanian','lt','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(158,'Lojban','jbo','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(159,'Luba-Katanga','lu','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(160,'Luxembourgish','lb','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(161,'Macedonian','mk','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(162,'Malagasy','mg','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(163,'Malay','ms','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(164,'Malay (BN)','ms-bn','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(165,'Malayalam','ml','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(166,'Maltese','mt','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(167,'Manx','gv','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(168,'Maori','mi','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(169,'Marathi','mr','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(170,'Marshallese','mh','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(171,'Moldavian; Moldovan','mo','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(172,'Mongolian','mn','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(173,'Montenegrin','me-me','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(174,'Montenegrin (Cyrillic)','me-cyrl','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(175,'Nauru','na','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(176,'Navajo; Navaho','nv','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(177,'Ndonga','ng','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(178,'Nepali','ne','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(179,'North Ndebele','nd','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(180,'Northern Sami','se','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(181,'Norwegian','no','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(182,'Norwegian Bokmål','nb','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(183,'Norwegian Nynorsk','nn','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(184,'Occitan','oc','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(185,'Ojibwa','oj','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(186,'Oriya','or','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(187,'Oromo','om','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(188,'Ossetian; Ossetic','os','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(189,'Pali','pi','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(190,'Panjabi; Punjabi','pa','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(191,'Persian','fa','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(192,'Polish','pl','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(193,'Portuguese','pt','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(194,'Portuguese (BR)','pt-br','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(195,'Pushto; Pashto','ps','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(196,'Quechua','qu','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(197,'Romani','rom','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(198,'Romanian','ro','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(199,'Romansh','rm','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(200,'Rundi','rn','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(201,'Russian','ru','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(202,'Rusyn','ry','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(203,'Samoan','sm','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(204,'Sango','sg','2022-04-18 07:24:41','2022-04-18 07:24:41',NULL),
(205,'Sanskrit','sa','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(206,'Santali','sat','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(207,'Sardinian','sc','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(208,'Scottish Gaelic','gd','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(209,'Serbian','sr','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(210,'Serbian (Cyrillic)','sr-cyrl','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(211,'Serbo-Croatian','sh','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(212,'Shona','sn','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(213,'Sichuan Yi','ii','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(214,'Sicilian','scn','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(215,'Sindhi','sd','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(216,'Sinhalese','si','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(217,'Slovak','sk','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(218,'Slovenian','sl','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(219,'Somali','so','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(220,'Sotho, Southern','st','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(221,'South Ndebele','nr','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(222,'Spanish','es','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(223,'Spanish (AR)','es-ar','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(224,'Spanish (BO)','es-bo','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(225,'Spanish (CL)','es-cl','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(226,'Spanish (CO)','es-co','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(227,'Spanish (CR)','es-cr','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(228,'Spanish (DO)','es-do','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(229,'Spanish (EC)','es-ec','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(230,'Spanish (GT)','es-gt','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(231,'Spanish (HN)','es-hn','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(232,'Spanish (LA & C)','es-419','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(233,'Spanish (MX)','es-mx','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(234,'Spanish (NI)','es-ni','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(235,'Spanish (PA)','es-pa','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(236,'Spanish (PE)','es-pe','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(237,'Spanish (PR)','es-pr','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(238,'Spanish (PY)','es-py','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(239,'Spanish (SV)','es-sv','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(240,'Spanish (UY)','es-uy','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(241,'Spanish (VE)','es-ve','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(242,'Sundanese','su','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(243,'Swahili','sw','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(244,'Swati','ss','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(245,'Swedish','sv','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(246,'Swedish (FI)','sv-fi','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(247,'Tagalog','tl','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(248,'Tahitian','ty','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(249,'Tajik','tg','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(250,'Tamil','ta','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(251,'Tatar','tt','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(252,'Telugu','te','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(253,'Thai','th','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(254,'Tibetan','bo','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(255,'Tigrinya','ti','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(256,'Tonga','to','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(257,'Tsonga','ts','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(258,'Tswana','tn','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(259,'Turkish','tr','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(260,'Turkmen','tk','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(261,'Twi','tw','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(262,'Ukrainian','uk','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(263,'Urdu','ur','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(264,'Uyghur','ug','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(265,'Uzbek','uz','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(266,'Uzbek (Cyrillic)','uz-cyrl','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(267,'Venda','ve','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(268,'Vietnamese','vi','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(269,'Volapük','vo','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(270,'Walloon','wa','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(271,'Welsh','cy','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(272,'Western Frisian','fy','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(273,'Wolof','wo','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(274,'Xhosa','xh','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(275,'Yiddish','yi','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(276,'Yoruba','yo','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(277,'Zhuang; Chuang','za','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL),
(278,'Zulu','zu','2022-04-18 07:24:42','2022-04-18 07:24:42',NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(20,'2022_04_04_022510_create_jobs_table',1),
(21,'2022_04_06_065030_create_languages_table',2),
(22,'2022_04_06_073148_create_world_countries_table',2),
(23,'2022_04_07_084408_create_static_translations_table',2),
(24,'2022_04_18_090822_create_dynamic_translations_table',3);

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
('01c36c9fa7f4af7c5697f175269bbc6f7442d9a875ec134b1102b3454a4f2bb557a9d0ff6dfdf289',1,1,'GGTC CFS Admin API Access Token','[]',0,'2022-04-18 05:04:04','2022-04-18 05:04:04','2022-10-18 05:04:04'),
('7fbf8f29a5ae0202db28c914710d4c3cd78df3886bf035ef83f1701f8680a6679f74d5595c60b9f1',1,1,'GGTC CFS Admin API Access Token','[]',0,'2022-04-21 02:21:23','2022-04-21 02:21:23','2022-10-21 02:21:23'),
('c1e5b3acf0b940743b21a698075e2d64700589b72e6d944e9730945823b9552cf21b6c601475d1c8',1,1,'GGTC CFS Admin API Access Token','[]',0,'2022-04-18 03:56:27','2022-04-18 03:56:27','2022-10-18 03:56:27'),
('f857ef6402114796308f6f5a0539280d4ecb8f8006330748e014ca437c302595e160f3077740dc39',1,1,'GGTC CFS Admin API Access Token','[]',0,'2022-04-20 01:59:11','2022-04-20 01:59:11','2022-10-20 01:59:11');

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
(1,NULL,'GGCTCFS Personal Access Client','ezxGDXHYdLv9Gak1sZ2CN777tJI7ctxaj8eVbrM3',NULL,'http://localhost',1,0,0,'2022-04-18 03:54:23','2022-04-18 03:54:23'),
(2,NULL,'GGCTCFS Password Grant Client','wufcDSl0qXj3q6h0I7Wt7NP9wK4YMAMHs8rTgDiD','users','http://localhost',0,1,0,'2022-04-18 03:54:23','2022-04-18 03:54:23');

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
(1,1,'2022-04-18 03:54:23','2022-04-18 03:54:23');

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

/*Table structure for table `static_translations` */

DROP TABLE IF EXISTS `static_translations`;

CREATE TABLE `static_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` bigint(20) DEFAULT NULL,
  `content_fields` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `static_translations` */

insert  into `static_translations`(`id`,`language_id`,`content_fields`,`created_at`,`updated_at`,`deleted_at`) values 
(1,93,'{\"header_title\":\"Fact Sheet ng Bansa\",\"dropdown_label\":\"Pumili ng Bansa\",\"download\":\"I-download\",\"infographics_title\":\"Ang tinantyang halaga ng basura ng produktong tabako na naipon sa\",\"cultivation\":\"Paglilinang\",\"curing\":\"Paggamot\",\"process_manufacturing\":\"Proseso at Paggawa\",\"distribution\":\"Pamamahagi\",\"use\":\"Gamitin\",\"disposal\":\"Pagtatapon\",\"waste_management\":\"Pamamahala ng Basura\",\"marine_pollution\":\"Polusyon sa Dagat\",\"billion\":\"Bilyon\",\"million\":\"Milyon\",\"trillion\":\"Trilyon\",\"in_usd\":\"SA USD\",\"cost\":\"HALAGA\",\"cigarettes_consumed\":\"Sigarilyong nakonsumo\",\"waste_management_costs\":\"Mga Gastos sa Pamamahala ng Basura\",\"consuming\":\"umuubos\",\"sticks_of_cigarettes\":\"stick ng sigarilyo\",\"produced_mainly\":\"pangunahing ginawa ng\",\"references\":\"Mga sanggunian\",\"show_less\":\"MAGPAKITA NG KAUNTI\",\"show_more\":\"MAGPAKITA PA\",\"threat_title\":\"Tabako: Banta sa Kapaligiran\",\"threat_p_1\":\"Sa buong ikot ng buhay nito, ang tabako ay may negatibong epekto sa kapaligiran:\",\"threat_p_2\":\"Ang paglilinis ng mga lupain at pagsusunog ng mga nalalabi ng halaman ay humahantong sa <b>pagkasira ng kagubatan<\\/b>, habang ang mga agrochemical\\/pesticides ay nagpaparumi sa mga daluyan ng tubig at nakakalason sa mga isda\",\"threat_p_3\":\"Ang pagsusunog ng kahoy na panggatong upang pagalingin ang mga dahon ay nagdudulot ng <b>pagkasira ng kagubatan at kakulangan ng tubig<\\/b>\",\"threat_p_4\":\"Kasama sa mga proseso ang paggamit ng mga nakakalason na kemikal, at paglabas ng mga greenhouse gas at iba pang basura\",\"threat_p_5\":\"Ang mga greenhouse gas ay ibinubuga sa panahon ng transportasyon\",\"threat_p_6\":\"Ang lason na nalalabi mula sa usok ng tabako ay nananatili sa kapaligiran ( <b>mga nilalaman ng panloob na particulate matter<\\/b> ay 10x na mas mataas kaysa sa mga tambutso ng diesel na kotse)\",\"threat_p_7\":\"<ul><li>Ang mga upos ng sigarilyo ay ilan sa mga pinaka nakakalat na bagay sa mundo at ang packaging ng produktong tabako ay nagbubunga ng 2 milyong <b>toneladang solidong basura<\\/b><\\/li><\\/ul>\",\"threat_p_8\":\"<ul><li>Mahigit sa 1\\/3 ng butt litter ang napupunta sa mga karagatan at <b>19-38% ng kabuuang debris<\\/b> sa paglilinis ng karagatan ay mga upos ng sigarilyo<\\/li> <li>Environmental toxins leach mula sa mga puwit na nagdudulot ng <b>pangmatagalang pinsala sa buhay dagat.<\\/b><\\/li><\\/ul>\",\"threat_p_9\":\"Ang <span>Sigarilyo<\\/span> ay isa ring pinakakaraniwang sanhi ng <b>aksidenteng sunog<\\/b> at nakakalason na <b>third hand smoke<\\/b> na materyales na nagpapadumi sa kapaligiran\",\"cost_p_1\":\"Ang mga pagtatantya ay nagmula sa data ng ICCD, Beaumont et al at World Bank. Ang data ng polusyon sa dagat ay mga konserbatibong pagtatantya\",\"cost_p_2\":\"Sinasalamin nito ang ilan sa mga gastos sa kapaligiran sa ilalim ng \\\"Pagtapon.\\\" HINDI KASAMA dito ang mga gastos sa deforestation at greenhouse gas emissions sa panahon ng \\u201cProduction at Distribution; \\u201d nakakalason na polusyon sa hangin sa panahon ng \\u201cPaggamit,\\u201d aksidenteng sunog at iba pang basura sa panahon ng \\u201cPagtapon\\u201d\",\"cost_p_3\":\"Idinagdag sa mga pinsala sa kapaligiran ay\",\"cost_p_4\":\"<span> Mga Sigarilyong Kinukonsumo<\\/span> bawat taon sa <span>pagkalugi sa ekonomiya<\\/span> mula sa\",\"example_title\":\"Ang Tinatawag na CSR ng Industriya ng Tabako\",\"example_p_1\":\"Ang sigarilyo ay ang tanging produkto ng mamimili na, kung gagamitin ayon sa layunin, ay pumapatay sa kalahati ng mga mamimili nito. Ang tabako ay pumapatay ng 8 milyong tao taun-taon, higit pa sa mga armas at natural na sakuna, kung pinagsama. At kilala ang industriya ng tabako na ikinukubli ang mga pinsalang dulot nito sa pamamagitan ng tinatawag na corporate social responsibility activities (CSR) upang ilihis ang atensyon mula sa mapangwasak na epekto ng tabako. Ang mga aktibidad ng mga kumpanya ng tabako ay may posibilidad na ilipat ang sisihin sa pinsala sa kapaligiran sa mga mamimili at lunurin ang mga boses ng mga magsasaka at manggagawa na naapektuhan ng mga pinsala sa kapaligiran at kalusugan.\",\"example_p_2\":\"Ayon sa WHO Framework Convention on Tobacco Control, <b>kailangang ipagbawal ang industriya ng tabako sa pagtataguyod ng tinatawag nitong mga aktibidad na CSR. Hindi dapat bigyan ng mga pamahalaan ng upuan ang industriya ng tabako.<\\/b> Higit sa 60 pamahalaan ang partikular na nagbabawal sa mga aktibidad sa pag-sponsor ng industriya ng tabako.\",\"example_p_3\":\"Ang WHO Framework Convention on Tobacco Control ay pinagtibay ng 182 na pamahalaan (fine print)\",\"example_p_4\":\"Limitahan ang mga pakikipag-ugnayan sa industriya ng tabako maliban kung mahigpit na kinakailangan para sa mga regulasyon\",\"reco_title\":\"Mga rekomendasyon\",\"reco_p_1\":\"Dapat isaalang-alang ang industriya ng tabako. Sa likas na katangian ng negosyo nito, ang mga kumpanya ng tabako ay lumalabag sa karapatang pantao. Mayroon silang makabuluhang kontrol sa disenyo ng produkto at mga supply chain na nagdulot ng pinsala sa buhay sa karagatan at pagkagambala sa ecosystem. Ang WHO FCTC ay nagbibigay ng mga paraan ng pasulong:\",\"reco_p_2\":\"<span>Presyo at Mga Panukala sa Buwis<\\/span> (Art 6) Inaatasan ang industriya ng tabako na magbayad para sa mga negatibong panlabas sa pamamagitan ng pagtaas ng pagbubuwis o mga bayarin; ilang bansa ang nagpapataw ng mga bayad na naaayon sa prinsipyo ng pagbabayad ng mga polusyon. (Para sa mga plastik na pang-isahang gamit, kung saan nahuhulog ang mga upos ng sigarilyo, ang ilan ay gumamit ng Extended Producer Responsibility (EPR) system upang ilipat sa industriya ang pasanin ng pagharap sa basura ng produkto.)\",\"reco_p_3\":\"<span>Sponsorship Bans<\\/span> (Art 13): Ipagbawal ang tinatawag na CSR ng mga kumpanya ng tabako o ipagbawal ang publisidad nito (kung may mga paghihigpit sa konstitusyon sa isang pagbabawal) at huwag lumahok, kasosyo, o isapubliko ang parehong\",\"reco_p_4\":\"<span>Mga Alternatibo na Mabubuhay sa Ekonomiya<\\/span> (Art 17 18): Magpatibay at mapanatili ang pananalapi sa mga patakarang hinihimok ng magsasaka\\/manggagawa tungo sa pagkakaiba-iba at protektahan ang mga ito mula sa panghihimasok sa industriya ng tabako\",\"reco_p_5\":\"<span>Panagutan<\\/span> (Art 19): Isulong ang internasyonal na kooperasyon sa pagpapanagot sa industriya ng tabako para sa mga pinsalang dulot kabilang ang mga pinsala sa kapaligiran\",\"reco_p_6\":\"<span>Pakikialam sa Industriya ng Tabako<\\/span> (Art 5.3): Protektahan ang mga patakaran mula sa mga komersyal at nakatalagang interes ng industriya ng tabako; at i-denormalize ang tinatawag na CSR ng mga kumpanya ng tabako. <i>Ang \\\"corporate social responsibility\\\" ng tabako ay isang likas na kontradiksyon. Kapag ang tinatawag na Extended Producer Responsibility (EPR) ay inilapat sa industriya ng tabako, hindi dapat pahintulutan ang huli na isapubliko ang pareho, gumawa ng maling pag-aangkin na may kaugnayan sa sustainability, o gamitin ito para sa pag-impluwensya sa patakaran o pakikipag-ugnayan sa mga pamahalaan.<\\/i >\",\"marine_modal\":\"Ang <span>Gastos ng Marine<\\/span> ay Sigarilyong Butts (sa Tons) na pinarami ng Upper Estimate ng taunang gastos sa mga tuntunin ng pinababang marine natural capital.\\u201d Ito ay conjectured na konserbatibo sa pagitan ng 3300 hanggang 33000, kung saan ang pinakamataas na limitasyon ng 33000 ay ginagamit sa aming pagtatantya dahil sa nakakalason na katangian ng mga butts (hindi tulad ng iba pang plastic item) Ipinapalagay na ang 2\\/3 ng upos ng sigarilyo ay napupunta sa karagatan, kaya 2\\/3 ng mga stick na natupok ay inilapat Ang batayan para sa bigat ng mga butts ay 3.4g bawat 20sticks( source). Tandaan din na sa mga umuunlad na bansa kung saan ang pagkonsumo ay pinakamataas; hindi maayos na pinangangasiwaan ang mga basura at maaari ding mauwi sa mga karagatan. Ang dami ng sigarilyong nakonsumo sa Sticks\\/Million data ay mula sa (ICCD at o Atlas)\",\"waste_modal\":\"Kasama sa gastos sa <span>Pamamahala ng Basura<\\/span> ( ISANG listahan lahat eg paghakot ng landfill atbp) Ang mga pagtatantya ay hinango mula sa mga inaasahang gastos ng WB para sa 2025 na nag-iiba ng mga gastos para sa HIC UMIC LMIC LIC bawat tonelada. Ang mga stick sa milyun-milyon ay na-convert sa tonelada sa pamamagitan ng pag-aakalang ang 20 sticks ay may 3.4g ng butt kapag ganap na natupok (pinagmulan) Ang dami ng sigarilyo na nakonsumo sa Sticks\\/Million data ay mula sa (ICCD at o Atlas)\",\"partial_modal\":\"Ang <span>Bahagyang Gastos<\\/span> ay isang TAUNANG GASTOS na siyang kabuuan ng Gastusin sa Pamamahala ng Basura (World Bank) at Gastos sa Polusyon sa Dagat (Beaumont et al). Tinatawag itong Partial Cost dahil ang mga gastos sa Marine Pollution ay mga konserbatibong pagtatantya at may iba pang mga gastos na hindi kasama rito tulad ng mga aksidenteng sunog. Ibinubukod din nito ang epekto sa kapaligiran na nauugnay sa produksyon tulad ng deforestation at greenhouse gas emissions o epekto ng mga nakakalason na emisyon habang ginagamit.\",\"back_to_main_site\":\"BUMALIK SA PANGUNAHING SITE\",\"deaths\":\"Mga pagkamatay\"}','2022-04-21 02:18:22','2022-04-21 07:00:52',NULL);

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
(1,'admin',NULL,'cfs','admin','Active','admin@dbm.com',NULL,'$2y$10$A/h0Gpj2vlQoV1wiKEGE.eiqnm06I.XqgZZoxqoJCwEEMzFZfkWh.',NULL,'2022-04-18 03:56:25','2022-04-18 03:56:25',NULL,1);

/*Table structure for table `world_countries` */

DROP TABLE IF EXISTS `world_countries`;

CREATE TABLE `world_countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `world_countries` */

insert  into `world_countries`(`id`,`name`,`country_code`,`language_id`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Afghanistan','AF',195,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(2,'Åland Islands','AX',245,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(3,'Albania','AL',5,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(4,'Algeria','DZ',7,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(5,'American Samoa','AS',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(6,'Andorra','AD',44,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(7,'Angola','AO',193,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(8,'Anguilla','AI',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(9,'Antigua and Barbuda','AG',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(10,'Argentina','AR',222,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(11,'Armenia','AM',25,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(12,'Aruba','AW',66,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(13,'Australia','AU',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(14,'Austria','AT',106,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(15,'Azerbaijan','AZ',31,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(16,'Bahamas','BS',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(17,'Bahrain','BH',7,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(18,'Bangladesh','BD',37,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(19,'Barbados','BB',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(20,'Belarus','BY',36,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(21,'Belgium','BE',66,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(22,'Belize','BZ',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(23,'Benin','BJ',96,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(24,'Bermuda','BM',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(25,'Bhutan','BT',67,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(26,'Bolivia (Plurinational State of)','BO',222,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(27,'Bonaire, Sint Eustatius and Saba','BQ',66,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(28,'Bosnia and Herzegovina','BA',40,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(29,'Botswana','BW',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(30,'Bouvet Island','BV',181,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(31,'Brazil','BR',193,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(32,'British Indian Ocean Territory','IO',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(33,'United States Minor Outlying Islands','UM',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(34,'Virgin Islands (British)','VG',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(35,'Virgin Islands (U.S.)','VI',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(36,'Brunei Darussalam','BN',163,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(37,'Bulgaria','BG',42,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(38,'Burkina Faso','BF',96,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(39,'Burundi','BI',96,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(40,'Cambodia','KH',143,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(41,'Cameroon','CM',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(42,'Canada','CA',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(43,'Cabo Verde','CV',193,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(44,'Cayman Islands','KY',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(45,'Central African Republic','CF',96,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(46,'Chad','TD',96,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(47,'Chile','CL',222,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(48,'China','CN',49,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(49,'Christmas Island','CX',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(50,'Cocos (Keeling) Islands','CC',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(51,'Colombia','CO',222,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(52,'Comoros','KM',96,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(53,'Congo','CG',96,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(54,'Congo (Democratic Republic of the)','CD',96,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(55,'Cook Islands','CK',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(56,'Costa Rica','CR',222,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(57,'Croatia','HR',61,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(58,'Cuba','CU',222,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(59,'Curaçao','CW',66,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(60,'Cyprus','CY',259,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(61,'Czech Republic','CZ',62,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(62,'Denmark','DK',63,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(63,'Djibouti','DJ',96,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(64,'Dominica','DM',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(65,'Dominican Republic','DO',222,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(66,'Ecuador','EC',222,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(67,'Egypt','EG',7,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(68,'El Salvador','SV',222,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(69,'Equatorial Guinea','GQ',222,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(70,'Eritrea','ER',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(71,'Estonia','EE',89,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(72,'Ethiopia','ET',6,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(73,'Falkland Islands (Malvinas)','FK',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(74,'Faroe Islands','FO',91,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(75,'Fiji','FJ',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(76,'Finland','FI',94,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(77,'France','FR',96,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(78,'French Guiana','GF',96,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(79,'French Polynesia','PF',96,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(80,'French Southern Territories','TF',96,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(81,'Gabon','GA',96,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(82,'Gambia','GM',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(83,'Georgia','GE',105,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(84,'Germany','DE',106,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(85,'Ghana','GH',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(86,'Gibraltar','GI',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(87,'Greece','GR',112,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(88,'Greenland','GL',138,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(89,'Grenada','GD',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(90,'Guadeloupe','GP',96,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(91,'Guam','GU',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(92,'Guatemala','GT',222,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(93,'Guernsey','GG',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(94,'Guinea','GN',96,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(95,'Guinea-Bissau','GW',193,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(96,'Guyana','GY',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(97,'Haiti','HT',96,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(98,'Heard Island and McDonald Islands','HM',68,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(99,'Holy See','VA',96,'2022-04-18 07:24:57','2022-04-18 07:24:57',NULL),
(100,'Honduras','HN',222,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(101,'Hong Kong','HK',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(102,'Hungary','HU',122,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(103,'Iceland','IS',123,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(104,'India','IN',120,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(105,'Indonesia','ID',126,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(106,'Côte d\'Ivoire','CI',96,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(107,'Iran (Islamic Republic of)','IR',191,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(108,'Iraq','IQ',7,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(109,'Ireland','IE',131,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(110,'Isle of Man','IM',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(111,'Israel','IL',118,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(112,'Italy','IT',132,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(113,'Jamaica','JM',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(114,'Japan','JP',135,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(115,'Jersey','JE',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(116,'Jordan','JO',7,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(117,'Kazakhstan','KZ',142,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(118,'Kenya','KE',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(119,'Kiribati','KI',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(120,'Kuwait','KW',7,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(121,'Kyrgyzstan','KG',146,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(122,'Lao People\'s Democratic Republic','LA',152,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(123,'Latvia','LV',154,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(124,'Lebanon','LB',7,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(125,'Lesotho','LS',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(126,'Liberia','LR',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(127,'Libya','LY',7,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(128,'Liechtenstein','LI',106,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(129,'Lithuania','LT',157,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(130,'Luxembourg','LU',96,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(131,'Macao','MO',49,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(132,'Macedonia (the former Yugoslav Republic of)','MK',161,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(133,'Madagascar','MG',96,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(134,'Malawi','MW',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(135,'Malaysia','MY',163,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(136,'Maldives','MV',65,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(137,'Mali','ML',96,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(138,'Malta','MT',166,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(139,'Marshall Islands','MH',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(140,'Martinique','MQ',96,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(141,'Mauritania','MR',7,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(142,'Mauritius','MU',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(143,'Mayotte','YT',96,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(144,'Mexico','MX',222,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(145,'Micronesia (Federated States of)','FM',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(146,'Moldova (Republic of)','MD',198,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(147,'Monaco','MC',96,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(148,'Mongolia','MN',172,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(149,'Montenegro','ME',209,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(150,'Montserrat','MS',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(151,'Morocco','MA',7,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(152,'Mozambique','MZ',193,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(153,'Myanmar','MM',43,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(154,'Namibia','NA',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(155,'Nauru','NR',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(156,'Nepal','NP',178,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(157,'Netherlands','NL',66,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(158,'New Caledonia','NC',96,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(159,'New Zealand','NZ',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(160,'Nicaragua','NI',222,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(161,'Niger','NE',96,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(162,'Nigeria','NG',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(163,'Niue','NU',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(164,'Norfolk Island','NF',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(165,'Korea (Democratic People\'s Republic of)','KP',149,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(166,'Northern Mariana Islands','MP',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(167,'Norway','NO',181,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(168,'Oman','OM',7,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(169,'Pakistan','PK',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(170,'Palau','PW',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(171,'Palestine, State of','PS',7,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(172,'Panama','PA',222,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(173,'Papua New Guinea','PG',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(174,'Paraguay','PY',222,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(175,'Peru','PE',222,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(176,'Philippines','PH',93,'2022-04-18 07:24:58','2022-04-19 07:30:14',NULL),
(177,'Pitcairn','PN',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(178,'Poland','PL',192,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(179,'Portugal','PT',193,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(180,'Puerto Rico','PR',222,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(181,'Qatar','QA',7,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(182,'Republic of Kosovo','XK',5,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(183,'Réunion','RE',96,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(184,'Romania','RO',198,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(185,'Russian Federation','RU',201,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(186,'Rwanda','RW',145,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(187,'Saint Barthélemy','BL',96,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(188,'Saint Helena, Ascension and Tristan da Cunha','SH',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(189,'Saint Kitts and Nevis','KN',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(190,'Saint Lucia','LC',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(191,'Saint Martin (French part)','MF',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(192,'Saint Pierre and Miquelon','PM',96,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(193,'Saint Vincent and the Grenadines','VC',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(194,'Samoa','WS',203,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(195,'San Marino','SM',132,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(196,'Sao Tome and Principe','ST',193,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(197,'Saudi Arabia','SA',7,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(198,'Senegal','SN',96,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(199,'Serbia','RS',209,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(200,'Seychelles','SC',96,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(201,'Sierra Leone','SL',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(202,'Singapore','SG',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(203,'Sint Maarten (Dutch part)','SX',66,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(204,'Slovakia','SK',217,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(205,'Slovenia','SI',218,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(206,'Solomon Islands','SB',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(207,'Somalia','SO',7,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(208,'South Africa','ZA',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(209,'South Georgia and the South Sandwich Islands','GS',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(210,'Korea (Republic of)','KR',149,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(211,'South Sudan','SS',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(212,'Spain','ES',222,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(213,'Sri Lanka','LK',216,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(214,'Sudan','SD',7,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(215,'Suriname','SR',66,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(216,'Svalbard and Jan Mayen','SJ',181,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(217,'Swaziland','SZ',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(218,'Sweden','SE',245,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(219,'Switzerland','CH',106,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(220,'Syrian Arab Republic','SY',7,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(221,'Taiwan','TW',49,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(222,'Tajikistan','TJ',249,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(223,'Tanzania, United Republic of','TZ',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(224,'Thailand','TH',253,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(225,'Timor-Leste','TL',193,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(226,'Togo','TG',96,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(227,'Tokelau','TK',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(228,'Tonga','TO',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(229,'Trinidad and Tobago','TT',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(230,'Tunisia','TN',7,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(231,'Turkey','TR',259,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(232,'Turkmenistan','TM',260,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(233,'Turks and Caicos Islands','TC',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(234,'Tuvalu','TV',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(235,'Uganda','UG',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(236,'Ukraine','UA',262,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(237,'United Arab Emirates','AE',7,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(238,'United Kingdom of Great Britain and Northern Ireland','GB',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(239,'United States of America','US',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(240,'Uruguay','UY',222,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(241,'Uzbekistan','UZ',265,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(242,'Vanuatu','VU',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(243,'Venezuela (Bolivarian Republic of)','VE',222,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(244,'Viet Nam','VN',268,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(245,'Wallis and Futuna','WF',96,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(246,'Western Sahara','EH',222,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(247,'Yemen','YE',7,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(248,'Zambia','ZM',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL),
(249,'Zimbabwe','ZW',68,'2022-04-18 07:24:58','2022-04-18 07:24:58',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
