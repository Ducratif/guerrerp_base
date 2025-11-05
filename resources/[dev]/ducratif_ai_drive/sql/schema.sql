-- Tables principales pour ducratif_ai_drive

CREATE TABLE IF NOT EXISTS vehicle_ai (
    plate VARCHAR(20) PRIMARY KEY,
    owner_identifier VARCHAR(64) NOT NULL,
    enabled TINYINT(1) NOT NULL DEFAULT 0,
    calibrated TINYINT(1) NOT NULL DEFAULT 0,
    driving_mode ENUM('souple','rapide','violente') DEFAULT NULL,
    limiter_enabled TINYINT(1) NOT NULL DEFAULT 0,
    limiter_speed_kmh INT DEFAULT 0,
    cruise_enabled TINYINT(1) NOT NULL DEFAULT 0,
    cruise_speed_kmh INT DEFAULT 0,
    collision_avoid_enabled TINYINT(1) NOT NULL DEFAULT 0,
    durability JSON NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS ai_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    owner_identifier VARCHAR(64) NOT NULL,
    plate VARCHAR(20) NOT NULL,
    from_label VARCHAR(64) NULL,
    to_label VARCHAR(64) NULL,
    from_x DOUBLE, from_y DOUBLE, from_z DOUBLE,
    to_x DOUBLE, to_y DOUBLE, to_z DOUBLE,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS ai_favorites (
    id INT AUTO_INCREMENT PRIMARY KEY,
    owner_identifier VARCHAR(64) NOT NULL,
    label VARCHAR(64) NOT NULL,
    x DOUBLE, y DOUBLE, z DOUBLE,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS ai_users (
    owner_identifier VARCHAR(64) PRIMARY KEY,
    fav_slots INT NOT NULL DEFAULT 10
);

CREATE TABLE IF NOT EXISTS ai_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    owner_identifier VARCHAR(64) NULL,
    plate VARCHAR(20) NULL,
    action VARCHAR(64) NOT NULL,
    details TEXT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE vehicle_ai ADD UNIQUE KEY uniq_plate (plate);

ALTER TABLE vehicle_ai ADD COLUMN lawless_enabled TINYINT(1) NOT NULL DEFAULT 0;
ALTER TABLE vehicle_ai ADD COLUMN lawless_active  TINYINT(1) NOT NULL DEFAULT 0;
