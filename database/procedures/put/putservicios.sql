DELIMITER //

DROP PROCEDURE IF EXISTS PUTSERVICIOS;

CREATE PROCEDURE PUTSERVICIOS(
     pidTN BIGINT
    ,pCodigo VARCHAR(255)
)
BEGIN
    UPDATE Servicios SET
         idTN = ifnull(pidTN, idTN)
        ,Codigo = ifnull(pCodigo, Codigo)
    WHERE ID = PID;

END; //

DELIMITER ;
