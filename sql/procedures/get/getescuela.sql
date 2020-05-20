DELIMITER //

/*
    Escuela:
        Si LOCID es -1 filtra y PCIAID es -1 filter por EID
        Si LOCID es -1 y EID es -1 filtra por PCIAID
        SI EID es -1 y PCIAID es -1 filtra por LOCIS
        Si los 3 son -1 trae toda la tabla

        Ojo>: Hay muchas escuelas:

*/

DROP PROCEDURE IF EXISTS GETESCUELA;

CREATE PROCEDURE GETESCUELA(IN EID INT, IN LOCID INT, IN PCIAID INT)
BEGIN
    SELECT 
        E.ID          
        ,E.IDLOCALIDAD AS IDLOCALIDAD
        ,L.NOMBRE AS NOMBRELOCALIDAD
        ,E.IDSECTOR AS IDSECTOR
        ,S.NOMBRE  AS NOMBRESECTOR
        ,E.IDAMBITO AS IDAMBITO
        ,A.NOMBRE   AS NOMBREAMBITO
        ,P.ID AS IDPROVINCIA
        ,P.NOMBRE AS NOMBREPROVINCIA
        ,E.CODIGO   
        ,E.NOMBRE     
        ,E.DOMICILIO  
        ,E.CODPOS
        ,MT.TELEFONO
        ,MT.MAIL   
    FROM Escuela E
    INNER JOIN Sector S
        ON S.ID = E.IDSECTOR
    INNER JOIN Ambito A
        ON A.ID = E.IDSECTOR 
    LEFT JOIN MailTel MT 
        ON MT.ID = E.ID
    INNER JOIN Localidad L 
        ON L.ID = CASE WHEN LOCID != -1 AND EID = -1 THEN LOCID ELSE L.ID END
        AND E.IDLOCALIDAD = L.ID
    INNER JOIN Departamento D
        ON D.ID = L.IDDEPARTAMENTO
    INNER JOIN Provincia P
        ON P.ID = CASE WHEN PCIAID != -1 THEN PCIAID ELSE P.ID END
        AND D.IDPROVINCIA = P.ID
    WHERE E.ID = CASE WHEN EID != -1 THEN EID ELSE E.ID END;
END //

DELIMITER ;