-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: im
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `invoice` (
  `id` char(36) NOT NULL DEFAULT '1',
  `name` char(12) DEFAULT '仓库',
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `username` char(12) DEFAULT '张三',
  `from` char(16) DEFAULT '第一分公司',
  `text` tinytext,
  `no` int(11) DEFAULT '1',
  `number` decimal(6,0) DEFAULT '200',
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_id_uindex` (`id`),
  KEY `invoice_product_id_fk` (`no`),
  CONSTRAINT `invoice_product_id_fk` FOREIGN KEY (`no`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES ('03e48b4c-8df1-11ea-89d3-54ee75db0943','广州仓库','2020-05-04 10:21:28','123','第一分公司','这个人什么都没有留下···',1,200),('60453e11-8ddc-11ea-89d3-54ee75db0943','仓库','2020-05-04 07:53:43','张三','第一分公司','这个人什么都没有留下···',1,200),('62d39e7e-8ddc-11ea-89d3-54ee75db0943','仓库','2020-05-04 07:53:47','张三','第一分公司','这个人什么都没有留下···',1,200),('62d48e06-8ddc-11ea-89d3-54ee75db0943','仓库','2020-05-04 07:53:47','张三','第一分公司','这个人什么都没有留下···',1,200),('62d54a68-8ddc-11ea-89d3-54ee75db0943','仓库','2020-05-04 07:53:47','张三','第一分公司','这个人什么都没有留下···',1,200),('62d6a9db-8ddc-11ea-89d3-54ee75db0943','仓库','2020-05-04 07:53:47','张三','第一分公司','这个人什么都没有留下···',1,200),('62d834d8-8ddc-11ea-89d3-54ee75db0943','仓库','2020-05-04 07:53:47','张三','第一分公司','这个人什么都没有留下···',1,200),('62d9afa9-8ddc-11ea-89d3-54ee75db0943','仓库','2020-05-04 07:53:47','张三','第一分公司','这个人什么都没有留下···',1,200),('c5f38d0c-8de1-11ea-89d3-54ee75db0943','广州仓库','2020-05-04 08:32:21','123','第一分公司','这个人什么都没有留下···',1,200);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UUID_FOR_invoice` BEFORE INSERT ON `invoice` FOR EACH ROW SET NEW.id = (SELECT UUID()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TEXT_FOR_invoice` BEFORE INSERT ON `invoice` FOR EACH ROW BEGIN
    IF NEW.text is null or NEW.text='' then
        SET NEW.text = '这个人什么都没有留下···';
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AFTER_DELETE_invoice` AFTER DELETE ON `invoice` FOR EACH ROW BEGIN
        DELETE FROM invoice_product WHERE no = OLD.id;
    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `out_ware`
--

DROP TABLE IF EXISTS `out_ware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `out_ware` (
  `id` char(36) NOT NULL DEFAULT '1',
  `name` char(12) DEFAULT '仓库',
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `username` char(12) DEFAULT '张三',
  `out` char(16) DEFAULT '第一分公司',
  `text` tinytext,
  `no` int(11) DEFAULT '1',
  `number` decimal(5,0) DEFAULT '200',
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_id_uindex` (`id`),
  KEY `out_ware_product_id_fk` (`no`),
  CONSTRAINT `out_ware_product_id_fk` FOREIGN KEY (`no`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `out_ware`
--

LOCK TABLES `out_ware` WRITE;
/*!40000 ALTER TABLE `out_ware` DISABLE KEYS */;
INSERT INTO `out_ware` VALUES ('084cdc2a-8dc9-11ea-89d3-54ee75db0943','广州仓库','2020-05-04 05:35:15','张三','第一分公司','这个人什么都没有留下···',1,200),('3518aa9d-8df3-11ea-89d3-54ee75db0943','广州仓库','2020-05-04 10:37:09','123','第一分公司','这个人什么都没有留下···',1,200),('59541738-8dce-11ea-89d3-54ee75db0943','广州仓库','2020-05-04 06:13:18','张三','第一分公司','这个人什么都没有留下···',1,200),('737b03d6-8ddf-11ea-89d3-54ee75db0943','广州仓库','2020-05-04 08:15:44','123','第一分公司','这个人什么都没有留下···',1,200),('ad826afb-8ddf-11ea-89d3-54ee75db0943','广州仓库','2020-05-04 08:17:21','123','第一分公司','这个人什么都没有留下···',1,200),('af606b31-8db7-11ea-89d3-54ee75db0943','广州仓库','2020-05-04 03:31:04','wowo','第一分公司','这个人什么都没有留下',2,200),('ff244eda-8df0-11ea-89d3-54ee75db0943','广州仓库','2020-05-04 10:21:20','123','第一分公司','这个人什么都没有留下···',1,200);
/*!40000 ALTER TABLE `out_ware` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TEXT_FOR_out_ware` BEFORE INSERT ON `out_ware` FOR EACH ROW BEGIN
    IF NEW.text is null or NEW.text='' then
        SET NEW.text = '这个人什么都没有留下···';
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UUID_FOR_out_ware` BEFORE INSERT ON `out_ware` FOR EACH ROW SET NEW.id = (SELECT UUID()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` char(10) NOT NULL,
  `size` smallint(3) NOT NULL,
  `product_name` char(20) NOT NULL,
  `color` char(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_product_price_product_id_fk` (`product_id`),
  CONSTRAINT `product_product_price_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product_price` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'BR1703',175,'大衣','红色'),(2,'BR1704',170,'中款大衣','大红色'),(3,'BR1705',180,'大款大衣','大红色'),(4,'BR1703',165,'大款大衣','大红色'),(5,'BR1703',170,'大款大衣','大红色'),(6,'BR1703',175,'中款大衣','绿色'),(7,'BR1703',180,'中款大衣','黑色'),(8,'BR1704',175,'中款大衣','黑色'),(9,'BR1704',180,'大款大衣','白色'),(10,'BR1705',170,'大款大衣','红色'),(11,'BR1706',170,'大衣','白色'),(16,'BR1707',170,'带衣','黑色'),(18,'BR1709',170,'带衣','黑色'),(19,'BR1703',175,'大衣','白色'),(21,'BR1710',175,'大衣','白色'),(22,'BR1713',175,'大衣','白色'),(23,'BR1720',180,'大衣','黑色'),(26,'BR1721',170,'good','green'),(27,'BR1703',160,'大衣','黑色'),(28,'BR1717',165,'good','白色');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price`
--

DROP TABLE IF EXISTS `product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_price` (
  `product_id` char(10) NOT NULL,
  `ex_price` decimal(7,2) DEFAULT '100.00',
  `price` decimal(7,2) DEFAULT '100.00',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price`
--

LOCK TABLES `product_price` WRITE;
/*!40000 ALTER TABLE `product_price` DISABLE KEYS */;
INSERT INTO `product_price` VALUES ('BR1703',999.00,2999.00),('BR1704',999.00,2999.00),('BR1705',999.00,2999.00),('BR1706',999.00,2999.00),('BR1707',999.00,2999.00),('BR1708',999.00,2999.00),('BR1709',999.00,2999.00),('BR1710',999.00,2999.00),('BR1713',999.00,2999.00),('BR1717',999.00,2999.00),('BR1720',999.00,2999.00),('BR1721',999.00,2999.00);
/*!40000 ALTER TABLE `product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `product_view`
--

DROP TABLE IF EXISTS `product_view`;
/*!50001 DROP VIEW IF EXISTS `product_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `product_view` AS SELECT 
 1 AS `id`,
 1 AS `product_id`,
 1 AS `size`,
 1 AS `product_name`,
 1 AS `color`,
 1 AS `ex_price`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reserve`
--

DROP TABLE IF EXISTS `reserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reserve` (
  `id` char(36) NOT NULL,
  `name` char(16) DEFAULT '广州仓库',
  `no` int(11) DEFAULT '1',
  `number` decimal(6,0) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reserve_warehouse_name_fk` (`name`),
  KEY `reserve_product_id_fk` (`no`),
  CONSTRAINT `reserve_product_id_fk` FOREIGN KEY (`no`) REFERENCES `product` (`id`),
  CONSTRAINT `reserve_warehouse_name_fk` FOREIGN KEY (`name`) REFERENCES `warehouse` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve`
--

LOCK TABLES `reserve` WRITE;
/*!40000 ALTER TABLE `reserve` DISABLE KEYS */;
INSERT INTO `reserve` VALUES ('f05459eb-8de2-11ea-89d3-54ee75db0943','武汉仓库',1,200),('f05645be-8de2-11ea-89d3-54ee75db0943','广州仓库',3,0),('f0571907-8de2-11ea-89d3-54ee75db0943','广州仓库',4,0),('f058b86a-8de2-11ea-89d3-54ee75db0943','广州仓库',1,0),('f05995e5-8de2-11ea-89d3-54ee75db0943','广州仓库',1,0);
/*!40000 ALTER TABLE `reserve` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UUID_FOR_reserve` BEFORE INSERT ON `reserve` FOR EACH ROW SET NEW.id = (SELECT UUID()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `uid` char(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_uid_uindex` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'喔喔喔','wowo','123'),(4,'zxx','zxx','123'),(5,'qwq','qwq','123'),(6,'qaq','qaq','123'),(7,'tat','tat','123'),(8,'xax','xax','123'),(9,'zxc','zxc','123'),(10,'qwe','qwe','123'),(11,'asd','asd','123'),(12,'gsd','gsd','123'),(13,'opo','opo','123'),(14,'zmm','zmm','123'),(15,'lol','lol','123'),(16,'emm','emm','123'),(17,'zero','zero','admin'),(18,'guwenwei','guwenwei','123456'),(19,'zane1','zane123','123456'),(20,'yonghu','yonghu','123123'),(21,'123','123','123'),(22,'asdf','asdf','123123'),(23,'123123123','123123123','123123123'),(24,'12312','1231231231','123123'),(25,'1231','1231234','123123'),(31,'123','122113','123123'),(36,'123','12312321','qwe');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `warehouse` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` char(12) DEFAULT '1',
  `number` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `warehouse_name_uindex` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10009 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (10001,'高邮仓库',0),(10002,'武汉仓库',0),(10003,'广州仓库',400),(10004,'北京仓库',0),(10005,'杭州仓库',400),(10008,'苏州仓库',0);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `product_view`
--

/*!50001 DROP VIEW IF EXISTS `product_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_view` AS select `p`.`id` AS `id`,`p`.`product_id` AS `product_id`,`p`.`size` AS `size`,`p`.`product_name` AS `product_name`,`p`.`color` AS `color`,`pr`.`ex_price` AS `ex_price`,`pr`.`price` AS `price` from (`product` `p` join `product_price` `pr`) where (`p`.`product_id` = `pr`.`product_id`) order by `p`.`id` */;
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

-- Dump completed on 2020-05-05 11:31:03
