-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: eventsystem
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `eventlocations`
--

DROP TABLE IF EXISTS `eventlocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventlocations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `locationame` varchar(200) NOT NULL,
  `capacity` int NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventlocations`
--

LOCK TABLES `eventlocations` WRITE;
/*!40000 ALTER TABLE `eventlocations` DISABLE KEYS */;
INSERT INTO `eventlocations` VALUES (1,'Концертный зал \"Звезда\"',500,'Москва, ул. Ленина, д. 10','+74951234567'),(2,'Дворец спорта',2000,'Санкт-Петербург, пр. Невский, д. 20','+78121234567'),(3,'Клуб \"Творчество\"',150,'Екатеринбург, ул. Карла Либкнехта, д. 5','+73431234567'),(4,'Конференц-центр \"Гармония\"',250,'Казань, ул. Баумана, д. 15','+78431234567'),(5,'Открытая площадка \"Летний сад\"',1000,'Новосибирск, ул. Красный проспект, д. 30','+73831234567'),(6,' Большой Зал Концертного Комплекса',500,' ул. Ленина, 10, г. Москва','71234567890');
/*!40000 ALTER TABLE `eventlocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventss`
--

DROP TABLE IF EXISTS `eventss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventss` (
  `id` int NOT NULL AUTO_INCREMENT,
  `eventname` varchar(35) NOT NULL,
  `eventdate` date NOT NULL,
  `descriptionn` text NOT NULL,
  `location_id` int NOT NULL,
  `eventtype_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `eventtype_id` (`eventtype_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `eventss_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `eventlocations` (`id`),
  CONSTRAINT `eventss_ibfk_2` FOREIGN KEY (`eventtype_id`) REFERENCES `eventtypes` (`id`),
  CONSTRAINT `eventss_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventss`
--

LOCK TABLES `eventss` WRITE;
/*!40000 ALTER TABLE `eventss` DISABLE KEYS */;
INSERT INTO `eventss` VALUES (1,'Концерт группы \"Звезды ночи\"','2024-10-17','Захватывающее выступление популярной группы \"Звезды ночи\" с новыми хитами и любимыми песнями.',1,1,1),(2,'Мастер-класс по живописи','2024-12-07','Научитесь создавать потрясающие картины акрилом под руководством опытного художника.',3,6,1),(3,'Выставка современных художников','2024-10-27','Представляем работы молодых и талантливых современных художников. Вход свободный.',5,3,4),(4,'Семинар по управлению проектами','2025-01-17','Узнайте секреты успешного управления проектами от ведущих специалистов.',3,4,4),(5,'Семинар о истории искусств','2024-10-25','Увлекательная лекция об истории искусств, от древности до современности.',4,4,1),(8,'Гендер-пати','2024-10-25','Праздник в связи с объявлением пола будущего ребёнка.',5,2,8);
/*!40000 ALTER TABLE `eventss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventtypes`
--

DROP TABLE IF EXISTS `eventtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE eventtypes (
  id INT NOT NULL AUTO_INCREMENT,
  event_name VARCHAR(35) NOT NULL,
  description TEXT,
  PRIMARY KEY (id),
  INDEX idx_event_name (event_name)
);
ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventtypes`
--

LOCK TABLES `eventtypes` WRITE;
/*!40000 ALTER TABLE `eventtypes` DISABLE KEYS */;
INSERT INTO `eventtypes` VALUES (1,'Концерт'),(2,'Спектакль'),(3,'Выставка'),(4,'Семинар'),(5,'Конференция'),(6,'Мастер-класс'),(8,'Вебинар'),(9,'Стендап');
/*!40000 ALTER TABLE `eventtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performances`
--

DROP TABLE IF EXISTS `performances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performances` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic` varchar(35) NOT NULL,
  `descriptionn` text NOT NULL,
  `duration` int NOT NULL,
  `rating_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rating_id` (`rating_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `performances_ibfk_1` FOREIGN KEY (`rating_id`) REFERENCES `ratings` (`id`),
  CONSTRAINT `performances_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performances`
--

LOCK TABLES `performances` WRITE;
/*!40000 ALTER TABLE `performances` DISABLE KEYS */;
INSERT INTO `performances` VALUES (1,'Современные методы разработки','Обзор актуальных технологий и фреймворков для создания высокопроизводительных и масштабируемых веб-приложений.',60,4,2),(2,'Искусственный интеллект','Анализ текущего состояния и перспектив развития искусственного интеллекта, а также обсуждение этических вопросов.',90,5,2),(3,'Эффективное управление персоналом','Практические советы и рекомендации по эффективному управлению персоналом в современных условиях.',45,6,5),(4,'Основы финансовой грамотности','Вводный курс по финансовой грамотности: планирование бюджета, инвестиции, основы кредитования.',30,4,5);
/*!40000 ALTER TABLE `performances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ratingname` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,'0+'),(2,'3+'),(3,'6+'),(4,'12+'),(5,'16+'),(6,'18+');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speakerevents`
--

DROP TABLE IF EXISTS `speakerevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `speakerevents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `performance_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `performance_id` (`performance_id`),
  CONSTRAINT `speakerevents_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `eventss` (`id`),
  CONSTRAINT `speakerevents_ibfk_2` FOREIGN KEY (`performance_id`) REFERENCES `performances` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speakerevents`
--

LOCK TABLES `speakerevents` WRITE;
/*!40000 ALTER TABLE `speakerevents` DISABLE KEYS */;
INSERT INTO `speakerevents` VALUES (1,2,2),(2,1,2),(3,1,4),(4,5,4),(7,8,3);
/*!40000 ALTER TABLE `speakerevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lname` varchar(35) NOT NULL,
  `fname` varchar(35) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `login` varchar(32) NOT NULL,
  `phash` varchar(255) NOT NULL,
  `psalt` varchar(32) NOT NULL,
  `urole` enum('Организатор','Спикер','Администратор') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Иванов','Алексей','+79161234567','ivanov_ivan','Q3l9Tz9eJbH4JE40kd7RvbbET6+FPBiLUL2WMm7IlmA=','Sz5Il67XdAwmbBA61DSMGQ==','Организатор'),(2,'Петрова','Анна','+79051234567','petrova_anna','tMHzrt0nZWOnAs3wOW+qvsCpCZolu7OAKJ32iHBLImg=','tvbUXIUCm4m6DTvE7A8XbA==','Спикер'),(3,'Ноздрюхина','София','+79998887654','nozdryuhinas@mail.ru','W2pqe2xYCdVDqYXRm3blP0Fij4burYAHWzplXvTpEYw=','DBUUNXe5adkFThs5Ua/RUw==','Администратор'),(4,'Никитин','Сергей','+79671234567','nikitin_sergey','kKk24V+0QHgzVnsJS70uC43cRwYYqI771yHcerXx5sY=','0obtolGbflB2x7EQEVDCKg==','Организатор'),(5,'Лебедева','Марина','+79781234567','lebedjeva_maria','KlPRdmVTk6ctJMsIkSrwj/LQNFUfGMFUBknb/arzKjE=','QpZYwkGOq1n1MUKsl4qg0A==','Спикер'),(8,'Иванов','Иван','+71234567899','ivan_34','mB/4fdCFMI/XuVdKfKIgD0AjiKe+NuiRVXPOquRKFGo=','4cVDc0u/AD0Il19OWvlD3A==','Организатор');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-03 14:28:20
