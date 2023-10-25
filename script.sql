INSERT INTO `accommodatie`
VALUES ('HEVO1', 'Etosha Village', 'Okaukuejo', 'Namibië', 'Standaard kamer met 2 Bedden', 2, 'Hotel'),
       ('HHIH1', 'Holiday Inn', 'Harare', 'Zimbabwe', 'Standaard kamer', 3, 'Hotel'),
       ('HIBZ1', 'Indigo Beach', 'Zanzibar', 'Tanzania', 'Swahili-stijl budget tweepersoonskamer', 2, 'Hotel'),
       ('HIBZ2', 'Indigo Beach', 'Zanzibar', 'Tanzania', 'Bungalow met uitzicht op de tuin', 8, 'Hotel'),
       ('HPHC1', 'Premier Hotel Cape Town', 'Kaapstad', 'Zuid-Afrika',
        'Familie loft met queensize bed en 2 aparte bedden', 4, 'Hotel'),
       ('HRHB1', 'Bulawayo Rainbow Hotel', 'Bulawayo', 'Zimbabwe', 'Deluxe tweepersoonskamer', 2, 'Hotel'),
       ('HRMS1', 'River Manor Boutique Hotel', 'Stellen Bosch', 'Zuid-Afrika', 'Loft studio kamer', 2, 'Hotel'),
       ('HRMS2', 'River Manor Boutique Hotel', 'Stellen Bosch', 'Zuid-Afrika', 'Superior tweepersoonskamer', 2,
        'Hotel'),
       ('HSCW1', 'Safari Court Hotel', 'Windhoek', 'Namibië', 'Classic tweepersoonskamer met 2 aparte bedden', 2,
        'Hotel'),
       ('HZBK1', 'Zanbluu Beach Hotel', 'Kiwengwa', 'Tanzania', 'Superior Suite met uitzicht op zee en eigen zwembad',
        2, 'Hotel'),
       ('LAAC1', 'Sasa Safari Camp', 'Outjo', 'Namibië', 'Tweepersoonskamer met Uitzicht', 2, 'Lodge'),
       ('LASL1', 'Africa Safari Lodge', 'Mariental', 'Namibië', 'Familiekamer', 4, 'Lodge'),
       ('LBBL1', 'Baby Bush Lodge', 'Kiwengwa', 'Tanzania', 'Bruidssuite met Balkon', 2, 'Lodge'),
       ('LIEK1', 'Impala Ecolodge', 'Kisumu', 'Kenia', 'Luxe suite', 2, 'Lodge'),
       ('LIML1', 'Immanuel Wilderness Lodge', 'Windhoek', 'Namibië', 'Tweepersoonskamer met Uitzicht op de Tuin', 2,
        'Lodge'),
       ('LLML1', 'Mika Lodge', 'Lusaka', 'Zambia', 'Executive Suite', 2, 'Lodge'),
       ('LNZL1', 'Ngoma Zanga Lodge', 'Livingstone', 'Zambia', 'Deluxe kamer met kingsize bed', 3, 'Lodge');
INSERT INTO `hotel`
VALUES ('HEVO1', 191, 1),
       ('HHIH1', 64, 0),
       ('HIBZ1', 75, 1),
       ('HIBZ2', 243, 0),
       ('HPHC1', 127, 0),
       ('HRHB1', 90, 1),
       ('HRMS1', 99, 1),
       ('HRMS2', 166, 1),
       ('HSCW1', 105, 0),
       ('HZBK1', 369, 1);
INSERT INTO `lodge`
VALUES ('LAAC1', 447, 0),
       ('LASL1', 946, 1),
       ('LBBL1', 939, 1),
       ('LIEK1', 1182, 0),
       ('LIML1', 788, 1),
       ('LLML1', 1091, 1),
       ('LNZL1', 899, 1);
INSERT INTO `reiziger`
VALUES ('FadilO', 'Omar', 'Fadil', 'Houtsberg 16', '6091 NA', 'Leveroy', 'Nederland', 'FadilT'),
       ('FadilT', 'Tahera', 'Fadil', 'Houtsberg 16', '6091 NA', 'Leveroy', 'Nederland', NULL),
       ('FonteijnC', 'Claar', 'Fonteijn', 'Castricummerwerf 70', '1901 RF', 'Castricum', 'Nederland', 'MeijerP'),
       ('JeremyB', 'Bram', 'Jeremy', 'Rijksstraatweg 289', '3956 CP', 'Leersum', 'Nederland', 'JeremyD'),
       ('JeremyD', 'Demitri', 'Jeremy', 'Rijksstraatweg 289', '3956 CP', 'Leersum', 'Nederland', NULL),
       ('JeremyD1', 'Devid', 'Jeremy', 'De Kronkels 25', '3752 LM', 'Bunschoten', 'Nederland', 'JeremyD'),
       ('MeijerP', 'Pieter', 'Meijer', 'Expeditiestraat 2', '1135 GB', 'Edam', 'Nederland', NULL),
       ('MulderD', 'Derek', 'Mulder', 'Lakenblekerstraat 49A', '1431 GE', 'Aalsmeer', 'Nederland', 'MulderF'),
       ('MulderF', 'Frank', 'Mulder', 'Lakenblekerstraat 49A', '1431 GE', 'Aalsmeer', 'Nederland', NULL),
       ('MulderS', 'Sophie', 'Mulder', 'Lakenblekerstraat 49A', '1431 GE', 'Aalsmeer', 'Nederland', 'MulderF'),
       ('NazariM', 'Moustafa', 'Nazari', 'Vlakdissen 12', '1648 HJ', 'Den Goorn', 'Nederland', NULL),
       ('NguyenR', 'Roy', 'Nguyen', 'Bukkemweg 1', '5081 CT', 'Hilvarenbeek', 'Nederland', NULL),
       ('RijenF', 'Fred', 'van Rijen', 'Einsteinstraat 10', '1446 VG', 'Purmerend', 'Nederland', 'MulderF'),
       ('WongH', 'Hu', 'Wong', 'Rembrandtstraat 7', '3662 HN', 'Oud-Bijerland', 'Nederland', NULL);
