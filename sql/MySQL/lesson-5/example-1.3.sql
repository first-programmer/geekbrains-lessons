USE vk;

/*
 * В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры:
 * 0, если товар закончился и выше нуля, если на складе имеются запасы. 
 * Необходимо отсортировать записи таким образом, 
 * чтобы они выводились в порядке увеличения значения value. 
 * Однако, нулевые запасы должны выводиться в конце, после всех записей.
 */

DROP TABLE IF EXISTS `storehouse_products`;

CREATE TABLE `storehouse_products` (
	`id` SERIAL PRIMARY KEY,
	`name` VARCHAR(255) NOT NULL UNIQUE,
	`count` BIGINT NOT NULL DEFAULT 0
);

INSERT INTO `storehouse_products` (`name`, `count`)
VALUES 
('Name 1', 50),
('Name 2', 70),
('Name 3', 80),
('Name 4', 20),
('Name 5', 30),
('Name 6', 30),
('Name 7', 0),
('Name 8', 10),
('Name 9', 0),
('Name 10', 90);

-- You can use this sintaxis or use union. Also if you know value of max count, you may use it instead inner select.

SELECT *
FROM `storehouse_products`
ORDER BY
CASE `count` 
WHEN 0 THEN (SELECT max(`count`) +1 FROM `storehouse_products`) ELSE `count` 
END;
