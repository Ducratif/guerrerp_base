CREATE TABLE IF NOT EXISTS `ducrachat_users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `identifier` VARCHAR(64) NOT NULL,
    `id_telegram` VARCHAR(24) NOT NULL,
    `can_read` TINYINT(1) NOT NULL DEFAULT 0,
    `delay_override` INT DEFAULT 600, -- délai actuel en secondes
    PRIMARY KEY (`id`),
    UNIQUE (`identifier`),
    UNIQUE (`id_telegram`)
);

CREATE TABLE IF NOT EXISTS `ducrachat_messages` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `sender` VARCHAR(64) NOT NULL,
    `receiver` VARCHAR(64) NOT NULL,
    `message` TEXT NOT NULL,
    `timestamp` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `deliver_at` DATETIME NOT NULL,
    `is_read` TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    INDEX (`sender`),
    INDEX (`receiver`)
);