INSERT INTO `reservering`
VALUES (1, 'HIBZ2', 'FadilT', '2022-07-12', '2022-07-19', 0),
       (2, 'HSCW1', 'JeremyD', '2022-07-10', '2022-07-19', 1),
       (3, 'HPHC1', 'WongH', '2022-07-31', '2022-08-05', 0),
       (4, 'LBBL1', 'FadilT', '2022-07-19', '2022-07-26', 0),
       (5, 'LNZL1', 'MulderF', '2022-08-12', '2022-08-19', 1),
       (6, 'HRHB1', 'NazariM', '2022-07-01', '2022-07-05', 0),
       (7, 'LNZL1', 'NazariM', '2022-07-05', '2022-07-12', 0),
       (8, 'HRMS1', 'NguyenR', '2022-07-24', '2022-07-26', 1),
       (9, 'HPHC1', 'NguyenR', '2022-07-26', '2022-07-31', 1),
       (10, 'LIEK1', 'NguyenR', '2022-08-01', '2022-08-08', 1),
       (11, 'LAAC1', 'MeijerP', '2022-08-19', '2022-08-26', 0),
       (12, 'LIML1', 'MeijerP', '2022-08-26', '2022-09-02', 0);

ALTER TABLE `Reservering`
    ADD CONSTRAINT reservering_datum_check
        CHECK (vertrek_datum > aankomst_datum);

SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$
CREATE FUNCTION GeboektOp(pCode VARCHAR(10), pDatum DATE)
    RETURNS VARCHAR(10)
BEGIN
    DECLARE reiziger VARCHAR(45);
    SELECT reiziger_code
    INTO reiziger
    FROM reservering
    WHERE accommodatie_code = pCode
      AND aankomst_datum <= pDatum
      AND vertrek_datum > pDatum
    LIMIT 1;
    RETURN reiziger;
END$$
DELIMITER ;

CREATE OR REPLACE VIEW ‘Boekingsoverzicht’ AS
SELECT Accommodatie.code                                               as accommodatie_code,
       Accommodatie.naam                                               as accommodatie_naam,
       Accommodatie.stad                                               as accommodatie_stad,
       Accommodatie.land                                               as accommodatie_land,
       Accommodatie.type                                               as accommodatie_type,
       CONCAT(Reiziger.voornaam, ' ', Reiziger.achternaam)             as reiziger,
       Reiziger.code                                                   as reiziger_code,
       Reservering.aankomst_datum,
       Reservering.vertrek_datum,
       DATEDIFF(Reservering.vertrek_datum, Reservering.aankomst_datum) as aantal_dagen,
       Reservering.betaald
FROM Reservering
         LEFT JOIN Reiziger ON Reservering.reiziger_code = Reiziger.code
         LEFT JOIN Accommodatie ON Reservering.accommodatie_code = Accommodatie.code
ORDER BY Reservering.aankomst_datum ASC;

DELIMITER $$
CREATE PROCEDURE verwijderAccommodatie(IN accommodatieCode VARCHAR(5))
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
        IF (SELECT type
            FROM accommodatie
            WHERE accommodatie.code = accommodatieCode) = 'Hotel'
        THEN
            DELETE FROM hotel WHERE hotel.accommodatie_code = accommodatieCode;
        END IF;
        IF (SELECT type
            FROM accommodatie
            WHERE accommodatie.code = accommodatieCode) = 'Lodge'
        THEN
            DELETE FROM lodge WHERE lodge.accommodatie_code = accommodatieCode;
        END IF;
        DELETE FROM accommodatie WHERE accommodatie.code = accommodatieCode;
    END IF;
END$$
DELIMITER ;

ALTER TABLE `Accommodatie`
    ADD CONSTRAINT `accommodatie_code` CHECK (code REGEXP '^[A-Z0-9]{4}[0-9]$');

CREATE USER 'administratie'@'localhost' IDENTIFIED BY 'Vakantie2020';
GRANT SELECT ON big_five_safari.‘boekingsoverzicht’ TO 'administratie'@'localhost';
GRANT EXECUTE ON PROCEDURE `verwijderAccommodatie` TO 'administratie'@'localhost';