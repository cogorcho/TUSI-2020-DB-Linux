DELIMITER //

DROP PROCEDURE IF EXISTS PUTSECTOR;

CREATE PROCEDURE PUTSECTOR(
     pid INT
    ,pnombre VARCHAR(256)
)
BEGIN
    UPDATE Sector SET
         nombre = ifnull(pnombre, nombre)
    WHERE ID = PID;

END; //

DELIMITER ;
