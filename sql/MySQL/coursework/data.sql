USE `game`;

-- PHOTOS 

INSERT INTO `photos`(`name`, `mime_type`, `ext`, `size`, `hash`) VALUES
("image1", "image/jpeg", "jpeg", "324324", "jogifjgpowpoqmadlwfewpoeqlbhea"),
("image2", "image/jpeg", "jpeg", "34543", "jogifjgpowpoqmadlwfewpoeqlbhea"),
("image3", "image/png", "png", "12312", "jogifjgpowpoqmadlwfewpoeqlbhea"),
("image4", "image/jpeg", "jpeg", "32432", "jogifjgpowpoqmadlwfewpoeqlbhea"),
("image5", "image/jpeg", "jpeg", "23432423", "jogifjgpowpoqmadlwfewpoeqlbhea"),
("image6", "image/png", "png", "43534", "jogifjgpowpoqmadlwfewpoeqlbhea"),
("image7", "image/jpeg", "jpeg", "43543", "jogifjgpowpoqmadlwfewpoeqlbhea"),
("image8", "image/png", "png", "34534", "jogifjgpowpoqmadlwfewpoeqlbhea"),
("image9", "image/jpeg", "jpeg", "23432", "jogifjgpowpoqmadlwfewpoeqlbhea");

-- ICONS 

INSERT INTO `icons`(`name`, `mime_type`, `ext`, `size`, `hash`) VALUES
("icon1", "image/jpeg", "jpeg", "324324", "jogifjgpowpoqmadlwfewpoeqlbhea"),
("icon2", "image/jpeg", "jpeg", "34543", "jogifjgpowpoqmadlwfewpoeqlbhea"),
("icon3", "image/png", "png", "12312", "jogifjgpowpoqmadlwfewpoeqlbhea"),
("icon4", "image/jpeg", "jpeg", "32432", "jogifjgpowpoqmadlwfewpoeqlbhea"),
("icon5", "image/jpeg", "jpeg", "23432423", "jogifjgpowpoqmadlwfewpoeqlbhea"),
("icon6", "image/png", "png", "43534", "jogifjgpowpoqmadlwfewpoeqlbhea"),
("icon7", "image/jpeg", "jpeg", "43543", "jogifjgpowpoqmadlwfewpoeqlbhea"),
("icon8", "image/png", "png", "34534", "jogifjgpowpoqmadlwfewpoeqlbhea"),
("icon9", "image/jpeg", "jpeg", "23432", "jogifjgpowpoqmadlwfewpoeqlbhea");

-- USERS 

INSERT INTO `users`(`username`, `auth_key`, `password_hash`, `email`, `status`) VALUES
("User1", "jogifjgpowpoqmadlwfewpoeqlbhea", "jogifjgpowpoqmadlwfewpoeqlbhea", "example1@example.local", "approved"),
("User2", "jogifjgpowpoqmadlwfewpoeqlbhea", "jogifjgpowpoqmadlwfewpoeqlbhea", "example2@example.local", "approved"),
("User3", "jogifjgpowpoqmadlwfewpoeqlbhea", "jogifjgpowpoqmadlwfewpoeqlbhea", "example3@example.local", "approved"),
("User4", "jogifjgpowpoqmadlwfewpoeqlbhea", "jogifjgpowpoqmadlwfewpoeqlbhea", "example4@example.local", "approved"),
("User5", "jogifjgpowpoqmadlwfewpoeqlbhea", "jogifjgpowpoqmadlwfewpoeqlbhea", "example5@example.local", "approved");

-- ADMINS 

