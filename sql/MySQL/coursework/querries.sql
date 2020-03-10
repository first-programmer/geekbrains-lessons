USE `game`;

-- get servers statistics

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

-- get inventory items

SELECT
`c`.`inventory_id`,
`i`.`icon_id`,
`it`.`name` AS "item_type",
`i`.`name`,
`i`.`description`,
`ic`.`rank`,
`ic`.`pdef`,
`ic`.`mdef`,
`ic`.`p_attack`,
`ic`.`m_attack`,
`ic`.`accuracy`,
`ic`.`attack_speed`,
`ic`.`critical_power`,
`ic`.`critical_chance`,
`ic`.`weight`,
`ic`.`cristals_count`,
`ic`.`can_be_broken`,
`ii`.`enchanted`,
`ii`.`equipped`,
`ii`.`count`
FROM `characters` `c`
JOIN `inventory_items` `ii` ON `ii`.`inventory_id` = `c`.`inventory_id`
JOIN `items` `i` ON `ii`.`item_id` = `i`.`id`
JOIN `item_types` `it` ON `i`.`item_type_id` = `it`.`id`
JOIN `item_characteristics` `ic` ON `i`.`item_characteristic_id` = `ic`.`id`
WHERE `c`.`id` = 1;

-- get most popular profession

SELECT
`p`.`name`,
COUNT(`p`.`id`) AS "count"
FROM `characters` `c`
JOIN `professions` `p` ON `c`.`current_profession_id` = `p`.`id`
GROUP BY `p`.`id`;


