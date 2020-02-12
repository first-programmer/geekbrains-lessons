USE `storage`;

/*
 * Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
 */

SELECT `u`.`id` 
FROM `users` `u`
JOIN `orders` `o` ON `u`.`id` = `o`.`user_id`
GROUP BY `u`.`id`;