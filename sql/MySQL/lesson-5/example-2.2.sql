USE vk;

/* 
 * Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
 * Следует учесть, что необходимы дни недели текущего года, а не года рождения.
 */

SELECT 
DATE_FORMAT(`p`.`birthday`, '%a') as `weekday`, -- DAYNAME(`p`.`birthday`)
COUNT(DATE_FORMAT(`p`.`birthday`, '%a')) as `count_birthday`
FROM `users` `u`
JOIN `profiles` `p` ON `u`.`id` = `p`.`user_id`
GROUP BY `weekday`
ORDER BY WEEKDAY(`p`.`birthday`);

-- For test uncomment following code
/*
SELECT DAYNAME(`p`.`birthday`)
FROM `users` `u`
JOIN `profiles` `p` ON `u`.`id` = `p`.`user_id`
WHERE DAYNAME(`p`.`birthday`) = "Monday";
*/