INSERT INTO `admins`(`username`, `auth_key`, `password_hash`, `email`, `status`) VALUES
("Admin1", "jogifjgpowpoqmadlwfewpoeqlbhea", "jogifjgpowpoqmadlwfewpoeqlbhea", "example1@example.local", "approved"),
("Admin2", "jogifjgpowpoqmadlwfewpoeqlbhea", "jogifjgpowpoqmadlwfewpoeqlbhea", "example2@example.local", "approved"),
("Admin3", "jogifjgpowpoqmadlwfewpoeqlbhea", "jogifjgpowpoqmadlwfewpoeqlbhea", "example3@example.local", "approved"),
("Admin4", "jogifjgpowpoqmadlwfewpoeqlbhea", "jogifjgpowpoqmadlwfewpoeqlbhea", "example4@example.local", "approved"),
("Admin5", "jogifjgpowpoqmadlwfewpoeqlbhea", "jogifjgpowpoqmadlwfewpoeqlbhea", "example5@example.local", "approved");

-- USER_PROFILES 

UPDATE `user_profiles` `p`
JOIN `users` `u` ON `u`.`profile_id` = `p`.`id`
SET 
`firstname` = "firstname1",
`lastname` = "lastname1",
`middelname` = "middelname1",
`phone_number` = "+79992578357",
`about_me` = "Description1",
`photo_id` = 1,
`birthday` = "1990-10-09"
WHERE `u`.`id` = 1;

UPDATE `user_profiles` `p`
JOIN `users` `u` ON `u`.`profile_id` = `p`.`id`
SET 
`firstname` = "firstname2",
`lastname` = "lastname2",
`middelname` = "middelname2",
`phone_number` = "+79993378357",
`about_me` = "Description2",
`photo_id` = 2,
`birthday` = "1989-10-09"
WHERE `u`.`id` = 2;

UPDATE `user_profiles` `p`
JOIN `users` `u` ON `u`.`profile_id` = `p`.`id`
SET 
`firstname` = "firstname3",
`lastname` = "lastname3",
`middelname` = "middelname3",
`phone_number` = "+79997578357",
`about_me` = "Description3",
`photo_id` = 3,
`birthday` = "1998-09-07"
WHERE `u`.`id` = 3;

UPDATE `user_profiles` `p`
JOIN `users` `u` ON `u`.`profile_id` = `p`.`id`
SET 
`birthday` = "2000-10-09"
WHERE `u`.`id` = 4;

UPDATE `user_profiles` `p`
JOIN `users` `u` ON `u`.`profile_id` = `p`.`id`
SET 
`birthday` = "1990-08-10"
WHERE `u`.`id` = 5;

-- ADMIN_PROFILES 

UPDATE `user_profiles` `up`
JOIN `admins` `a` ON `a`.`profile_id` = `up`.`id`
SET 
`firstname` = "firstname1",
`lastname` = "lastname1",
`middelname` = "middelname1",
`phone_number` = "+79993878357",
`about_me` = "Description1",
`photo_id` = 1,
`birthday` = "1990-10-09"
WHERE `a`.`id` = 1;

UPDATE `user_profiles` `up`
JOIN `admins` `a` ON `a`.`profile_id` = `up`.`id`
SET 
`firstname` = "firstname2",
`lastname` = "lastname2",
`middelname` = "middelname2",
`phone_number` = "+79993778357",
`about_me` = "Description2",
`photo_id` = 2,
`birthday` = "1989-10-09"
WHERE `a`.`id` = 2;

UPDATE `user_profiles` `up`
JOIN `admins` `a` ON `a`.`profile_id` = `up`.`id`
SET 
`firstname` = "firstname3",
`lastname` = "lastname3",
`middelname` = "middelname3",
`phone_number` = "+79993578357",
`about_me` = "Description3",
`photo_id` = 3,
`birthday` = "1998-09-07"
WHERE `a`.`id` = 3;

UPDATE `user_profiles` `up`
JOIN `admins` `a` ON `a`.`profile_id` = `up`.`id`
SET 
`birthday` = "2000-10-09"
WHERE `a`.`id` = 4;

UPDATE `user_profiles` `up`
JOIN `admins` `a` ON `a`.`profile_id` = `up`.`id`
SET 
`birthday` = "1990-08-10"
WHERE `a`.`id` = 5;

