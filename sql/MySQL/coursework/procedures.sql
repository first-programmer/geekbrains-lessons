USE `game`;

DELIMITER $$

CREATE OR REPLACE PROCEDURE `create_accounts`(IN user_id BIGINT, IN admin_id BIGINT)
NOT DETERMINISTIC
BEGIN
	IF (user_id IS NOT NULL AND user_id > 0) THEN 
		INSERT INTO `accounts` SET `user_id` = user_id;
	ELSEIF (admin_id IS NOT NULL AND admin_id > 0) THEN
		INSERT INTO `accounts` SET `admin_id` = admin_id;
	END IF;
END$$

CREATE OR REPLACE PROCEDURE `insert_profession_base_stats`()
NOT DETERMINISTIC
BEGIN
	DECLARE start_profession_id BIGINT DEFAULT 1;
	DECLARE start_lvl TINYINT(3) DEFAULT 1;
	DECLARE start_health SMALLINT(4) DEFAULT 100;
	DECLARE start_mp SMALLINT(4) DEFAULT 100;
	DECLARE start_cp SMALLINT(4) DEFAULT 100;
	DECLARE start_pdef SMALLINT(4) DEFAULT 100;
	DECLARE start_mdef SMALLINT(4) DEFAULT 100;
	DECLARE start_p_attack SMALLINT(4) DEFAULT 100;
	DECLARE start_m_attack SMALLINT(4) DEFAULT 100;
	DECLARE start_accuracy SMALLINT(4) DEFAULT 100;
	DECLARE start_attack_speed SMALLINT(4) DEFAULT 150;
	DECLARE start_critical_power SMALLINT(4) DEFAULT 100;
	DECLARE start_critical_chance SMALLINT(4) DEFAULT 150;
	DECLARE start_speed SMALLINT(4) DEFAULT 120;
	DECLARE start_weight_limit MEDIUMINT(5) DEFAULT 40000;

	SET @max_profession_id = (SELECT MAX(`id`) FROM `professions`);
	
	cycle3: WHILE (start_lvl <= 85) DO 
		INSERT INTO `profession_base_stats`(
		`profession_id`,
		`lvl`,
		`health`,
		`mp`,
		`cp`,
		`pdef`,
		`mdef`,
		`p_attack`,
		`m_attack`,
		`accuracy`,
		`attack_speed`,
		`critical_power`,
		`critical_chance`,
		`speed`,
		`weight_limit`
		) VALUES (
			start_profession_id,
			start_lvl, 
			start_health, 
			start_mp, 
			start_cp, 
			start_pdef, 
			start_mdef,
			start_p_attack, 
			start_m_attack, 
			start_accuracy, 
			start_attack_speed, 
			start_critical_power, 
			start_critical_chance, 
			start_speed, 
			start_weight_limit
		);
		
		IF (start_lvl = 85 AND start_profession_id = @max_profession_id) THEN 
			LEAVE cycle3;
		ELSEIF (start_lvl != 85) THEN
			SET start_lvl = start_lvl + 1; 
			SET start_health = start_health + 50; 
			SET start_mp = start_mp + 50; 
			SET start_cp = start_cp + 40; 
			SET start_pdef = start_pdef + 10; 
			SET start_mdef = start_mdef + 10;
			SET start_p_attack = start_p_attack + 10; 
			SET start_m_attack = start_m_attack + 10; 
			SET start_accuracy = start_accuracy + 1; 
			SET start_attack_speed = start_attack_speed + 1; 
			SET start_critical_power = start_critical_power + 3; 
			SET start_critical_chance = start_critical_chance + 1;
			SET start_speed = start_speed + 1; 
			SET start_weight_limit = start_weight_limit + 44;
		ELSEIF (start_lvl = 85) THEN
			SET start_profession_id = start_profession_id + 1;
			SET start_lvl = 1; 
			SET start_health = 100; 
			SET start_mp = 100; 
			SET start_cp = 100; 
			SET start_pdef = 100; 
			SET start_mdef = 100;
			SET start_p_attack = 100; 
			SET start_m_attack = 100; 
			SET start_accuracy = 100; 
			SET start_attack_speed = 150;
			SET start_critical_power = 100; 
			SET start_critical_chance = 150; 
			SET start_speed = 120;
			SET start_weight_limit = 40000;
		END IF;
	END WHILE cycle3;
END$$

CREATE OR REPLACE PROCEDURE `insert_profession_skills`()
NOT DETERMINISTIC
BEGIN
	DECLARE start_profession_id BIGINT DEFAULT 1;
	DECLARE start_skill_id TINYINT(3) DEFAULT 1;
	
	SET @max_profession_id = (SELECT MAX(`id`) FROM `professions`);
	SET @max_skill_id = (SELECT MAX(`id`) FROM `skills`);
	
	cycle3: WHILE (start_profession_id <= max_profession_id) DO 
		cycle5: WHILE (start_skill_id <= max_skill_id) DO 
			INSERT INTO `profession_skills`(`profession_id`, `skill_id`) VALUES 
			(start_profession_id, start_skill_id);
			
			SET @skill_id = skill_id + 1;
		END WHILE cycle5;
		SET @start_profession_id = start_profession_id + 1;
	END WHILE cycle3;
END$$




