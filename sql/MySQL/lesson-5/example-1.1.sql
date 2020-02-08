USE vk;

/*
 * Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
 */

ALTER TABLE `users`
ADD `created_at` datetime NOT NULL,
ADD `updated_at` datetime NOT NULL;

UPDATE `users` SET `created_at` = NOW(), `updated_at` = NOW();

-- Or you can do something like this

/*
ALTER TABLE `users`
DROP `created_at`,
DROP `updated_at`;

ALTER TABLE `users`
ADD `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

UPDATE `users` SET `created_at` = DEFAULT, `updated_at` = DEFAULT;
*/