-- ACCOUNTS 



-- SERVERS 

INSERT INTO `servers`(`name`, `status`, `description`) VALUES
("Phoenix", "active", "Main server"),
("Server1", "down", "Server1"),
("Server2", "active", "Server2"),
("Server3", "active", "Server3"),
("Server4", "active", "Server4");

-- SKILLS 

INSERT INTO `skills`(`name`, `description`, `mp_cost`, `reuse_time`, `icon_id`) VALUES
("Skill1", "Increase pdef to 3000", 30, 300, 1),
("Skill2", "Increase mdef to 3000", 30, 300, 2),
("Skill3", "Increase attak speed to 100", 50, 80, 3),
("Skill4", "Attak all enemies around with power 2500 by phisical attak", 50, 4, 4),
("Skill5", "Increase hp to 3000 for 20 minutes", 90, 1, 5);

-- RACES 

INSERT INTO `races`(`name`, `description`) VALUES
("Orcs", "Interesting description of Orcs."),
("Elves", "Interesting description of Elves."),
("Dwarfs", "Interesting description of Dwarfs."),
("Darck elves", "Interesting description of Darck elves."),
("Humans", "Interesting description of Humans.");


-- PROFESSIONS 

INSERT INTO `professions`(`name`, `description`, `parent_id`) VALUES
("Human fighter", "Interesting description of Human fighter.", DEFAULT),
("Human knight", "Interesting description of Human knight.", 1),
("Humen warrior", "Interesting description of Humen warrior.", 1),
("Humen rogue", "Interesting description of Humen rogue.", 1),
("Human mag", "Interesting description of Human mag.", DEFAULT),
("Human cleric", "Interesting description of Human cleric.", 5),
("Human wizard", "Interesting description of Human wizard.", 5),
("Elve fighter", "Interesting description of Elve fighter.", DEFAULT),
("Elve knight", "Interesting description of Elve knight.", 8),
("Evle warrior", "Interesting description of Evle warrior.", 8),
("Evle rogue", "Interesting description of Evle rogue.", 8),
("Evle mag", "Interesting description of Evle mag.", DEFAULT),
("Elve cleric", "Interesting description of Elve cleric.", 12),
("Evle wizard", "Interesting description of Evle wizard.", 12),
("Dark elve fighter", "Interesting description of Dark elve fighter.", DEFAULT),
("Dark elve knight", "Interesting description of Dark elve knight.", 15),
("Dark elve warrior", "Interesting description of Dark elve warrior.", 15),
("Dark elve rogue", "Interesting description of Dark elve rogue.", 15),
("Dark elve mag", "Interesting description of Dark elve mag.", DEFAULT),
("Dark elve cleric", "Interesting description of Dark elve cleric.", 19),
("Dark elve wizard", "Interesting description of Dark elve wizard.", 19),
("Dwarf fighter", "Interesting description of Dwarf fighter.", DEFAULT),
("Dwarf knight", "Interesting description of Dwarf knight.", 22),
("Dwarf warrior", "Interesting description of Dwarf warrior.", 22),
("Dwarf rogue", "Interesting description of Dwarf rogue.", 22),
("Dwarf mag", "Interesting description of Dwarf mag.", DEFAULT),
("Dwarf cleric", "Interesting description of Dwarf cleric.", 26),
("Dwarf wizard", "Interesting description of Dwarf wizard.", 26),
("Orc fighter", "Interesting description of Orc fighter.", DEFAULT),
("Orc knight", "Interesting description of Orc knight.", 29),
("Orc warrior", "Interesting description of Orc warrior.", 29),
("Orc rogue", "Interesting description of Orc rogue.", 29),
("Orc mag", "Interesting description of Orc mag.", DEFAULT),
("Orc cleric", "Interesting description of Orc cleric.", 33),
("Orc wizard", "Interesting description of Orc wizard.", 33);

-- PROFESSION_SKILLS 

