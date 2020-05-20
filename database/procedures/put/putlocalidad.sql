DELIMITER //

DROP PROCEDURE IF EXISTS PUTLOCALIDAD;

CREATE PROCEDURE PUTLOCALIDAD(
     pid INT
    ,pidDepartamento INT
    ,pcodigo VARCHAR(32)
    ,pnombre VARCHAR(256)
)
BEGIN
    UPDATE Localidad SET
         idDepartamento = ifnull(pidDepartamento, idDepartamento)
        ,codigo = ifnull(pcodigo, codigo)
        ,nombre = ifnull(pnombre, nombre)
    WHERE ID = PID;

END; //

DELIMITER ;
