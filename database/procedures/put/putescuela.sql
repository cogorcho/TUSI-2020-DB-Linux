DELIMITER //

DROP PROCEDURE IF EXISTS PUTESCUELA;

CREATE PROCEDURE PUTESCUELA(
     pid INT
    ,pidLocalidad INT
    ,pidSector INT
    ,pidAmbito INT
    ,pcodigo VARCHAR(32)
    ,pnombre VARCHAR(256)
    ,pdomicilio VARCHAR(256)
    ,pcodpos VARCHAR(64)
)
BEGIN
    UPDATE Escuela SET
         idLocalidad = ifnull(pidLocalidad, idLocalidad)
        ,idSector = ifnull(pidSector, idSector)
        ,idAmbito = ifnull(pidAmbito, idAmbito)
        ,codigo = ifnull(pcodigo, codigo)
        ,nombre = ifnull(pnombre, nombre)
        ,domicilio = ifnull(pdomicilio, domicilio)
        ,codpos = ifnull(pcodpos, codpos)
    WHERE ID = PID;

END; //

DELIMITER ;