INSERT INTO `profession_skills`(`profession_id`, `skill_id`) 
SELECT `p`.`id`, `s`.`id`
FROM `professions` `p`, `skills` `s`;

-- CHARACTERISTICS 

INSERT INTO `characteristics`(`name`, `description`) VALUES
("str", "Some description of str param."),
("con", "Some description of con param."),
("dex", "Some description of dex param."),
("int", "Some description of int param."),
("wit", "Some description of wit param."),
("men", "Some description of men param.");

-- PROFESSION_BASE_CHARACTERISTICS 

INSERT INTO `profession_base_characteristics`(`profession_id`, `characteristic_id`, `value`) VALUES
(1, 1, 40),
(1, 2, 40),
(1, 3, 40),
(1, 4, 35),
(1, 5, 35),
(1, 6, 35),
(2, 1, 40),
(2, 2, 45),
(2, 3, 35),
(2, 4, 35),
(2, 5, 35),
(2, 6, 35),
(3, 1, 45),
(3, 2, 40),
(3, 3, 35),
(3, 4, 35),
(3, 5, 40),
(3, 6, 30),
(4, 1, 40),
(4, 2, 35),
(4, 3, 45),
(4, 4, 40),
(4, 5, 35),
(4, 6, 35),
(5, 1, 30),
(5, 2, 35),
(5, 3, 40),
(5, 4, 40),
(5, 5, 40),
(5, 6, 40),
(6, 1, 35),
(6, 2, 40),
(6, 3, 35),
(6, 4, 40),
(6, 5, 35),
(6, 6, 45),
(7, 1, 35),
(7, 2, 40),
(7, 3, 35),
(7, 4, 45),
(7, 5, 40),
(7, 6, 35),
(8, 1, 40),
(8, 2, 40),
(8, 3, 40),
(8, 4, 35),
(8, 5, 35),
(8, 6, 35),
(9, 1, 40),
(9, 2, 45),
(9, 3, 35),
(9, 4, 35),
(9, 5, 35),
(9, 6, 35),
(10, 1, 45),
(10, 2, 40),
(10, 3, 35),
(10, 4, 35),
(10, 5, 40),
(10, 6, 30),
(11, 1, 40),
(11, 2, 35),
(11, 3, 45),
(11, 4, 40),
(11, 5, 35),
(11, 6, 35),
(12, 1, 30),
(12, 2, 35),
(12, 3, 40),
(12, 4, 40),
(12, 5, 40),
(12, 6, 40),
(13, 1, 35),
(13, 2, 40),
(13, 3, 35),
(13, 4, 40),
(13, 5, 35),
(13, 6, 45),
(14, 1, 35),
(14, 2, 40),
(14, 3, 35),
(14, 4, 45),
(14, 5, 40),
(14, 6, 35),
(15, 1, 40),
(15, 2, 40),
(15, 3, 40),
(15, 4, 35),
(15, 5, 35),
(15, 6, 35),
(16, 1, 40),
(16, 2, 45),
(16, 3, 35),
(16, 4, 35),
(16, 5, 35),
(16, 6, 35),
(17, 1, 45),
(17, 2, 40),
(17, 3, 35),
(17, 4, 35),
(17, 5, 40),
(17, 6, 30),
(18, 1, 40),
(18, 2, 35),
(18, 3, 45),
(18, 4, 40),
(18, 5, 35),
(18, 6, 35),
(19, 1, 30),
(19, 2, 35),
(19, 3, 40),
(19, 4, 40),
(19, 5, 40),
(19, 6, 40),
(20, 1, 35),
(20, 2, 40),
(20, 3, 35),
(20, 4, 40),
(20, 5, 35),
(20, 6, 45),
(21, 1, 35),
(21, 2, 40),
(21, 3, 35),
(21, 4, 45),
(21, 5, 40),
(21, 6, 35),
(22, 1, 40),
(22, 2, 40),
(22, 3, 40),
(22, 4, 35),
(22, 5, 35),
(22, 6, 35),
(23, 1, 40),
(23, 2, 45),
(23, 3, 35),
(23, 4, 35),
(23, 5, 35),
(23, 6, 35),
(24, 1, 45),
(24, 2, 40),
(24, 3, 35),
(24, 4, 35),
(24, 5, 40),
(24, 6, 30),
(25, 1, 40),
(25, 2, 35),
(25, 3, 45),
(25, 4, 40),
(25, 5, 35),
(25, 6, 35),
(26, 1, 30),
(26, 2, 35),
(26, 3, 40),
(26, 4, 40),
(26, 5, 40),
(26, 6, 40),
(27, 1, 35),
(27, 2, 40),
(27, 3, 35),
(27, 4, 40),
(27, 5, 35),
(27, 6, 45),
(28, 1, 35),
(28, 2, 40),
(28, 3, 35),
(28, 4, 45),
(28, 5, 40),
(28, 6, 35),
(29, 1, 40),
(29, 2, 40),
(29, 3, 40),
(29, 4, 35),
(29, 5, 35),
(29, 6, 35),
(30, 1, 40),
(30, 2, 45),
(30, 3, 35),
(30, 4, 35),
(30, 5, 35),
(30, 6, 35),
(31, 1, 45),
(31, 2, 40),
(31, 3, 35),
(31, 4, 35),
(31, 5, 40),
(31, 6, 30),
(32, 1, 40),
(32, 2, 35),
(32, 3, 45),
(32, 4, 40),
(32, 5, 35),
(32, 6, 35),
(33, 1, 30),
(33, 2, 35),
(33, 3, 40),
(33, 4, 40),
(33, 5, 40),
(33, 6, 40),
(34, 1, 35),
(34, 2, 40),
(34, 3, 35),
(34, 4, 40),
(34, 5, 35),
(34, 6, 45),
(35, 1, 35),
(35, 2, 40),
(35, 3, 35),
(35, 4, 45),
(35, 5, 40),
(35, 6, 35);

