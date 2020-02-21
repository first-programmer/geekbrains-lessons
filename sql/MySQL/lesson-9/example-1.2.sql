USE `shop`;

/**
 * Создайте представление, которое выводит название name товарной позиции
 *  из таблицы products и соответствующее название каталога name из таблицы catalogs.
 */

CREATE OR REPLACE VIEW `products_catalogs_names` AS
SELECT 
`p`.`name` AS 'product_name', 
`c`.`name` AS 'catalog_name'
FROM `products` `p`
JOIN `catalogs` `c` ON `p`.`catalog_id` = `c`.`id`;

SELECT * FROM `products_catalogs_names`;