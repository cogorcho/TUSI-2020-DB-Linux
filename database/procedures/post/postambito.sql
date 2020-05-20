DELIMITER //

DROP PROCEDURE IF EXISTS POSTAMBITO;

CREATE PROCEDURE POSTAMBITO(
    pnombre VARCHAR(256)
    ,OUT out_id INT)
BEGIN
    INSERT INTO Ambito (
        nombre
    ) VALUES (
        pnombre
    );

    SET out_id = LAST_INSERT_ID();
END; //

DELIMITER ;
