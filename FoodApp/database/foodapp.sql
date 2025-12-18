-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: foodapp
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menuId` int NOT NULL AUTO_INCREMENT,
  `restaurantId` int NOT NULL,
  `menuName` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `description` varchar(500) NOT NULL,
  `isAvailable` int NOT NULL DEFAULT '1',
  `imgPath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menuId`),
  KEY `fk_restaurantId_idx` (`restaurantId`),
  CONSTRAINT `fk1_restaurantId` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'Margherita Pizza',199,'Classic cheese pizza with fresh basil',1,'pizza.jpg'),(2,1,'Veg Burger',149,'Fresh vegetable patty with sauces',1,'veg burger.jpg'),(3,1,'French Fries',99,'Crispy golden fries',1,'french fries.jpg'),(4,2,'Chicken Biryani',299,'Aromatic Hyderabadi biryani',1,'chicken biryani.jpg'),(5,2,'Mutton Kebab',349,'Tender spicy kebabs',1,'mutton kabab.jpg'),(6,3,'Masala Dosa',120,'Crispy dosa with aloo masala',1,'masala dosa.jpg'),(7,3,'Idli Sambhar',80,'Soft idlis with hot sambhar',1,'idli sambar.jpg'),(8,4,'Butter Naan',100,'Butter Naan is a soft, fluffy Indian flatbread brushed with melted butter and cooked in a tandoor for a smoky aroma',1,'butter naan.jpg'),(9,4,'Paneer Butter Masala',150,'Paneer Butter Masala is a rich, creamy, and mildly spiced North Indian curry made with soft paneer simmered in a buttery tomato-based gravy.',1,'paneer butter masala.jpg'),(10,4,'Gobi Manchuri',120,'Gobi Manchurian is a crispy, flavorful Indo-Chinese dish made with fried cauliflower tossed in a spicy, tangy Manchurian sauce.',1,'gobi manchuri.jpg'),(11,4,'Ghee Rice',110,'Ghee Rice is a fragrant, mildly spiced South Indian rice dish cooked in rich ghee with aromatic whole spices.',1,'ghee rice.jpg'),(12,5,'Chicken Biryani',150,'Aromatic Hyderabadi biryani',1,'chicken biryani.jpg'),(13,5,'Mutton Kebab',200,'Tender spicy kebabs',1,'mutton kabab.jpg'),(14,5,'Chicken Ghee Roast',250,'Tender spicy chicken ghee roast',1,'chicken ghee roast.jpg'),(15,6,'Gobi Manchuri',120,'Gobi Manchurian is a crispy, flavorful Indo-Chinese dish made with fried cauliflower tossed in a spicy, tangy Manchurian sauce.',1,'gobi manchuri.jpg'),(16,6,'Paneer Butter Masala',130,'Paneer Butter Masala is a rich, creamy, and mildly spiced North Indian curry made with soft paneer simmered in a buttery tomato-based gravy.',1,'paneer butter masala.jpg'),(17,6,'Ghee Rice',145,'Ghee Rice is a fragrant, mildly spiced South Indian rice dish cooked in rich ghee with aromatic whole spices.',1,'ghee rice.jpg'),(18,7,'Margherita Pizza',100,'Classic cheese pizza with fresh basil',1,'pizza.jpg'),(19,7,'Veg Burger',90,'Fresh vegetable patty with sauces',1,'veg burger.jpg'),(20,7,'French Fries',110,'Crispy golden fries',1,'french fries.jpg');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderhistory`
--

DROP TABLE IF EXISTS `orderhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderhistory` (
  `orderhistoryId` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `userId` int NOT NULL,
  `restaurantId` int NOT NULL,
  `menuId` int NOT NULL,
  `restaurantName` varchar(100) NOT NULL,
  `menuName` varchar(100) NOT NULL,
  `orderDate` datetime NOT NULL,
  `totalAmount` float NOT NULL,
  `status` varchar(45) NOT NULL,
  `paymentMode` varchar(20) NOT NULL,
  PRIMARY KEY (`orderhistoryId`),
  KEY `fk_orderId_idx` (`orderId`),
  KEY `fk_restaurantId_idx` (`restaurantId`),
  KEY `fk_menuId_idx` (`menuId`),
  KEY `fk_userId` (`userId`),
  CONSTRAINT `fk1_orderId` FOREIGN KEY (`orderId`) REFERENCES `ordertable` (`orderId`),
  CONSTRAINT `fk2_restaurantId` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`),
  CONSTRAINT `fk3_menuId` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`),
  CONSTRAINT `fk4_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderhistory`
--

