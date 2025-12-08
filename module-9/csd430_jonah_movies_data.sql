-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: csd430
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `jonah_movies_data`
--

DROP TABLE IF EXISTS `jonah_movies_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jonah_movies_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `director` varchar(100) DEFAULT NULL,
  `release_year` int DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `rating` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jonah_movies_data`
--

LOCK TABLES `jonah_movies_data` WRITE;
/*!40000 ALTER TABLE `jonah_movies_data` DISABLE KEYS */;
INSERT INTO `jonah_movies_data` VALUES (1,'Batman','Tim Burton',1989,'Superhero','PG-13'),(2,'Batman Begins','Christopher Nolan',2005,'Superhero','PG-13'),(3,'The Dark Knight','Christopher Nolan',2008,'Superhero','PG-13'),(4,'That Thing You Do','Tom Hanks',1996,'Comedy/Drama','PG'),(5,'Breach','Billy Ray',2007,'Thriller','PG-13'),(6,'The Shawshank Redemption','Frank Darabont',1994,'Thriller/Drama','R'),(7,'Catch Me If You Can','Steven Spielberg',2002,'Crime/Comedy','PG-13'),(8,'Pulp Fiction','Quentin Tarantino',1994,'Crime','R'),(9,'Forrest Gump','Robert Zemeckis',1994,'Drama','PG-13'),(10,'Hook','Steven Speilberg',1991,'Adventure','PG');
/*!40000 ALTER TABLE `jonah_movies_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-13 18:19:55
