-- ducratif_atmrob: table de logs
CREATE TABLE IF NOT EXISTS `atm_robbery_logs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `identifier` VARCHAR(64) NOT NULL,
  `name` VARCHAR(64) DEFAULT NULL,
  `rp_rank` INT DEFAULT NULL,
  `atm_model` VARCHAR(64) DEFAULT NULL,
  `atm_x` DOUBLE DEFAULT 0,
  `atm_y` DOUBLE DEFAULT 0,
  `atm_z` DOUBLE DEFAULT 0,
  `outcome` ENUM('success','fail','cancel','denied') NOT NULL,
  `reward` INT DEFAULT 0,
  `item_required` TINYINT(1) DEFAULT 0,
  `item_name` VARCHAR(64) DEFAULT NULL,
  `reason` VARCHAR(128) DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `idx_identifier` (`identifier`),
  INDEX `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
