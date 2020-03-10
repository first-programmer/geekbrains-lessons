USE `game`;

CREATE OR REPLACE VIEW `servers_stats` (`server_id`, `status`, `players`, `male_count`, `female_count`, `max_lvl`) AS
SELECT
`s`.`id`, 
`s`.`status`, 
COUNT(`c`.`id`) AS `players`, 
COUNT(CASE `c`.`sex` WHEN 'male' THEN 1 END) AS `male_count`, 
COUNT(CASE `c`.`sex` WHEN 'female' THEN 1 END) AS `female_count`, 
MAX(`c`.`lvl`) AS `max_lvl`
FROM `characters` `c`
RIGHT JOIN `servers` `s` ON `c`.`server_id` = `s`.`id`
GROUP BY `s`.`id`; 
