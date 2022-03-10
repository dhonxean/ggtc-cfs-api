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

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` blob NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`iso2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `countries` */

insert  into `countries`(`name`,`iso2`,`iso3`,`flag`,`currency`,`region`,`publish`,`deleted_at`,`created_at`,`updated_at`) values 
('Andorra','AD','AND','🇦🇩','EUR','Europe','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('United Arab Emirates','AE','ARE','🇦🇪','AED','Asia','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Afghanistan','AF','AFG','🇦🇫','AFN','Asia','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Antigua And Barbuda','AG','ATG','🇦🇬','XCD','Americas','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Anguilla','AI','AIA','🇦🇮','XCD','Americas','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Albania','AL','ALB','🇦🇱','ALL','Europe','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Armenia','AM','ARM','🇦🇲','AMD','Asia','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Angola','AO','AGO','🇦🇴','AOA','Africa','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Antarctica','AQ','ATA','🇦🇶','AAD','Polar','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Argentina','AR','ARG','🇦🇷','ARS','Americas','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('American Samoa','AS','ASM','🇦🇸','USD','Oceania','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Austria','AT','AUT','🇦🇹','EUR','Europe','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Australia','AU','AUS','🇦🇺','AUD','Oceania','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Aruba','AW','ABW','🇦🇼','AWG','Americas','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Aland Islands','AX','ALA','🇦🇽','EUR','Europe','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Azerbaijan','AZ','AZE','🇦🇿','AZN','Asia','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Bosnia and Herzegovina','BA','BIH','🇧🇦','BAM','Europe','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Barbados','BB','BRB','🇧🇧','BBD','Americas','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Bangladesh','BD','BGD','🇧🇩','BDT','Asia','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Belgium','BE','BEL','🇧🇪','EUR','Europe','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Burkina Faso','BF','BFA','🇧🇫','XOF','Africa','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Bulgaria','BG','BGR','🇧🇬','BGN','Europe','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Bahrain','BH','BHR','🇧🇭','BHD','Asia','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Burundi','BI','BDI','🇧🇮','BIF','Africa','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Benin','BJ','BEN','🇧🇯','XOF','Africa','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Saint-Barthelemy','BL','BLM','🇧🇱','EUR','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Bermuda','BM','BMU','🇧🇲','BMD','Americas','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Brunei','BN','BRN','🇧🇳','BND','Asia','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Bolivia','BO','BOL','🇧🇴','BOB','Americas','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Bonaire, Sint Eustatius and Saba','BQ','BES','🇧🇶','USD','Americas','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Brazil','BR','BRA','🇧🇷','BRL','Americas','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Bahamas The','BS','BHS','🇧🇸','BSD','Americas','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Bhutan','BT','BTN','🇧🇹','BTN','Asia','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Bouvet Island','BV','BVT','🇧🇻','NOK',NULL,'0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Botswana','BW','BWA','🇧🇼','BWP','Africa','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Belarus','BY','BLR','🇧🇾','BYN','Europe','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Belize','BZ','BLZ','🇧🇿','BZD','Americas','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Canada','CA','CAN','🇨🇦','CAD','Americas','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Cocos (Keeling) Islands','CC','CCK','🇨🇨','AUD','Oceania','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Democratic Republic of the Congo','CD','COD','🇨🇩','CDF','Africa','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Central African Republic','CF','CAF','🇨🇫','XAF','Africa','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Congo','CG','COG','🇨🇬','XAF','Africa','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Switzerland','CH','CHE','🇨🇭','CHF','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Cote D\'Ivoire (Ivory Coast)','CI','CIV','🇨🇮','XOF','Africa','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Cook Islands','CK','COK','🇨🇰','NZD','Oceania','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Chile','CL','CHL','🇨🇱','CLP','Americas','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Cameroon','CM','CMR','🇨🇲','XAF','Africa','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('China','CN','CHN','🇨🇳','CNY','Asia','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Colombia','CO','COL','🇨🇴','COP','Americas','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Costa Rica','CR','CRI','🇨🇷','CRC','Americas','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Cuba','CU','CUB','🇨🇺','CUP','Americas','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Cape Verde','CV','CPV','🇨🇻','CVE','Africa','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Curaçao','CW','CUW','🇨🇼','ANG','Americas','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Christmas Island','CX','CXR','🇨🇽','AUD','Oceania','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Cyprus','CY','CYP','🇨🇾','EUR','Europe','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Czech Republic','CZ','CZE','🇨🇿','CZK','Europe','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Germany','DE','DEU','🇩🇪','EUR','Europe','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Djibouti','DJ','DJI','🇩🇯','DJF','Africa','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Denmark','DK','DNK','🇩🇰','DKK','Europe','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Dominica','DM','DMA','🇩🇲','XCD','Americas','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Dominican Republic','DO','DOM','🇩🇴','DOP','Americas','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Algeria','DZ','DZA','🇩🇿','DZD','Africa','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Ecuador','EC','ECU','🇪🇨','USD','Americas','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Estonia','EE','EST','🇪🇪','EUR','Europe','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Egypt','EG','EGY','🇪🇬','EGP','Africa','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Western Sahara','EH','ESH','🇪🇭','MAD','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Eritrea','ER','ERI','🇪🇷','ERN','Africa','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Spain','ES','ESP','🇪🇸','EUR','Europe','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Ethiopia','ET','ETH','🇪🇹','ETB','Africa','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Finland','FI','FIN','🇫🇮','EUR','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Fiji Islands','FJ','FJI','🇫🇯','FJD','Oceania','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Falkland Islands','FK','FLK','🇫🇰','FKP','Americas','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Micronesia','FM','FSM','🇫🇲','USD','Oceania','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Faroe Islands','FO','FRO','🇫🇴','DKK','Europe','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('France','FR','FRA','🇫🇷','EUR','Europe','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Gabon','GA','GAB','🇬🇦','XAF','Africa','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('United Kingdom','GB','GBR','🇬🇧','GBP','Europe','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Grenada','GD','GRD','🇬🇩','XCD','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Georgia','GE','GEO','🇬🇪','GEL','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('French Guiana','GF','GUF','🇬🇫','EUR','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Guernsey and Alderney','GG','GGY','🇬🇬','GBP','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Ghana','GH','GHA','🇬🇭','GHS','Africa','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Gibraltar','GI','GIB','🇬🇮','GIP','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Greenland','GL','GRL','🇬🇱','DKK','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Gambia The','GM','GMB','🇬🇲','GMD','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Guinea','GN','GIN','🇬🇳','GNF','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Guadeloupe','GP','GLP','🇬🇵','EUR','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Equatorial Guinea','GQ','GNQ','🇬🇶','XAF','Africa','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Greece','GR','GRC','🇬🇷','EUR','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('South Georgia','GS','SGS','🇬🇸','GBP','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Guatemala','GT','GTM','🇬🇹','GTQ','Americas','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Guam','GU','GUM','🇬🇺','USD','Oceania','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Guinea-Bissau','GW','GNB','🇬🇼','XOF','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Guyana','GY','GUY','🇬🇾','GYD','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Hong Kong S.A.R.','HK','HKG','🇭🇰','HKD','Asia','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Heard Island and McDonald Islands','HM','HMD','🇭🇲','AUD',NULL,'0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Honduras','HN','HND','🇭🇳','HNL','Americas','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Croatia','HR','HRV','🇭🇷','HRK','Europe','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Haiti','HT','HTI','🇭🇹','HTG','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Hungary','HU','HUN','🇭🇺','HUF','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Indonesia','ID','IDN','🇮🇩','IDR','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Ireland','IE','IRL','🇮🇪','EUR','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Israel','IL','ISR','🇮🇱','ILS','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Man (Isle of)','IM','IMN','🇮🇲','GBP','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('India','IN','IND','🇮🇳','INR','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('British Indian Ocean Territory','IO','IOT','🇮🇴','USD','Africa','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Iraq','IQ','IRQ','🇮🇶','IQD','Asia','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Iran','IR','IRN','🇮🇷','IRR','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Iceland','IS','ISL','🇮🇸','ISK','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Italy','IT','ITA','🇮🇹','EUR','Europe','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Jersey','JE','JEY','🇯🇪','GBP','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Jamaica','JM','JAM','🇯🇲','JMD','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Jordan','JO','JOR','🇯🇴','JOD','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Japan','JP','JPN','🇯🇵','JPY','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Kenya','KE','KEN','🇰🇪','KES','Africa','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Kyrgyzstan','KG','KGZ','🇰🇬','KGS','Asia','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Cambodia','KH','KHM','🇰🇭','KHR','Asia','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Kiribati','KI','KIR','🇰🇮','AUD','Oceania','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Comoros','KM','COM','🇰🇲','KMF','Africa','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Saint Kitts And Nevis','KN','KNA','🇰🇳','XCD','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('North Korea','KP','PRK','🇰🇵','KPW','Asia','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('South Korea','KR','KOR','🇰🇷','KRW','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Kuwait','KW','KWT','🇰🇼','KWD','Asia','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Cayman Islands','KY','CYM','🇰🇾','KYD','Americas','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Kazakhstan','KZ','KAZ','🇰🇿','KZT','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Laos','LA','LAO','🇱🇦','LAK','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Lebanon','LB','LBN','🇱🇧','LBP','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Saint Lucia','LC','LCA','🇱🇨','XCD','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Liechtenstein','LI','LIE','🇱🇮','CHF','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Sri Lanka','LK','LKA','🇱🇰','LKR','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Liberia','LR','LBR','🇱🇷','LRD','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Lesotho','LS','LSO','🇱🇸','LSL','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Lithuania','LT','LTU','🇱🇹','EUR','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Luxembourg','LU','LUX','🇱🇺','EUR','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Latvia','LV','LVA','🇱🇻','EUR','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Libya','LY','LBY','🇱🇾','LYD','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Morocco','MA','MAR','🇲🇦','MAD','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Monaco','MC','MCO','🇲🇨','EUR','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Moldova','MD','MDA','🇲🇩','MDL','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Montenegro','ME','MNE','🇲🇪','EUR','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Saint-Martin (French part)','MF','MAF','🇲🇫','EUR','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Madagascar','MG','MDG','🇲🇬','MGA','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Marshall Islands','MH','MHL','🇲🇭','USD','Oceania','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Macedonia','MK','MKD','🇲🇰','MKD','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Mali','ML','MLI','🇲🇱','XOF','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Myanmar','MM','MMR','🇲🇲','MMK','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Mongolia','MN','MNG','🇲🇳','MNT','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Macau S.A.R.','MO','MAC','🇲🇴','MOP','Asia','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Northern Mariana Islands','MP','MNP','🇲🇵','USD','Oceania','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Martinique','MQ','MTQ','🇲🇶','EUR','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Mauritania','MR','MRT','🇲🇷','MRO','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Montserrat','MS','MSR','🇲🇸','XCD','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Malta','MT','MLT','🇲🇹','EUR','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Mauritius','MU','MUS','🇲🇺','MUR','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Maldives','MV','MDV','🇲🇻','MVR','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Malawi','MW','MWI','🇲🇼','MWK','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Mexico','MX','MEX','🇲🇽','MXN','Americas','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Malaysia','MY','MYS','🇲🇾','MYR','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Mozambique','MZ','MOZ','🇲🇿','MZN','Africa','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Namibia','NA','NAM','🇳🇦','NAD','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('New Caledonia','NC','NCL','🇳🇨','XPF','Oceania','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Niger','NE','NER','🇳🇪','XOF','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Norfolk Island','NF','NFK','🇳🇫','AUD','Oceania','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Nigeria','NG','NGA','🇳🇬','NGN','Africa','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Nicaragua','NI','NIC','🇳🇮','NIO','Americas','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Netherlands','NL','NLD','🇳🇱','EUR','Europe','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Norway','NO','NOR','🇳🇴','NOK','Europe','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Nepal','NP','NPL','🇳🇵','NPR','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Nauru','NR','NRU','🇳🇷','AUD','Oceania','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Niue','NU','NIU','🇳🇺','NZD','Oceania','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('New Zealand','NZ','NZL','🇳🇿','NZD','Oceania','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Oman','OM','OMN','🇴🇲','OMR','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Panama','PA','PAN','🇵🇦','PAB','Americas','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Peru','PE','PER','🇵🇪','PEN','Americas','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('French Polynesia','PF','PYF','🇵🇫','XPF','Oceania','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Papua new Guinea','PG','PNG','🇵🇬','PGK','Oceania','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Philippines','PH','PHL','🇵🇭','PHP','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Pakistan','PK','PAK','🇵🇰','PKR','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Poland','PL','POL','🇵🇱','PLN','Europe','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Saint Pierre and Miquelon','PM','SPM','🇵🇲','EUR','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Pitcairn Island','PN','PCN','🇵🇳','NZD','Oceania','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Puerto Rico','PR','PRI','🇵🇷','USD','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Palestinian Territory Occupied','PS','PSE','🇵🇸','ILS','Asia','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Portugal','PT','PRT','🇵🇹','EUR','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Palau','PW','PLW','🇵🇼','USD','Oceania','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Paraguay','PY','PRY','🇵🇾','PYG','Americas','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Qatar','QA','QAT','🇶🇦','QAR','Asia','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Reunion','RE','REU','🇷🇪','EUR','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Romania','RO','ROU','🇷🇴','RON','Europe','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Serbia','RS','SRB','🇷🇸','RSD','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Russia','RU','RUS','🇷🇺','RUB','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Rwanda','RW','RWA','🇷🇼','RWF','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Saudi Arabia','SA','SAU','🇸🇦','SAR','Asia','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Solomon Islands','SB','SLB','🇸🇧','SBD','Oceania','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Seychelles','SC','SYC','🇸🇨','SCR','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Sudan','SD','SDN','🇸🇩','SDG','Africa','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Sweden','SE','SWE','🇸🇪','SEK','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Singapore','SG','SGP','🇸🇬','SGD','Asia','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Saint Helena','SH','SHN','🇸🇭','SHP','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Slovenia','SI','SVN','🇸🇮','EUR','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Svalbard And Jan Mayen Islands','SJ','SJM','🇸🇯','NOK','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Slovakia','SK','SVK','🇸🇰','EUR','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Sierra Leone','SL','SLE','🇸🇱','SLL','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('San Marino','SM','SMR','🇸🇲','EUR','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Senegal','SN','SEN','🇸🇳','XOF','Africa','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Somalia','SO','SOM','🇸🇴','SOS','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Suriname','SR','SUR','🇸🇷','SRD','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('South Sudan','SS','SSD','🇸🇸','SSP','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Sao Tome and Principe','ST','STP','🇸🇹','STD','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('El Salvador','SV','SLV','🇸🇻','USD','Americas','1',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Sint Maarten (Dutch part)','SX','SXM','🇸🇽','ANG','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Syria','SY','SYR','🇸🇾','SYP','Asia','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Swaziland','SZ','SWZ','🇸🇿','SZL','Africa','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Turks And Caicos Islands','TC','TCA','🇹🇨','USD','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Chad','TD','TCD','🇹🇩','XAF','Africa','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('French Southern Territories','TF','ATF','🇹🇫','EUR','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Togo','TG','TGO','🇹🇬','XOF','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Thailand','TH','THA','🇹🇭','THB','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Tajikistan','TJ','TJK','🇹🇯','TJS','Asia','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Tokelau','TK','TKL','🇹🇰','NZD','Oceania','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('East Timor','TL','TLS','🇹🇱','USD','Asia','0',NULL,'2022-03-10 09:18:59','2022-03-10 09:18:59'),
('Turkmenistan','TM','TKM','🇹🇲','TMT','Asia','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Tunisia','TN','TUN','🇹🇳','TND','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Tonga','TO','TON','🇹🇴','TOP','Oceania','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Turkey','TR','TUR','🇹🇷','TRY','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Trinidad And Tobago','TT','TTO','🇹🇹','TTD','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Tuvalu','TV','TUV','🇹🇻','AUD','Oceania','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Taiwan','TW','TWN','🇹🇼','TWD','Asia','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Tanzania','TZ','TZA','🇹🇿','TZS','Africa','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Ukraine','UA','UKR','🇺🇦','UAH','Europe','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Uganda','UG','UGA','🇺🇬','UGX','Africa','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('United States Minor Outlying Islands','UM','UMI','🇺🇲','USD','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('United States','US','USA','🇺🇸','USD','Americas','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Uruguay','UY','URY','🇺🇾','UYU','Americas','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Uzbekistan','UZ','UZB','🇺🇿','UZS','Asia','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Vatican City State (Holy See)','VA','VAT','🇻🇦','EUR','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Saint Vincent And The Grenadines','VC','VCT','🇻🇨','XCD','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Venezuela','VE','VEN','🇻🇪','VEF','Americas','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Virgin Islands (British)','VG','VGB','🇻🇬','USD','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Virgin Islands (US)','VI','VIR','🇻🇮','USD','Americas','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Vietnam','VN','VNM','🇻🇳','VND','Asia','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Vanuatu','VU','VUT','🇻🇺','VUV','Oceania','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Wallis And Futuna Islands','WF','WLF','🇼🇫','XPF','Oceania','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Samoa','WS','WSM','🇼🇸','WST','Oceania','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Kosovo','XK','XKX','🇽🇰','EUR','Europe','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Yemen','YE','YEM','🇾🇪','YER','Asia','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Mayotte','YT','MYT','🇾🇹','EUR','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('South Africa','ZA','ZAF','🇿🇦','ZAR','Africa','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Zambia','ZM','ZMB','🇿🇲','ZMW','Africa','1',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00'),
('Zimbabwe','ZW','ZWE','🇿🇼','ZWL','Africa','0',NULL,'2022-03-10 09:19:00','2022-03-10 09:19:00');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(23,'2022_03_10_054511_create_countries_table',2);

/*Table structure for table `oauth_access_tokens` */

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
('1957ed08851b5e189af5fba2a764f9f81d81b6116aee58b107aaa29270b31bb252e1414a8b5010ce',1,1,'GGTC CFS Admin API Access Token','[]',0,'2022-03-10 05:45:49','2022-03-10 05:45:49','2022-09-10 05:45:49'),
('2256a22cd964d8582f488426932a87bac98f210fc94206e4b8ab5643cc4635d0bc9c7f175cacb137',1,3,'GGTC CFS Admin API Access Token','[]',0,'2022-03-10 07:47:34','2022-03-10 07:47:34','2022-09-10 07:47:34'),
('2f24d8b06d9e905b12b976228137d8bb92508b28d8b4566ba9edb02b5e3b84ad3781cc0380ac4075',1,1,'GGTC CFS Admin API Access Token','[]',0,'2022-03-10 05:38:50','2022-03-10 05:38:50','2022-09-10 05:38:50'),
('50de468763b936fef6318b3b76be65ca9e2d8b9b69abfdedddfc610c5d3c6aa8ad67ddb6056b8658',1,3,'GGTC CFS Admin API Access Token','[]',0,'2022-03-10 07:56:51','2022-03-10 07:56:51','2022-09-10 07:56:51'),
('bf69a460e226968545f4f49f75168e724a99626fc23426979a18f9347b1b872e146e1b1b745cb465',1,3,'GGTC CFS Admin API Access Token','[]',0,'2022-03-10 07:58:46','2022-03-10 07:58:46','2022-09-10 07:58:46'),
('cfbf8446dc96060245c37fbd975d3a14d392cb4f1c1fe20bb4e26d5de9b89fd49a64eb59235269c4',1,3,'GGTC CFS Admin API Access Token','[]',0,'2022-03-10 07:56:43','2022-03-10 07:56:43','2022-09-10 07:56:43'),
('dc778102fa57c70a17513a42be089173861f2cdbb4cf3a12bdc0568c6b340df2a3950e2dfd672aeb',1,1,'GGTC CFS Admin API Access Token','[]',0,'2022-03-10 07:15:36','2022-03-10 07:15:36','2022-09-10 07:15:36'),
('e35405e6f52f07f329a4f5fa148cfd92cb93d296f9ba4223dffe1ce1747aaa294baef6e5b3d8910a',1,3,'GGTC CFS Admin API Access Token','[]',0,'2022-03-10 07:47:37','2022-03-10 07:47:37','2022-09-10 07:47:37');

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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_clients` */

insert  into `oauth_clients`(`id`,`user_id`,`name`,`secret`,`provider`,`redirect`,`personal_access_client`,`password_client`,`revoked`,`created_at`,`updated_at`) values 
(1,NULL,'GGCTCFS Personal Access Client','sfhX0TrzWwn2OBM7dbvNOv4TpGdSSmKDDjEDwpPJ',NULL,'http://localhost',1,0,0,'2022-03-10 05:38:42','2022-03-10 05:38:42'),
(2,NULL,'GGCTCFS Password Grant Client','fKj2mILBOmjA2xeqb0CqmOqmOMBs2955pv3M4yqE','users','http://localhost',0,1,0,'2022-03-10 05:38:42','2022-03-10 05:38:42'),
(3,NULL,'GGCTCFS Personal Access Client','BNbK281WQmmkLVoJE542b2Z4OFfqbQADkfNi0RPl',NULL,'http://localhost',1,0,0,'2022-03-10 07:20:34','2022-03-10 07:20:34'),
(4,NULL,'GGCTCFS Password Grant Client','sLlJaedmrX4VDjDquHx3nnNLeOUUN63hKX3GkEb8','users','http://localhost',0,1,0,'2022-03-10 07:20:34','2022-03-10 07:20:34');

/*Table structure for table `oauth_personal_access_clients` */

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_personal_access_clients` */

insert  into `oauth_personal_access_clients`(`id`,`client_id`,`created_at`,`updated_at`) values 
(1,1,'2022-03-10 05:38:42','2022-03-10 05:38:42'),
(2,3,'2022-03-10 07:20:34','2022-03-10 07:20:34');

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
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`permissions`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Admin',NULL,NULL,NULL,NULL),
(2,'Superadmin',NULL,NULL,NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1,'admin',NULL,'cfs','admin','Active','admin@dbm.com',NULL,'$2y$10$V6G5GuViq07m0sEzJTvvLOlv9hB4z3.AfLddoqk0b4iuQtWEPwyuS',NULL,'2022-03-10 05:28:46','2022-03-10 05:28:46',NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
