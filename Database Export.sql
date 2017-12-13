-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: tsuts.tskoli.is    Database: 2308992829_progresstracker_v1
-- ------------------------------------------------------
-- Server version	5.7.14-log

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `courseNumber` char(10) NOT NULL,
  `courseName` varchar(75) NOT NULL,
  `courseCredits` tinyint(4) DEFAULT '3',
  PRIMARY KEY (`courseNumber`),
  UNIQUE KEY `name_unique` (`courseName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('EÐL103','Eðlisfræði I',3),('EÐL203','Eðlisfræði II',3),('EÐL303','Eðlisfræði III',3),('EÐL403','Eðlisfræði IV',3),('FOR3D3U','3D leikjaforritun',3),('FOR3G3U','Inngangur að leikjaforritun',3),('FOR3L3U','Leikjaforritun',3),('GSF2A3U','Gagnasafnsfræði I',3),('GSF2B3U','Gagnasafnsfræði II',3),('GSF3A3U','Gagnanotkun',3),('GSF3B3U','Gagnagreining',3),('STÆ103','Inngangur að stærðfræði',3),('STÆ203','Algebra',3),('STÆ303','Rúmfræði',3),('STÆ313','Tölfræði',3),('STÆ403','Vektorar',3),('STÆ503','Diffrun og Heildun',3),('STÆ603','Stærðfræðigreining',3);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `divisions` (
  `divisionID` int(11) NOT NULL AUTO_INCREMENT,
  `divisionName` varchar(75) NOT NULL,
  `schoolID` int(11) NOT NULL,
  PRIMARY KEY (`divisionID`),
  KEY `division_school_FK` (`schoolID`),
  CONSTRAINT `division_school_FK` FOREIGN KEY (`schoolID`) REFERENCES `schools` (`schoolID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES (1,'Byggingatækniskólinn',1),(2,'Endurmenntunarskólinn',1),(3,'Flugskóli Íslands',1),(4,'Handverksskólinn',1),(5,'Margmiðlunarskólinn',1),(6,'Meistaraskólinn',1),(7,'Raftækniskólinn',1),(8,'Skipstjórnarskólinn',1),(9,'Tækniakademían',1),(10,'Tæknimenntaskólinn',1),(11,'Upplýsingatækniskólinn',1),(12,'Vefskólinn',1),(13,'Véltækniskólinn',1);
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restrictors`
--

DROP TABLE IF EXISTS `restrictors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restrictors` (
  `courseNumber` char(10) NOT NULL,
  `restrictorID` char(10) NOT NULL,
  `restrictorType` char(1) DEFAULT '1',
  PRIMARY KEY (`courseNumber`,`restrictorID`),
  CONSTRAINT `course_course_FK` FOREIGN KEY (`courseNumber`) REFERENCES `courses` (`courseNumber`),
  CONSTRAINT `restrictor_course_FK` FOREIGN KEY (`courseNumber`) REFERENCES `courses` (`courseNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restrictors`
--

LOCK TABLES `restrictors` WRITE;
/*!40000 ALTER TABLE `restrictors` DISABLE KEYS */;
INSERT INTO `restrictors` VALUES ('EÐL103','STÆ103','1'),('EÐL203','EÐL103','1'),('EÐL303','EÐL203','1'),('EÐL403','EÐL303','1'),('FOR3G3U','STÆ403','1'),('FOR3L3U','EÐL203','1'),('FOR3L3U','FOR3D3U','2'),('FOR3L3U','FOR3G3U','1'),('GSF2B3U','GSF2A3U','1'),('GSF3A3U','GSF2B3U','1'),('GSF3A3U','GSF3B3U','2'),('GSF3B3U','GSF3A3U','3'),('STÆ203','STÆ103','1'),('STÆ303','STÆ203','1'),('STÆ303','STÆ313','2'),('STÆ313','STÆ203','1'),('STÆ403','STÆ303','1'),('STÆ503','STÆ403','1'),('STÆ603','STÆ503','1');
/*!40000 ALTER TABLE `restrictors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schools` (
  `schoolID` int(11) NOT NULL AUTO_INCREMENT,
  `schoolName` varchar(75) DEFAULT NULL,
  `schoolInfo` json DEFAULT NULL,
  PRIMARY KEY (`schoolID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES (1,'Tækniskólinn','{\"Founded\": \"2008\", \"Símanúmer\": \"514-9000\", \"Staðsetning\": \"Skólavörðuholt, 101 Reykjavík\"}'),(2,'FSU','{\"Founded\": \"1981\", \"Símanúmer\": \"480-8100\", \"Staðsetning\": \"Tryggvagata 25, 800 Selfoss\"}'),(3,'Menntaskólinn í Reykjavík','{\"Founded\": \"1056\", \"Símanúmer\": \"545-1900\", \"Staðsetning\": \"Þingholtsstræti 12, 101 Reykjavík\"}'),(4,'Versló','{\"Founded\": \"1905\", \"Símanúmer\": \"545-1900\", \"Staðsetning\": \"Ofanleiti 1, 101 Reykjavík\"}'),(5,'Menntaskólinn í Kópavogi','{\"Founded\": \"1973\", \"Símanúmer\": \"594-4000\", \"Staðsetning\": \"Digranesvegur 51, 200 Kópavogur\"}');
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semesters`
--

DROP TABLE IF EXISTS `semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semesters` (
  `semesterID` int(11) NOT NULL AUTO_INCREMENT,
  `semesterName` char(10) NOT NULL,
  `semesterStarts` date NOT NULL,
  `semesterEnds` date NOT NULL,
  `academicYear` char(10) DEFAULT NULL,
  PRIMARY KEY (`semesterID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesters`
--

LOCK TABLES `semesters` WRITE;
/*!40000 ALTER TABLE `semesters` DISABLE KEYS */;
INSERT INTO `semesters` VALUES (1,'Haust2015','2015-08-01','2015-12-31','2015-2016'),(2,'Vor2016','2016-01-01','2016-05-31','2015-2016'),(3,'Haust2016','2016-08-01','2016-12-31','2016-2017'),(4,'Vor2017','2017-01-01','2017-05-31','2016-2017'),(5,'Haust2017','2017-08-01','2017-12-31','2017-2018'),(6,'Vor2018','2018-01-01','2018-05-31','2017-2018'),(7,'Haust2018','2018-08-01','2018-12-31','2018-2019'),(8,'Vor2019','2019-01-01','2019-05-31','2018-2019'),(9,'Haust2019','2019-08-01','2019-12-31','2019-2020'),(10,'Vor2020','2020-01-01','2020-05-31','2019-2020'),(11,'Haust2020','2020-08-01','2020-12-31','2020-2021'),(12,'Vor2021','2021-01-01','2021-05-31','2020-2021');
/*!40000 ALTER TABLE `semesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentcourses`
--

DROP TABLE IF EXISTS `studentcourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentcourses` (
  `studentID` int(11) NOT NULL,
  `courseNumber` char(10) NOT NULL,
  `mandatory` char(10) DEFAULT NULL,
  `Lokið` tinyint(1) NOT NULL,
  PRIMARY KEY (`studentID`,`courseNumber`),
  CONSTRAINT `studentcourses_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentcourses`
--

LOCK TABLES `studentcourses` WRITE;
/*!40000 ALTER TABLE `studentcourses` DISABLE KEYS */;
INSERT INTO `studentcourses` VALUES (1,'EÐL403','STÆ303',1),(1,'FOR3G3U','STÆ303',1),(1,'GSF3A3U','STÆ303',1),(1,'STÆ403','STÆ303',1),(2,'EÐL203','STÆ303',0),(2,'FOR3D3U','STÆ303',1),(2,'GSF2B3U','STÆ303',1),(3,'EÐL303','STÆ303',1),(3,'GSF2B3U','STÆ303',0),(4,'EÐL103','STÆ303',1);
/*!40000 ALTER TABLE `studentcourses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phoneNo` varchar(7) DEFAULT NULL,
  `schoolID` int(11) DEFAULT '1',
  `divisionID` int(11) DEFAULT NULL,
  `trackID` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Hilmar',18,'hillisnillig@gmail.com','8455622',1,11,9),(2,'James',18,'bla','8455622',1,11,9),(3,'Stella',18,'abc','8455622',1,11,9),(4,'Jenny',18,'qwerty','8455622',1,11,9);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackcourses`
--

DROP TABLE IF EXISTS `trackcourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackcourses` (
  `trackID` int(11) NOT NULL,
  `courseNumber` char(10) NOT NULL,
  `semester` tinyint(3) unsigned DEFAULT NULL,
  `mandatory` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`trackID`,`courseNumber`),
  KEY `track_course_courses_FK` (`courseNumber`),
  CONSTRAINT `track_course_courses_FK` FOREIGN KEY (`courseNumber`) REFERENCES `courses` (`courseNumber`),
  CONSTRAINT `track_course_tracks_FK` FOREIGN KEY (`trackID`) REFERENCES `tracks` (`trackID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackcourses`
--

LOCK TABLES `trackcourses` WRITE;
/*!40000 ALTER TABLE `trackcourses` DISABLE KEYS */;
INSERT INTO `trackcourses` VALUES (9,'EÐL203',1,1),(9,'FOR3G3U',3,1),(9,'GSF3A3U',2,1),(9,'STÆ503',1,1);
/*!40000 ALTER TABLE `trackcourses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracks` (
  `trackID` int(11) NOT NULL AUTO_INCREMENT,
  `trackName` varchar(75) DEFAULT NULL,
  `validFrom` date DEFAULT NULL,
  `divisionID` int(11) NOT NULL,
  PRIMARY KEY (`trackID`),
  KEY `track_division_FK` (`divisionID`),
  CONSTRAINT `track_division_FK` FOREIGN KEY (`divisionID`) REFERENCES `divisions` (`divisionID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks`
--

LOCK TABLES `tracks` WRITE;
/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
INSERT INTO `tracks` VALUES (1,'Almennt nám Upplýsingatækniskóla - AN UTN','2015-08-01',10),(2,'Bókband','2015-08-01',10),(3,'Grafísk miðlun','2015-08-01',10),(4,'Grunnnám upplýsinga- og fjölmiðlagreina','2015-08-01',10),(5,'K2 Tækni- og vísindaleiðin','2015-08-01',10),(6,'Ljósmyndun','2015-08-01',10),(7,'Prentun','2015-08-01',10),(8,'Stúdentspróf','2015-08-01',10),(9,'Tölvubraut TBR16 - stúdentsbraut','2016-08-01',10);
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database '2308992829_progresstracker_v1'
--
/*!50003 DROP FUNCTION IF EXISTS `NumberOfCourses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`2308992829`@`%` FUNCTION `NumberOfCourses`() RETURNS int(11)
begin
    declare Amount_of_Corses int;
    set Amount_of_Corses = (
    select count(*)
    from courses);
    return Amount_of_Corses;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TotalTrackCredits` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`2308992829`@`%` FUNCTION `TotalTrackCredits`(trackid int) RETURNS int(11)
begin
    declare total_credits int;
    set total_credits = (
    select sum(coursecredits) from courses
join trackcourses on trackcourses.courseNumber = courses.courseNumber
join tracks on trackcourses.trackID = tracks.trackID
where trackcourses.trackID = trackid);
return total_credits;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddMandatoryCourses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`2308992829`@`%` PROCEDURE `AddMandatoryCourses`(track_ID int,student_ID int)
begin
	DECLARE done INT DEFAULT FALSE;
    declare RestrictorsCourseNumber char(10);
    declare Restrictor_ID char(10);
    declare StudentcoursesCourseNumber char(10);
    declare studentID_ int;
    
	declare cur cursor for SELECT
    restrictors.courseNumber, restrictorID, studentcourses.courseNumber, studentcourses.studentID
	FROM
    restrictors
	join studentcourses
	on restrictors.courseNumber = studentcourses.courseNumber
	where studentID = student_ID;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    open cur;
    read_loop:LOOP
		fetch cur into RestrictorsCourseNumber,Restrictor_ID,StudentcoursesCourseNumber,studentID_;	
        IF done then
			leave read_loop;
		end IF;
        if(studentID_ = student_ID) then
		UPDATE studentcourses 
		SET 
			mandatory = Restrictor_ID;		
		end IF;
	end LOOP;
    close cur;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`2308992829`@`%` PROCEDURE `AddStudent`(
name varchar(40),
age int(11),
email varchar(30),
phoneNo varchar(7),
schoolID int(11),
divisionID int(11),
trackID int(11)
)
begin
insert into students(name,age,email,phoneNo,schoolID,divisionID,trackID)
Values(name,age,email,phoneNo,schoolID,divisionID,trackID);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Courselist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`2308992829`@`%` PROCEDURE `Courselist`()
begin
		select * from courses
		order by courseNumber;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteCourse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`2308992829`@`%` PROCEDURE `DeleteCourse`(course_number char(10))
begin
    Delete from courses
    where coursenumber = course_number;
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteStudents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`2308992829`@`%` PROCEDURE `DeleteStudents`(

studentname varchar(50)

)
begin
	
delete from students
   
 where name = studentname;
  
  end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ElectedCourses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`2308992829`@`%` PROCEDURE `ElectedCourses`(
student int(11)
)
begin
 
select studentID, studentcourses.courseNumber, students.name from courses
join studentcourses
on studentcourses.coursenumber = courses.courseNumber
join students
on studentcourses.studentid = students.student_id
where studentcourses.lokið = 0 and studentcourses.studentID = student
limit 5;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_schoolInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`2308992829`@`%` PROCEDURE `get_schoolInfo`(
school int
)
begin
select schoolName,schoolInfo from schools
where schoolID = school;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_studentJSON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`2308992829`@`%` PROCEDURE `get_studentJSON`(
student int
)
begin
select JSON_OBJECT('Name',name,'TrackID',students.trackid,"Semester",semesters.semesterName,"Course",courses.courseNumber) AS 'Student Info'from students
join trackcourses on trackcourses.trackID = students.trackID
join semesters on semesters.semesterID = trackcourses.semester
join courses on trackcourses.courseNumber = courses.courseNumber
where trackcourses.trackID = students.trackID and semesters.semesterID = trackcourses.semester and courses.courseNumber = trackcourses.courseNumber and semesters.semesterID = student;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NewCourse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`2308992829`@`%` PROCEDURE `NewCourse`(
in course_number char(10),
in course_name varchar(75),
in course_credits int,
OUT number_of_inserted_rows int)
begin    
    Insert into courses
    values(course_number,course_name,course_credits);
    set number_of_inserted_rows = row_count();
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `samtals_einingar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`2308992829`@`%` PROCEDURE `samtals_einingar`(
student int(11)
)
begin
select students.name, sum(courseCredits) from courses
join studentcourses
on studentcourses.courseNumber = courses.courseNumber
join students
on studentcourses.studentID = students.student_ID
where studentID = student and studentcourses.lokið = 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelectStudents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`2308992829`@`%` PROCEDURE `SelectStudents`(
studentname varchar(50)
)
begin
	
select * from students
   
 where name = studentname;
  
  end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SingleCourse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`2308992829`@`%` PROCEDURE `SingleCourse`(course char(10))
begin
		select * from Courses
		where coursenumber = course;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateCourse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`2308992829`@`%` PROCEDURE `UpdateCourse`(old_course_number char(10),course_number char(10),course_name varchar(75),course_credits int)
begin
    update courses
    set coursenumber = course_number,coursecredits = course_credits,coursename = course_name
    where old_course_number = coursenumber;
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateStudents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`2308992829`@`%` PROCEDURE `UpdateStudents`(

oldstudentname varchar(50),

studentname varchar(50)
)
begin
    
update students
    
set name = studentname
    
where oldstudentname = name;
    
end ;;
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

-- Dump completed on 2017-12-13 16:52:04
