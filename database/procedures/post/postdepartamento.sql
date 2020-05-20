DELIMITER //

DROP PROCEDURE IF EXISTS POSTDEPARTAMENTO;

CREATE PROCEDURE POSTDEPARTAMENTO(
    pidProvincia INT
    ,pnombre VARCHAR(256)
    ,OUT out_id INT)
BEGIN
    INSERT INTO Departamento (
        idProvincia
        ,nombre
    ) VALUES (
        pidProvincia
        ,pnombre
    );

    SET out_id = LAST_INSERT_ID();
END; //

DELIMITER ;
