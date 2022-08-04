DROP TABLE IF EXISTS `identifiers`;
CREATE TABLE `identifiers` (
	`steamname` VARCHAR(40) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`steamid` VARCHAR(40) NOT NULL COLLATE 'utf8mb4_general_ci',
	`license` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`license2` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`discord` VARCHAR(40) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`fivem` VARCHAR(40) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`xbox` VARCHAR(40) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`ip` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`steamid`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;