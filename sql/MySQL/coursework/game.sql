CREATE DATABASE IF NOT EXISTS `game`;

USE `game`;

DROP TABLE IF EXISTS `users`;

CREATE TABLE IF NOT EXISTS `users` (
	`id` SERIAL PRIMARY KEY,
  	`username` VARCHAR(255) NOT NULL COMMENT "Логин",
  	`auth_key` VARCHAR(32) NOT NULL COMMENT "Ключ авторизации",
  	`password_hash` VARCHAR(255) NOT NULL COMMENT "Хеш пароля",
  	`password_reset_token` VARCHAR(255) DEFAULT NULL COMMENT "Токен восстановления пароля",
  	`verification_token` VARCHAR(255) DEFAULT NULL COMMENT "Токен верификации",
  	`email` VARCHAR(255) NOT NULL COMMENT "Email",
  	`profile_id` BIGINT NOT NULL,
  	`status` ENUM("Approved", "Not approved", "Blocked") NOT NULL DEFAULT "Not approved" COMMENT "Статус",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в",
  	UNIQUE KEY `username` (`username`),
  	UNIQUE KEY `email` (`email`),
  	UNIQUE KEY `password_reset_token` (`password_reset_token`),
  	CONSTRAINT `fk_users_profile-profile_id`
  	FOREIGN KEY (`profile_id`) REFERENCES `profiles`(`id`)
) COMMENT "Пользователи";

DROP TABLE IF EXISTS `users`;

CREATE TABLE IF NOT EXISTS `users` (
	`id` SERIAL PRIMARY KEY,
  	`username` VARCHAR(255) NOT NULL COMMENT "Логин",
  	`auth_key` VARCHAR(32) NOT NULL COMMENT "Ключ авторизации",
  	`password_hash` VARCHAR(255) NOT NULL COMMENT "Хеш пароля",
  	`password_reset_token` VARCHAR(255) DEFAULT NULL COMMENT "Токен восстановления пароля",
  	`verification_token` VARCHAR(255) DEFAULT NULL COMMENT "Токен верификации",
  	`email` VARCHAR(255) NOT NULL COMMENT "Email",
  	`profile_id` BIGINT NOT NULL,
  	`status` ENUM("Approved", "Not approved", "Blocked") NOT NULL DEFAULT "Not approved" COMMENT "Статус",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в",
  	UNIQUE KEY `username` (`username`),
  	UNIQUE KEY `email` (`email`),
  	UNIQUE KEY `password_reset_token` (`password_reset_token`),
  	CONSTRAINT `fk_users_profile-profile_id`
  	FOREIGN KEY (`profile_id`) REFERENCES `profiles`(`id`)
) COMMENT "Пользователи";



DROP TABLE IF EXISTS `admins`;

CREATE TABLE IF NOT EXISTS `admins` (
  	`username` VARCHAR(255) NOT NULL COMMENT "Логин",
  	`auth_key` VARCHAR(32) NOT NULL COMMENT "Ключ авторизации",
  	`password_hash` VARCHAR(255) NOT NULL COMMENT "Хеш пароля",
  	`password_reset_token` VARCHAR(255) DEFAULT NULL COMMENT "Токен восстановления пароля",
  	`verification_token` VARCHAR(255) DEFAULT NULL COMMENT "Токен верификации",
  	`email` VARCHAR(255) NOT NULL COMMENT "Email",
  	`profile_id` BIGINT NOT NULL,
  	`status` ENUM("Approved", "Not approved", "Blocked") NOT NULL DEFAULT "Not approved" COMMENT "Статус",
  	`deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT "Удален",
  	`created_at` DATETIME NOT NULL DEFAULT NOW() COMMENT "Создано в",
  	`updated_at` DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW() COMMENT "Обновлено в",
  	UNIQUE KEY `username` (`username`),
  	UNIQUE KEY `email` (`email`),
  	UNIQUE KEY `password_reset_token` (`password_reset_token`),
  	CONSTRAINT `fk_users_profile-profile_id`
  	FOREIGN KEY (`profile_id`) REFERENCES `profiles`(`id`)
) COMMENT "Администраторы";


