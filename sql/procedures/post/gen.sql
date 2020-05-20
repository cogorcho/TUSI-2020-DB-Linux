DELIMITER //

DROP PROCEDURE IF EXISTS curdemo;

CREATE PROCEDURE curdemo(tabname VARCHAR(32))
BEGIN
    select column_name, upper(data_type), ifnull(character_maximum_length,0) as vclen
    from information_schema.columns 
    where table_name = tabname 
    order by ordinal_position;
END; //

DELIMITER ;

