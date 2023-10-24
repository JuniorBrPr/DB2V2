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