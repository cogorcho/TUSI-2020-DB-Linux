DELIMITER //

DROP PROCEDURE IF EXISTS POSTMAILTEL;

CREATE PROCEDURE POSTMAILTEL(
    pCodigo VARCHAR(32)
    ,pMail VARCHAR(255)
    ,pTelefono VARCHAR(128)
    ,OUT out_id INT)
BEGIN
    INSERT INTO MailTel (
        Codigo
        ,Mail
        ,Telefono
    ) VALUES (
        pCodigo
        ,pMail
        ,pTelefono
    );

    SET out_id = LAST_INSERT_ID();
END; //

DELIMITER ;
