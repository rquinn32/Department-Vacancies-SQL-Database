-- MySQL dump 10.13  Distrib 8.0.43, for macos15 (x86_64)
--
-- Host: localhost    Database: Department_Vacancies 
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `candidate_details`
--

DROP TABLE IF EXISTS `candidate_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_details` (
  `candidate_id` int NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `telephone_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`candidate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_details`
--

LOCK TABLES `candidate_details` WRITE;
/*!40000 ALTER TABLE `candidate_details` DISABLE KEYS */;
INSERT INTO `candidate_details` VALUES (12345,'Ryan','Quinn','20 Beresford Rd','2017609329'),(32451,'John','Farrington','89 West Lake Dr','8456786689'),(33333,'Julia','Homan','23 Dale Ave','9732222828'),(45679,'Henry','Bishop','789 Forrest Ave','8458907765'),(45690,'Liam','Corriston','79 Harrington Ave','9898789908'),(48921,'Laura','Marie','20 Holden Rd','2018972428'),(54321,'Jack','Lee','32 Hamilton Ln','2018978909'),(56891,'Patrick','Shea','65 Allendale Ave','7898907789'),(67888,'Mary','Thompson','290 Holloway Ave','2019099999'),(89302,'Quentin','Richardson','98 Harlow Dr','8764569908');
/*!40000 ALTER TABLE `candidate_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_skill`
--

DROP TABLE IF EXISTS `candidate_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_skill` (
  `candidate_id` int NOT NULL,
  `skill_id` int NOT NULL,
  PRIMARY KEY (`candidate_id`,`skill_id`),
  KEY `skill_idx` (`skill_id`),
  CONSTRAINT `candidate identifier` FOREIGN KEY (`candidate_id`) REFERENCES `candidate_details` (`candidate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `skill` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_skill`
--

LOCK TABLES `candidate_skill` WRITE;
/*!40000 ALTER TABLE `candidate_skill` DISABLE KEYS */;
INSERT INTO `candidate_skill` VALUES (12345,329),(45679,329),(32451,400),(54321,400),(56891,432),(48921,435),(89302,435),(33333,507),(45690,602),(67888,892);
/*!40000 ALTER TABLE `candidate_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_details`
--

DROP TABLE IF EXISTS `department_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department_details` (
  `department_id` int NOT NULL,
  `department_name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `telephone_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_details`
--

LOCK TABLES `department_details` WRITE;
/*!40000 ALTER TABLE `department_details` DISABLE KEYS */;
INSERT INTO `department_details` VALUES (1234,'Safety','345 Harrold Place','2012409988'),(1267,'Event Planning','435 Harrold Place','2018277492'),(3456,'Sanitation','564 Harrold Place','2017892202'),(4123,'HR','21 Harrold Place','2019998821'),(5678,'Marketing','654 Harrold Place','2012409928'),(7786,'IT','22 Harrold Place','2019989999'),(7809,'Finance','356 Harrold Place','2019876666'),(7891,'Social Media','123 Harrold Place','2019928233'),(8888,'Operations','32 Harrold Place','2016789012'),(8890,'Accounting','456 Harrold Place','2012499999');
/*!40000 ALTER TABLE `department_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_details`
--

DROP TABLE IF EXISTS `interview_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interview_details` (
  `interview_id` int NOT NULL,
  `candidate_id` int DEFAULT NULL,
  `interview_date` varchar(45) DEFAULT NULL,
  `position_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `position_offered` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`interview_id`),
  KEY `candidate_idx` (`candidate_id`),
  KEY `position_idx` (`position_id`),
  KEY `department_idx` (`department_id`),
  CONSTRAINT `cand` FOREIGN KEY (`candidate_id`) REFERENCES `candidate_details` (`candidate_id`) ON DELETE CASCADE,
  CONSTRAINT `dep` FOREIGN KEY (`department_id`) REFERENCES `department_details` (`department_id`) ON DELETE RESTRICT,
  CONSTRAINT `posid` FOREIGN KEY (`position_id`) REFERENCES `position_details` (`position_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_details`
--

LOCK TABLES `interview_details` WRITE;
/*!40000 ALTER TABLE `interview_details` DISABLE KEYS */;
INSERT INTO `interview_details` VALUES (20,12345,'1/11/25',7,7809,'yes'),(21,12345,'3/11/25',9,8888,'yes'),(22,32451,'4/11/25',1,1234,'no'),(23,33333,'5/11/25',5,5678,'yes'),(24,45679,'6/11/25',8,7891,'yes'),(25,45690,'7/11/25',3,3456,'yes'),(26,48921,'10/11/25',10,8890,'yes'),(27,54321,'11/11/25',4,4123,'no'),(28,56891,'12/11/25',6,7786,'yes'),(29,89302,'14/11/25',2,1267,'yes');
/*!40000 ALTER TABLE `interview_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_details`
--

DROP TABLE IF EXISTS `position_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position_details` (
  `position_id` int NOT NULL,
  `department_id` int DEFAULT NULL,
  `position_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`position_id`),
  KEY `department_idx` (`department_id`),
  CONSTRAINT `department` FOREIGN KEY (`department_id`) REFERENCES `department_details` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_details`
--

LOCK TABLES `position_details` WRITE;
/*!40000 ALTER TABLE `position_details` DISABLE KEYS */;
INSERT INTO `position_details` VALUES (1,1234,'Safety Officer'),(2,1267,'Event Planner'),(3,3456,'Janitor'),(4,4123,'HR Officer'),(5,5678,'Marketing Intern'),(6,7786,'Tech'),(7,7809,'Senior Analyst'),(8,7891,'Media Coordinator'),(9,8888,'Project Manager'),(10,8890,'Accountant');
/*!40000 ALTER TABLE `position_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_skill`
--

DROP TABLE IF EXISTS `position_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position_skill` (
  `position_id` int NOT NULL,
  `skill_id` int NOT NULL,
  PRIMARY KEY (`position_id`,`skill_id`),
  KEY `skill_idx` (`skill_id`),
  CONSTRAINT `position` FOREIGN KEY (`position_id`) REFERENCES `position_details` (`position_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `skill identifier` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_skill`
--

LOCK TABLES `position_skill` WRITE;
/*!40000 ALTER TABLE `position_skill` DISABLE KEYS */;
INSERT INTO `position_skill` VALUES (1,329),(9,329),(4,400),(7,401),(6,432),(2,435),(10,435),(5,507),(3,602),(8,892);
/*!40000 ALTER TABLE `position_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `skill_id` int NOT NULL,
  `skill_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (305,'teamwork'),(329,'leadership'),(400,'problem solving'),(401,'public speaking'),(432,'mysql'),(435,'administrative'),(501,'python '),(507,'computer literacy'),(602,'hardworking'),(892,'creativity');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'quinn25275889'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_candidate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_candidate`(
	IN p_candidate_id INT,
    IN p_firstname VARCHAR(45),
    IN p_surname VARCHAR(45),
    IN p_address VARCHAR(45),
    IN p_telephone VARCHAR(45)
)
BEGIN
    INSERT INTO candidate_details (candidate_id, firstname, surname, address, telephone_number)
    VALUES (p_candidate_id, p_firstname, p_surname, p_address, p_telephone);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_candidateskill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_candidateskill`(
    IN p_candidate_id INT,
    IN p_skill_id INT)
BEGIN
    INSERT INTO candidate_skill (candidate_id, skill_id)
    VALUES (p_candidate_id, p_skill_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_dept` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_dept`(
    IN p_department_id INT,
    IN p_department_name VARCHAR(45),
    IN p_address VARCHAR(45),
    IN p_telephone_number VARCHAR(45)
)
BEGIN
    INSERT INTO department_details (department_id, department_name, address, telephone_number)
    VALUES (p_department_id, p_department_name, p_address, p_telephone_number);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_interview` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_interview`(
    IN p_interview_id INT,
    IN p_candidate_id INT,
    IN p_interview_date VARCHAR(45),
    IN p_position_id INT,
    IN p_department_id INT,
    IN p_position_offered VARCHAR(45)
)
BEGIN
    INSERT INTO interview_details (interview_id, candidate_id, interview_date, position_id, department_id, position_offered)
    VALUES (p_interview_id, p_candidate_id, p_interview_date, p_position_id, p_department_id, p_position_offered);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_position` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_position`(
    IN p_position_id INT,
    IN p_department_id INT,
    IN p_position_type VARCHAR(45)
)
BEGIN
    INSERT INTO position_details (position_id, department_id, position_type)
    VALUES (p_position_id, p_department_id, p_position_type);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_positionskill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_positionskill`(
    IN p_position_id INT,
    IN p_skill_id INT
)
BEGIN
    INSERT INTO position_skill (position_id, skill_id)
    VALUES (p_position_id, p_skill_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_skill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_skill`(
    IN p_skill_id INT,
    IN p_skill_name VARCHAR(45)
)
BEGIN
    INSERT INTO skill (skill_id, skill_name)
    VALUES (p_skill_id, p_skill_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q10_sorted_positions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q10_sorted_positions`()
BEGIN
SELECT position_details.position_id,
       position_details.position_type,
       department_details.department_name
FROM position_details, department_details
Where department_details.department_id = position_details.department_id
ORDER BY department_details.department_name, position_details.position_type;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q11_multiple_interviews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q11_multiple_interviews`()
BEGIN
SELECT candidate_details.candidate_id,
       candidate_details.firstname,
       candidate_details.surname,
       COUNT(interview_details.candidate_id)
FROM candidate_details, interview_details
Where candidate_details.candidate_id = interview_details.candidate_id
GROUP BY candidate_details.candidate_id, candidate_details.firstname, candidate_details.surname
HAVING COUNT(interview_details.candidate_id) > 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q1_Candidate_names` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q1_Candidate_names`(IN p_id varchar(45))
BEGIN
SELECT *
FROM candidate_details
where firstname=p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q2_Surname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q2_Surname`(IN p_id INT)
BEGIN
SELECT *
FROM candidate_details
where candidate_id=p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q3_Departments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q3_Departments`(IN p_id varchar(45))
BEGIN
SELECT *
FROM department_details
where department_name=p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q4_Candidate_skills` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q4_Candidate_skills`(IN p_id INT)
BEGIN
SELECT *
FROM candidate_details, candidate_skill, position_skill
Where position_id=p_id and candidate_details.candidate_id = candidate_skill.candidate_id and position_skill.skill_id = candidate_skill.skill_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q5_position_skill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q5_position_skill`(IN p_id INT)
BEGIN
SELECT *
FROM position_details, position_skill
Where skill_id=p_id and position_details.position_id = position_skill.position_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q6_Offers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q6_Offers`()
BEGIN
SELECT count(candidate_id)
FROM interview_details
Where position_offered = 'yes';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q7_Admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q7_Admin`()
BEGIN
SELECT count(position_id)
FROM position_skill, skill
Where skill_name = 'administrative' and position_skill.skill_id = skill.skill_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q8_Interview_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q8_Interview_date`(IN p_id varchar(45))
BEGIN
SELECT *
FROM interview_details
Where interview_date=p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q9_interviewdates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q9_interviewdates`()
BEGIN
SELECT interview_id, candidate_id, interview_date, position_id, department_id, position_offered
FROM interview_details
WHERE interview_date = @enter_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-14 14:42:45
