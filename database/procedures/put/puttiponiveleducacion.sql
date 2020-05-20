DELIMITER //

DROP PROCEDURE IF EXISTS PUTTIPONIVELEDUCACION;

CREATE PROCEDURE PUTTIPONIVELEDUCACION(
     pid INT
    ,pidTipoEducacion INT
    ,pidNivelEducacion INT
)
BEGIN
    UPDATE TipoNivelEducacion SET
         idTipoEducacion = ifnull(pidTipoEducacion, idTipoEducacion)
        ,idNivelEducacion = ifnull(pidNivelEducacion, idNivelEducacion)
    WHERE ID = PID;

END; //

DELIMITER ;
