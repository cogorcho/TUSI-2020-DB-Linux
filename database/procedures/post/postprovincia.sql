DELIMITER //

DROP PROCEDURE IF EXISTS POSTPROVINCIA;

CREATE PROCEDURE POSTPROVINCIA(
    pnombre VARCHAR(128)
    ,OUT out_id INT)
BEGIN
    INSERT INTO Provincia (
        nombre
    ) VALUES (
        pnombre
    );

    SET out_id = LAST_INSERT_ID();
END; //

DELIMITER ;
