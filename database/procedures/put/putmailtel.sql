DELIMITER //

DROP PROCEDURE IF EXISTS PUTMAILTEL;

CREATE PROCEDURE PUTMAILTEL(
     pid INT
    ,pCodigo VARCHAR(32)
    ,pMail VARCHAR(255)
    ,pTelefono VARCHAR(128)
)
BEGIN
    UPDATE MailTel SET
         Codigo = ifnull(pCodigo, Codigo)
        ,Mail = ifnull(pMail, Mail)
        ,Telefono = ifnull(pTelefono, Telefono)
    WHERE ID = PID;

END; //

DELIMITER ;
