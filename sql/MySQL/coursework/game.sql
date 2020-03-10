CREATE DATABASE IF NOT EXISTS `game`;

USE `game`;

CREATE TABLE IF NOT EXISTS `photos` (
	`id` SERIAL PRIMARY KEY,
	`name` VARCHAR(255) NOT NULL COMMENT "Название",
	`mime_type` ENUM("image/jpeg", "image/png", "image/gif") NOT NULL COMMENT "Тип",
	`ext` ENUM("jpeg", "png", "gif") NOT NULL COMMENT "Расширение",
	`size` int(10) NOT NULL COMMENT "Размер в кб",
	`hash` varchar(255) NOT NULL COMMENT "Хеш сервиса",
	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в"
) COMMENT "Фотографии";

DROP TABLE IF EXISTS `icons`;

CREATE TABLE IF NOT EXISTS `icons` (
	`id` SERIAL PRIMARY KEY,
	`name` VARCHAR(255) NOT NULL COMMENT "Название",
	`mime_type` ENUM("image/jpeg", "image/png", "image/gif") NOT NULL COMMENT "Тип",
	`ext` ENUM("jpeg", "png", "gif") NOT NULL COMMENT "Расширение",
	`size` int(10) NOT NULL COMMENT "Размер в кб",
	`hash` varchar(255) NOT NULL COMMENT "Хеш сервиса",
	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в"
) COMMENT "Изображения";

CREATE TABLE IF NOT EXISTS `user_profiles` (
	`id` SERIAL PRIMARY KEY,
	`firstname` VARCHAR(50) NULL COMMENT "Имя",
	`lastname` VARCHAR(50) NULL COMMENT "Фамилия",
	`middelname` VARCHAR(50) NULL COMMENT "Отчество",
	`phone_number` VARCHAR(25) NULL COMMENT "Телефон",
	`about_me` TEXT NULL COMMENT "Обо мне",
	`photo_id` BIGINT UNSIGNED NULL COMMENT "Фотография профиля",
	`birthday` DATETIME NULL COMMENT "День рождения",
	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в",
	UNIQUE (`phone_number`),
	
	CONSTRAINT `fk_user_profiles-photo_id`
	FOREIGN KEY (`photo_id`) REFERENCES `photos`(`id`)
) COMMENT "Профили пользователей";

CREATE TABLE IF NOT EXISTS `admin_profiles` (
	`id` SERIAL PRIMARY KEY,
	`firstname` VARCHAR(50) NULL COMMENT "Имя",
	`lastname` VARCHAR(50) NULL COMMENT "Фамилия",
	`middelname` VARCHAR(50) NULL COMMENT "Отчество",
	`phone_number` VARCHAR(25) NULL COMMENT "Телефон",
	`about_me` TEXT NULL COMMENT "Обо мне",
	`photo_id` BIGINT UNSIGNED NULL COMMENT "Фотография профиля",
	`birthday` DATETIME NULL COMMENT "День рождения",
	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в",
	UNIQUE (`phone_number`),
	
	CONSTRAINT `fk_admin_profiles-photo_id`
	FOREIGN KEY (`photo_id`) REFERENCES `photos`(`id`)
) COMMENT "Профили администраторов";

CREATE TABLE IF NOT EXISTS `users` (
	`id` SERIAL PRIMARY KEY,
  	`username` VARCHAR(255) NOT NULL COMMENT "Логин",
  	`auth_key` VARCHAR(32) NOT NULL COMMENT "Ключ авторизации",
  	`password_hash` VARCHAR(255) NOT NULL COMMENT "Хеш пароля",
  	`password_reset_token` VARCHAR(255) DEFAULT NULL COMMENT "Токен восстановления пароля",
  	`verification_token` VARCHAR(255) DEFAULT NULL COMMENT "Токен верификации",
  	`email` VARCHAR(255) NOT NULL COMMENT "Email",
  	`profile_id` BIGINT UNSIGNED NOT NULL,
  	`status` ENUM("approved", "not approved", "blocked") NOT NULL DEFAULT "not approved" COMMENT "Статус",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в",
  	UNIQUE KEY `username` (`username`),
  	UNIQUE KEY `email` (`email`),
  	UNIQUE KEY `password_reset_token` (`password_reset_token`),
  	
  	CONSTRAINT `fk_users-profile_id`
  	FOREIGN KEY (`profile_id`) REFERENCES `user_profiles`(`id`)
) COMMENT "Пользователи";

