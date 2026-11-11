-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: crownfieldeyehospital
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `AppointmentID` int NOT NULL AUTO_INCREMENT,
  `PatientID` int DEFAULT NULL,
  `DoctorID` int DEFAULT NULL,
  `AppointmentDate` date DEFAULT NULL,
  `AppointmentTime` time DEFAULT NULL,
  `Status` varchar(30) DEFAULT NULL,
  `ClinicID` int NOT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `PatientID` (`PatientID`),
  KEY `DoctorID` (`DoctorID`),
  KEY `fk_appointment_clinic` (`ClinicID`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`),
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`),
  CONSTRAINT `fk_appointment_clinic` FOREIGN KEY (`ClinicID`) REFERENCES `clinics` (`ClinicID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,1,1,'2026-10-05','09:00:00','Completed',1),(2,2,2,'2026-10-05','09:30:00','Completed',1),(3,1,1,'2026-11-16','10:15:00','Scheduled',2),(4,3,1,'2026-10-06','11:00:00','Completed',1),(5,4,3,'2026-10-07','14:00:00','Completed',3),(6,5,4,'2026-11-02','09:00:00','Scheduled',1),(7,6,5,'2026-11-02','09:30:00','Scheduled',2),(8,7,6,'2026-11-03','10:00:00','Scheduled',3),(9,8,7,'2026-11-03','10:30:00','Scheduled',1),(10,9,8,'2026-11-04','11:00:00','Scheduled',2),(11,10,9,'2026-11-04','11:30:00','Scheduled',3),(12,11,10,'2026-11-05','12:00:00','Scheduled',1),(13,12,11,'2026-11-05','12:30:00','Scheduled',2),(14,13,12,'2026-11-06','13:00:00','Scheduled',3),(15,14,13,'2026-11-06','13:30:00','Scheduled',1);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinics`
--

DROP TABLE IF EXISTS `clinics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinics` (
  `ClinicID` int NOT NULL AUTO_INCREMENT,
  `ClinicName` varchar(100) NOT NULL,
  PRIMARY KEY (`ClinicID`),
  UNIQUE KEY `ClinicName` (`ClinicName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinics`
--

LOCK TABLES `clinics` WRITE;
/*!40000 ALTER TABLE `clinics` DISABLE KEYS */;
INSERT INTO `clinics` VALUES (2,'Bedford'),(8,'Central Eye Clinic'),(1,'City Road'),(3,'Croydon'),(7,'East London Eye Clinic'),(10,'Green Park Eye Clinic'),(5,'North London Eye Clinic'),(9,'Riverside Eye Clinic'),(6,'South London Eye Clinic'),(4,'West London Eye Clinic');
/*!40000 ALTER TABLE `clinics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnoses`
--

DROP TABLE IF EXISTS `diagnoses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnoses` (
  `DiagnosisID` int NOT NULL AUTO_INCREMENT,
  `AppointmentID` int NOT NULL,
  `DiagnosisName` varchar(150) NOT NULL,
  PRIMARY KEY (`DiagnosisID`),
  KEY `AppointmentID` (`AppointmentID`),
  CONSTRAINT `diagnoses_ibfk_1` FOREIGN KEY (`AppointmentID`) REFERENCES `appointments` (`AppointmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnoses`
--

LOCK TABLES `diagnoses` WRITE;
/*!40000 ALTER TABLE `diagnoses` DISABLE KEYS */;
INSERT INTO `diagnoses` VALUES (1,1,'Ocular hypertension'),(2,2,'Diabetic macular oedema'),(3,3,'Ocular hypertension'),(4,4,'Glaucoma suspect'),(5,5,'Keratoconus'),(6,6,'Glaucoma suspect'),(7,7,'Dry eye syndrome'),(8,8,'Cataract'),(9,9,'Diabetic retinopathy'),(10,10,'Ocular hypertension'),(11,11,'Macular degeneration'),(12,12,'Conjunctivitis'),(13,13,'Keratoconus'),(14,14,'Retinal disorder'),(15,15,'Corneal inflammation');
/*!40000 ALTER TABLE `diagnoses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `DoctorID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Specialisation` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DoctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Maya','Shah','Glaucoma',NULL,NULL),(2,'Leo','Grant','Retina',NULL,NULL),(3,'Priya','Nair','Cornea',NULL,NULL),(4,'Sarah','Johnson','Glaucoma',NULL,NULL),(5,'David','Williams','Retina',NULL,NULL),(6,'Emily','Brown','Cornea',NULL,NULL),(7,'James','Taylor','Cataract',NULL,NULL),(8,'Olivia','Wilson','Paediatric Ophthalmology',NULL,NULL),(9,'Daniel','Harris','Glaucoma',NULL,NULL),(10,'Sophia','Clark','Retina',NULL,NULL),(11,'Thomas','Lewis','Cornea',NULL,NULL),(12,'Grace','Walker','Cataract',NULL,NULL),(13,'Oliver','Hall','Glaucoma',NULL,NULL);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followupplans`
--

DROP TABLE IF EXISTS `followupplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followupplans` (
  `FollowUpID` int NOT NULL AUTO_INCREMENT,
  `AppointmentID` int NOT NULL,
  `DueDate` date NOT NULL,
  `Priority` varchar(20) NOT NULL,
  `Status` varchar(30) NOT NULL DEFAULT 'Pending',
  `Notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FollowUpID`),
  KEY `AppointmentID` (`AppointmentID`),
  CONSTRAINT `followupplans_ibfk_1` FOREIGN KEY (`AppointmentID`) REFERENCES `appointments` (`AppointmentID`),
  CONSTRAINT `followupplans_chk_1` CHECK ((`Priority` in (_utf8mb4'Low',_utf8mb4'Routine',_utf8mb4'High',_utf8mb4'Urgent'))),
  CONSTRAINT `followupplans_chk_2` CHECK ((`Status` in (_utf8mb4'Pending',_utf8mb4'Completed',_utf8mb4'Cancelled')))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followupplans`
--

LOCK TABLES `followupplans` WRITE;
/*!40000 ALTER TABLE `followupplans` DISABLE KEYS */;
INSERT INTO `followupplans` VALUES (1,1,'2026-11-16','High','Pending','Review IOP'),(2,2,'2026-11-02','Urgent','Pending','OCT before review'),(3,3,'2027-02-08','Routine','Pending','Visual field test'),(4,4,'2027-04-06','Routine','Pending','Monitor'),(5,5,'2026-12-02','Routine','Pending','Corneal topography'),(6,6,'2026-12-01','Routine','Pending','Eye pressure review'),(7,7,'2026-12-05','High','Pending','Retina examination'),(8,8,'2026-12-10','Routine','Pending','Vision test'),(9,9,'2026-12-15','Urgent','Pending','Specialist consultation'),(10,10,'2026-12-20','Routine','Pending','Follow-up eye examination');
/*!40000 ALTER TABLE `followupplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicines` (
  `MedicineID` int NOT NULL AUTO_INCREMENT,
  `MedicineName` varchar(100) NOT NULL,
  PRIMARY KEY (`MedicineID`),
  UNIQUE KEY `MedicineName` (`MedicineName`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines`
--

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;
INSERT INTO `medicines` VALUES (12,'Acetazolamide'),(3,'Aflibercept'),(5,'Artificial tears'),(13,'Bimatoprost'),(6,'Brimonidine'),(9,'Cyclopentolate'),(7,'Dorzolamide'),(1,'Latanoprost'),(11,'Moxifloxacin eye drops'),(14,'Olopatadine'),(10,'Prednisolone eye drops'),(4,'Sodium chloride drops'),(2,'Timolol'),(8,'Travoprost');
/*!40000 ALTER TABLE `medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `PatientID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PatientCode` varchar(10) DEFAULT NULL,
  `Postcode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`PatientID`),
  UNIQUE KEY `PatientCode` (`PatientCode`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Amina','Yusuf',NULL,NULL,NULL,NULL,'OP001','NE1 4AB'),(2,'Daniel','Reed',NULL,NULL,NULL,NULL,'OP002','N16 7QP'),(3,'Sofia','Bennett',NULL,NULL,NULL,NULL,'OP003','E8 2LD'),(4,'Michael','Okoro',NULL,NULL,NULL,NULL,'OP004','SE6 3RT'),(5,'Emma','Wilson',NULL,NULL,NULL,NULL,'OP005','W12 8AB'),(6,'James','Taylor',NULL,NULL,NULL,NULL,'OP006','E15 2CD'),(7,'Olivia','Brown',NULL,NULL,NULL,NULL,'OP007','SW6 3EF'),(8,'Noah','Martin',NULL,NULL,NULL,NULL,'OP008','NW10 4GH'),(9,'Isabella','Clark',NULL,NULL,NULL,NULL,'OP009','SE1 5JK'),(10,'Liam','Harris',NULL,NULL,NULL,NULL,'OP010','N7 6LM'),(11,'Ava','Lewis',NULL,NULL,NULL,NULL,'OP011','W5 7NP'),(12,'George','Walker',NULL,NULL,NULL,NULL,'OP012','E3 8QR'),(13,'Mia','Hall',NULL,NULL,NULL,NULL,'OP013','SW11 9ST'),(14,'Henry','Young',NULL,NULL,NULL,NULL,'OP014','NW3 2UV'),(15,'Alex','Morgan',NULL,NULL,NULL,NULL,'OP015','W12 9ZZ');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptionitems`
--

DROP TABLE IF EXISTS `prescriptionitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptionitems` (
  `PrescriptionItemID` int NOT NULL AUTO_INCREMENT,
  `PrescriptionID` int NOT NULL,
  `MedicineID` int NOT NULL,
  `Dosage` varchar(50) NOT NULL,
  `Route` varchar(50) NOT NULL,
  `Frequency` varchar(50) NOT NULL,
  `Duration` varchar(50) NOT NULL,
  PRIMARY KEY (`PrescriptionItemID`),
  KEY `PrescriptionID` (`PrescriptionID`),
  KEY `MedicineID` (`MedicineID`),
  CONSTRAINT `prescriptionitems_ibfk_1` FOREIGN KEY (`PrescriptionID`) REFERENCES `prescriptions` (`PrescriptionID`),
  CONSTRAINT `prescriptionitems_ibfk_2` FOREIGN KEY (`MedicineID`) REFERENCES `medicines` (`MedicineID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptionitems`
--

LOCK TABLES `prescriptionitems` WRITE;
/*!40000 ALTER TABLE `prescriptionitems` DISABLE KEYS */;
INSERT INTO `prescriptionitems` VALUES (1,1,1,'Demo dose A','Eye drops','Demo frequency A','Demo duration A'),(2,1,2,'Demo dose B','Eye drops','Demo frequency B','Demo duration B'),(3,2,3,'Demo dose C','Injection','Demo frequency C','Demo duration C'),(4,3,1,'Demo dose D','Eye drops','Demo frequency D','Demo duration D'),(5,4,4,'Demo dose E','Eye drops','Demo frequency E','Demo duration E'),(6,5,5,'1 drop','Eye drops','Twice daily','14 days'),(7,6,6,'1 drop','Eye drops','Twice daily','30 days'),(8,7,7,'1 drop','Eye drops','Three times daily','14 days'),(9,8,8,'1 drop','Eye drops','Once daily','30 days'),(10,9,9,'1 drop','Eye drops','Once daily','7 days'),(11,10,10,'1 drop','Eye drops','Four times daily','7 days'),(12,11,11,'1 drop','Eye drops','Three times daily','7 days'),(13,12,12,'250 mg','Oral','Twice daily','5 days'),(14,13,13,'1 drop','Eye drops','Once daily','30 days'),(15,14,14,'1 drop','Eye drops','Twice daily','14 days');
/*!40000 ALTER TABLE `prescriptionitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `PrescriptionID` int NOT NULL AUTO_INCREMENT,
  `AppointmentID` int NOT NULL,
  `PrescriptionDate` date NOT NULL,
  PRIMARY KEY (`PrescriptionID`),
  KEY `AppointmentID` (`AppointmentID`),
  CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`AppointmentID`) REFERENCES `appointments` (`AppointmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (1,1,'2026-10-05'),(2,2,'2026-10-05'),(3,3,'2026-11-16'),(4,5,'2026-10-07'),(5,6,'2026-11-02'),(6,7,'2026-11-02'),(7,8,'2026-11-03'),(8,9,'2026-11-03'),(9,10,'2026-11-04'),(10,11,'2026-11-04'),(11,12,'2026-11-05'),(12,13,'2026-11-05'),(13,14,'2026-11-06'),(14,15,'2026-11-06');
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-31 21:05:52
