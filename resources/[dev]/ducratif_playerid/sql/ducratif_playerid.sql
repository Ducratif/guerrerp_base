-- ducratif_playerid SQL
CREATE TABLE IF NOT EXISTS `ducratif_identifications` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `requester_identifier` VARCHAR(64) DEFAULT NULL,
  `requester_name` VARCHAR(64) DEFAULT NULL,
  `requester_source` INT DEFAULT NULL,
  `target_identifier` VARCHAR(64) DEFAULT NULL,
  `target_name` VARCHAR(64) DEFAULT NULL,
  `unique_id` VARCHAR(128) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_requester` (`requester_identifier`),
  KEY `idx_target` (`target_identifier`),
  KEY `idx_unique` (`unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
