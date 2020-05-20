DELIMITER //

DROP PROCEDURE IF EXISTS POSTSERVICIOS;

CREATE PROCEDURE POSTSERVICIOS(
    pidTN BIGINT
    ,pCodigo VARCHAR(255)
    ,OUT out_id INT)
BEGIN
    INSERT INTO Servicios (
        idTN
        ,Codigo
    ) VALUES (
        pidTN
        ,pCodigo
    );

    SET out_id = LAST_INSERT_ID();
END; //

DELIMITER ;
