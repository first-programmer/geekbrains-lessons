DROP DATABASE IF EXISTS `travel`;

CREATE DATABASE `travel`;

USE `travel`;

/*
 * Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
 * Поля from, to и label содержат английские названия городов, поле name — русское. 
 * Выведите список рейсов flights с русскими названиями городов.
 */

CREATE TABLE `cities` (
	`id` SERIAL PRIMARY KEY,
	`label` VARCHAR(255) COMMENT  "Город отправления",
	`name` VARCHAR(255) COMMENT  "Город назначения"
);

INSERT INTO `cities` (`label`, `name`) VALUES 
('Saint-Petersburg', 'Санкт-Петербург'),
('Evansville', 'Эвансвилл'),
('Moscow', 'Москва'),
('Chicago', 'Чикаго'),
('Sietle', 'Сиэтл');

CREATE TABLE `flights` (
	`id` SERIAL PRIMARY KEY,
	`from` BIGINT UNSIGNED COMMENT  "Город отправления",
	`to` BIGINT UNSIGNED COMMENT  "Город назначения",
	CONSTRAINT `fk_fligts-from`
	FOREIGN KEY (`from`) REFERENCES `cities`(`id`),
	CONSTRAINT `fk_fligts-to`
	FOREIGN KEY (`to`) REFERENCES `cities`(`id`)
);

INSERT INTO `flights` (`from`, `to`) VALUES 
(1, 2),
(2, 1),
(1, 4),
(4, 1),
(1, 5),
(5, 1),
(3, 1),
(1, 3);


SELECT
`f`.`id`,
`c1`.`name` as `from`,
`c2`.`name` as `to`
FROM `flights` `f`
JOIN `cities` `c1` ON `f`.`from` = `c1`.`id`
JOIN `cities` `c2` ON `f`.`to` = `c2`.`id`;
