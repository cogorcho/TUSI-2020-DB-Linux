DELIMITER //

DROP PROCEDURE IF EXISTS POSTTEDNIVESCUELA;

CREATE PROCEDURE POSTTEDNIVESCUELA(
    pidEscuela INT
    ,pidTipoNivel INT
    ,OUT out_id INT)
BEGIN
    INSERT INTO TedNivEscuela (
        idEscuela
        ,idTipoNivel
    ) VALUES (
        pidEscuela
        ,pidTipoNivel
    );

    SET out_id = LAST_INSERT_ID();
END; //

DELIMITER ;
