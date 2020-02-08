USE vk;

/*
 * Таблица users была неудачно спроектирована. 
 * Записи created_at и updated_at были заданы типом VARCHAR 
 * и в них долгое время помещались значения в формате "20.10.2017 8:10". 
 * Необходимо преобразовать поля к типу DATETIME, 
 * сохранив введеные ранее значения.
 */

/*
 * syntaxis if exists in alter table statement works just in mariadb
 * in other cases you can use schema to determine if column exists or not.
 */

ALTER TABLE `users` MODIFY IF EXISTS `created_at` varchar(255) NOT NULL;
ALTER TABLE `users` MODIFY IF EXISTS `updated_at` varchar(255) NOT NULL;

ALTER TABLE `users` ADD IF NOT EXISTS `created_at` varchar(255) NOT NULL;
ALTER TABLE `users` ADD IF NOT EXISTS `updated_at` varchar(255) NOT NULL;

UPDATE `users` 
SET `created_at` = '20.10.2017 8:10', `updated_at` = '03.10.2017 12:10';

UPDATE `users`
SET `created_at` = STR_TO_DATE(`created_at`, '%d.%m.%Y %H:%i'), `updated_at` = STR_TO_DATE(`updated_at`, '%d.%m.%Y %H:%i');

SELECT `created_at`, `updated_at` FROM `users`;