LOCK TABLES `orderhistory` WRITE;
/*!40000 ALTER TABLE `orderhistory` DISABLE KEYS */;
INSERT INTO `orderhistory` VALUES (2,13,1,1,1,'Sarief','Margherita Pizza','2025-12-05 02:50:01',199,'Completed','COD'),(3,14,1,1,1,'Sarief','Margherita Pizza','2025-12-05 02:55:00',398,'Completed','COD'),(4,15,1,1,1,'Sarief','Margherita Pizza','2025-12-05 02:59:18',597,'Completed','COD'),(5,16,1,2,5,'Sam','Mutton Kebab','2025-12-05 03:08:38',349,'Completed','COD'),(6,17,1,3,6,'Khana','Masala Dosa','2025-12-05 03:12:49',120,'Completed','COD'),(7,18,1,1,1,'Sarief','Margherita Pizza','2025-12-05 03:20:27',199,'Completed','COD'),(8,19,1,2,4,'Sam','Chicken Biryani','2025-12-05 03:20:36',299,'Completed','COD'),(9,20,1,3,6,'Khana','Masala Dosa','2025-12-05 03:20:52',840,'Completed','COD'),(10,21,1,1,1,'Sarief','Margherita Pizza','2025-12-05 03:56:42',398,'Completed','COD'),(11,22,1,1,1,'Sarief','Margherita Pizza','2025-12-05 03:57:47',199,'Completed','COD'),(12,23,1,1,1,'Sarief','Margherita Pizza','2025-12-05 03:58:43',199,'Completed','COD'),(13,24,1,2,4,'Sam','Chicken Biryani','2025-12-05 03:58:58',598,'Completed','COD'),(14,25,3,2,5,'Sam','Mutton Kebab','2025-12-05 04:00:15',349,'Completed','COD'),(15,26,1,3,7,'Khana','Idli Sambhar','2025-12-05 04:23:05',80,'Completed','COD'),(16,27,5,1,1,'Sarief','Margherita Pizza','2025-12-05 11:55:46',398,'Completed','COD'),(17,28,6,1,1,'Sarief','Margherita Pizza','2025-12-05 12:22:16',199,'Completed','COD'),(18,29,1,1,1,'Sarief','Margherita Pizza','2025-12-05 18:27:11',199,'Completed','COD'),(19,30,1,1,1,'Sarief','Margherita Pizza','2025-12-06 18:09:35',199,'Completed','COD'),(20,31,1,1,1,'Sarief','Margherita Pizza','2025-12-06 18:09:55',199,'Completed','COD'),(21,32,1,1,1,'Sarief','Margherita Pizza','2025-12-06 18:34:30',199,'Completed','COD'),(22,33,1,1,1,'Sarief','Margherita Pizza','2025-12-07 00:17:35',199,'Completed','COD'),(23,34,1,3,7,'Khana','Idli Sambhar','2025-12-08 11:09:44',80,'Completed','COD'),(24,35,1,3,7,'Khana','Idli Sambhar','2025-12-08 11:25:20',80,'Completed','COD'),(25,36,1,3,7,'Khana','Idli Sambhar','2025-12-08 11:54:45',80,'Completed','COD'),(26,37,1,3,7,'Khana','Idli Sambhar','2025-12-08 11:58:15',80,'Completed','COD'),(27,38,1,3,7,'Khana','Idli Sambhar','2025-12-08 11:59:07',160,'Completed','COD'),(28,39,1,3,7,'Khana','Idli Sambhar','2025-12-08 15:14:15',80,'Completed','COD'),(29,40,1,3,7,'Khana','Idli Sambhar','2025-12-09 00:46:11',80,'Completed','COD'),(30,41,1,3,7,'Khana','Idli Sambhar','2025-12-09 00:46:32',80,'Completed','COD'),(31,42,1,3,4,'Khana','Chicken Biryani','2025-12-10 16:44:25',299,'Completed','COD'),(32,42,1,3,7,'Khana','Idli Sambhar','2025-12-10 16:44:25',80,'Completed','COD'),(33,43,1,2,4,'Sam','Chicken Biryani','2025-12-10 17:20:47',598,'Completed','COD'),(34,43,1,2,5,'Sam','Mutton Kebab','2025-12-10 17:20:47',349,'Completed','COD'),(35,44,1,2,4,'Sam','Chicken Biryani','2025-12-10 17:40:27',299,'Completed','COD'),(36,45,1,3,7,'South India','Idli Sambhar','2025-12-10 18:59:51',80,'Completed','COD'),(37,46,1,1,1,'Chakde Cafe','Margherita Pizza','2025-12-11 12:57:30',199,'Completed','COD'),(38,46,1,1,2,'Chakde Cafe','Veg Burger','2025-12-11 12:57:30',149,'Completed','COD'),(39,47,1,3,7,'South India','Idli Sambhar','2025-12-11 13:34:02',80,'Completed','COD'),(40,48,1,2,5,'Sharif Bhai','Mutton Kebab','2025-12-11 13:37:54',349,'Completed','COD'),(41,49,1,7,19,'The Hungry Bowl','Veg Burger','2025-12-11 18:04:31',90,'Completed','COD'),(42,49,1,7,8,'The Hungry Bowl','Butter Naan','2025-12-11 18:04:31',100,'Completed','COD'),(43,50,1,6,16,'Urban Tadka','Paneer Butter Masala','2025-12-11 18:05:13',130,'Completed','COD'),(44,50,1,6,18,'Urban Tadka','Margherita Pizza','2025-12-11 18:05:13',100,'Completed','COD'),(45,50,1,6,5,'Urban Tadka','Mutton Kebab','2025-12-11 18:05:13',349,'Completed','COD'),(46,51,1,4,7,'North India','Idli Sambhar','2025-12-11 18:08:02',80,'Completed','COD'),(47,51,1,4,10,'North India','Gobi Manchuri','2025-12-11 18:08:02',120,'Completed','COD'),(48,52,1,3,4,'South India','Chicken Biryani','2025-12-11 18:18:17',299,'Completed','COD'),(49,52,1,3,7,'South India','Idli Sambhar','2025-12-11 18:18:17',80,'Completed','COD'),(50,53,1,3,4,'South India','Chicken Biryani','2025-12-11 18:18:49',299,'Completed','COD'),(51,53,1,3,7,'South India','Idli Sambhar','2025-12-11 18:18:49',80,'Completed','COD'),(52,54,1,4,4,'North India','Chicken Biryani','2025-12-11 18:42:29',598,'Completed','COD'),(53,54,1,4,10,'North India','Gobi Manchuri','2025-12-11 18:42:29',360,'Completed','COD'),(54,55,1,2,5,'Sharif Bhai','Mutton Kebab','2025-12-11 18:50:27',349,'Completed','COD'),(55,56,1,1,1,'Chakde Cafe','Margherita Pizza','2025-12-11 18:50:47',199,'Completed','COD'),(56,56,1,1,10,'Chakde Cafe','Gobi Manchuri','2025-12-11 18:50:47',120,'Completed','COD'),(57,57,1,4,7,'North India','Idli Sambhar','2025-12-11 18:57:46',160,'Completed','COD'),(58,57,1,4,10,'North India','Gobi Manchuri','2025-12-11 18:57:47',120,'Completed','COD'),(59,58,1,3,4,'South India','Chicken Biryani','2025-12-12 17:06:01',299,'Completed','COD'),(60,58,1,3,7,'South India','Idli Sambhar','2025-12-12 17:06:01',80,'Completed','COD'),(61,59,1,3,4,'South India','Chicken Biryani','2025-12-12 17:16:46',299,'Completed','COD'),(62,59,1,3,7,'South India','Idli Sambhar','2025-12-12 17:16:47',80,'Completed','COD'),(63,60,1,1,2,'Chakde Cafe','Veg Burger','2025-12-12 17:20:02',149,'Completed','COD'),(64,60,1,1,7,'Chakde Cafe','Idli Sambhar','2025-12-12 17:20:02',80,'Completed','COD'),(65,61,1,2,1,'null','Margherita Pizza','2025-12-12 18:32:29',199,'Completed','COD'),(66,61,1,2,4,'null','Chicken Biryani','2025-12-12 18:32:29',299,'Completed','COD'),(67,62,1,2,4,'null','Chicken Biryani','2025-12-12 18:33:24',299,'Completed','COD'),(68,63,1,2,1,'null','Margherita Pizza','2025-12-12 18:41:31',199,'Completed','COD'),(69,63,1,2,4,'null','Chicken Biryani','2025-12-12 18:41:31',299,'Completed','COD'),(70,64,1,1,1,'null','Margherita Pizza','2025-12-12 18:53:16',199,'Completed','COD'),(71,65,1,2,1,'null','Margherita Pizza','2025-12-12 19:01:40',199,'Completed','COD'),(72,65,1,2,4,'null','Chicken Biryani','2025-12-12 19:01:40',299,'Completed','COD'),(73,66,1,2,1,'null','Margherita Pizza','2025-12-12 19:07:40',199,'Completed','COD'),(74,66,1,2,4,'null','Chicken Biryani','2025-12-12 19:07:40',299,'Completed','COD'),(75,67,1,2,1,'null','Margherita Pizza','2025-12-12 19:24:59',199,'Completed','COD'),(76,67,1,2,4,'null','Chicken Biryani','2025-12-12 19:24:59',299,'Completed','COD'),(77,68,1,2,1,'null','Margherita Pizza','2025-12-12 19:33:57',199,'Completed','COD'),(78,68,1,2,4,'null','Chicken Biryani','2025-12-12 19:33:57',299,'Completed','COD'),(79,69,1,2,1,'null','Margherita Pizza','2025-12-12 19:36:21',199,'Completed','COD'),(80,69,1,2,4,'null','Chicken Biryani','2025-12-12 19:36:21',299,'Completed','COD'),(81,70,1,2,1,'null','Margherita Pizza','2025-12-12 19:39:17',199,'Completed','COD'),(82,70,1,2,4,'null','Chicken Biryani','2025-12-12 19:39:17',299,'Completed','COD'),(83,71,1,2,1,'Sharif Bhai','Margherita Pizza','2025-12-12 22:59:06',199,'Completed','COD'),(84,71,1,2,4,'Sharif Bhai','Chicken Biryani','2025-12-12 22:59:06',299,'Completed','COD'),(85,72,1,2,1,'Sharif Bhai','Margherita Pizza','2025-12-12 23:12:08',199,'Completed','COD'),(86,72,1,2,4,'Sharif Bhai','Chicken Biryani','2025-12-12 23:12:08',299,'Completed','COD'),(87,73,1,2,1,'Sharif Bhai','Margherita Pizza','2025-12-12 23:15:50',199,'Completed','COD'),(88,73,1,2,4,'Sharif Bhai','Chicken Biryani','2025-12-12 23:15:50',299,'Completed','COD'),(89,74,1,1,1,'Chakde Cafe','Margherita Pizza','2025-12-12 23:45:34',199,'Completed','COD'),(90,75,1,1,2,'Chakde Cafe','Veg Burger','2025-12-13 00:48:03',149,'Completed','COD'),(91,76,1,2,5,'Sharif Bhai','Mutton Kebab','2025-12-15 10:40:44',349,'Completed','COD'),(92,77,1,1,1,'Chakde Cafe','Margherita Pizza','2025-12-15 10:56:35',199,'Completed','COD'),(93,77,1,2,5,'Sharif Bhai','Mutton Kebab','2025-12-15 10:56:35',698,'Completed','COD'),(94,78,1,1,1,'Chakde Cafe','Margherita Pizza','2025-12-15 16:19:15',199,'Completed','Online'),(95,78,1,2,4,'Sharif Bhai','Chicken Biryani','2025-12-15 16:19:15',598,'Completed','Online'),(96,79,1,1,1,'Chakde Cafe','Margherita Pizza','2025-12-15 16:27:41',199,'Completed','COD'),(97,79,1,2,4,'Sharif Bhai','Chicken Biryani','2025-12-15 16:27:41',299,'Completed','COD'),(98,80,1,2,4,'Sharif Bhai','Chicken Biryani','2025-12-15 16:49:06',299,'Completed','Online'),(99,81,1,1,1,'Chakde Cafe','Margherita Pizza','2025-12-15 16:50:06',199,'Completed','Online'),(100,81,1,2,5,'Sharif Bhai','Mutton Kebab','2025-12-15 16:50:06',349,'Completed','Online'),(101,81,1,3,7,'South India','Idli Sambhar','2025-12-15 16:50:06',80,'Completed','Online'),(102,82,8,2,5,'Sharif Bhai','Mutton Kebab','2025-12-15 16:55:54',698,'Completed','COD'),(103,82,8,3,7,'South India','Idli Sambhar','2025-12-15 16:55:54',80,'Completed','COD'),(104,83,8,2,4,'Sharif Bhai','Chicken Biryani','2025-12-15 17:06:03',299,'Completed','COD'),(105,83,8,3,7,'South India','Idli Sambhar','2025-12-15 17:06:03',80,'Completed','COD'),(106,84,1,2,4,'Sharif Bhai','Chicken Biryani','2025-12-15 17:27:58',299,'Completed','COD');
/*!40000 ALTER TABLE `orderhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `orderItemId` int NOT NULL AUTO_INCREMENT,
  `menuId` int NOT NULL,
  `orderId` int NOT NULL,
  `quantity` int NOT NULL,
  `subTotal` float NOT NULL,
  `menuName` varchar(100) DEFAULT NULL,
  `restaurantId` int NOT NULL,
  `restaurantName` varchar(100) NOT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `fk_orderId_idx` (`orderId`),
  KEY `fk_menuId_idx` (`menuId`),
  KEY `fk_orderitem_menuName` (`menuName`),
  KEY `fk_rest` (`restaurantId`),
  CONSTRAINT `fk_menuId` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`),
  CONSTRAINT `fk_orderId` FOREIGN KEY (`orderId`) REFERENCES `ordertable` (`orderId`),
  CONSTRAINT `fk_rest` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (12,1,1,1,199,'Margherita Pizza',1,''),(13,1,2,2,398,'Margherita Pizza',1,''),(14,5,2,2,698,'Mutton Kebab',1,''),(15,1,3,1,199,'Margherita Pizza',1,''),(16,1,4,2,398,'Margherita Pizza',1,''),(17,1,5,1,199,'Margherita Pizza',3,''),(18,2,5,2,298,'Veg Burger',3,''),(19,7,5,2,160,'Idli Sambhar',3,''),(20,1,6,2,398,'Margherita Pizza',1,''),(21,1,7,1,199,'Margherita Pizza',1,''),(22,1,8,2,398,'Margherita Pizza',3,''),(23,6,8,1,120,'Masala Dosa',3,''),(24,7,8,3,240,'Idli Sambhar',3,''),(25,1,9,1,199,'Margherita Pizza',1,''),(26,1,10,1,199,'Margherita Pizza',1,''),(27,1,11,1,199,'Margherita Pizza',1,''),(28,1,12,1,199,'Margherita Pizza',1,''),(29,1,13,1,199,'Margherita Pizza',1,''),(30,1,14,2,398,'Margherita Pizza',1,''),(31,1,15,3,597,'Margherita Pizza',1,''),(32,5,16,1,349,'Mutton Kebab',2,''),(33,6,17,1,120,'Masala Dosa',3,''),(34,1,18,1,199,'Margherita Pizza',1,''),(35,4,19,1,299,'Chicken Biryani',2,''),(36,6,20,7,840,'Masala Dosa',3,''),(37,1,21,2,398,'Margherita Pizza',1,''),(38,1,22,1,199,'Margherita Pizza',1,''),(39,1,23,1,199,'Margherita Pizza',1,''),(40,4,24,2,598,'Chicken Biryani',2,''),(41,5,25,1,349,'Mutton Kebab',2,''),(42,7,26,1,80,'Idli Sambhar',3,''),(43,1,27,2,398,'Margherita Pizza',1,''),(44,1,28,1,199,'Margherita Pizza',1,''),(45,1,29,1,199,'Margherita Pizza',1,''),(46,1,30,1,199,'Margherita Pizza',1,''),(47,1,31,1,199,'Margherita Pizza',1,''),(48,1,32,1,199,'Margherita Pizza',1,''),(49,1,33,1,199,'Margherita Pizza',1,''),(50,7,34,1,80,'Idli Sambhar',3,''),(51,7,35,1,80,'Idli Sambhar',3,''),(52,7,36,1,80,'Idli Sambhar',3,''),(53,7,37,1,80,'Idli Sambhar',3,''),(54,7,38,2,160,'Idli Sambhar',3,''),(55,7,39,1,80,'Idli Sambhar',3,''),(56,7,40,1,80,'Idli Sambhar',3,''),(57,7,41,1,80,'Idli Sambhar',3,''),(58,4,42,1,299,'Chicken Biryani',3,''),(59,7,42,1,80,'Idli Sambhar',3,''),(60,4,43,2,598,'Chicken Biryani',2,''),(61,5,43,1,349,'Mutton Kebab',2,''),(62,4,44,1,299,'Chicken Biryani',2,''),(63,7,45,1,80,'Idli Sambhar',3,''),(64,1,46,1,199,'Margherita Pizza',1,''),(65,2,46,1,149,'Veg Burger',1,''),(66,7,47,1,80,'Idli Sambhar',3,''),(67,5,48,1,349,'Mutton Kebab',2,''),(68,19,49,1,90,'Veg Burger',7,''),(69,8,49,1,100,'Butter Naan',7,''),(70,16,50,1,130,'Paneer Butter Masala',6,''),(71,18,50,1,100,'Margherita Pizza',6,''),(72,5,50,1,349,'Mutton Kebab',6,''),(73,7,51,1,80,'Idli Sambhar',4,''),(74,10,51,1,120,'Gobi Manchuri',4,''),(75,4,52,1,299,'Chicken Biryani',3,''),(76,7,52,1,80,'Idli Sambhar',3,''),(77,4,53,1,299,'Chicken Biryani',3,''),(78,7,53,1,80,'Idli Sambhar',3,''),(79,5,55,1,349,'Mutton Kebab',2,''),(80,1,56,1,199,'Margherita Pizza',1,''),(81,10,56,1,120,'Gobi Manchuri',1,''),(82,7,57,2,160,'Idli Sambhar',4,''),(83,10,57,1,120,'Gobi Manchuri',4,''),(84,4,58,1,299,'Chicken Biryani',3,''),(85,7,58,1,80,'Idli Sambhar',3,''),(86,4,59,1,299,'Chicken Biryani',3,''),(87,7,59,1,80,'Idli Sambhar',3,''),(88,2,60,1,149,'Veg Burger',1,''),(89,7,60,1,80,'Idli Sambhar',1,''),(90,1,61,1,199,'Margherita Pizza',2,''),(91,4,61,1,299,'Chicken Biryani',2,''),(92,4,62,1,299,'Chicken Biryani',2,''),(93,1,63,1,199,'Margherita Pizza',2,''),(94,4,63,1,299,'Chicken Biryani',2,''),(95,1,64,1,199,'Margherita Pizza',1,''),(96,1,65,1,199,'Margherita Pizza',2,''),(97,4,65,1,299,'Chicken Biryani',2,''),(98,1,66,1,199,'Margherita Pizza',2,'null'),(99,4,66,1,299,'Chicken Biryani',2,'null'),(100,1,67,1,199,'Margherita Pizza',2,'null'),(101,4,67,1,299,'Chicken Biryani',2,'null'),(102,1,68,1,199,'Margherita Pizza',2,'null'),(103,4,68,1,299,'Chicken Biryani',2,'null'),(104,1,69,1,199,'Margherita Pizza',2,'null'),(105,4,69,1,299,'Chicken Biryani',2,'null'),(106,1,70,1,199,'Margherita Pizza',2,'null'),(107,4,70,1,299,'Chicken Biryani',2,'null'),(108,1,71,1,199,'Margherita Pizza',2,'Sharif Bhai'),(109,4,71,1,299,'Chicken Biryani',2,'Sharif Bhai'),(110,1,72,1,199,'Margherita Pizza',2,'Sharif Bhai'),(111,4,72,1,299,'Chicken Biryani',2,'Sharif Bhai'),(112,1,73,1,199,'Margherita Pizza',2,'Sharif Bhai'),(113,4,73,1,299,'Chicken Biryani',2,'Sharif Bhai'),(114,1,74,1,199,'Margherita Pizza',1,'Chakde Cafe'),(115,2,75,1,149,'Veg Burger',1,'Chakde Cafe'),(116,5,76,1,349,'Mutton Kebab',2,'Sharif Bhai'),(117,1,77,1,199,'Margherita Pizza',1,'Chakde Cafe'),(118,5,77,2,698,'Mutton Kebab',2,'Sharif Bhai'),(119,1,78,1,199,'Margherita Pizza',1,'Chakde Cafe'),(120,4,78,2,598,'Chicken Biryani',2,'Sharif Bhai'),(121,1,79,1,199,'Margherita Pizza',1,'Chakde Cafe'),(122,4,79,1,299,'Chicken Biryani',2,'Sharif Bhai'),(123,4,80,1,299,'Chicken Biryani',2,'Sharif Bhai'),(124,1,81,1,199,'Margherita Pizza',1,'Chakde Cafe'),(125,5,81,1,349,'Mutton Kebab',2,'Sharif Bhai'),(126,7,81,1,80,'Idli Sambhar',3,'South India'),(127,5,82,2,698,'Mutton Kebab',2,'Sharif Bhai'),(128,7,82,1,80,'Idli Sambhar',3,'South India'),(129,4,83,1,299,'Chicken Biryani',2,'Sharif Bhai'),(130,7,83,1,80,'Idli Sambhar',3,'South India'),(131,4,84,1,299,'Chicken Biryani',2,'Sharif Bhai');
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordertable`
--

DROP TABLE IF EXISTS `ordertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordertable` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `restaurantId` int NOT NULL,
  `userId` int NOT NULL,
  `orderDate` datetime NOT NULL,
  `totalAmount` double NOT NULL,
  `status` varchar(50) NOT NULL,
  `paymentMode` varchar(50) NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `fk_restaurantId_idx` (`restaurantId`),
  KEY `fk_userId_idx` (`userId`),
  CONSTRAINT `fk_restaurantId` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`),
  CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordertable`
--

LOCK TABLES `ordertable` WRITE;
/*!40000 ALTER TABLE `ordertable` DISABLE KEYS */;
INSERT INTO `ordertable` VALUES (1,1,1,'2025-11-30 19:21:30',199,'Pending','COD'),(2,2,1,'2025-11-30 19:32:30',1096,'Pending','COD'),(3,1,1,'2025-11-30 20:29:54',199,'Pending','COD'),(4,1,1,'2025-12-03 00:22:27',398,'Pending','COD'),(5,3,1,'2025-12-03 00:27:47',657,'Pending','COD'),(6,1,1,'2025-12-03 10:13:38',398,'Pending','COD'),(7,1,1,'2025-12-03 11:04:34',199,'Pending','COD'),(8,3,1,'2025-12-03 11:12:50',758,'Pending','COD'),(9,1,1,'2025-12-03 12:02:18',199,'Pending','COD'),(10,1,1,'2025-12-03 12:04:27',199,'Pending','COD'),(11,1,1,'2025-12-04 10:49:41',199,'Pending','COD'),(12,1,1,'2025-12-05 02:27:02',199,'Pending','COD'),(13,1,1,'2025-12-05 02:50:01',199,'Pending','COD'),(14,1,1,'2025-12-05 02:55:00',398,'Pending','COD'),(15,1,1,'2025-12-05 02:59:18',597,'Pending','COD'),(16,2,1,'2025-12-05 03:08:38',349,'Pending','COD'),(17,3,1,'2025-12-05 03:12:49',120,'Pending','COD'),(18,1,1,'2025-12-05 03:20:27',199,'Pending','COD'),(19,2,1,'2025-12-05 03:20:36',299,'Pending','COD'),(20,3,1,'2025-12-05 03:20:52',840,'Pending','COD'),(21,1,1,'2025-12-05 03:56:42',398,'Pending','COD'),(22,1,1,'2025-12-05 03:57:47',199,'Pending','COD'),(23,1,1,'2025-12-05 03:58:43',199,'Pending','COD'),(24,2,1,'2025-12-05 03:58:58',598,'Pending','COD'),(25,2,3,'2025-12-05 04:00:15',349,'Pending','COD'),(26,3,1,'2025-12-05 04:23:04',80,'Pending','COD'),(27,1,5,'2025-12-05 11:55:46',398,'Pending','COD'),(28,1,6,'2025-12-05 12:22:16',199,'Pending','COD'),(29,1,1,'2025-12-05 18:27:11',199,'Pending','COD'),(30,1,1,'2025-12-06 18:09:35',199,'Pending','COD'),(31,1,1,'2025-12-06 18:09:55',199,'Pending','COD'),(32,1,1,'2025-12-06 18:34:30',199,'Pending','COD'),(33,1,1,'2025-12-07 00:17:35',199,'Pending','COD'),(34,3,1,'2025-12-08 11:09:44',80,'Pending','COD'),(35,3,1,'2025-12-08 11:25:20',80,'Pending','COD'),(36,3,1,'2025-12-08 11:54:45',80,'Pending','COD'),(37,3,1,'2025-12-08 11:58:15',80,'Pending','COD'),(38,3,1,'2025-12-08 11:59:07',160,'Pending','COD'),(39,3,1,'2025-12-08 15:14:15',80,'Pending','COD'),(40,3,1,'2025-12-09 00:46:11',80,'Pending','COD'),(41,3,1,'2025-12-09 00:46:32',80,'Pending','COD'),(42,3,1,'2025-12-10 16:44:25',379,'Pending','COD'),(43,2,1,'2025-12-10 17:20:47',947,'Pending','COD'),(44,2,1,'2025-12-10 17:40:27',299,'Pending','COD'),(45,3,1,'2025-12-10 18:59:51',80,'Pending','COD'),(46,1,1,'2025-12-11 12:57:30',348,'Pending','COD'),(47,3,1,'2025-12-11 13:34:02',80,'Pending','COD'),(48,2,1,'2025-12-11 13:37:54',349,'Pending','COD'),(49,7,1,'2025-12-11 18:04:31',190,'Pending','COD'),(50,6,1,'2025-12-11 18:05:13',579,'Pending','COD'),(51,4,1,'2025-12-11 18:08:02',200,'Pending','COD'),(52,3,1,'2025-12-11 18:18:17',379,'Pending','COD'),(53,3,1,'2025-12-11 18:18:48',379,'Pending','COD'),(54,4,1,'2025-12-11 18:42:29',958,'Pending','COD'),(55,2,1,'2025-12-11 18:50:27',349,'Pending','COD'),(56,1,1,'2025-12-11 18:50:47',319,'Pending','COD'),(57,4,1,'2025-12-11 18:57:46',280,'Pending','COD'),(58,3,1,'2025-12-12 17:06:01',379,'Pending','COD'),(59,3,1,'2025-12-12 17:16:46',379,'Pending','COD'),(60,1,1,'2025-12-12 17:20:02',229,'Pending','COD'),(61,2,1,'2025-12-12 18:32:29',498,'Pending','COD'),(62,2,1,'2025-12-12 18:33:24',299,'Pending','COD'),(63,2,1,'2025-12-12 18:41:31',498,'Pending','COD'),(64,1,1,'2025-12-12 18:53:16',199,'Pending','COD'),(65,2,1,'2025-12-12 19:01:40',498,'Pending','COD'),(66,2,1,'2025-12-12 19:07:40',498,'Pending','COD'),(67,2,1,'2025-12-12 19:24:59',498,'Pending','COD'),(68,2,1,'2025-12-12 19:33:57',498,'Pending','COD'),(69,2,1,'2025-12-12 19:36:21',498,'Pending','COD'),(70,2,1,'2025-12-12 19:39:17',498,'Pending','COD'),(71,2,1,'2025-12-12 22:59:06',498,'Pending','COD'),(72,2,1,'2025-12-12 23:12:08',498,'Pending','COD'),(73,2,1,'2025-12-12 23:15:50',498,'Pending','COD'),(74,1,1,'2025-12-12 23:45:34',199,'Pending','COD'),(75,1,1,'2025-12-13 00:48:03',149,'Pending','COD'),(76,2,1,'2025-12-15 10:40:44',349,'Pending','COD'),(77,1,1,'2025-12-15 10:56:35',897,'Pending','COD'),(78,1,1,'2025-12-15 16:19:15',797,'Pending','Online'),(79,1,1,'2025-12-15 16:27:41',498,'Pending','COD'),(80,2,1,'2025-12-15 16:49:06',299,'Pending','Online'),(81,1,1,'2025-12-15 16:50:06',628,'Pending','Online'),(82,2,8,'2025-12-15 16:55:53',778,'Pending','COD'),(83,2,8,'2025-12-15 17:06:03',379,'Pending','COD'),(84,2,1,'2025-12-15 17:27:58',299,'Pending','COD');
/*!40000 ALTER TABLE `ordertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurantId` int NOT NULL AUTO_INCREMENT,
  `restaurantName` varchar(45) NOT NULL,
  `deliveryTime` varchar(50) NOT NULL DEFAULT '30 ''min''',
  `cuisineType` varchar(45) NOT NULL DEFAULT 'Indian',
  `address` varchar(45) NOT NULL,
  `rating` float NOT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `imagePath` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`restaurantId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Chakde Cafe','30 \'min\'','Indian','HSR Layout',9,1,'chakde cafe.jpg'),(2,'Sharif Bhai','30 \'min\'','Indian','Indiranagar',8.5,1,'sharief bhai.jpg'),(3,'South India','30 \'min\'','Indian','Whitefield',7,1,'south indian.jpg'),(4,'North India','30 \'min\'','Indian','Electronic City',6.5,1,'north india.jpg'),(5,'Spice villa','30 \'min\'','Indian','Vidyanagar',9,1,'spice villa.jpg'),(6,'Urban Tadka','30 \'min\'','Indian','BTM Layout',8,1,'urban tadka.jpg'),(7,'The Hungry Bowl','30 \'min\'','Indian','Koramangla',9.5,1,'hungry bowl.jpg'),(8,'Aroma Express','30 \'min\'','Indian','Jayanagar',8.5,1,'aroma express.jpg'),(9,'Food Factory','30 \'min\'','Indian','Hebbal',9,1,'food factory.jpg'),(10,'Royal Biryani House','30 \'min\'','Indian','Malleshwaram',8.5,1,'royal biriyani.jpg'),(11,'Curry Corner','30 \'min\'','Indian','Yelahanka',7.5,1,'curry corner.jpg'),(12,'Fresh Feast','30 \'min\'','Indian','Rajajinagar',9,1,'fresh feast.jpg');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phonenumber` varchar(45) NOT NULL,
  `password` int NOT NULL,
  `address` varchar(45) NOT NULL,
  `createdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastlogin` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'siddu','siddu@gmail.com','93535390',1234,'nittuvalli','2025-11-04 10:42:07','2025-11-04 10:42:07'),(2,'sam','sam@gmail.com','12345678',12345,'mang','2025-11-05 11:27:01','2025-11-05 11:27:01'),(3,'raju','raju@gmail.com','123456789',1234,'KTJ','2025-11-17 14:11:56','2025-11-17 14:11:56'),(4,'rake','rake@gmail.com','123456789',12345,'SHJ','2025-11-17 14:40:19','2025-11-17 14:40:19'),(5,'siddarth_chakarasalli','siddarthsiddu739@gmail.com','9353539017',1234,'Ninchana School Road Nittuvalli','2025-12-05 11:54:06','2025-12-05 11:54:06'),(6,'sidd','nuthanpatel26@gmail.com','935353901',1234,'Nittuvalli, 7th Main Road','2025-12-05 12:21:29','2025-12-05 12:21:29'),(7,'Ram','Ram@gmail.com','9353539011',1234,'Ninchana School Road Nittuvalli','2025-12-11 11:00:33','2025-12-11 11:00:33'),(8,'sham','sham@gmail.com','9353539011',1234,'Ninchana School Road Nittuvalli','2025-12-15 16:54:46','2025-12-15 16:54:46');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-18  0:15:32
