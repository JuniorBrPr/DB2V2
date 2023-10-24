CREATE DATABASE  IF NOT EXISTS `big_five_safari` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `big_five_safari`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: big_five_safari
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
-- Table structure for table `accommodatie`
--

DROP TABLE IF EXISTS `accommodatie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accommodatie` (
                                `code` varchar(45) NOT NULL,
                                `naam` varchar(45) NOT NULL,
                                `stad` varchar(45) NOT NULL,
                                `land` varchar(45) NOT NULL,
                                `kamer` varchar(100) NOT NULL,
                                `personen` int NOT NULL,
                                `type` enum('Lodge','Hotel') NOT NULL,
                                PRIMARY KEY (`code`),
                                CONSTRAINT `accommodatie_code` CHECK (regexp_like(`code`,_utf8mb4'^[A-Z0-9]{4}[0-9]{1}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodatie`
--

LOCK TABLES `accommodatie` WRITE;
/*!40000 ALTER TABLE `accommodatie` DISABLE KEYS */;
INSERT INTO `accommodatie` VALUES ('HEVO1','Etosha Village','Okaukuejo','Namibië','Standaard kamer met 2 Bedden',2,'Hotel'),('HHIH1','Holiday Inn','Harare','Zimbabwe','Standaard kamer',3,'Hotel'),('HIBZ1','Indigo Beach','Zanzibar','Tanzania','Swahili-stijl budget tweepersoonskamer',2,'Hotel'),('HIBZ2','Indigo Beach','Zanzibar','Tanzania','Bungalow met uitzicht op de tuin',8,'Hotel'),('HPHC1','Premier Hotel Cape Town','Kaapstad','Zuid-Afrika','Familie loft met queensize bed en 2 aparte bedden',4,'Hotel'),('HRHB1','Bulawayo Rainbow Hotel','Bulawayo','Zimbabwe','Deluxe tweepersoonskamer',2,'Hotel'),('HRMS1','River Manor Boutique Hotel','Stellen Bosch','Zuid-Afrika','Loft studio kamer',2,'Hotel'),('HRMS2','River Manor Boutique Hotel','Stellen Bosch','Zuid-Afrika','Superior tweepersoonskamer',2,'Hotel'),('HSCW1','Safari Court Hotel','Windhoek','Namibië','Classic tweepersoonskamer met 2 aparte bedden',2,'Hotel'),('HZBK1','Zanbluu Beach Hotel','Kiwengwa','Tanzania','Superior Suite met uitzicht op zee en eigen zwembad',2,'Hotel'),('LAAC1','Sasa Safari Camp','Outjo','Namibië','Tweepersoonskamer met Uitzicht',2,'Lodge'),('LASL1','Africa Safari Lodge','Mariental','Namibië','Familiekamer',4,'Lodge'),('LBBL1','Baby Bush Lodge','Kiwengwa','Tanzania','Bruidssuite met Balkon',2,'Lodge'),('LIEK1','Impala Ecolodge','Kisumu','Kenia','Luxe suite',2,'Lodge'),('LIML1','Immanuel Wilderness Lodge','Windhoek','Namibië','Tweepersoonskamer met Uitzicht op de Tuin',2,'Lodge'),('LLML1','Mika Lodge','Lusaka','Zambia','Executive Suite',2,'Lodge'),('LNZL1','Ngoma Zanga Lodge','Livingstone','Zambia','Deluxe kamer met kingsize bed',3,'Lodge');
/*!40000 ALTER TABLE `accommodatie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
                         `accommodatie_code` varchar(45) NOT NULL,
                         `prijs_per_nacht` double NOT NULL,
                         `ontbijt` tinyint NOT NULL,
                         PRIMARY KEY (`accommodatie_code`),
                         CONSTRAINT `HotelAccomodatieCode` FOREIGN KEY (`accommodatie_code`) REFERENCES `accommodatie` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES ('HEVO1',191,1),('HHIH1',64,0),('HIBZ1',75,1),('HIBZ2',243,0),('HPHC1',127,0),('HRHB1',90,1),('HRMS1',99,1),('HRMS2',166,1),('HSCW1',105,0),('HZBK1',369,1);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lodge`
--

DROP TABLE IF EXISTS `lodge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lodge` (
                         `accommodatie_code` varchar(45) NOT NULL,
                         `prijs_per_week` double NOT NULL,
                         `autohuur` tinyint NOT NULL,
                         PRIMARY KEY (`accommodatie_code`),
                         CONSTRAINT `LodgeAccomodatieCode` FOREIGN KEY (`accommodatie_code`) REFERENCES `accommodatie` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lodge`
--

LOCK TABLES `lodge` WRITE;
/*!40000 ALTER TABLE `lodge` DISABLE KEYS */;
INSERT INTO `lodge` VALUES ('LAAC1',447,0),('LASL1',946,1),('LBBL1',939,1),('LIEK1',1182,0),('LIML1',788,1),('LLML1',1091,1),('LNZL1',899,1);
/*!40000 ALTER TABLE `lodge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reiziger`
--

DROP TABLE IF EXISTS `reiziger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reiziger` (
                            `code` varchar(45) NOT NULL,
                            `voornaam` varchar(45) NOT NULL,
                            `achternaam` varchar(45) NOT NULL,
                            `adres` varchar(45) NOT NULL,
                            `postcode` varchar(7) NOT NULL,
                            `plaats` varchar(45) NOT NULL,
                            `land` varchar(45) NOT NULL,
                            `hoofd_reiziger` varchar(45) DEFAULT NULL,
                            PRIMARY KEY (`code`),
                            KEY `HoofdReizigerCode_idx` (`hoofd_reiziger`),
                            CONSTRAINT `HoofdReizigerCode` FOREIGN KEY (`hoofd_reiziger`) REFERENCES `reiziger` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reiziger`
--

LOCK TABLES `reiziger` WRITE;
/*!40000 ALTER TABLE `reiziger` DISABLE KEYS */;
INSERT INTO `reiziger` VALUES ('FadilO','Omar','Fadil','Houtsberg 16','6091 NA','Leveroy','Nederland','FadilT'),('FadilT','Tahera','Fadil','Houtsberg 16','6091 NA','Leveroy','Nederland',NULL),('FonteijnC','Claar','Fonteijn','Castricummerwerf 70','1901 RF','Castricum','Nederland','MeijerP'),('JeremyB','Bram','Jeremy','Rijksstraatweg 289','3956 CP','Leersum','Nederland','JeremyD'),('JeremyD','Demitri','Jeremy','Rijksstraatweg 289','3956 CP','Leersum','Nederland',NULL),('JeremyD1','Devid','Jeremy','De Kronkels 25','3752 LM','Bunschoten','Nederland','JeremyD'),('MeijerP','Pieter','Meijer','Expeditiestraat 2','1135 GB','Edam','Nederland',NULL),('MulderD','Derek','Mulder','Lakenblekerstraat 49A','1431 GE','Aalsmeer','Nederland','MulderF'),('MulderF','Frank','Mulder','Lakenblekerstraat 49A','1431 GE','Aalsmeer','Nederland',NULL),('MulderS','Sophie','Mulder','Lakenblekerstraat 49A','1431 GE','Aalsmeer','Nederland','MulderF'),('NazariM','Moustafa','Nazari','Vlakdissen 12','1648 HJ','Den Goorn','Nederland',NULL),('NguyenR','Roy','Nguyen','Bukkemweg 1','5081 CT','Hilvarenbeek','Nederland',NULL),('RijenF','Fred','van Rijen','Einsteinstraat 10','1446 VG','Purmerend','Nederland','MulderF'),('WongH','Hu','Wong','Rembrandtstraat 7','3662 HN','Oud-Bijerland','Nederland',NULL);
/*!40000 ALTER TABLE `reiziger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservering`
--

DROP TABLE IF EXISTS `reservering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservering` (
                               `id` int NOT NULL AUTO_INCREMENT,
                               `accommodatie_code` varchar(45) NOT NULL,
                               `reiziger_code` varchar(45) NOT NULL,
                               `aankomst_datum` date NOT NULL,
                               `vertrek_datum` date NOT NULL,
                               `betaald` tinyint NOT NULL,
                               PRIMARY KEY (`id`),
                               KEY `ReserveringAccommodatieCode_idx` (`accommodatie_code`),
                               KEY `ReserveringReizigersCode_idx` (`reiziger_code`),
                               CONSTRAINT `ReserveringAccommodatieCode` FOREIGN KEY (`accommodatie_code`) REFERENCES `accommodatie` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
                               CONSTRAINT `ReserveringReizigersCode` FOREIGN KEY (`reiziger_code`) REFERENCES `reiziger` (`code`),
                               CONSTRAINT `reservering_datum_check` CHECK ((`vertrek_datum` > `aankomst_datum`)),
                               CONSTRAINT `vertrekdatum_check` CHECK ((`vertrek_datum` > `aankomst_datum`))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservering`
--

LOCK TABLES `reservering` WRITE;
/*!40000 ALTER TABLE `reservering` DISABLE KEYS */;
INSERT INTO `reservering` VALUES (1,'HIBZ2','FadilT','2022-07-12','2022-07-19',0),(2,'HSCW1','JeremyD','2022-07-10','2022-07-19',1),(3,'HPHC1','WongH','2022-07-31','2022-08-05',0),(4,'LBBL1','FadilT','2022-07-19','2022-07-26',0),(5,'LNZL1','MulderF','2022-08-12','2022-08-19',1),(6,'HRHB1','NazariM','2022-07-01','2022-07-05',0),(7,'LNZL1','NazariM','2022-07-05','2022-07-12',0),(8,'HRMS1','NguyenR','2022-07-24','2022-07-26',1),(9,'HPHC1','NguyenR','2022-07-26','2022-07-31',1),(10,'LIEK1','NguyenR','2022-08-01','2022-08-08',1),(11,'LAAC1','MeijerP','2022-08-19','2022-08-26',0),(12,'LIML1','MeijerP','2022-08-26','2022-09-02',0);
/*!40000 ALTER TABLE `reservering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `‘boekingsoverzicht’`
--

DROP TABLE IF EXISTS `‘boekingsoverzicht’`;
/*!50001 DROP VIEW IF EXISTS `‘boekingsoverzicht’`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `‘boekingsoverzicht’` AS SELECT
                                                  1 AS `accommodatie_code`,
                                                  1 AS `accommodatie_naam`,
                                                  1 AS `accommodatie_stad`,
                                                  1 AS `accommodatie_land`,
                                                  1 AS `accommodatie_type`,
                                                  1 AS `reiziger`,
                                                  1 AS `reiziger_code`,
                                                  1 AS `aankomst_datum`,
                                                  1 AS `vertrek_datum`,
                                                  1 AS `aantal_dagen`,
                                                  1 AS `betaald`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'big_five_safari'
--

--
-- Dumping routines for database 'big_five_safari'
--
/*!50003 DROP FUNCTION IF EXISTS `GeboektOp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GeboektOp`(pCode VARCHAR(10), pDatum DATE) RETURNS varchar(10) CHARSET utf8mb3
BEGIN
    DECLARE reiziger VARCHAR(45);
    SELECT reiziger_code INTO reiziger
    FROM reservering
    WHERE accommodatie_code = pCode AND aankomst_datum <= pDatum AND vertrek_datum > pDatum
    LIMIT 1;
    RETURN reiziger;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verwijderAccommodatie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verwijderAccommodatie`(IN accommodatieCode VARCHAR(5))
BEGIN
    IF NOT EXISTS (SELECT *
                   FROM reservering
                   WHERE reservering.accommodatie_code = accommodatieCode
                     AND vertrek_datum >= CURDATE())
        AND NOT EXISTS (SELECT *
                        FROM reservering
                        WHERE reservering.accommodatie_code = accommodatieCode
                          AND vertrek_datum < CURDATE()
                          AND betaald = 0) THEN
        DELETE FROM accommodatie WHERE accommodatie.code = accommodatieCode;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `‘boekingsoverzicht’`
--

/*!50001 DROP VIEW IF EXISTS `‘boekingsoverzicht’`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
    /*!50013 DEFINER=`dbConn`@`localhost` SQL SECURITY DEFINER */
    /*!50001 VIEW `‘boekingsoverzicht’` AS select `accommodatie`.`code` AS `accommodatie_code`,`accommodatie`.`naam` AS `accommodatie_naam`,`accommodatie`.`stad` AS `accommodatie_stad`,`accommodatie`.`land` AS `accommodatie_land`,`accommodatie`.`type` AS `accommodatie_type`,concat(`reiziger`.`voornaam`,' ',`reiziger`.`achternaam`) AS `reiziger`,`reiziger`.`code` AS `reiziger_code`,`reservering`.`aankomst_datum` AS `aankomst_datum`,`reservering`.`vertrek_datum` AS `vertrek_datum`,(to_days(`reservering`.`vertrek_datum`) - to_days(`reservering`.`aankomst_datum`)) AS `aantal_dagen`,`reservering`.`betaald` AS `betaald` from ((`reservering` left join `reiziger` on((`reservering`.`reiziger_code` = `reiziger`.`code`))) left join `accommodatie` on((`reservering`.`accommodatie_code` = `accommodatie`.`code`))) order by `reservering`.`aankomst_datum` */;
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

-- Dump completed on 2023-10-24 22:02:22
