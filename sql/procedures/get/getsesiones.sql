DELIMITER //

DROP PROCEDURE IF EXISTS GETSESIONES;

CREATE PROCEDURE GETSESIONES()
BEGIN
    SELECT ID,USER,HOST,DB,COMMAND,TIME,STATE,INFO FROM INFORMATION_SCHEMA.PROCESSLIST;
END //

DELIMITER ;