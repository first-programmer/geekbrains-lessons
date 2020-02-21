/*
 * В базе данных shop и shop_sample присутствуют одни и те же таблицы, учебной базы данных. 
 * Переместите запись id = 1 из таблицы shop.users в таблицу shop_sample.users. 
 * Используйте транзакции.
 */

START TRANSACTION;

INSERT INTO `shop_sample`.`users`
SELECT * FROM `shop`.`users` `su` WHERE `su`.`id` = 1;

COMMIT;

SELECT * FROM `shop_sample`.`users`;