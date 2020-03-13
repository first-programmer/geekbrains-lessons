CREATE DATABASE IF NOT EXISTS `shop`;

USE `shop`;

SET SESSION time_zone = "SYSTEM";

DELIMITER $$

CREATE OR REPLACE PROCEDURE `greatings`()
NOT DETERMINISTIC 
BEGIN 
	DECLARE `hour` INT DEFAULT HOUR(CURRENT_TIME);

	IF (`hour` BETWEEN 6 AND 12) THEN
		SELECT "Доброе утро!";
	ELSEIF (`hour` BETWEEN 12 AND 18) THEN
		SELECT "Добрый день!";
	ELSEIF (`hour` BETWEEN 18 AND 0) THEN
		SELECT "Добрый вечер!";
	ELSE
		SELECT "Доброй ночи!";
	END IF;

END$$

CALL greatings(); 