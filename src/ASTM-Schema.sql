-- MariaDB dump 10.19  Distrib 10.5.9-MariaDB, for osx10.14 (x86_64)
--
-- Host: localhost    Database: ASTM
-- ------------------------------------------------------
-- Server version	10.5.9-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Action_Code`
--

DROP TABLE IF EXISTS `Action_Code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Action_Code` (
  `id` varchar(1) NOT NULL,
  `Descripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Comment_Orden`
--

DROP TABLE IF EXISTS `Comment_Orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment_Orden` (
  `Comment_ID` varchar(33) NOT NULL,
  `Orden_ID` varchar(33) DEFAULT NULL,
  `Reference_Table` varchar(15) DEFAULT NULL,
  `Sequence` varchar(10) DEFAULT NULL,
  `Comment_Source` varchar(1) DEFAULT NULL,
  `Text` varchar(100) DEFAULT NULL,
  `Comment_Type` varchar(1) DEFAULT NULL,
  `Status` varchar(3) DEFAULT NULL,
  `Checksum` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`Comment_ID`),
  KEY `Comment-Source` (`Comment_Source`),
  KEY `Comment-Type` (`Comment_Type`),
  KEY `Comment-Orden` (`Orden_ID`),
  CONSTRAINT `Comment_Orden` FOREIGN KEY (`Orden_ID`) REFERENCES `Orden` (`Orden_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Comment_Patient`
--

DROP TABLE IF EXISTS `Comment_Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment_Patient` (
  `Comment_ID` varchar(33) NOT NULL,
  `Patient_ID` varchar(33) DEFAULT NULL,
  `Reference_Table` varchar(15) DEFAULT NULL,
  `Sequence` varchar(10) DEFAULT NULL,
  `Comment_Source` varchar(1) DEFAULT NULL,
  `Text` varchar(100) DEFAULT NULL,
  `Comment_Type` varchar(1) DEFAULT NULL,
  `Status` varchar(3) DEFAULT NULL,
  `Checksum` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`Comment_ID`),
  KEY `Comment-Source` (`Comment_Source`),
  KEY `Comment-Type` (`Comment_Type`),
  KEY `Comment-Orden` (`Patient_ID`),
  CONSTRAINT `Comment_Patient` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient` (`Patient_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Comment_Result`
--

DROP TABLE IF EXISTS `Comment_Result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment_Result` (
  `Comment_ID` varchar(33) NOT NULL,
  `Result_ID` varchar(33) DEFAULT NULL,
  `Reference_Table` varchar(15) DEFAULT NULL,
  `Sequence` varchar(10) DEFAULT NULL,
  `Comment_Source` varchar(1) DEFAULT NULL,
  `Text` varchar(100) DEFAULT NULL,
  `Comment_Type` varchar(1) DEFAULT NULL,
  `Status` varchar(3) DEFAULT NULL,
  `Checksum` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`Comment_ID`),
  KEY `Comment-Source` (`Comment_Source`),
  KEY `Comment-Type` (`Comment_Type`),
  KEY `Comment-Orden` (`Result_ID`),
  CONSTRAINT `Comment_Result` FOREIGN KEY (`Result_ID`) REFERENCES `Result` (`Result_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Comment_Source`
--

DROP TABLE IF EXISTS `Comment_Source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment_Source` (
  `id` varchar(1) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Comment_Type`
--

DROP TABLE IF EXISTS `Comment_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment_Type` (
  `id` varchar(1) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Header`
--

DROP TABLE IF EXISTS `Header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Header` (
  `Header_ID` varchar(33) NOT NULL,
  `Access_Password` varchar(50) DEFAULT NULL,
  `Sender_Name` varchar(50) DEFAULT NULL,
  `Sender_Address` varchar(50) DEFAULT NULL,
  `Reserved` varchar(50) DEFAULT NULL,
  `Sender_Telephone` varchar(20) DEFAULT NULL,
  `Characteristics_Of_Sender` varchar(50) DEFAULT NULL,
  `Receiver_ID` varchar(33) DEFAULT NULL,
  `Comments` varchar(50) DEFAULT NULL,
  `Processing_ID` varchar(33) DEFAULT NULL,
  `ASTM_Version` varchar(50) DEFAULT NULL,
  `Date_and_Time` varchar(14) DEFAULT NULL,
  `Status` varchar(3) DEFAULT NULL,
  `Checksum` varchar(2) DEFAULT NULL,
  `NumPac` int(11) DEFAULT 0,
  PRIMARY KEY (`Header_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Message_Terminator`
--

DROP TABLE IF EXISTS `Message_Terminator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Message_Terminator` (
  `id` varchar(1) NOT NULL,
  `Descripcion` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Nature_of_Abnormality_Testing`
--

DROP TABLE IF EXISTS `Nature_of_Abnormality_Testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nature_of_Abnormality_Testing` (
  `id` varchar(1) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Orden`
--

DROP TABLE IF EXISTS `Orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orden` (
  `Orden_ID` varchar(33) NOT NULL,
  `Patient_ID` varchar(33) DEFAULT NULL,
  `Sequence` varchar(10) DEFAULT NULL,
  `Sample_ID` varchar(22) DEFAULT NULL,
  `Instrument_Specimen_ID` varchar(1) DEFAULT NULL,
  `Universal_Test_ID` varchar(15) DEFAULT NULL,
  `Priority` varchar(1) DEFAULT NULL,
  `Requested_Ordered_Date_and_Time` varchar(20) DEFAULT NULL,
  `Specimen_Collection_Date_and_Time` varchar(20) DEFAULT NULL,
  `Collection_End_Time` varchar(20) DEFAULT NULL,
  `Collection_Volume` varchar(50) DEFAULT NULL,
  `Collector_ID` varchar(50) DEFAULT NULL,
  `Action_Code` varchar(1) DEFAULT NULL,
  `Danger_Code` varchar(50) DEFAULT NULL,
  `Relevant_Clinical_Informations` varchar(50) DEFAULT NULL,
  `Date_Time_Specimen_Received` varchar(20) DEFAULT NULL,
  `Specimen_Descriptor` varchar(20) DEFAULT NULL,
  `Ordering_Physician` varchar(50) DEFAULT NULL,
  `Physician_Tel_Nb` varchar(20) DEFAULT NULL,
  `User_Field_1` varchar(50) DEFAULT NULL,
  `User_Field_2` varchar(50) DEFAULT NULL,
  `Laboratory_Field_1` varchar(50) DEFAULT NULL,
  `Laboratory_Field_2` varchar(50) DEFAULT NULL,
  `Date_and_Time_Results_reported_or_last_modified` varchar(20) DEFAULT NULL,
  `Instrument_Charge_to_Computer_System` varchar(50) DEFAULT NULL,
  `Instrument_Section_ID` varchar(50) DEFAULT NULL,
  `Report_Types` varchar(1) DEFAULT NULL,
  `Reserved` varchar(50) DEFAULT NULL,
  `Location_or_Ward_of_Specimen_Collection` varchar(10) DEFAULT NULL,
  `Nosocomial_Infection_Flag` varchar(50) DEFAULT NULL,
  `Specimen_Service` varchar(50) DEFAULT NULL,
  `Specimen_institution` varchar(50) DEFAULT NULL,
  `Status` varchar(3) DEFAULT NULL,
  `Checksum` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`Orden_ID`),
  KEY `FK_Order` (`Patient_ID`),
  KEY `Order-Action_code` (`Action_Code`),
  KEY `Order-Report_Types` (`Report_Types`),
  CONSTRAINT `FK_Order` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient` (`Patient_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patient` (
  `Patient_ID` varchar(33) NOT NULL,
  `Header_ID` varchar(33) DEFAULT NULL,
  `Sequence` varchar(10) DEFAULT NULL,
  `Practice_Assigned_Patient_ID` varchar(20) DEFAULT NULL,
  `Laboratory_Assigned_Patient_ID` varchar(50) DEFAULT NULL,
  `Patient_ID_No_3` varchar(50) DEFAULT NULL,
  `Patient_Name_Name_First_name` varchar(52) DEFAULT NULL,
  `Mothers_Maiden_Name` varchar(50) DEFAULT NULL,
  `Birthdate` varchar(8) DEFAULT NULL,
  `Patient_Sex` varchar(1) DEFAULT NULL,
  `Patient_Race_thnic_Origin` varchar(20) DEFAULT NULL,
  `Patient_Address` varchar(50) DEFAULT NULL,
  `Reserved` varchar(50) DEFAULT NULL,
  `Patient_Telephone_Nb` varchar(20) DEFAULT NULL,
  `Attending_Physician_ID` varchar(20) DEFAULT NULL,
  `Special_Field_1` varchar(20) DEFAULT NULL,
  `Special_Field_2` varchar(20) DEFAULT NULL,
  `Patient_Height` varchar(5) DEFAULT NULL,
  `Patient_Weight` varchar(5) DEFAULT NULL,
  `Patients_Known_or_Suspected_Diagnosis` varchar(20) DEFAULT NULL,
  `Patient_Active_Medication` varchar(20) DEFAULT NULL,
  `Patients_Diet` varchar(20) DEFAULT NULL,
  `Practice_Field_1` varchar(50) DEFAULT NULL,
  `Practice_Field_2` varchar(50) DEFAULT NULL,
  `Admission_and_Discharge_Dates` varchar(50) DEFAULT NULL,
  `Admission_Status` varchar(50) DEFAULT NULL,
  `Location` varchar(20) DEFAULT NULL,
  `Nature_of_Alternative_Diagnostic_Code_and_Classifiers_1` varchar(50) DEFAULT NULL,
  `Nature_of_Alternative_Diagnostic_Code_and_Classifiers_2` varchar(50) DEFAULT NULL,
  `Patient_Religion` varchar(50) DEFAULT NULL,
  `Martial_status` varchar(50) DEFAULT NULL,
  `Isolation_Status` varchar(50) DEFAULT NULL,
  `Language` varchar(50) DEFAULT NULL,
  `Hospital_Service` varchar(50) DEFAULT NULL,
  `Hopital_Institution` varchar(50) DEFAULT NULL,
  `Dosage_Category` varchar(50) DEFAULT NULL,
  `Status` varchar(3) DEFAULT NULL,
  `Checksum` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`Patient_ID`),
  KEY `Patient-Sex` (`Patient_Sex`),
  KEY `Header-Patient` (`Header_ID`),
  CONSTRAINT `Header-Patient` FOREIGN KEY (`Header_ID`) REFERENCES `Header` (`Header_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Patient_Sex`
--

DROP TABLE IF EXISTS `Patient_Sex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patient_Sex` (
  `id` varchar(1) NOT NULL,
  `Decripcion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Priority`
--

DROP TABLE IF EXISTS `Priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Priority` (
  `id` varchar(1) NOT NULL,
  `Descripcion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Report_Types`
--

DROP TABLE IF EXISTS `Report_Types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Report_Types` (
  `id` varchar(1) NOT NULL,
  `Descripcion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Result`
--

DROP TABLE IF EXISTS `Result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Result` (
  `Result_ID` varchar(33) NOT NULL,
  `Orden_ID` varchar(33) DEFAULT NULL,
  `Sequence` varchar(10) DEFAULT NULL,
  `Universal_Test_ID` varchar(15) DEFAULT NULL,
  `Data_or_Measurement_value` varchar(20) DEFAULT NULL,
  `Unit` varchar(50) DEFAULT NULL,
  `Reference_Range` varchar(50) DEFAULT NULL,
  `Result_Abnormal_Flag` varchar(2) DEFAULT NULL,
  `Nature_of_Abnormality_Testing` varchar(50) DEFAULT NULL,
  `Result_Status` varchar(1) DEFAULT NULL,
  `Date_of_Change_in_Normative_Values_or_Units` varchar(20) DEFAULT NULL,
  `Operator_Identification` varchar(50) DEFAULT NULL,
  `Date_Time_Test_Starting` varchar(20) DEFAULT NULL,
  `Date_Time_Test_Completed` varchar(20) DEFAULT NULL,
  `Instrument_Identification` varchar(20) DEFAULT NULL,
  `Status` varchar(3) DEFAULT NULL,
  `Checksum` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`Result_ID`),
  KEY `Result-Nature_of_Abnormal_Testing` (`Nature_of_Abnormality_Testing`),
  KEY `Result-Abnormal_Flags` (`Result_Abnormal_Flag`),
  KEY `Result-Status` (`Result_Status`),
  KEY `Result-Orden` (`Orden_ID`),
  CONSTRAINT `Result-Orden` FOREIGN KEY (`Orden_ID`) REFERENCES `Orden` (`Orden_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Result_Abnormal_ Flags`
--

DROP TABLE IF EXISTS `Result_Abnormal_ Flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Result_Abnormal_ Flags` (
  `id` varchar(2) NOT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Result_Status`
--

DROP TABLE IF EXISTS `Result_Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Result_Status` (
  `id` varchar(1) NOT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `comment_order_view`
--

DROP TABLE IF EXISTS `comment_order_view`;
/*!50001 DROP VIEW IF EXISTS `comment_order_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `comment_order_view` (
  `Comment_ID` tinyint NOT NULL,
  `Orden_ID` tinyint NOT NULL,
  `Reference_Table` tinyint NOT NULL,
  `Sequence` tinyint NOT NULL,
  `Comment_Source` tinyint NOT NULL,
  `Text` tinyint NOT NULL,
  `order_date` tinyint NOT NULL,
  `comment_text` tinyint NOT NULL,
  `Comment_Type` tinyint NOT NULL,
  `Status` tinyint NOT NULL,
  `Checksum` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `header_view`
--

DROP TABLE IF EXISTS `header_view`;
/*!50001 DROP VIEW IF EXISTS `header_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `header_view` (
  `Header_ID` tinyint NOT NULL,
  `Access_Password` tinyint NOT NULL,
  `Sender_Name` tinyint NOT NULL,
  `Sender_Address` tinyint NOT NULL,
  `Reserved` tinyint NOT NULL,
  `Sender_Telephone` tinyint NOT NULL,
  `Characteristics_Of_Sender` tinyint NOT NULL,
  `Receiver_ID` tinyint NOT NULL,
  `Comments` tinyint NOT NULL,
  `Processing_ID` tinyint NOT NULL,
  `ASTM_Version` tinyint NOT NULL,
  `Date_and_Time` tinyint NOT NULL,
  `Status` tinyint NOT NULL,
  `Checksum` tinyint NOT NULL,
  `NumPac` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `order_view`
--

DROP TABLE IF EXISTS `order_view`;
/*!50001 DROP VIEW IF EXISTS `order_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `order_view` (
  `Orden_ID` tinyint NOT NULL,
  `Patient_ID` tinyint NOT NULL,
  `Sequence` tinyint NOT NULL,
  `Sample_ID` tinyint NOT NULL,
  `Instrument_Specimen_ID` tinyint NOT NULL,
  `Universal_Test_ID` tinyint NOT NULL,
  `Priority` tinyint NOT NULL,
  `Requested_Ordered_Date_and_Time` tinyint NOT NULL,
  `Specimen_Collection_Date_and_Time` tinyint NOT NULL,
  `Collection_End_Time` tinyint NOT NULL,
  `Collection_Volume` tinyint NOT NULL,
  `Collector_ID` tinyint NOT NULL,
  `Action_Code` tinyint NOT NULL,
  `Danger_Code` tinyint NOT NULL,
  `Relevant_Clinical_Informations` tinyint NOT NULL,
  `Date_Time_Specimen_Received` tinyint NOT NULL,
  `Specimen_Descriptor` tinyint NOT NULL,
  `Ordering_Physician` tinyint NOT NULL,
  `Physician_Tel_Nb` tinyint NOT NULL,
  `User_Field_1` tinyint NOT NULL,
  `User_Field_2` tinyint NOT NULL,
  `Laboratory_Field_1` tinyint NOT NULL,
  `Laboratory_Field_2` tinyint NOT NULL,
  `Date_and_Time_Results_reported_or_last_modified` tinyint NOT NULL,
  `Instrument_Charge_to_Computer_System` tinyint NOT NULL,
  `Instrument_Section_ID` tinyint NOT NULL,
  `Report_Types` tinyint NOT NULL,
  `Reserved` tinyint NOT NULL,
  `Location_or_Ward_of_Specimen_Collection` tinyint NOT NULL,
  `Nosocomial_Infection_Flag` tinyint NOT NULL,
  `Specimen_Service` tinyint NOT NULL,
  `Specimen_institution` tinyint NOT NULL,
  `Status` tinyint NOT NULL,
  `Checksum` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `patient_view`
--

DROP TABLE IF EXISTS `patient_view`;
/*!50001 DROP VIEW IF EXISTS `patient_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `patient_view` (
  `Patient_ID` tinyint NOT NULL,
  `Header_ID` tinyint NOT NULL,
  `Sequence` tinyint NOT NULL,
  `Practice_Assigned_Patient_ID` tinyint NOT NULL,
  `Laboratory_Assigned_Patient_ID` tinyint NOT NULL,
  `Patient_ID_No_3` tinyint NOT NULL,
  `Patient_Name_Name_First_name` tinyint NOT NULL,
  `Mothers_Maiden_Name` tinyint NOT NULL,
  `Birthdate` tinyint NOT NULL,
  `Patient_Sex` tinyint NOT NULL,
  `Patient_Race_thnic_Origin` tinyint NOT NULL,
  `Patient_Address` tinyint NOT NULL,
  `Reserved` tinyint NOT NULL,
  `Patient_Telephone_Nb` tinyint NOT NULL,
  `Attending_Physician_ID` tinyint NOT NULL,
  `Special_Field_1` tinyint NOT NULL,
  `Special_Field_2` tinyint NOT NULL,
  `Patient_Height` tinyint NOT NULL,
  `Patient_Weight` tinyint NOT NULL,
  `Patients_Known_or_Suspected_Diagnosis` tinyint NOT NULL,
  `Patient_Active_Medication` tinyint NOT NULL,
  `Patients_Diet` tinyint NOT NULL,
  `Practice_Field_1` tinyint NOT NULL,
  `Practice_Field_2` tinyint NOT NULL,
  `Admission_and_Discharge_Dates` tinyint NOT NULL,
  `Admission_Status` tinyint NOT NULL,
  `Location` tinyint NOT NULL,
  `Nature_of_Alternative_Diagnostic_Code_and_Classifiers_1` tinyint NOT NULL,
  `Nature_of_Alternative_Diagnostic_Code_and_Classifiers_2` tinyint NOT NULL,
  `Patient_Religion` tinyint NOT NULL,
  `Martial_status` tinyint NOT NULL,
  `Isolation_Status` tinyint NOT NULL,
  `Language` tinyint NOT NULL,
  `Hospital_Service` tinyint NOT NULL,
  `Hopital_Institution` tinyint NOT NULL,
  `Dosage_Category` tinyint NOT NULL,
  `Status` tinyint NOT NULL,
  `Checksum` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `result_view`
--

DROP TABLE IF EXISTS `result_view`;
/*!50001 DROP VIEW IF EXISTS `result_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `result_view` (
  `Result_ID` tinyint NOT NULL,
  `Orden_ID` tinyint NOT NULL,
  `Sequence` tinyint NOT NULL,
  `Universal_Test_ID` tinyint NOT NULL,
  `Data_or_Measurement_value` tinyint NOT NULL,
  `oor` tinyint NOT NULL,
  `result_value` tinyint NOT NULL,
  `Unit` tinyint NOT NULL,
  `Reference_Range` tinyint NOT NULL,
  `Result_Abnormal_Flag` tinyint NOT NULL,
  `Nature_of_Abnormality_Testing` tinyint NOT NULL,
  `Result_Status` tinyint NOT NULL,
  `Date_of_Change_in_Normative_Values_or_Units` tinyint NOT NULL,
  `Operator_Identification` tinyint NOT NULL,
  `Date_Time_Test_Started` tinyint NOT NULL,
  `Date_Time_Test_Completed` tinyint NOT NULL,
  `Instrument_Identification` tinyint NOT NULL,
  `Status` tinyint NOT NULL,
  `Checksum` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `comment_order_view`
--

/*!50001 DROP TABLE IF EXISTS `comment_order_view`*/;
/*!50001 DROP VIEW IF EXISTS `comment_order_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pathology`@`10.134.100.%` SQL SECURITY DEFINER */
/*!50001 VIEW `astm`.`comment_order_view` AS select `astm`.`comment_orden`.`Comment_ID` AS `Comment_ID`,`astm`.`comment_orden`.`Orden_ID` AS `Orden_ID`,`astm`.`comment_orden`.`Reference_Table` AS `Reference_Table`,`astm`.`comment_orden`.`Sequence` AS `Sequence`,`astm`.`comment_orden`.`Comment_Source` AS `Comment_Source`,`astm`.`comment_orden`.`Text` AS `Text`,case when `astm`.`comment_orden`.`Text` like '%;%' then str_to_date(substr(`astm`.`comment_orden`.`Text`,1,locate(';',`astm`.`comment_orden`.`Text`) - 1),'%m/%d/%Y %H:%i:%s') else makedate(1970,1) end AS `order_date`,case when `astm`.`comment_orden`.`Text` like '%;%' then substr(`astm`.`comment_orden`.`Text`,locate(';',`astm`.`comment_orden`.`Text`) + 2) else `astm`.`comment_orden`.`Text` end AS `comment_text`,`astm`.`comment_orden`.`Comment_Type` AS `Comment_Type`,`astm`.`comment_orden`.`Status` AS `Status`,`astm`.`comment_orden`.`Checksum` AS `Checksum` from `astm`.`comment_orden` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `header_view`
--

/*!50001 DROP TABLE IF EXISTS `header_view`*/;
/*!50001 DROP VIEW IF EXISTS `header_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pathology`@`10.134.100.%` SQL SECURITY DEFINER */
/*!50001 VIEW `astm`.`header_view` AS select `astm`.`header`.`Header_ID` AS `Header_ID`,`astm`.`header`.`Access_Password` AS `Access_Password`,`astm`.`header`.`Sender_Name` AS `Sender_Name`,`astm`.`header`.`Sender_Address` AS `Sender_Address`,`astm`.`header`.`Reserved` AS `Reserved`,`astm`.`header`.`Sender_Telephone` AS `Sender_Telephone`,`astm`.`header`.`Characteristics_Of_Sender` AS `Characteristics_Of_Sender`,`astm`.`header`.`Receiver_ID` AS `Receiver_ID`,`astm`.`header`.`Comments` AS `Comments`,`astm`.`header`.`Processing_ID` AS `Processing_ID`,`astm`.`header`.`ASTM_Version` AS `ASTM_Version`,str_to_date(`astm`.`header`.`Date_and_Time`,'%Y%m%d%H%i%s') AS `Date_and_Time`,`astm`.`header`.`Status` AS `Status`,`astm`.`header`.`Checksum` AS `Checksum`,`astm`.`header`.`NumPac` AS `NumPac` from `astm`.`header` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_view`
--

/*!50001 DROP TABLE IF EXISTS `order_view`*/;
/*!50001 DROP VIEW IF EXISTS `order_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pathology`@`10.134.100.%` SQL SECURITY DEFINER */
/*!50001 VIEW `astm`.`order_view` AS select `astm`.`orden`.`Orden_ID` AS `Orden_ID`,`astm`.`orden`.`Patient_ID` AS `Patient_ID`,`astm`.`orden`.`Sequence` AS `Sequence`,`astm`.`orden`.`Sample_ID` AS `Sample_ID`,`astm`.`orden`.`Instrument_Specimen_ID` AS `Instrument_Specimen_ID`,replace(`astm`.`orden`.`Universal_Test_ID`,'^','') AS `Universal_Test_ID`,`astm`.`orden`.`Priority` AS `Priority`,str_to_date(`astm`.`orden`.`Requested_Ordered_Date_and_Time`,'%Y%m%d%H%i%s') AS `Requested_Ordered_Date_and_Time`,str_to_date(`astm`.`orden`.`Specimen_Collection_Date_and_Time`,'%Y%m%d%H%i%s') AS `Specimen_Collection_Date_and_Time`,str_to_date(`astm`.`orden`.`Collection_End_Time`,'%Y%m%d%H%i%s') AS `Collection_End_Time`,`astm`.`orden`.`Collection_Volume` AS `Collection_Volume`,`astm`.`orden`.`Collector_ID` AS `Collector_ID`,`astm`.`orden`.`Action_Code` AS `Action_Code`,`astm`.`orden`.`Danger_Code` AS `Danger_Code`,`astm`.`orden`.`Relevant_Clinical_Informations` AS `Relevant_Clinical_Informations`,str_to_date(`astm`.`orden`.`Date_Time_Specimen_Received`,'%Y%m%d%H%i%s') AS `Date_Time_Specimen_Received`,`astm`.`orden`.`Specimen_Descriptor` AS `Specimen_Descriptor`,`astm`.`orden`.`Ordering_Physician` AS `Ordering_Physician`,`astm`.`orden`.`Physician_Tel_Nb` AS `Physician_Tel_Nb`,`astm`.`orden`.`User_Field_1` AS `User_Field_1`,`astm`.`orden`.`User_Field_2` AS `User_Field_2`,`astm`.`orden`.`Laboratory_Field_1` AS `Laboratory_Field_1`,`astm`.`orden`.`Laboratory_Field_2` AS `Laboratory_Field_2`,str_to_date(`astm`.`orden`.`Date_and_Time_Results_reported_or_last_modified`,'%Y%m%d%H%i%s') AS `Date_and_Time_Results_reported_or_last_modified`,`astm`.`orden`.`Instrument_Charge_to_Computer_System` AS `Instrument_Charge_to_Computer_System`,`astm`.`orden`.`Instrument_Section_ID` AS `Instrument_Section_ID`,`astm`.`orden`.`Report_Types` AS `Report_Types`,`astm`.`orden`.`Reserved` AS `Reserved`,`astm`.`orden`.`Location_or_Ward_of_Specimen_Collection` AS `Location_or_Ward_of_Specimen_Collection`,`astm`.`orden`.`Nosocomial_Infection_Flag` AS `Nosocomial_Infection_Flag`,`astm`.`orden`.`Specimen_Service` AS `Specimen_Service`,`astm`.`orden`.`Specimen_institution` AS `Specimen_institution`,`astm`.`orden`.`Status` AS `Status`,`astm`.`orden`.`Checksum` AS `Checksum` from `astm`.`orden` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patient_view`
--

/*!50001 DROP TABLE IF EXISTS `patient_view`*/;
/*!50001 DROP VIEW IF EXISTS `patient_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pathology`@`10.134.100.%` SQL SECURITY DEFINER */
/*!50001 VIEW `astm`.`patient_view` AS select `astm`.`patient`.`Patient_ID` AS `Patient_ID`,`astm`.`patient`.`Header_ID` AS `Header_ID`,`astm`.`patient`.`Sequence` AS `Sequence`,`astm`.`patient`.`Practice_Assigned_Patient_ID` AS `Practice_Assigned_Patient_ID`,lcase(`astm`.`patient`.`Laboratory_Assigned_Patient_ID`) AS `Laboratory_Assigned_Patient_ID`,`astm`.`patient`.`Patient_ID_No_3` AS `Patient_ID_No_3`,`astm`.`patient`.`Patient_Name_Name_First_name` AS `Patient_Name_Name_First_name`,`astm`.`patient`.`Mothers_Maiden_Name` AS `Mothers_Maiden_Name`,str_to_date(`astm`.`patient`.`Birthdate`,'%Y%m%d') AS `Birthdate`,`astm`.`patient`.`Patient_Sex` AS `Patient_Sex`,`astm`.`patient`.`Patient_Race_thnic_Origin` AS `Patient_Race_thnic_Origin`,`astm`.`patient`.`Patient_Address` AS `Patient_Address`,`astm`.`patient`.`Reserved` AS `Reserved`,`astm`.`patient`.`Patient_Telephone_Nb` AS `Patient_Telephone_Nb`,`astm`.`patient`.`Attending_Physician_ID` AS `Attending_Physician_ID`,`astm`.`patient`.`Special_Field_1` AS `Special_Field_1`,`astm`.`patient`.`Special_Field_2` AS `Special_Field_2`,`astm`.`patient`.`Patient_Height` AS `Patient_Height`,`astm`.`patient`.`Patient_Weight` AS `Patient_Weight`,`astm`.`patient`.`Patients_Known_or_Suspected_Diagnosis` AS `Patients_Known_or_Suspected_Diagnosis`,`astm`.`patient`.`Patient_Active_Medication` AS `Patient_Active_Medication`,`astm`.`patient`.`Patients_Diet` AS `Patients_Diet`,`astm`.`patient`.`Practice_Field_1` AS `Practice_Field_1`,`astm`.`patient`.`Practice_Field_2` AS `Practice_Field_2`,`astm`.`patient`.`Admission_and_Discharge_Dates` AS `Admission_and_Discharge_Dates`,`astm`.`patient`.`Admission_Status` AS `Admission_Status`,`astm`.`patient`.`Location` AS `Location`,`astm`.`patient`.`Nature_of_Alternative_Diagnostic_Code_and_Classifiers_1` AS `Nature_of_Alternative_Diagnostic_Code_and_Classifiers_1`,`astm`.`patient`.`Nature_of_Alternative_Diagnostic_Code_and_Classifiers_2` AS `Nature_of_Alternative_Diagnostic_Code_and_Classifiers_2`,`astm`.`patient`.`Patient_Religion` AS `Patient_Religion`,`astm`.`patient`.`Martial_status` AS `Martial_status`,`astm`.`patient`.`Isolation_Status` AS `Isolation_Status`,`astm`.`patient`.`Language` AS `Language`,`astm`.`patient`.`Hospital_Service` AS `Hospital_Service`,`astm`.`patient`.`Hopital_Institution` AS `Hopital_Institution`,`astm`.`patient`.`Dosage_Category` AS `Dosage_Category`,`astm`.`patient`.`Status` AS `Status`,`astm`.`patient`.`Checksum` AS `Checksum` from `astm`.`patient` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `result_view`
--

/*!50001 DROP TABLE IF EXISTS `result_view`*/;
/*!50001 DROP VIEW IF EXISTS `result_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pathology`@`10.134.100.%` SQL SECURITY DEFINER */
/*!50001 VIEW `astm`.`result_view` AS select `astm`.`result`.`Result_ID` AS `Result_ID`,`astm`.`result`.`Orden_ID` AS `Orden_ID`,`astm`.`result`.`Sequence` AS `Sequence`,replace(`astm`.`result`.`Universal_Test_ID`,'^','') AS `Universal_Test_ID`,`astm`.`result`.`Data_or_Measurement_value` AS `Data_or_Measurement_value`,case when `astm`.`result`.`Data_or_Measurement_value` regexp '[<>]+' then substr(`astm`.`result`.`Data_or_Measurement_value`,1,1) else NULL end AS `oor`,case when `astm`.`result`.`Data_or_Measurement_value` regexp '[<>]+' then substr(`astm`.`result`.`Data_or_Measurement_value`,2) else `astm`.`result`.`Data_or_Measurement_value` end AS `result_value`,`astm`.`result`.`Unit` AS `Unit`,`astm`.`result`.`Reference_Range` AS `Reference_Range`,`astm`.`result`.`Result_Abnormal_Flag` AS `Result_Abnormal_Flag`,`astm`.`result`.`Nature_of_Abnormality_Testing` AS `Nature_of_Abnormality_Testing`,`astm`.`result`.`Result_Status` AS `Result_Status`,`astm`.`result`.`Date_of_Change_in_Normative_Values_or_Units` AS `Date_of_Change_in_Normative_Values_or_Units`,`astm`.`result`.`Operator_Identification` AS `Operator_Identification`,str_to_date(`astm`.`result`.`Date_Time_Test_Starting`,'%Y%m%d%H%i%s') AS `Date_Time_Test_Started`,str_to_date(`astm`.`result`.`Date_Time_Test_Completed`,'%Y%m%d%H%i%s') AS `Date_Time_Test_Completed`,`astm`.`result`.`Instrument_Identification` AS `Instrument_Identification`,`astm`.`result`.`Status` AS `Status`,`astm`.`result`.`Checksum` AS `Checksum` from `astm`.`result` */;
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

-- Dump completed on 2021-08-18 15:26:46