-- PROFESSION_BASE_STATS 

CALL insert_profession_base_stats();

-- CHARACTER_STATS 

INSERT INTO `character_stats`(`value`) VALUES 
('{
	characteristics": {
		"str": 40, 
		"con": 45, 
		"dex": 45, 
		"int": 40, 
		"wit": 35, 
		"men": 45
	}, 
	"stats": {
		"health" : 1800,
		"mp" : 1800,
		"cp" : 1460,
		"pdef" : 440,
		"mdef" : 440,
		"p_attack" : 440,
		"m_attack" : 440,
		"accuracy" : 134,
		"attack_speed" : 184,
		"critical_power" : 202,
		"critical_chance" : 184,
		"speed" : 154,
		"weight_limit" : 41496
	}
}'),
('{
	characteristics": {
		"str": 40, 
		"con": 45, 
		"dex": 45, 
		"int": 40, 
		"wit": 35, 
		"men": 45
	}, 
	"stats": {
		"health" : 1800,
		"mp" : 1800,
		"cp" : 1460,
		"pdef" : 440,
		"mdef" : 440,
		"p_attack" : 440,
		"m_attack" : 440,
		"accuracy" : 134,
		"attack_speed" : 184,
		"critical_power" : 202,
		"critical_chance" : 184,
		"speed" : 154,
		"weight_limit" : 41496
	}
}'),
('{
	characteristics": {
		"str": 40, 
		"con": 45, 
		"dex": 45, 
		"int": 40, 
		"wit": 35, 
		"men": 45
	}, 
	"stats": {
		"health" : 1800,
		"mp" : 1800,
		"cp" : 1460,
		"pdef" : 440,
		"mdef" : 440,
		"p_attack" : 440,
		"m_attack" : 440,
		"accuracy" : 134,
		"attack_speed" : 184,
		"critical_power" : 202,
		"critical_chance" : 184,
		"speed" : 154,
		"weight_limit" : 41496
	}
}'),
('{
	characteristics": {
		"str": 40, 
		"con": 45, 
		"dex": 45, 
		"int": 40, 
		"wit": 35, 
		"men": 45
	}, 
	"stats": {
		"health" : 1800,
		"mp" : 1800,
		"cp" : 1460,
		"pdef" : 440,
		"mdef" : 440,
		"p_attack" : 440,
		"m_attack" : 440,
		"accuracy" : 134,
		"attack_speed" : 184,
		"critical_power" : 202,
		"critical_chance" : 184,
		"speed" : 154,
		"weight_limit" : 41496
	}
}'),
('{
	characteristics": {
		"str": 40, 
		"con": 45, 
		"dex": 45, 
		"int": 40, 
		"wit": 35, 
		"men": 45
	}, 
	"stats": {
		"health" : 1800,
		"mp" : 1800,
		"cp" : 1460,
		"pdef" : 440,
		"mdef" : 440,
		"p_attack" : 440,
		"m_attack" : 440,
		"accuracy" : 134,
		"attack_speed" : 184,
		"critical_power" : 202,
		"critical_chance" : 184,
		"speed" : 154,
		"weight_limit" : 41496
	}
}');