CREATE TABLE IF NOT EXISTS `admins` (
	`id` SERIAL PRIMARY KEY,
  	`username` VARCHAR(255) NOT NULL COMMENT "Логин",
  	`auth_key` VARCHAR(32) NOT NULL COMMENT "Ключ авторизации",
  	`password_hash` VARCHAR(255) NOT NULL COMMENT "Хеш пароля",
  	`password_reset_token` VARCHAR(255) DEFAULT NULL COMMENT "Токен восстановления пароля",
  	`verification_token` VARCHAR(255) DEFAULT NULL COMMENT "Токен верификации",
  	`email` VARCHAR(255) NOT NULL COMMENT "Email",
  	`profile_id` BIGINT UNSIGNED NOT NULL,
  	`status` ENUM("approved", "not approved", "blocked") NOT NULL DEFAULT "not approved" COMMENT "Статус",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в",
  	UNIQUE KEY `username` (`username`),
  	UNIQUE KEY `email` (`email`),
  	UNIQUE KEY `password_reset_token` (`password_reset_token`),
  	
  	CONSTRAINT `fk_admins-profile_id`
  	FOREIGN KEY (`profile_id`) REFERENCES `admin_profiles`(`id`)
) COMMENT "Администраторы";

CREATE TABLE IF NOT EXISTS `accounts` (
	`id` SERIAL PRIMARY KEY,
  	`user_id` BIGINT UNSIGNED NULL COMMENT "Пользователь",
  	`admin_id` BIGINT UNSIGNED NULL COMMENT "Администратор",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в",
  	UNIQUE (`user_id`),
  	UNIQUE (`admin_id`),
  	CONSTRAINT `fk_accounts-user_id`
  	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
  	
  	CONSTRAINT `fk_accounts-admin_id`
  	FOREIGN KEY (`admin_id`) REFERENCES `admins`(`id`)
) COMMENT "Аккаунты";

CREATE TABLE IF NOT EXISTS `servers` (
	`id` SERIAL PRIMARY KEY,
	`name` VARCHAR(50) NOT NULL COMMENT "Название",
	`status` ENUM("active", "down") NOT NULL DEFAULT "active" COMMENT "Статус",
	`description` TEXT NULL COMMENT "Описание",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в"
) COMMENT "Серверы";

CREATE TABLE IF NOT EXISTS `skills` (
	`id` SERIAL PRIMARY KEY,
	`name` VARCHAR(25) NOT NULL COMMENT "Название",
	`description` VARCHAR(300) NOT NULL COMMENT "Описание",
	`mp_cost` TINYINT(3) NOT NULL DEFAULT 0  COMMENT "Стоимость использования",
	`reuse_time` MEDIUMINT (3) NOT NULL DEFAULT 1  COMMENT "Время отката в секундах",
	`icon_id` BIGINT UNSIGNED NOT NULL COMMENT "Изображение",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в",
  	CONSTRAINT `fk_skills-icon_id`
  	FOREIGN KEY (`icon_id`) REFERENCES `icons`(`id`)
) COMMENT "Навыки персонажей";

CREATE TABLE IF NOT EXISTS `races` (
	`id` SERIAL PRIMARY KEY,
	`name` VARCHAR(30) NOT NULL COMMENT "Название",
	`description` VARCHAR(300) NOT NULL COMMENT "Название",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в"
) COMMENT "Расы";

CREATE TABLE IF NOT EXISTS `professions` (
	`id` SERIAL PRIMARY KEY,
	`name` VARCHAR(30) NOT NULL COMMENT "Название",
	`description` VARCHAR(300) NOT NULL COMMENT "Описание",
	`parent_id` BIGINT UNSIGNED NULL COMMENT "Профессия",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в",
  	CONSTRAINT `fk_professions-parent_id`
  	FOREIGN KEY (`parent_id`) REFERENCES `professions`(`id`)
) COMMENT "Профессии";

CREATE TABLE IF NOT EXISTS `profession_skills` (
	`id` SERIAL PRIMARY KEY,
	`profession_id` BIGINT UNSIGNED NULL COMMENT "Профессия",
	`skill_id` BIGINT UNSIGNED NULL COMMENT "Умение",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в",
  	CONSTRAINT `fk_profession_skills-profession_id`
  	FOREIGN KEY (`profession_id`) REFERENCES `professions`(`id`),
  	
  	CONSTRAINT `fk_profession_skills-skill_id`
  	FOREIGN KEY (`skill_id`) REFERENCES `skills`(`id`)
) COMMENT "Уменя профессий";

