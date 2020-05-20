DELIMITER //

DROP PROCEDURE IF EXISTS PUTTEDNIVESCUELA;

CREATE PROCEDURE PUTTEDNIVESCUELA(
     pid INT
    ,pidEscuela INT
    ,pidTipoNivel INT
)
BEGIN
    UPDATE TedNivEscuela SET
         idEscuela = ifnull(pidEscuela, idEscuela)
        ,idTipoNivel = ifnull(pidTipoNivel, idTipoNivel)
    WHERE ID = PID;

END; //

DELIMITER ;