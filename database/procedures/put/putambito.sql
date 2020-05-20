DELIMITER //

DROP PROCEDURE IF EXISTS PUTAMBITO;

CREATE PROCEDURE PUTAMBITO(
     pid INT
    ,pnombre VARCHAR(256)
)
BEGIN
    UPDATE Ambito SET
         nombre = ifnull(pnombre, nombre)
    WHERE ID = PID;

END; //

DELIMITER ;
