USE `storage`;

/*
 * Выведите список товаров products и разделов catalogs, который соответствует товару.
 */

SELECT 
`p`.`name` as `product`, 
`c`.`name` as `catalog`
FROM `products` `p`
JOIN `catalogs` `c` ON `p`.`catalog_id` = `c`.`id`; 