-- CLANS 

INSERT INTO clans
(`server_id`, `name`, `lvl`, `current_exp`, `next_lvl_exp`, `icon_id`, `members_count`, `members_max_count`) VALUES
(1, "Clan name 1", 9, 35789, 100000, 1, 17, 30),
(2, "Clan name 2", 8, 35789, 80000, 1, 10, 30),
(1, "Clan name 3", 7, 35789, 60000, 1, 17, 30),
(3, "Clan name 4", 6, 35789, 40000, 1, 30, 30),
(3, "Clan name 5", 5, 35789, 20000, 1, 27, 30),
(4, "Clan name 6", 4, 35789, 10000, 1, 25, 30),
(1, "Clan name 7", 3, 35789, 7500, 1, 17, 30),
(5, "Clan name 8", 2, 35789, 5000, 1, 15, 30),
(5, "Clan name 9", 1, 35789, 2500, 1, 8, 30),
(5, "Clan name 10", 9, 35789, 100000, 1, 20, 30),
(4, "Clan name 11", 10, 35789, 120000, 1, 5, 35),
(3, "Clan name 12", 9, 35789, 100000, 1, 9, 30);


-- ITEM_TYPES 

INSERT INTO `item_types`(`name`, `parent_id`) VALUES 
("weapon", DEFAULT),
("sword", 1),
("bow", 1),
("dagger", 1),
("blunt", 1),
("two hand blunt", 1),
("two hand sword", 1),
("armor", DEFAULT),
("light armor", 8),
("heavy armor", 8),
("magic armor", 8),
("jewelry", DEFAULT),
("necklace", 12),
("earing", 12),
("ring", 12),
("resource", DEFAULT),
("quest", DEFAULT);

-- ITEM_CHARACTERISTICS 

INSERT INTO `item_characteristics` (
`rank`,
`pdef`,
`mdef`,
`p_attack`,
`m_attack`,
`accuracy`,
`attack_speed`,
`critical_power`,
`critical_chance`,
`weight`,
`cristals_count`,
`can_be_broken`) VALUES 
("s", 190, 190, DEFAULT, DEFAULT, DEFAULT, NULL, DEFAULT, DEFAULT, 1500, 1900, 1),
("s", 190, 190, DEFAULT, DEFAULT, DEFAULT, NULL, DEFAULT, DEFAULT, 1500, 1900, 1),
("s", 190, 190, DEFAULT, DEFAULT, DEFAULT, NULL, DEFAULT, DEFAULT, 1500, 1900, 1),
("s", 270, 270, DEFAULT, DEFAULT, DEFAULT, NULL, DEFAULT, DEFAULT, 2500, 2500, 1),
("s", 390, 390, DEFAULT, DEFAULT, DEFAULT, NULL, DEFAULT, DEFAULT, 3900, 3900, 1),
("s", DEFAULT, 190, DEFAULT, DEFAULT, DEFAULT, NULL, DEFAULT, DEFAULT, 190, 190, 1),
("s", DEFAULT, 150, DEFAULT, DEFAULT, DEFAULT, NULL, DEFAULT, DEFAULT, 150, 150, 1),
("s", DEFAULT, 90, DEFAULT, DEFAULT, DEFAULT, NULL, DEFAULT, DEFAULT, 90, 90, 1),
("s", DEFAULT, DEFAULT, 500, 250, 190, "normal", 297, 297, 1500, 5970, 1),
("s", DEFAULT, DEFAULT, 297, 197, 197, "fast", 197, 197, 1980, 5970, 1);

