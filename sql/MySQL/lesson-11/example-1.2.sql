USE `shop`;

/**
 * Создайте SQL-запрос, который помещает в таблицу users миллион записей.
 */

DROP TABLE IF EXISTS `users_semple`;
CREATE TABLE `users_semple` LIKE `users`;

-- Disable autocommit to prevent dublicate entry id for insert in example
SET AUTOCOMMIT = 0;

START TRANSACTION;

INSERT INTO `users_semple`(`name`, `birthday_at`)
SELECT
`u1`.`name`, 
`u1`.`birthday_at`
FROM `users` AS `u1`
JOIN `users` AS `u2`
JOIN `users` AS `u3`
JOIN `users` AS `u4`
JOIN `users` AS `u5`
JOIN `users` AS `u6`;

SELECT COUNT(*) FROM `users_semple` LIMIT 100;

ROLLBACK;

SET AUTOCOMMIT = 1;