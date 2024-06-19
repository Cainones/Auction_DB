-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: auction_db
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `characteristic`
--

DROP TABLE IF EXISTS `characteristic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characteristic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price_per_slot` decimal(10,2) DEFAULT NULL,
  `merchant_s_price` decimal(10,2) DEFAULT NULL,
  `initial_price` decimal(10,2) DEFAULT NULL,
  `sizes` int DEFAULT NULL,
  `mass` decimal(10,2) DEFAULT NULL,
  `items_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_characteristic_items_type_idx` (`items_type_id`),
  CONSTRAINT `fk_characteristic_items_type` FOREIGN KEY (`items_type_id`) REFERENCES `items_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characteristic`
--

LOCK TABLES `characteristic` WRITE;
/*!40000 ALTER TABLE `characteristic` DISABLE KEYS */;
INSERT INTO `characteristic` VALUES (1,7717.00,15434.00,125000.00,2,0.40,1),(2,7087.50,14175.00,55000.00,2,0.35,1),(3,17640.00,35280.00,36390.00,2,0.83,1),(4,32760.00,32760.00,56432.00,1,0.65,2),(5,5040.00,30240.00,239500.00,6,9.25,2),(6,22949.00,22949.00,23247.00,1,0.20,2),(7,19090.00,38180.00,54329.00,2,1.80,2),(19,26570.00,26570.00,34327.00,1,0.10,2),(20,22050.00,22050.00,25560.00,1,0.20,2),(21,7875.00,31500.00,155600.00,4,5.60,2),(22,33075.00,66150.00,66600.00,2,0.55,3),(23,10395.00,83160.00,163244.00,10,5.50,3),(25,23940.00,23940.00,36363.00,1,0.36,3),(26,2441.25,19530.00,56743.00,4,0.90,3),(27,38060.00,78120.00,80750.00,2,1.20,3),(28,41580.00,83160.00,84250.00,2,1.50,3),(29,20790.00,20790.00,32152.00,1,0.10,3),(30,15806.00,15806.00,22456.00,1,0.20,4),(31,18956.00,18956.00,19342.00,1,1.10,4),(32,4095.00,4095.00,25437.00,1,0.20,4),(33,53494.00,53494.00,86982.00,1,0.06,4),(34,141498.00,141498.00,415245.00,1,1.50,4),(35,611100.00,611100.00,925925.00,1,0.08,4),(36,1890.00,1890.00,25432.00,1,0.06,4),(37,6930.00,6930.00,31345.00,1,0.40,5),(38,15750.00,15750.00,97652.00,1,0.40,5),(39,5481.00,5481.00,25672.00,1,0.40,5),(40,3843.00,7686.00,47474.00,2,0.60,5),(41,19278.00,38556.00,56478.00,2,0.80,5),(42,15120.00,15120.00,31450.00,1,0.15,5),(43,3150.00,3150.00,42312.00,1,0.45,5),(44,11097.00,11097.00,29292.00,1,0.22,5),(45,1214.00,1214.00,47456.00,1,0.20,6),(46,16030.50,32061.00,32323.00,2,0.40,6),(47,34932.00,34932.00,34980.00,1,0.06,6),(48,2978.50,5957.00,59673.00,2,0.75,6),(59,17108.00,102650.00,167230.00,6,7.20,7),(60,34650.00,34650.00,43251.00,1,0.01,7),(61,39943.00,39943.00,42531.00,1,0.50,7),(62,34650.00,34650.00,52643.00,1,0.06,7),(63,42840.00,42840.00,49345.00,1,0.20,7),(64,53550.00,53550.00,76432.00,1,0.10,7),(65,62370.00,124740.00,678432.00,2,0.60,8),(66,45832.50,91665.00,125231.00,2,2.00,8),(67,30240.00,30240.00,91234.00,1,0.50,8),(70,26775.00,53550.00,57645.00,2,1.70,9),(71,25987.00,207900.00,320413.00,8,43.20,9),(72,16380.00,16380.00,287232.00,1,0.04,9),(73,7750.00,7750.00,24500.00,1,0.02,10);
/*!40000 ALTER TABLE `characteristic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demand_creates_supply`
--

DROP TABLE IF EXISTS `demand_creates_supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demand_creates_supply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `merchant_s_price_id` int NOT NULL,
  `merchant_s_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_demand_creates_supply_merchant's_price1_idx` (`merchant_s_price_id`),
  KEY `fk_demand_creates_supply_merchant's1_idx` (`merchant_s_id`),
  CONSTRAINT `fk_demand_creates_supply_merchant's1` FOREIGN KEY (`merchant_s_id`) REFERENCES `merchant_s` (`id`),
  CONSTRAINT `fk_demand_creates_supply_merchant's_price1` FOREIGN KEY (`merchant_s_price_id`) REFERENCES `merchant_s_price` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demand_creates_supply`
--

LOCK TABLES `demand_creates_supply` WRITE;
/*!40000 ALTER TABLE `demand_creates_supply` DISABLE KEYS */;
INSERT INTO `demand_creates_supply` VALUES (1,1,2),(2,2,8),(3,3,1),(4,4,1),(5,5,8),(6,6,6),(7,7,8),(8,8,5),(9,9,5),(10,10,8),(11,11,2),(12,12,2),(13,13,2),(14,14,2),(15,15,2),(16,16,2),(17,17,2),(18,18,2),(19,19,2),(20,20,2),(21,21,2),(22,22,2),(23,23,2),(24,24,2),(25,25,8),(26,26,1),(27,27,8),(28,28,1),(29,29,2),(30,30,2),(31,31,2),(32,32,2),(33,33,2),(34,34,2),(35,35,2),(36,36,2),(37,37,2),(38,38,2),(39,39,2),(40,40,2),(41,41,2),(42,42,2),(43,43,5),(44,44,5),(45,45,5),(46,46,6),(47,47,1),(48,48,6),(49,49,9);
/*!40000 ALTER TABLE `demand_creates_supply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `characteristic_id` int NOT NULL,
  `item_class_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bodies_characteristic1_idx` (`characteristic_id`),
  CONSTRAINT `fk_bodies_characteristic1` FOREIGN KEY (`characteristic_id`) REFERENCES `characteristic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Водный фильтр',1,1),(2,'Моток паракорда',2,1),(3,'Снаряд ОФЗ 30x160мм',3,1),(4,'Банка с термитной смесью',4,2),(5,'Металлическая топливная канистра',5,2),(6,'Оружейная смазка #FireKlean',6,2),(7,'Присадка для диз.топлива',7,2),(8,'Сухое горючее',19,2),(9,'Тротиловая шашка ТП-200',20,2),(10,'Экспедиционная топливная канистра',21,2),(11,'Кабелерез Bulbex',22,3),(12,'Кувалда \"Лютый удар\"',23,3),(13,'Набор для шитья',25,3),(14,'Набор инструментов',26,3),(15,'Трещоточный ключ',27,3),(16,'Шарнирный ключ КШС',28,3),(17,'Шило',29,3),(18,'Банка с витаминами OLOLO',30,4),(19,'Банка с таблетками \"Аквапепс\"',31,4),(20,'Набор медикаментов',32,4),(21,'Офтальмоскоп',33,4),(22,'Портативный дефибриллятор',34,4),(23,'Трансиллюминатор кожи LEDX',35,4),(24,'Шприц в упаковке',36,4),(25,'Болты',37,5),(26,'Военная гофрированная трубка',38,5),(27,'Гайки',39,5),(28,'Гофрированный шланг',40,5),(29,'Датчик давления',41,5),(30,'Липкая лента \"KEKТЕЙП\"',42,5),(31,'Набор металлических частей',43,5),(32,'Силиконовая трубка',44,5),(33,'Зубная паста сибирь',45,6),(34,'Крысиный яд LVNDMARK\'s',46,6),(35,'Масло для бороды Deadlyslob\'s',47,6),(36,'Средство для прочистки труб \"Копченый Дымоход\"',48,6),(37,'Бронзовый лев',59,7),(38,'Гитарный медиатор Veritas',60,7),(39,'Древнее кресало',61,7),(40,'Золотое кольцо с черепом',62,7),(41,'Золотое яйцо',63,7),(42,'Цепь с медальёном Prolill',64,7),(43,'Видиокарта',65,8),(44,'COFDM',66,8),(45,'Считыватель UHF RFID',67,8),(46,'Аккумуляторная батарея \"Циклон\"',70,9),(47,'Военный аккумулятор 6-СТЭН-140-М',71,9),(48,'Аккумуляторная батарейка GreenBat',72,9),(49,'GP-Монетка',73,NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `items_information`
--

DROP TABLE IF EXISTS `items_information`;
/*!50001 DROP VIEW IF EXISTS `items_information`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `items_information` AS SELECT 
 1 AS `item_id`,
 1 AS `item_title`,
 1 AS `characteristic_id`,
 1 AS `price_per_slot`,
 1 AS `merchant_s_price`,
 1 AS `initial_price`,
 1 AS `sizes`,
 1 AS `mass`,
 1 AS `item_type_id`,
 1 AS `item_type`,
 1 AS `merchant_price_id`,
 1 AS `merchant_item_price`,
 1 AS `link_url`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `items_type`
--

DROP TABLE IF EXISTS `items_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_type`
--

LOCK TABLES `items_type` WRITE;
/*!40000 ALTER TABLE `items_type` DISABLE KEYS */;
INSERT INTO `items_type` VALUES (1,'Прочее'),(2,'Горюче-смазочные материалы'),(3,'Инструменты'),(4,'Медматериалы'),(5,'Стройматериалы'),(6,'Хозтовары'),(7,'Ценности'),(8,'Электроника'),(9,'Элементы питания'),(10,'Ценности');
/*!40000 ALTER TABLE `items_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_s`
--

DROP TABLE IF EXISTS `merchant_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant_s` (
  `id` int NOT NULL AUTO_INCREMENT,
  `merchant_s_name` varchar(255) DEFAULT NULL,
  `supply_m_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_merchant's_sequence_m1_idx` (`supply_m_id`),
  CONSTRAINT `fk_merchant's_sequence_m1` FOREIGN KEY (`supply_m_id`) REFERENCES `supply_m` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_s`
--

LOCK TABLES `merchant_s` WRITE;
/*!40000 ALTER TABLE `merchant_s` DISABLE KEYS */;
INSERT INTO `merchant_s` VALUES (1,'Прапор',1),(2,'Терапевт',2),(3,'Скупщик',6),(4,'Лыжник',1),(5,'Миротворец',4),(6,'Механик',1),(7,'Барахольщик',3),(8,'Егерь',4),(9,'Терапевт',7);
/*!40000 ALTER TABLE `merchant_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_s_price`
--

DROP TABLE IF EXISTS `merchant_s_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant_s_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `merchant_s_price` decimal(10,2) DEFAULT NULL,
  `items_id` int NOT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_historical_events_items1_idx` (`items_id`),
  CONSTRAINT `fk_historical_events_items1` FOREIGN KEY (`items_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_s_price`
--

LOCK TABLES `merchant_s_price` WRITE;
/*!40000 ALTER TABLE `merchant_s_price` DISABLE KEYS */;
INSERT INTO `merchant_s_price` VALUES (1,15434.00,1,'https://tarkov.help/ru/item/vodnyi_filtr'),(2,14175.00,2,'https://tarkov.help/ru/item/motok_parakorda'),(3,35280.00,3,'https://tarkov.help/ru/item/snaryad_ofz_30x160mm'),(4,32760.00,4,'https://tarkov.help/ru/item/banka_s_termitnoi_smesyu'),(5,30240.00,5,'https://tarkov.help/ru/item/metallicheskaya_toplivnaya_kanistra'),(6,22949.00,6,'https://tarkov.help/ru/item/oruzheinaya_smazka_fireklean'),(7,38180.00,7,'https://tarkov.help/ru/item/prisadka_dlya_dizelnogo_topliva'),(8,26570.00,8,'https://tarkov.help/ru/item/sukhoye_goryucheye'),(9,22050.00,9,'https://tarkov.help/ru/item/trotilovaya_shashka_tp_200'),(10,31500.00,10,'https://tarkov.help/ru/item/ekspeditsionnaya_toplivnaya_kanistra'),(11,66150.00,11,'https://tarkov.help/ru/item/kabelerez_bulbex'),(12,83160.00,12,'https://tarkov.help/ru/item/kuvalda_lyutyi_udar'),(13,23940.00,13,'https://tarkov.help/ru/item/nabor_dlya_shitya'),(14,19530.00,14,'https://tarkov.help/ru/item/nabor_instrumentov'),(15,78120.00,15,'https://tarkov.help/ru/item/treshchotochnyi_klyuch'),(16,83160.00,16,'https://tarkov.help/ru/item/sharnirnyi_klyuch_kshs'),(17,20790.00,17,'https://tarkov.help/ru/item/shilo'),(18,15806.00,18,'https://tarkov.help/ru/item/banka_s_vitaminami_ololo'),(19,18956.00,19,'https://tarkov.help/ru/item/banka_s_tabletkami_dlya_ochistki_vody_akvapeps'),(20,4095.00,20,'https://tarkov.help/ru/item/nabor_medikamentov'),(21,53494.00,21,'https://tarkov.help/ru/item/oftalmoskop'),(22,141498.00,22,'https://tarkov.help/ru/item/portativnyi_defibrillyator'),(23,611100.00,23,'https://tarkov.help/ru/item/svetodiodnyi_transillyuminator_kozhi_ledx'),(24,1890.00,24,'https://tarkov.help/ru/item/shprits_v_upakovke'),(25,6930.00,25,'https://tarkov.help/ru/item/bolty'),(26,15750.00,26,'https://tarkov.help/ru/item/voyennaya_gofrirovannaya_trubka'),(27,5481.00,27,'https://tarkov.help/ru/item/gaiki'),(28,7686.00,28,'https://tarkov.help/ru/item/gofrirovannyi_shlang'),(29,38556.00,29,'https://tarkov.help/ru/item/datchik_davleniya'),(30,15120.00,30,'https://tarkov.help/ru/item/lipkaya_lenta_kekteip'),(31,3150.00,31,'https://tarkov.help/ru/item/nabor_metallicheskikh_chastei'),(32,11097.00,32,'https://tarkov.help/ru/item/silikonovaya_trubka'),(33,1214.00,33,'https://tarkov.help/ru/item/zubnaya_pasta'),(34,32061.00,34,'https://tarkov.help/ru/item/krysinyi_yad_lvndmarks'),(35,34932.00,35,'https://tarkov.help/ru/item/maslo_dlya_borody_deadlyslobs'),(36,5957.00,36,'https://tarkov.help/ru/item/sredstvo_dlya_prochistki_trub_kopchenyi_dymokhod'),(37,102650.00,37,'https://tarkov.help/ru/item/bronzovyi_lev'),(38,34650.00,38,'https://tarkov.help/ru/item/gitarnyi_mediator_veritas'),(39,39943.00,39,'https://tarkov.help/ru/item/drevneye_kresalo'),(40,34650.00,40,'https://tarkov.help/ru/item/zolotoye_koltso_s_cherepom'),(41,42840.00,41,'https://tarkov.help/ru/item/zolotoye_yaitso'),(42,53550.00,42,'https://tarkov.help/ru/item/tsep_s_medalonom_prokill'),(43,124740.00,43,'https://tarkov.help/ru/item/videokarta'),(44,91665.00,44,'https://tarkov.help/ru/item/voyennyi_cofdm_besprovodnoi_peredatchik_signalov'),(45,30240.00,45,'https://tarkov.help/ru/item/schityvatel_uhf_rfid'),(46,53550.00,46,'https://tarkov.help/ru/item/akkumulyatornaya_batareya_tsiklon'),(47,207900.00,47,'https://tarkov.help/ru/item/voyennyi_akkumulyator_6_st_en_140_m'),(48,16380.00,48,'https://tarkov.help/ru/item/litiyevaya_akkumulyatornaya_batareika_greenbat'),(49,7750.00,49,'https://tarkov.help/ru/item/moneta_gp');
/*!40000 ALTER TABLE `merchant_s_price` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdateTotalCharacter` AFTER UPDATE ON `merchant_s_price` FOR EACH ROW BEGIN
    DECLARE total_price DECIMAL(10,2);

    SELECT SUM(characteristic.merchant_s_price)
    INTO total_price
    FROM merchant_s_price
    JOIN items ON merchant_s_price.items_id = items.id
    JOIN characteristic ON items.characteristic_id = characteristic.id
    WHERE merchant_s_price.id = NEW.id;

    UPDATE characteristic
    SET total_price = total_price
    WHERE id = (
        SELECT characteristic_id
        FROM items
        WHERE id = NEW.items_id
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `supply_m`
--

DROP TABLE IF EXISTS `supply_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supply_m` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply_m`
--

LOCK TABLES `supply_m` WRITE;
/*!40000 ALTER TABLE `supply_m` DISABLE KEYS */;
INSERT INTO `supply_m` VALUES (1,'Оружие-модули-патроны'),(2,'Медицина-контейнеры-еда'),(3,'Одежда-экипировка'),(4,'Оружие-экипировка'),(5,'Бартер-GP'),(6,'Скупка-всего'),(7,'Медецина-продажи');
/*!40000 ALTER TABLE `supply_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'auction_db'
--

--
-- Dumping routines for database 'auction_db'
--
/*!50003 DROP FUNCTION IF EXISTS `TotalNumberOfProducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `TotalNumberOfProducts`(item_type VARCHAR(255)) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE item_count INT;

    SELECT COUNT(items.id) INTO item_count
    FROM items 
    JOIN characteristic ON items.characteristic_id = characteristic.id
    JOIN items_type ON characteristic.items_type_id = items_type.id
    WHERE items_type.type = item_type;

    RETURN item_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddNewItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewItem`(
    IN new_item_title VARCHAR(255),
    IN new_item_type VARCHAR(255),
    IN new_characteristic_price_per_slot DECIMAL(10,2),
    IN new_characteristic_merchants_price DECIMAL(10,2),
    IN new_characteristic_initial_price DECIMAL(10,2),
    IN new_characteristic_sizes INT,
    IN new_characteristic_mass DECIMAL(10,2),
    IN new_merchants_price DECIMAL(10,2),
    IN new_link_url VARCHAR(255),
    IN new_merchants_name VARCHAR(255),
    IN new_supply_title VARCHAR(255)
)
BEGIN
    DECLARE existing_item_type_id INT;
    DECLARE existing_merchant_id INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT id INTO existing_item_type_id
    FROM items_type
    WHERE type = new_item_type;

    IF existing_item_type_id IS NULL THEN
        INSERT INTO items_type (type) VALUES (new_item_type);
        SET existing_item_type_id = LAST_INSERT_ID();
    END IF;

    SELECT id INTO existing_merchant_id
    FROM merchant_s
    WHERE merchant_s_price = new_merchants_name;

    IF existing_merchant_id IS NULL THEN
        INSERT INTO merchant_s (merchant_s_price, supply_m_id) VALUES (new_merchants_name, (SELECT id FROM supply_m WHERE title = new_supply_title));
        SET existing_merchant_id = LAST_INSERT_ID();
    END IF;

    INSERT INTO characteristic (
        price_per_slot, 
        merchant_s_price, 
        initial_price, 
        sizes, 
        mass, 
        items_type_id
    ) VALUES (
        new_characteristic_price_per_slot, 
        new_characteristic_merchants_price, 
        new_characteristic_initial_price, 
        new_characteristic_sizes, 
        new_characteristic_mass, 
        existing_item_type_id
    );
    SET @new_characteristic_id = LAST_INSERT_ID();

    INSERT INTO items (title, characteristic_id) VALUES (new_item_title, @new_characteristic_id);
    SET @new_item_id = LAST_INSERT_ID();

    INSERT INTO supply_m (title) VALUES (new_supply_title)
    ON DUPLICATE KEY UPDATE title = new_supply_title;

    SET @new_supply_id = LAST_INSERT_ID();

    INSERT INTO merchant_s_price (
        merchant_s_price, 
        items_id,
        link_url
    ) VALUES (
        new_merchants_price, 
        @new_item_id, 
        new_link_url
    );
    SET @new_merchants_price_id = LAST_INSERT_ID();

    INSERT INTO demand_creates_supply (
        merchant_s_price_id, 
        merchant_s_id
    ) VALUES (
        @new_merchants_price_id, 
        existing_merchant_id
    );

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateMerchantPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateMerchantPrice`(
    IN new_merchants_price DECIMAL(10,2),
    IN items_id INT,
    IN new_link_url VARCHAR(255)
)
BEGIN
    DECLARE msp_id INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT id INTO msp_id
    FROM merchant_s_price
    WHERE items_id = items_id;

    -- Если запись существует, обновляем данные
    IF msp_id IS NOT NULL THEN
        UPDATE merchant_s_price
        SET merchant_s_price = new_merchants_price,
            link_url = new_link_url
        WHERE id = msp_id;
    ELSE
        INSERT INTO merchant_s_price (merchant_s_price, items_id, link_url)
        VALUES (new_merchants_price, items_id, new_link_url);
    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `items_information`
--

/*!50001 DROP VIEW IF EXISTS `items_information`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `items_information` AS select `items`.`id` AS `item_id`,`items`.`title` AS `item_title`,`characteristic`.`id` AS `characteristic_id`,`characteristic`.`price_per_slot` AS `price_per_slot`,`characteristic`.`merchant_s_price` AS `merchant_s_price`,`characteristic`.`initial_price` AS `initial_price`,`characteristic`.`sizes` AS `sizes`,`characteristic`.`mass` AS `mass`,`items_type`.`id` AS `item_type_id`,`items_type`.`type` AS `item_type`,`merchant_s_price`.`id` AS `merchant_price_id`,`merchant_s_price`.`merchant_s_price` AS `merchant_item_price`,`merchant_s_price`.`link_url` AS `link_url` from ((((`items` join `characteristic` on((`items`.`characteristic_id` = `characteristic`.`id`))) join `items_type` on((`characteristic`.`items_type_id` = `items_type`.`id`))) left join `merchant_s_price` on((`items`.`id` = `merchant_s_price`.`items_id`))) left join `merchant_s` on((`merchant_s_price`.`id` = `merchant_s`.`supply_m_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-19 19:23:33
