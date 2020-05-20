DELIMITER //

DROP PROCEDURE IF EXISTS GETSECTOR;

CREATE PROCEDURE GETSECTOR(PCIAID INT)
BEGIN
    IF PCIAID = -1 THEN
        SELECT ID, NOMBRE FROM Sector ORDER BY NOMBRE;
    ELSE
        SELECT ID, NOMBRE FROM Sector WHERE ID = PCIAID;
    END IF;
END //

DELIMITER ;