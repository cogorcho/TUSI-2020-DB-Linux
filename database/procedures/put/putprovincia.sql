DELIMITER //

DROP PROCEDURE IF EXISTS PUTPROVINCIA;

CREATE PROCEDURE PUTPROVINCIA(
     pid INT
    ,pnombre VARCHAR(128)
)
BEGIN
    UPDATE Provincia SET
         nombre = ifnull(pnombre, nombre)
    WHERE ID = PID;

END; //

DELIMITER ;
