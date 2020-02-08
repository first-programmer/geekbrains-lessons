USE vk;

/*
 * Подсчитайте средний возраст пользователей в таблице users
 */

SELECT AVG(TIMESTAMPDIFF(year, `p`.`birthday`, NOW())) as `avg_age`
FROM `users` `u`
JOIN `profiles` `p` ON `u`.`id` = `p`.`user_id`
