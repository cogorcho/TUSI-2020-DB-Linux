DELIMITER //

DROP PROCEDURE IF EXISTS GETNIVELEDUCACION;

CREATE PROCEDURE GETNIVELEDUCACION(NIVID INT)
BEGIN
    IF NIVID = -1 THEN
        SELECT ID, NOMBRE FROM NivelEducacion ORDER BY NOMBRE;
    ELSE
        SELECT ID, NOMBRE FROM NivelEducacion WHERE ID = NIVID;
    END IF;
END //

DELIMITER ;