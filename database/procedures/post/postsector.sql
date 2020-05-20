DELIMITER //

DROP PROCEDURE IF EXISTS POSTSECTOR;

CREATE PROCEDURE POSTSECTOR(
    pnombre VARCHAR(256)
    ,OUT out_id INT)
BEGIN
    INSERT INTO Sector (
        nombre
    ) VALUES (
        pnombre
    );

    SET out_id = LAST_INSERT_ID();
END; //

DELIMITER ;
