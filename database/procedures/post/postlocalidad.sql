DELIMITER //

DROP PROCEDURE IF EXISTS POSTLOCALIDAD;

CREATE PROCEDURE POSTLOCALIDAD(
    pidDepartamento INT
    ,pcodigo VARCHAR(32)
    ,pnombre VARCHAR(256)
    ,OUT out_id INT)
BEGIN
    INSERT INTO Localidad (
        idDepartamento
        ,codigo
        ,nombre
    ) VALUES (
        pidDepartamento
        ,pcodigo
        ,pnombre
    );

    SET out_id = LAST_INSERT_ID();
END; //

DELIMITER ;
