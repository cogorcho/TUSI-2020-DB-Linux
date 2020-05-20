DELIMITER //

DROP IF EXISTS GETMAILTEL;

CREATE PROCEDURE GETMAILTEL(IN EID INT)
BEGIN
    SELECT
        id
        ,Codigo
        ,Mail
        ,Telefono
    FROM $i
    WHERE ID = EID;
END; //

DELIMITER ;
