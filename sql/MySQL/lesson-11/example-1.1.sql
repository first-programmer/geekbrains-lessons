USE `shop`;

/**
 * Создайте таблицу logs типа Archive. 
 * Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается время
 * и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.
 */

DROP TABLE IF EXISTS `log`;

-- In mariadm by default not installed plugin archive
-- so you can use install plugin archive soname "ha_archive.so" statement
-- to install plugin and show plugins or show engines to see installed engines.
CREATE TABLE `log` (
	`tablename` VARCHAR(25) NOT NULL COMMENT "Таблица",
	`id` BIGINT UNSIGNED NOT NULL COMMENT "ID",
	`name` VARCHAR(255) NOT NULL COMMENT "Название",
	`created_at` DATETIME  NOT NULL DEFAULT NOW() COMMENT "Создано в"
) COMMENT = "Журнал магазига" ENGINE=archive;

DROP TRIGGER IF EXISTS `users_AFTER_INSERT`;
DROP TRIGGER IF EXISTS `catalogs_AFTER_INSERT`;
DROP TRIGGER IF EXISTS `products_AFTER_INSERT`;

DELIMITER #

CREATE TRIGGER `users_AFTER_INSERT`
AFTER INSERT 
ON `users`
FOR EACH ROW 
BEGIN 
	INSERT INTO `log` (`tablename`, `id`, `name`, `created_at`) 
	VALUES ("users", NEW.`id`, NEW.`name`, NEW.`created_at`);
END#

DELIMITER #

CREATE TRIGGER `catalogs_AFTER_INSERT`
AFTER INSERT 
ON `catalogs`
FOR EACH ROW 
BEGIN 
	INSERT INTO `log`(`tablename`, `id`, `name`) 
	VALUES ("catalogs", NEW.`id`, NEW.`name`);
END#

DELIMITER #

CREATE TRIGGER `products_AFTER_INSERT`
AFTER INSERT 
ON `products`
FOR EACH ROW 
BEGIN 
	INSERT INTO `log`(`tablename`, `id`, `name`, `created_at`) 
	VALUES ("products", NEW.`id`, NEW.`name`, NEW.`created_at`);
END#

DELIMITER ;

-- Disable autocommit to prevent dublicate entry id for insert in example
SET AUTOCOMMIT = 0;

INSERT INTO `users`(`name`, `birthday_at`) 
VALUES ("Name", "1990-10-05");

INSERT INTO `catalogs`(`name`)  
VALUES ("Monitors");
	
INSERT INTO `products`(`name`, `description`, `price`, `catalog_id`) 
VALUES ("Mitsubishi", "One of the best monitors", 9798, 6);

SELECT * FROM `log`;
ROLLBACK;

SET AUTOCOMMIT = 1;


