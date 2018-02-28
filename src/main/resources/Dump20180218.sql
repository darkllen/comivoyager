-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sys
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `all_points`
--

DROP TABLE IF EXISTS `all_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `all_points` (
  `number` int(11) NOT NULL,
  `coordinates` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `number_of_students` int(11) NOT NULL,
  `his_id` int(11) DEFAULT NULL,
  `adress` varchar(200) DEFAULT NULL,
  `all_pointscol` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`all_pointscol`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_points`
--

LOCK TABLES `all_points` WRITE;
/*!40000 ALTER TABLE `all_points` DISABLE KEYS */;
INSERT INTO `all_points` VALUES (1,'46.437579,30.739078',6,'school',0,27,'Палубна вулиця 12 Одеса Одеська область Украина 65000',111),(2,'46.477602,30.724499',6,'point1',5,27,'Спиридонівська вулиця 31 Одеса Одеська область Украина 65000',112),(3,'46.463435,30.722756',6,'point2',5,27,'вулиця Адмірала Лазарєва 38 Одеса Одеська область Украина 65000',113),(4,'46.473966,30.744181',6,'point3',5,27,'вулиця Осипова 26 Одеса Одеська область Украина 65000',114),(5,'46.457126,30.740033',6,'point4',5,27,'Бісквітний провулок 4 Одеса Одеська область Украина 65000',115),(6,'46.447620,30.718885',6,'point5',5,27,'вулиця Скворцова 24Г Одеса Одеська область Украина 65000',116),(1,'46.458006,30.737162',6,'school',0,28,'6-й Басейний провулок 8 Одеса Одеська область Украина 65000',117),(2,'46.472228,30.730617',6,'point1',5,28,'вулиця Преображенська 71 Одеса Одеська область Украина 65000',118),(3,'46.463073,30.712889',6,'point2',12,28,'Степова вулиця 36 Одеса Одеська область Украина 65000',119),(19,'46.447935,30.727933',6,'point3',7,28,'Люстдорфська дорога 7 Одеса Одеська область Украина 65000',120),(5,'46.450930,30.749594',6,'point4',9,28,'Армійська вулиця 18Б Одеса Одеська область Украина 65000',121),(6,'46.430933,30.732011',6,'point5',15,28,'вулиця Шклярука 12 Одеса Одеська область Украина 65000',122),(7,'46.447432,30.708938',6,'point6',3,28,'40B вулиця Рекордна 40Б Одеса Одеська область Украина 65000',123),(8,'46.437113,30.751081',6,'point7',4,28,'Сонячна вулиця 10А Одеса Одеська область Украина 65000',124),(9,'46.429853,30.712758',6,'point8',12,28,'вулиця Космонавтів 36 Одеса Одеська область Украина 65000',125),(10,'46.419244,30.734528',6,'point9',11,28,'2-й Тупиковий провулок 5 Одеса Одеська область Украина 65000',126),(11,'46.409682,30.725205',6,'point10',7,28,'4-а лінія Люстдорфської Дороги 3 Одеса Одеська область Украина 65000',127),(12,'46.416529,30.751851',6,'point11',5,28,'Фонтанська дорога 54 Одеса Одеська область Украина 65000',128),(13,'46.477243,30.748035',6,'point12',9,28,'вулиця Канатна 31 Одеса Одеська область Украина 65000',129),(1,'46.460879,30.722318',6,'school',0,29,'вулиця Генерала Цвєтаєва Одеса Одеська область Украина 65000',130),(2,'46.473908,30.718227',6,'point1',5,29,'вулиця Розумовська 15 Одеса Одеська область Украина 65000',131),(3,'46.471515,30.742355',6,'point2',5,29,'вулиця Лейтенанта Шмідта 8 Одеса Одеська область Украина 65000',132),(4,'46.966608,31.990742',6,'point3',5,29,'проспект Центральний 77 Миколаїв Миколаївська область Украина 54000',133),(5,'46.959216,32.003799',6,'point4',5,29,'вулиця Погранична 90 Миколаїв Миколаївська область Украина 54000',134),(1,'46.439207,30.737224',6,'school',0,30,'вулиця Генерала Швигіна 16 Одеса Одеська область Украина 65000',135),(2,'46.472338,30.727839',6,'point1',5,30,'вулиця Мала Арнаутська 112 Одеса Одеська область Украина 65000',136),(3,'46.472464,30.746831',6,'point2',5,30,'вулиця Велика Арнаутська 6 Одеса Одеська область Украина 65000',137),(4,'46.448649,30.721144',6,'point3',5,30,'Авіаційна вулиця 38Б Одеса Одеська область Украина 65000',138),(5,'46.452160,30.745724',6,'point4',5,30,'вулиця Маршала Говорова 1/4 Одеса Одеська область Украина 65000',139),(1,'46.503695,30.725235',7,'school',0,31,'вулиця Чорноморського Козацтва 28 Одеса Одеська область Украина 65000',140),(2,'46.472338,30.727839',7,'point1',5,31,'вулиця Мала Арнаутська 112 Одеса Одеська область Украина 65000',141),(3,'46.458605,30.748754',7,'point2',9,31,'проспект Шевченка 4А Одеса Одеська область Украина 65000',142),(4,'46.451531,30.706549',7,'point3',12,31,'Спартаківський провулок 29 Одеса Одеська область Украина 65000',143),(5,'46.393214,30.738298',7,'point4',11,31,'провулок Всеволода Змієнка Одеса Одеська область Украина 65000',144),(6,'46.361446,30.682569',7,'point5',7,31,'Стара Люстдорфська дорога Одеська область Украина',145),(7,'46.430751,30.729465',7,'point6',14,31,'вулиця Краснова 15 Одеса Одеська область Украина 65000',146),(8,'46.405875,30.717602',7,'point7',15,31,'вулиця Левітана Одеса Одеська область Украина 65000',147),(9,'46.564181,30.821058',7,'point8',6,31,'вулиця Южна 63 Одеська область Украина',148),(10,'46.574126,30.794466',7,'point9',14,31,'Дніпропетровська дорога 58 Одеса Одеська область Украина 65000',149),(11,'46.559817,30.849442',7,'point10',2,31,'вулиця Гагаріна 1 Фонтанка Одеська область Украина 67571',150),(12,'46.583357,30.809292',7,'point11',9,31,'вулиця Генерала Бочарова 44А Одеса Одеська область Украина',151);
/*!40000 ALTER TABLE `all_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `current_id`
--

DROP TABLE IF EXISTS `current_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `current_id` (
  `id` int(11) NOT NULL,
  `current_idcol` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`current_idcol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_id`
--

LOCK TABLES `current_id` WRITE;
/*!40000 ALTER TABLE `current_id` DISABLE KEYS */;
INSERT INTO `current_id` VALUES (7,1);
/*!40000 ALTER TABLE `current_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distances_matrix`
--

DROP TABLE IF EXISTS `distances_matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distances_matrix` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `0` int(20) DEFAULT NULL,
  `1` int(20) DEFAULT NULL,
  `2` int(20) DEFAULT NULL,
  `3` int(20) DEFAULT NULL,
  `4` int(20) DEFAULT NULL,
  `5` int(20) DEFAULT NULL,
  `6` int(20) DEFAULT NULL,
  `7` int(20) DEFAULT NULL,
  `8` int(20) DEFAULT NULL,
  `9` int(20) DEFAULT NULL,
  `10` int(20) DEFAULT NULL,
  `11` int(20) DEFAULT NULL,
  `12` int(20) DEFAULT NULL,
  `13` int(20) DEFAULT NULL,
  `14` int(20) DEFAULT NULL,
  `15` int(20) DEFAULT NULL,
  `16` int(20) DEFAULT NULL,
  `17` int(20) DEFAULT NULL,
  `18` int(20) DEFAULT NULL,
  `19` int(20) DEFAULT NULL,
  `20` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distances_matrix`
--

LOCK TABLES `distances_matrix` WRITE;
/*!40000 ALTER TABLE `distances_matrix` DISABLE KEYS */;
INSERT INTO `distances_matrix` VALUES (1,0,782,1355,975,1977,2278,1436,1799,1101,975,1100,1192,671,750,718,628,989,275,676,1007,252),(2,793,0,573,779,1315,1762,695,1186,1876,1750,1875,1967,419,1273,1164,896,902,1148,896,507,569),(3,1079,754,0,877,1171,1618,552,1041,2162,2037,2161,2253,683,777,690,474,303,859,474,348,529),(4,816,528,762,0,1103,1550,562,973,1900,1774,1899,1991,689,1106,884,616,632,1001,617,110,413),(5,1805,1265,1114,1128,0,829,636,455,2889,2763,2888,2980,631,630,426,508,697,491,383,977,431),(6,2316,1802,1651,1566,847,0,1172,781,3399,2996,3398,3298,834,579,585,317,805,454,317,684,553),(7,1169,659,478,522,616,1063,0,486,2253,2127,2252,2344,1055,761,480,639,300,959,514,699,365),(8,1707,1192,1041,956,453,695,563,0,2790,2664,2789,2881,945,1518,1296,1028,1044,1413,1028,522,594),(9,1078,1619,2192,1813,2814,3116,2274,2636,0,469,405,496,1173,843,454,721,896,836,597,1191,846),(10,920,1461,2034,1655,2656,2958,2116,2478,490,0,499,444,1165,923,752,745,365,1121,677,673,265),(11,1257,1798,2371,1992,2994,3295,2453,2815,291,633,0,622,1208,1076,839,571,724,955,571,400,248),(12,1279,1820,2393,2014,3015,3158,2475,2837,711,359,858,0,1103,1483,1261,993,1009,1378,993,487,1988),(13,646,381,649,617,643,921,972,897,973,1166,1238,1086,0,813,487,635,509,1011,567,909,390),(14,848,1030,583,879,786,634,972,1068,1115,910,657,1040,1097,0,853,586,843,849,586,753,260),(15,697,1228,617,1077,559,818,380,1267,357,754,856,1239,467,554,0,432,590,683,308,902,508),(16,572,995,372,844,434,599,539,1033,703,656,622,1006,685,321,441,0,506,558,174,657,418),(17,928,903,263,849,789,773,426,1039,809,345,674,1011,490,715,547,537,0,913,469,548,535),(18,160,1213,1057,1178,502,632,1053,1367,890,1298,1042,1340,1162,830,878,708,1148,0,723,1093,562),(19,459,920,388,769,321,524,387,959,529,637,548,931,511,246,268,124,488,445,0,644,325),(20,885,537,483,483,801,432,927,672,1070,759,343,645,1000,1045,808,541,691,925,541,0,307),(21,304,470,583,473,439,563,297,557,857,316,263,2054,371,271,349,437,322,500,368,333,0);
/*!40000 ALTER TABLE `distances_matrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `id` int(11) DEFAULT NULL,
  `result` varchar(250) NOT NULL,
  `id_his` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_his`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (6,'0-1-3-2-5-0-4-0',27,'2018/02/17 22:13:31'),(6,'0-9-11-10-0-5-7-4-0-8-6-3-1-0-12-2-0',28,'2018/02/17 22:15:38'),(6,'0-3-4-1-2-0',29,'2018/02/17 22:51:08'),(6,'0-1-2-4-3-0',30,'2018/02/18 18:50:45'),(7,'0-4-5-0-6-7-0-10-8-11-0-3-2-1-0-9-0',31,'2018/02/18 18:53:22');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point`
--

DROP TABLE IF EXISTS `point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `point` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `coordinates` varchar(50) DEFAULT NULL,
  `number_of_students` varchar(10) DEFAULT NULL,
  `adress` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point`
--

LOCK TABLES `point` WRITE;
/*!40000 ALTER TABLE `point` DISABLE KEYS */;
INSERT INTO `point` VALUES (1,'school','46.503695,30.725235','0','вулиця Чорноморського Козацтва 28 Одеса Одеська область Украина 65000'),(2,'point1','46.472338,30.727839','5','вулиця Мала Арнаутська 112 Одеса Одеська область Украина 65000'),(3,'point2','46.458605,30.748754','9','проспект Шевченка 4А Одеса Одеська область Украина 65000'),(4,'point3','46.451531,30.706549','12','Спартаківський провулок 29 Одеса Одеська область Украина 65000'),(5,'point4','46.393214,30.738298','11','провулок Всеволода Змієнка Одеса Одеська область Украина 65000'),(6,'point5','46.361446,30.682569','7','Стара Люстдорфська дорога Одеська область Украина'),(7,'point6','46.430751,30.729465','14','вулиця Краснова 15 Одеса Одеська область Украина 65000'),(8,'point7','46.405875,30.717602','15','вулиця Левітана Одеса Одеська область Украина 65000'),(9,'point8','46.564181,30.821058','6','вулиця Южна 63 Одеська область Украина'),(10,'point9','46.574126,30.794466','14','Дніпропетровська дорога 58 Одеса Одеська область Украина 65000'),(11,'point10','46.559817,30.849442','2','вулиця Гагаріна 1 Фонтанка Одеська область Украина 67571'),(12,'point11','46.583357,30.809292','9','вулиця Генерала Бочарова 44А Одеса Одеська область Украина'),(13,'point12','46.477243,30.748035','9','вулиця Канатна 31 Одеса Одеська область Украина 65000'),(14,'point13','46.457312,30.733761','17',NULL),(15,'point14','46.432553,30.726596','5',NULL),(16,'point15','46.454222,30.724567','15',NULL),(17,'point16','46.448198,30.699511','6',NULL),(18,'point17','46.454812,30.750609','4',NULL),(19,'point18','46.447935,30.727933','10',NULL),(20,'point19','46.474389,30.709895','7',NULL),(21,'point20','46.483466,30.736426','13',NULL);
/*!40000 ALTER TABLE `point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `points_number`
--

DROP TABLE IF EXISTS `points_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `points_number` (
  `id` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `points_number`
--

LOCK TABLES `points_number` WRITE;
/*!40000 ALTER TABLE `points_number` DISABLE KEYS */;
INSERT INTO `points_number` VALUES (1,11);
/*!40000 ALTER TABLE `points_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `result` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,'0-4-5-0-6-7-0-10-8-11-0-3-2-1-0-9-0');
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickName` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`nickName`),
  UNIQUE KEY `nickName_UNIQUE` (`nickName`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'das','dsa','das'),(6,'admin','admin','admin'),(7,'Ihor','yankiniigor@gmail.com','0123'),(8,'asd','das','2134'),(12,'d','d','d'),(14,'a','Ð´Ð¶',' Ð´Ð±Ð¶'),(16,'aaa','aaa','aaa'),(23,'as','as','as');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `win_matrix`
--

DROP TABLE IF EXISTS `win_matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `win_matrix` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `1` int(20) DEFAULT NULL,
  `2` int(20) DEFAULT NULL,
  `3` int(20) DEFAULT NULL,
  `4` int(20) DEFAULT NULL,
  `5` int(20) DEFAULT NULL,
  `6` int(20) DEFAULT NULL,
  `7` int(20) DEFAULT NULL,
  `8` int(20) DEFAULT NULL,
  `9` int(20) DEFAULT NULL,
  `10` int(20) DEFAULT NULL,
  `11` int(20) DEFAULT NULL,
  `12` int(20) DEFAULT NULL,
  `13` int(20) DEFAULT NULL,
  `14` int(20) DEFAULT NULL,
  `15` int(20) DEFAULT NULL,
  `16` int(20) DEFAULT NULL,
  `17` int(20) DEFAULT NULL,
  `18` int(20) DEFAULT NULL,
  `19` int(20) DEFAULT NULL,
  `20` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `win_matrix`
--

LOCK TABLES `win_matrix` WRITE;
/*!40000 ALTER TABLE `win_matrix` DISABLE KEYS */;
INSERT INTO `win_matrix` VALUES (1,0,1564,978,1444,1298,1523,1395,7,7,7,7,739,604,681,859,1214,254,907,1627,0),(2,1383,0,1453,2161,2015,2239,2113,294,293,294,294,521,957,1012,1138,1670,400,1186,1643,142),(3,1229,1568,0,1849,1703,1849,1801,176,176,176,176,528,737,927,1105,1450,367,1152,1990,264),(4,1494,2218,1824,0,3426,2777,3321,189,189,189,189,843,542,714,542,714,206,715,452,197),(5,1258,1982,1687,3408,0,2542,3296,-20,257,-20,172,713,718,680,858,731,368,906,870,260),(6,1559,2313,1889,2797,2651,0,2749,284,284,284,284,511,882,1131,882,1582,209,1055,1201,181),(7,1389,2113,1818,3323,3382,2672,0,110,110,110,110,636,514,704,882,1227,144,930,1767,50),(8,264,264,263,264,263,263,264,0,1607,1796,1797,400,638,995,638,824,170,810,547,260),(9,296,296,295,296,295,295,296,1586,0,1576,1723,621,966,1105,1022,1763,293,1138,1473,141),(10,84,84,83,83,83,83,84,1910,1442,0,1670,646,631,836,1014,1222,277,1062,1564,303),(11,154,154,153,154,312,153,154,1582,1808,1434,0,667,521,711,889,1234,151,937,1774,154),(12,777,555,600,831,626,594,684,600,620,616,684,0,939,1233,995,1482,266,1111,1100,185),(13,847,1151,964,386,663,671,964,366,979,1050,964,655,0,615,792,896,176,840,1004,370),(14,617,1085,734,581,447,1231,733,1092,1103,819,733,1253,914,0,914,1117,310,1086,823,180),(15,760,1240,877,616,576,982,877,656,1111,963,876,945,1057,905,0,1111,345,1130,978,269),(16,1213,1710,1233,622,763,1456,1232,911,1783,1272,1232,1501,1024,1160,1080,0,351,1196,1448,126),(17,189,202,190,195,190,115,190,116,116,190,189,115,195,115,195,116,0,228,189,26),(18,883,1272,1000,777,699,1182,999,878,1178,1085,999,1167,1180,1126,1180,1177,506,0,1039,282),(19,1597,1508,1617,628,1122,973,1617,668,1387,1621,1616,1009,712,917,1094,1305,357,1142,0,275),(20,99,88,204,189,250,249,87,249,90,288,88,204,359,339,250,339,88,239,249,0);
/*!40000 ALTER TABLE `win_matrix` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-18 18:59:10
