drop user if exists 'tusi3'@'localhost';
drop user if exists 'tusi3'@'%';
create user 'tusi3'@'localhost' identified by 'tusi3-2020';
create user 'tusi3'@'%' identified by 'tusi3-2020';
grant all privileges on tusi3.* to 'tusi3'@'%' identified by 'tusi3-2020';
grant all privileges on tusi3.* to 'tusi3'@'localhost' identified by 'tusi3-2020';
flush privileges;
