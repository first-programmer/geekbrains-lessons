USE vk;

/*
 * Подсчитайте произведение чисел в столбце таблицы
 */

DROP TABLE IF EXISTS `storehouse_products`;

CREATE TABLE `storehouse_products` (
	`id` SERIAL PRIMARY KEY,
	`name` VARCHAR(255) NOT NULL UNIQUE,
	`count` BIGINT NOT NULL DEFAULT 0
);

INSERT INTO `storehouse_products` (`name`, `count`)
VALUES 
('Name 1', 1),
('Name 2', 2),
('Name 3', 3),
('Name 4', 4),
('Name 5', 5);

-- Сам бы вряд ли догадался, так как давно алгеброй не занимался, интерент помог.

SELECT 
EXP(SUM(LOG(`count`))) as `*`
FROM `storehouse_products`;
