DELIMITER //

DROP PROCEDURE IF EXISTS POSTESCUELA;

CREATE PROCEDURE POSTESCUELA(
    pidLocalidad INT
    ,pidSector INT
    ,pidAmbito INT
    ,pcodigo VARCHAR(32)
    ,pnombre VARCHAR(256)
    ,pdomicilio VARCHAR(256)
    ,pcodpos VARCHAR(64)
    ,OUT out_id INT)
BEGIN
    INSERT INTO Escuela (
        idLocalidad
        ,idSector
        ,idAmbito
        ,codigo
        ,nombre
        ,domicilio
        ,codpos
    ) VALUES (
        pidLocalidad
        ,pidSector
        ,pidAmbito
        ,pcodigo
        ,pnombre
        ,pdomicilio
        ,pcodpos
    );

    SET out_id = LAST_INSERT_ID();
END; //

DELIMITER ;
