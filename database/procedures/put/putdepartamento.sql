DELIMITER //

DROP PROCEDURE IF EXISTS PUTDEPARTAMENTO;

CREATE PROCEDURE PUTDEPARTAMENTO(
     pid INT
    ,pidProvincia INT
    ,pnombre VARCHAR(256)
)
BEGIN
    UPDATE Departamento SET
         idProvincia = ifnull(pidProvincia, idProvincia)
        ,nombre = ifnull(pnombre, nombre)
    WHERE ID = PID;

END; //

DELIMITER ;
