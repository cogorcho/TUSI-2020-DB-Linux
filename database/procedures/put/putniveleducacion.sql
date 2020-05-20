DELIMITER //

DROP PROCEDURE IF EXISTS PUTNIVELEDUCACION;

CREATE PROCEDURE PUTNIVELEDUCACION(
     pid INT
    ,pnombre VARCHAR(256)
)
BEGIN
    UPDATE NivelEducacion SET
         nombre = ifnull(pnombre, nombre)
    WHERE ID = PID;

END; //

DELIMITER ;
