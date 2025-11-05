--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Database checker and initialization module
-- Handles database table creation and setup for Luxu Admin system

-- Storage for callbacks waiting for database ready
local databaseReadyCallbacks = {}
-- Flag to track if database is ready
local isDatabaseReady = false
-- SQL table creation statements
local tableCreationQueries = {}
-- Admin groups table - stores staff groups and their configurations
local createGroupsTable = [[
   CREATE TABLE IF NOT EXISTS `luxu_admin_groups` (
      `id` int (10) unsigned NOT NULL AUTO_INCREMENT,
      `name` varchar(255) NOT NULL,
      `label` varchar(255) NULL,
      `hierarchy` tinyint (3) unsigned NOT NULL DEFAULT 1,
      `permissions` longtext NOT NULL,
      `ace_config` longtext NOT NULL,
      `clothing` longtext NULL,
      `sprite` longtext NULL,
      PRIMARY KEY (`id`),
      UNIQUE KEY `name` (`name`)
) ENGINE = InnoDB;
]]
-- Group members table - stores staff member information and identifiers
local createGroupMembersTable = [[
CREATE TABLE IF NOT EXISTS `luxu_admin_group_members` (
      `id` int (10) unsigned NOT NULL AUTO_INCREMENT,
      `nickname` varchar(255) NULL,
      `group` varchar(255) NOT NULL,
      `license2` varchar(255) NULL,
      `fivem` varchar(255) NULL,
      `discord` varchar(255) NULL,
      `steam` varchar(255) NULL,
      `avatar` TEXT NULL,
      `gender` ENUM('male', 'female') NOT NULL DEFAULT 'male',
      `current_duty_start` datetime DEFAULT NULL,
      `total_duty_seconds` int(10) unsigned NOT NULL DEFAULT 0,
      `last_updated` datetime NOT NULL DEFAULT CURTIME(),
      PRIMARY KEY (`id`),
      UNIQUE KEY `license2` (`license2`),
      UNIQUE KEY `fivem` (`fivem`),
      UNIQUE KEY `discord` (`discord`),
      UNIQUE KEY `steam` (`steam`),
      KEY `group_name` (`group`),
      CONSTRAINT `group_name` FOREIGN KEY (`group`) REFERENCES `luxu_admin_groups` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;
]]
-- Admin chats table - stores chat channels and reports
local createChatsTable = [[
CREATE TABLE IF NOT EXISTS `luxu_admin_chats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` varchar(255) NULL,
  `label` varchar(255) NULL,
  `is_staff` tinyint(1) NOT NULL DEFAULT 0,
  `is_report` tinyint(1) NOT NULL DEFAULT 0,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `staff_restrictions` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURTIME(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_chats_id` (`id`)
) ENGINE=InnoDB;
]]
-- Chat messages table - stores individual messages within chats
local createChatMessagesTable = [[
CREATE TABLE IF NOT EXISTS `luxu_admin_chat_messages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` int(11) unsigned NOT NULL,
  `author_id` varchar(255) NOT NULL,
  `author_name` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `attachments` longtext NULL,
  `created_at` datetime NOT NULL DEFAULT CURTIME(),
  PRIMARY KEY (`id`),
  KEY `idx_chat_messages_chat_id` (`chat_id`),
  CONSTRAINT `fk_chat_messages_chat` FOREIGN KEY (`chat_id`)
    REFERENCES `luxu_admin_chats` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
]]
-- Bans table - stores player ban information and history
local createBansTable = [[
CREATE TABLE IF NOT EXISTS `luxu_admin_bans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_name` varchar(255) NOT NULL,
  `player_id` varchar(255) NOT NULL,
  `identifiers` longtext NOT NULL,
  `tokens` longtext NOT NULL,
  `reason` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURTIME(),
  `staff_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `FK_luxu_admin_bans_luxu_admin_group_members` (`staff_id`),
    CONSTRAINT `FK_luxu_admin_bans_luxu_admin_group_members` FOREIGN KEY (`staff_id`) REFERENCES `luxu_admin_group_members` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
]]
-- Warnings table - stores player warning records
local createWarningsTable = [[
CREATE TABLE IF NOT EXISTS `luxu_admin_warnings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_name` varchar(255) NOT NULL,
  `player_id` varchar(255) NOT NULL,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURTIME(),
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `FK_luxu_admin_warnings_luxu_admin_group_members` FOREIGN KEY (`staff_id`) REFERENCES `luxu_admin_group_members` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;
]]
-- Events table - stores admin events and announcements
local createEventsTable = [[
CREATE TABLE IF NOT EXISTS `luxu_admin_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `date` datetime NOT NULL,
  `author_id` varchar(255) NULL,
  `created_at` datetime NOT NULL DEFAULT CURTIME(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
]]
-- Player notes table - stores staff notes about players
local createPlayerNotesTable = [[
CREATE TABLE IF NOT EXISTS `luxu_admin_player_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `staff_name` varchar(255) NOT NULL,
  `staff_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURTIME(),
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
    CONSTRAINT `FK_luxu_admin_player_notes_luxu_admin_group_members` FOREIGN KEY (`staff_id`) REFERENCES `luxu_admin_group_members` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
]]
-- Blips table - stores map blips and markers
local createBlipsTable = [[
CREATE TABLE IF NOT EXISTS `luxu_admin_blips` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `coords` longtext NOT NULL,
  `display` int(10) unsigned NOT NULL,
  `scale` float NOT NULL,
  `shortRange` tinyint(1) NOT NULL,
  `color` int(10) unsigned NOT NULL,
  `sprite` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURTIME(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;]]
-- Media table - stores uploaded media files and CDN references
local createMediaTable = [[
CREATE TABLE IF NOT EXISTS `luxu_admin_media` (
      `id` int (10) unsigned NOT NULL AUTO_INCREMENT,
      `type` enum('image', 'video', 'audio') NOT NULL,
      `cdn_id` varchar(255) NOT NULL,
      `url` varchar(255) NOT NULL,
      `expiration` datetime NULL,
      `created_at` datetime NOT NULL DEFAULT CURTIME(),
      `author_id` varchar(255) NULL,
      PRIMARY KEY (`id`)
) ENGINE=InnoDB;
]]
-- Duty sessions table - tracks staff duty time sessions
local createDutySessionsTable = [[
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
  CONSTRAINT `fk_duty_sessions_staff` FOREIGN KEY (`staff_id`)
    REFERENCES `luxu_admin_group_members` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;]]
-- Duty daily stats table - aggregated daily duty statistics
local createDutyDailyStatsTable = [[
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
  CONSTRAINT `fk_duty_daily_stats_staff` FOREIGN KEY (`staff_id`)
    REFERENCES `luxu_admin_group_members` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;]]
-- Props table - stores spawned admin props (vehicles, objects, peds)
local createPropsTable = [[
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
  `created_at` datetime NOT NULL DEFAULT curtime(),
  `type` enum('vehicle','object','ped') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
]]
-- Database trigger - automatically updates last_modified timestamp
local createUpdateTrigger = [[
CREATE TRIGGER update_last_modified
BEFORE UPDATE ON luxu_admin_group_members
FOR EACH ROW
BEGIN
      SET NEW.last_updated = CURTIME();
END

   ]]
-- Populate table creation queries array
tableCreationQueries[1] = createGroupsTable
tableCreationQueries[2] = createGroupMembersTable
tableCreationQueries[3] = createChatsTable
tableCreationQueries[4] = createChatMessagesTable
tableCreationQueries[5] = createBansTable
tableCreationQueries[6] = createWarningsTable
tableCreationQueries[7] = createEventsTable
tableCreationQueries[8] = createPlayerNotesTable
tableCreationQueries[9] = createBlipsTable
tableCreationQueries[10] = createMediaTable
tableCreationQueries[11] = createDutySessionsTable
tableCreationQueries[12] = createDutyDailyStatsTable
tableCreationQueries[13] = createPropsTable
tableCreationQueries[14] = createUpdateTrigger
-- Function to handle database ready callbacks
local function handleDatabaseReady(callback)
  if isDatabaseReady then
    -- Database is ready, execute callback immediately
    callback()
  else
    -- Database not ready, queue callback for later execution
    local callbackIndex = #databaseReadyCallbacks + 1
    databaseReadyCallbacks[callbackIndex] = callback
  end
end

-- Export OnDatabaseReady function
OnDatabaseReady = handleDatabaseReady
-- Export OnDatabaseReady function for other resources
exports("OnDatabaseReady", OnDatabaseReady)
-- Function to execute all table creation queries in a transaction
local function executeTableCreation()
  return MySQL.transaction.await(tableCreationQueries)
end
-- Main database initialization function
MySQL.ready(function()
  -- Check if database tables exist by testing luxu_admin_groups table
  local databaseExists = pcall(function()
    return MySQL.scalar.await("SELECT 1 FROM luxu_admin_groups")
  end)
  
  -- If database doesn't exist, install it
  if not databaseExists then
    print("Database not installed, installing...")
    local installResult = executeTableCreation()
    print(installResult)
    Wait(200)
    print("Database installed")
  end
  
  -- Execute all queued database ready callbacks
  for _, callback in ipairs(databaseReadyCallbacks) do
    xpcall(callback, function(error)
      Luxu.print.warning("ERROR_AFTER_DATABASE_READY")
      Luxu.print.error(error)
      Luxu.print.warning("-ERROR_END-")
    end)
  end
  
  -- Mark database as ready
  isDatabaseReady = true
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