-- ITEMS 

INSERT INTO `items` (`icon_id`, `item_type_id`, `item_characteristic_id`, `name`, `description`) VALUES 
(1, 9, 1, "Draconic helmet", "Description of Draconic helmet"),
(2, 9, 2, "Draconic gloves", "Description of Draconic gloves"),
(3, 9, 3, "Draconic boots", "Description of Draconic boots"),
(4, 9, 4, "Draconic leggins", "Description of Draconic leggins"),
(5, 9, 5, "Draconic lether breastplate", "Description of Draconic ether breastplate"),
(6, 13, 6, "Dinasty necklace", "Description of Dinasty necklace"),
(7, 14, 7, "Dinasty earing", "Description of Dinasty earing"),
(8, 15, 8, "Dinasty ring", "Description of Dinasty ring"),
(9, 2, 10, "Dinasty sword", "Description of Dinasty sword"),
(9, 3, 9, "Dinasty bow", "Description of Dinasty bow");


-- CHARACTERS 

INSERT INTO `characters` (
account_id,
server_id,
status,
name,
race_id,
sex,
current_profession_id,
lvl,
current_exp,
next_lvl_exp,
clan_id,
character_stats_id,
location_lat,
location_lon) VALUES 
(1, 3, "active", "Phoenix1", 1, "male", 2, 80, 9000000, 0, 1, 1, 59.963521, 30.322624),
(1, 3, "active", "Phoenix2", 3, "female", 10, 85, 9000000, 0, 1, 1, 59.963521, 30.322624),
(2, 2, "active", "Phoenix3", 4, "male", 15, 80, 9000000, 0, 1, 1, 59.963521, 30.322624),
(3, 1, "active", "Phoenix4", 5, "female", 20, 85, 9000000, 0, 1, 1, 59.963521, 30.322624),
(5, 5, "active", "Phoenix5", 2, "female", 25, 85, 9000000, 0, 1, 1, 59.963521, 30.322624);

-- INVENTORIES 

UPDATE `inventories` 
JOIN `characters` ON `characters`.`inventory_id` = `inventories`.`id` AND `characters`.`id` = 1 
SET `free_space` = 77, `free_weight` = 50500;

UPDATE `inventories` 
JOIN `characters` ON `characters`.`inventory_id` = `inventories`.`id` AND `characters`.`id` = 1
SET `free_space` = 75, `free_weight` = 44100;

UPDATE `inventories` 
JOIN `characters` ON `characters`.`inventory_id` = `inventories`.`id` AND `characters`.`id` = 1
SET `free_space` = 70, `free_weight` = 42430;

UPDATE `inventories` 
JOIN `characters` ON `characters`.`inventory_id` = `inventories`.`id` AND `characters`.`id` = 1
SET `free_space` = 68, `free_weight` = 31490;

-- INVENTORY_ITEMS 

INSERT INTO `inventory_items` (`inventory_id`, `item_id`, `enchanted`, `equipped`, `count`) 
SELECT inv.id, ite.id, 0, 1, 1
FROM `inventories` `inv`, `items` `ite`;

-- CHARACTER_WAREHOUSES 