CREATE TABLE IF NOT EXISTS `characteristics` (
	`id` SERIAL PRIMARY KEY,
	`name` ENUM("str", "con", "dex", "men", "int", "wit") NOT NULL COMMENT "Название",
	`description` VARCHAR(300) NOT NULL COMMENT "Описание",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в"
) COMMENT "Характеристики профессий";

CREATE TABLE IF NOT EXISTS `profession_base_characteristics` (
	`id` SERIAL PRIMARY KEY,
	`profession_id` BIGINT UNSIGNED NOT NULL COMMENT "Профессия",
	`characteristic_id` BIGINT UNSIGNED NOT NULL COMMENT "Характеристика",
	`value` TINYINT(2) UNSIGNED NOT NULL COMMENT "Значение",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в",
  	UNIQUE (`profession_id`, `characteristic_id`),
  	
  	CONSTRAINT `fk_profession_base_characteristics-profession_id`
  	FOREIGN KEY (`profession_id`) REFERENCES `professions`(`id`),
  	
  	CONSTRAINT `fk_profession_base_characteristics-characteristic_id`
  	FOREIGN KEY (`characteristic_id`) REFERENCES `characteristics`(`id`)
) COMMENT "Базовые характеристики профессии";

CREATE TABLE IF NOT EXISTS `profession_base_stats` (
	`id` SERIAL PRIMARY KEY,
	`profession_id` BIGINT UNSIGNED NOT NULL COMMENT "Профессия",
	`lvl` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT "Уровень",
	`health` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 100 COMMENT "Здоровье",
	`mp` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 100 COMMENT "Мана",
	`cp` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 100 COMMENT "Броня",
	`pdef` SMALLINT(5) UNSIGNED NOT NULL COMMENT "Физическая защита",
	`mdef` SMALLINT(5) UNSIGNED NOT NULL COMMENT "Магическа защита",
	`p_attack` SMALLINT(5) UNSIGNED NOT NULL COMMENT "Физическая атака",
	`m_attack` SMALLINT(5) UNSIGNED NOT NULL COMMENT "Магическая атака",
	`accuracy` SMALLINT(3) UNSIGNED NOT NULL COMMENT "Точность",
	`attack_speed` SMALLINT(4) NOT NULL DEFAULT 150 COMMENT "Скорость атаки",
	`critical_power` SMALLINT(4) UNSIGNED NOT NULL COMMENT "Множитель критической атаки",
	`critical_chance` SMALLINT(3) UNSIGNED NOT NULL COMMENT "Шанс критической атаки",
	`speed` SMALLINT(3) UNSIGNED NOT NULL COMMENT "Скорость бега",
	`weight_limit` MEDIUMINT(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT "Вес",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в",
  	UNIQUE (`profession_id`, `lvl`),
  	
  	CONSTRAINT `fk_profession_base_stats-profession_id`
  	FOREIGN KEY (`profession_id`) REFERENCES `professions`(`id`)
) COMMENT "Базовые параметры профессии";

CREATE TABLE IF NOT EXISTS `character_stats` (
	`id` SERIAL PRIMARY KEY,
	`value` LONGTEXT NOT NULL DEFAULT "{}" COMMENT "Параметры",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в"
) COMMENT "Параметры персонажа";

CREATE TABLE IF NOT EXISTS `clans` (
	`id` SERIAL PRIMARY KEY,
	`server_id` BIGINT UNSIGNED NOT NULL COMMENT "Сервер",
	`name` VARCHAR(30) NOT NULL COMMENT "Название",
	`lvl` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT "Уроверь",
	`current_exp` DECIMAL(10, 3) UNSIGNED NOT NULL DEFAULT 0 COMMENT "Текущий опыт",
	`next_lvl_exp` DECIMAL(10, 3) UNSIGNED NOT NULL DEFAULT 1000 COMMENT "Опыт до следующего уровня",
	`icon_id` BIGINT UNSIGNED NOT NULL COMMENT "Изображение",
	`members_count` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT "Игроков в клане",
	`members_max_count` TINYINT(3) NOT NULL DEFAULT 30 COMMENT "Максимум игроков в клане",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в",
  	CONSTRAINT `fk_clans-server_id`
  	FOREIGN KEY (`server_id`) REFERENCES `servers`(`id`),
  	
  	CONSTRAINT `fk_clans-icon_id`
  	FOREIGN KEY (`icon_id`) REFERENCES `icons`(`id`)
) COMMENT "Кланы";

CREATE TABLE IF NOT EXISTS `item_types` (
	`id` SERIAL PRIMARY KEY,
	`name` VARCHAR(30) NOT NULL COMMENT "Название",
	`parent_id` BIGINT UNSIGNED NULL COMMENT "Подтип",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в",
  	UNIQUE (`name`),
  	
  	CONSTRAINT `fk_item_types-parent_id`
  	FOREIGN KEY (`parent_id`) REFERENCES `item_types`(`id`)
) COMMENT "Типы предметов";

CREATE TABLE IF NOT EXISTS `item_characteristics` (
	`id` SERIAL PRIMARY KEY,
	`rank` ENUM("none", "d", "c", "b", "a", "s", "s80", "s84") DEFAULT "none" NOT NULL COMMENT "Ранг",
	`pdef` SMALLINT(3) UNSIGNED NULL COMMENT "Физическая защита",
	`mdef` SMALLINT(3) UNSIGNED NULL COMMENT "Магическа защита",
	`p_attack` SMALLINT(5) UNSIGNED NULL COMMENT "Физическая атака",
	`m_attack` SMALLINT(5) UNSIGNED NULL COMMENT "Магическая атака",
	`accuracy` SMALLINT(2) UNSIGNED NULL COMMENT "Точность",
	`attack_speed` ENUM("slow", "normal", "fast", "very_fast") NULL DEFAULT "normal" COMMENT "Скорость атаки",
	`critical_power` SMALLINT(3) UNSIGNED NULL COMMENT "Множитель критической атаки",
	`critical_chance` SMALLINT(3) UNSIGNED NULL COMMENT "Шанс критической атаки",
	`weight` SMALLINT(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT "Вес",
	`cristals_count` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT "Кристалов при поломке",
	`can_be_broken` SMALLINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT "Может быть сломан",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в"
) COMMENT "Типы предметов";

CREATE TABLE IF NOT EXISTS `items` (
	`id` SERIAL PRIMARY KEY,
	`icon_id` BIGINT UNSIGNED NOT NULL COMMENT "Изображение",
	`item_type_id` BIGINT UNSIGNED NOT NULL COMMENT "Тип",
	`item_characteristic_id` BIGINT UNSIGNED NOT NULL COMMENT "Характеристики предмета",
	`name` VARCHAR(30) NOT NULL COMMENT "Название",
	`description` VARCHAR(300) NOT NULL COMMENT "Описание",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в",
  	UNIQUE (`name`, `item_type_id`),
  	
  	CONSTRAINT `fk_items-icon_id`
  	FOREIGN KEY (`icon_id`) REFERENCES `icons`(`id`),
  	
  	CONSTRAINT `fk_items-item_type_id`
  	FOREIGN KEY (`item_type_id`) REFERENCES `item_types`(`id`),
  	
  	CONSTRAINT `fk_items-item_characteristic_id`
  	FOREIGN KEY (`item_characteristic_id`) REFERENCES `item_characteristics`(`id`)
) COMMENT "Предметы";

CREATE TABLE IF NOT EXISTS `inventories` (
	`id` SERIAL PRIMARY KEY,
	`free_space` TINYINT (3) UNSIGNED NOT NULL DEFAULT 80 COMMENT "Свободно мест",
	`max_space` TINYINT(3) UNSIGNED NOT NULL DEFAULT 80 COMMENT "Максимум мест",
	`free_weight` MEDIUMINT(5) UNSIGNED NOT NULL DEFAULT 55000 COMMENT "Свободный вес",
	`max_weight` MEDIUMINT(5) UNSIGNED NOT NULL DEFAULT 55000 COMMENT "Максимальный вес",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в"
) COMMENT "Инвентари";

CREATE TABLE IF NOT EXISTS `inventory_items` (
	`id` SERIAL PRIMARY KEY,
	`inventory_id` BIGINT UNSIGNED NOT NULL COMMENT "Инвентарь",
	`item_id` BIGINT UNSIGNED NOT NULL COMMENT "Предмет",
	`enchanted` TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT "Уровень заточки",
	`equipped` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT "Одет",
	`count` BIGINT UNSIGNED NOT NULL DEFAULT 1 COMMENT "Количество",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в",
  	CONSTRAINT `fk_inventory_items-inventory_id`
  	FOREIGN KEY (`inventory_id`) REFERENCES `inventories`(`id`),
  	
  	CONSTRAINT `fk_inventory_items-item_id`
  	FOREIGN KEY (`item_id`) REFERENCES `items`(`id`)
) COMMENT "Предметы инвентаря";

CREATE TABLE IF NOT EXISTS `character_warehouses` (
	`id` SERIAL PRIMARY KEY,
	`free_space` TINYINT (3) UNSIGNED NOT NULL DEFAULT 120 COMMENT "Свободно мест",
	`max_space` TINYINT(3) UNSIGNED NOT NULL DEFAULT 120 COMMENT "Максимум мест",
	`free_weight` MEDIUMINT (5) UNSIGNED NOT NULL DEFAULT 90000 COMMENT "Свободный вес",
	`max_weight` MEDIUMINT(5) UNSIGNED NOT NULL DEFAULT 90000 COMMENT "Максимальный вес",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в"
) COMMENT "Склады персонажей";

CREATE TABLE IF NOT EXISTS `characters` (
	`id` SERIAL PRIMARY KEY,
	`account_id` BIGINT UNSIGNED NOT NULL COMMENT "Аккаунт",
	`server_id` BIGINT UNSIGNED NOT NULL COMMENT "Сервер",
	`status` ENUM('active', 'blocked') DEFAULT 'active' NOT NULL COMMENT "Статус",
	`name` VARCHAR(30) NOT NULL COMMENT "Имя",
	`race_id` BIGINT UNSIGNED NOT NULL COMMENT "Раса",
	`sex` ENUM('female', 'male') DEFAULT 'male' NOT NULL COMMENT "Пол",
	`current_profession_id` BIGINT UNSIGNED NOT NULL COMMENT "Профессия",
	`lvl` TINYINT(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT "Уровень",
	`current_exp` DECIMAL(10, 3) UNSIGNED NOT NULL DEFAULT 0 COMMENT "Текущий опыт",
	`next_lvl_exp` DECIMAL(10, 3) UNSIGNED NOT NULL DEFAULT 1000 COMMENT "Опыт до следующего уровня",
	`clan_id` BIGINT UNSIGNED NOT NULL COMMENT "Клан",
	`character_stats_id` BIGINT UNSIGNED NOT NULL COMMENT "Параметры",
	`location_lat` DECIMAL(8, 6) NOT NULL COMMENT "Широта",
	`location_lon` DECIMAL(8, 6) NOT NULL COMMENT "Долгота",
	`inventory_id` BIGINT UNSIGNED NOT NULL COMMENT "Инвентарь",
	`character_warehous_id` BIGINT UNSIGNED NOT NULL COMMENT "Хранилище",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в",
  	UNIQUE (`account_id`, `server_id`, `name`),
  	UNIQUE (`inventory_id`),
  	UNIQUE (`character_warehous_id`),
  	
  	CONSTRAINT `fk_characters-account_id`
  	FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`),
  	
  	CONSTRAINT `fk_characters-server_id`
  	FOREIGN KEY (`server_id`) REFERENCES `servers`(`id`),
  	
  	CONSTRAINT `fk_characters-race_id`
  	FOREIGN KEY (`race_id`) REFERENCES `races`(`id`),
  	
  	CONSTRAINT `fk_characters-current_profession_id`
  	FOREIGN KEY (`current_profession_id`) REFERENCES `professions`(`id`),
  	
  	CONSTRAINT `fk_characters-clan_id`
  	FOREIGN KEY (`clan_id`) REFERENCES `clans`(`id`),
  	
  	CONSTRAINT `fk_characters-character_stats_id`
  	FOREIGN KEY (`character_stats_id`) REFERENCES `character_stats`(`id`),
  	
  	CONSTRAINT `fk_characters-inventory_id`
  	FOREIGN KEY (`inventory_id`) REFERENCES `inventories`(`id`),
  	
  	CONSTRAINT `fk_characters-character_warehous_id`
  	FOREIGN KEY (`character_warehous_id`) REFERENCES `character_warehouses`(`id`)
) COMMENT "Персонажи";

