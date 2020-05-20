DELIMITER //

DROP PROCEDURE IF EXISTS POSTNIVELEDUCACION;

CREATE PROCEDURE POSTNIVELEDUCACION(
    pnombre VARCHAR(256)
    ,OUT out_id INT)
BEGIN
    INSERT INTO NivelEducacion (
        nombre
    ) VALUES (
        pnombre
    );

    SET out_id = LAST_INSERT_ID();
END; //

DELIMITER ;