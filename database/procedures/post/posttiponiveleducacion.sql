DELIMITER //

DROP PROCEDURE IF EXISTS POSTTIPONIVELEDUCACION;

CREATE PROCEDURE POSTTIPONIVELEDUCACION(
    pidTipoEducacion INT
    ,pidNivelEducacion INT
    ,OUT out_id INT)
BEGIN
    INSERT INTO TipoNivelEducacion (
        idTipoEducacion
        ,idNivelEducacion
    ) VALUES (
        pidTipoEducacion
        ,pidNivelEducacion
    );

    SET out_id = LAST_INSERT_ID();
END; //

DELIMITER ;
