DELIMITER //

/*
    Localidad:
        Si LOCID es != -1 filtra por LOCID, ignore PCIAID
        Si LOCID es -1 filtro por PCIAID
        Si los 2 son -1 trae toda la tabla

        Ojo>: Hay muchas localidades x pcia:
        Bs As: 1149 (Es mucho para un combo)
*/

DROP PROCEDURE IF EXISTS GETLOCALIDAD;

CREATE PROCEDURE GETLOCALIDAD(IN LOCID INT, IN PCIAID INT)
BEGIN
    SELECT 
        L.ID
        , P.ID AS IDPROVINCIA
        , P.NOMBRE AS NOMBREPROVINCIA
        , L.CODIGO
        , L.NOMBRE 
    FROM Localidad L
    INNER JOIN Departamento D
        ON D.ID = L.IDDEPARTAMENTO
    INNER JOIN Provincia P
        ON P.ID = CASE WHEN PCIAID = -1 THEN P.ID
                        WHEN LOCID != -1 THEN P.ID 
                ELSE PCIAID END
        AND D.IDPROVINCIA = P.ID
    WHERE L.ID = CASE WHEN LOCID = -1 THEN L.ID ELSE LOCID END;

END //

DELIMITER ;

