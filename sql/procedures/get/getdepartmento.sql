DELIMITER //

/*
    Departamentos:
        Si DEPID es != -1 filtra por DEPID, ignore PCIAID
        Si DEPID es -1 filtro por PCIAID
        Si los 2 son -1 trae toda la tablq
*/
DROP PROCEDURE IF EXISTS GETDEPARTAMENTO;

CREATE PROCEDURE GETDEPARTAMENTO(IN DEPID INT, IN PCIAID INT)
BEGIN
    SELECT 
        D.ID
        , D.IDPROVINCIA AS IDPROVINCIA
        , P.NOMBRE AS NOMBREPROVINCIA
        , D.NOMBRE 
    FROM Departamento D 
    INNER JOIN Provincia P
        ON P.ID = D.IDPROVINCIA
        AND P.ID = CASE WHEN PCIAID = -1 THEN P.ID
                        WHEN DEPID != -1 THEN P.ID 
                ELSE PCIAID END
    WHERE D.ID = CASE WHEN DEPID = -1 THEN D.ID ELSE DEPID END;
END //

DELIMITER ;