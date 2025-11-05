-- ============================================================
-- Luxu Admin - Schéma propre & opérationnel (MySQL 8.0+)
-- ============================================================

-- Toujours utile si tu relances plusieurs fois :
SET FOREIGN_KEY_CHECKS = 0;

-- =======================
-- Groupes & Membres Staff
-- =======================
CREATE TABLE IF NOT EXISTS `luxu_admin_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NULL,
  `hierarchy` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `permissions` longtext NOT NULL,
  `ace_config` longtext NOT NULL,
  `clothing` longtext NULL,
  `sprite` longtext NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_groups_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `luxu_admin_group_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) NULL,
  `group` varchar(255) NOT NULL,
  `license2` varchar(255) NULL,
  `fivem` varchar(255) NULL,
  `discord` varchar(255) NULL,
  `steam` varchar(255) NULL,
  `avatar` text NULL,
  `gender` enum('male','female') NOT NULL DEFAULT 'male',
  `current_duty_start` datetime DEFAULT NULL,
  `total_duty_seconds` int(10) unsigned NOT NULL DEFAULT 0,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_members_license2` (`license2`),
  UNIQUE KEY `uk_members_fivem` (`fivem`),
  UNIQUE KEY `uk_members_discord` (`discord`),
  UNIQUE KEY `uk_members_steam` (`steam`),
  KEY `idx_members_group` (`group`),
  CONSTRAINT `fk_members_group`
    FOREIGN KEY (`group`) REFERENCES `luxu_admin_groups` (`name`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ======================
-- Chats & Messages Staff
-- ======================
CREATE TABLE IF NOT EXISTS `luxu_admin_chats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` varchar(255) NULL,
  `label` varchar(255) NULL,
  `is_staff` tinyint(1) NOT NULL DEFAULT 0,
  `is_report` tinyint(1) NOT NULL DEFAULT 0,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `staff_restrictions` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `luxu_admin_chat_messages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` int(11) unsigned NOT NULL,
  `author_id` varchar(255) NOT NULL,
  `author_name` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `attachments` longtext NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_chat_messages_chat_id` (`chat_id`),
  KEY `idx_chat_messages_created_at` (`created_at`),
  CONSTRAINT `fk_chat_messages_chat`
    FOREIGN KEY (`chat_id`) REFERENCES `luxu_admin_chats` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ======
-- Bans
-- ======
CREATE TABLE IF NOT EXISTS `luxu_admin_bans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_name` varchar(255) NOT NULL,
  `player_id` varchar(255) NOT NULL,
  `identifiers` longtext NOT NULL,
  `tokens` longtext NOT NULL,
  `reason` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `staff_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bans_player_id` (`player_id`),
  KEY `idx_bans_expires_at` (`expires_at`),
  KEY `idx_bans_staff_id` (`staff_id`),
  CONSTRAINT `fk_bans_staff`
    FOREIGN KEY (`staff_id`) REFERENCES `luxu_admin_group_members` (`id`)
    ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =========
-- Warnings
-- =========
CREATE TABLE IF NOT EXISTS `luxu_admin_warnings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_name` varchar(255) NOT NULL,
  `player_id` varchar(255) NOT NULL,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_warnings_player_id` (`player_id`),
  KEY `idx_warnings_staff_id` (`staff_id`),
  KEY `idx_warnings_created_at` (`created_at`),
  CONSTRAINT `fk_warnings_staff`
    FOREIGN KEY (`staff_id`) REFERENCES `luxu_admin_group_members` (`id`)
    ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============
-- Player Notes
-- =============
CREATE TABLE IF NOT EXISTS `luxu_admin_player_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `staff_name` varchar(255) NOT NULL,
  `staff_id` int(10) unsigned DEFAULT NULL,        -- <-- FIX: autoriser NULL
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_player_notes_player_id` (`player_id`),
  KEY `idx_player_notes_staff_id` (`staff_id`),
  CONSTRAINT `fk_player_notes_staff`
    FOREIGN KEY (`staff_id`) REFERENCES `luxu_admin_group_members` (`id`)
    ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =======
-- Events
-- =======
CREATE TABLE IF NOT EXISTS `luxu_admin_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `date` datetime NOT NULL,
  `author_id` varchar(255) NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ======
-- Media
-- ======
CREATE TABLE IF NOT EXISTS `luxu_admin_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('image','video','audio') NOT NULL,
  `cdn_id` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `expiration` datetime NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author_id` varchar(255) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====
-- Blips
-- =====
CREATE TABLE IF NOT EXISTS `luxu_admin_blips` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `coords` longtext NOT NULL,
  `display` int(10) unsigned NOT NULL,
  `scale` float NOT NULL,
  `shortRange` tinyint(1) NOT NULL,
  `color` int(10) unsigned NOT NULL,
  `sprite` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==========================
-- Duty sessions & Daily Stat
-- ==========================
CREATE TABLE IF NOT EXISTS `luxu_admin_duty_sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned NOT NULL,
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` datetime DEFAULT NULL,
  `duration_seconds` int(10) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_staff_active_sessions` (`staff_id`, `end_time`, `start_time` DESC),
  KEY `idx_staff_start_time` (`staff_id`, `start_time` DESC),
  KEY `idx_end_time_start_time` (`end_time`, `start_time`),
  KEY `idx_staff_duration` (`staff_id`, `duration_seconds`),
  CONSTRAINT `fk_duty_sessions_staff`
    FOREIGN KEY (`staff_id`) REFERENCES `luxu_admin_group_members` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `luxu_admin_duty_daily_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `total_seconds` int(10) unsigned NOT NULL DEFAULT 0,
  `session_count` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_staff_date` (`staff_id`, `date`),
  KEY `idx_date` (`date`),
  KEY `idx_staff_date_totals` (`staff_id`, `date`, `total_seconds`),
  KEY `idx_date_staff_totals` (`date`, `staff_id`, `total_seconds` DESC),
  CONSTRAINT `fk_duty_daily_stats_staff`
    FOREIGN KEY (`staff_id`) REFERENCES `luxu_admin_group_members` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====
-- Props
-- =====
CREATE TABLE IF NOT EXISTS `luxu_admin_props` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `model` varchar(255) NOT NULL,
  `x` float NOT NULL DEFAULT 0,
  `y` float NOT NULL DEFAULT 0,
  `z` float NOT NULL DEFAULT 0,
  `rx` float NOT NULL DEFAULT 0,
  `ry` float NOT NULL DEFAULT 0,
  `rz` float NOT NULL DEFAULT 0,
  `plate` varchar(8) NOT NULL DEFAULT '',
  `metadata` longtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('vehicle','object','ped') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;

-- ==========================
-- Trigger de mise à jour
-- ==========================
DROP TRIGGER IF EXISTS `update_last_modified`;
DELIMITER //
CREATE TRIGGER `update_last_modified`
BEFORE UPDATE ON `luxu_admin_group_members`
FOR EACH ROW
BEGIN
  SET NEW.`last_updated` = CURRENT_TIMESTAMP;
END //
DELIMITER ;
