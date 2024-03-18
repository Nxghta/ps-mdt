CREATE TABLE IF NOT EXISTS `mdt_users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `cid` VARCHAR(20) UNIQUE,
  `information` TEXT,
  `tags` TEXT NOT NULL,
  `gallery` TEXT NOT NULL,
  `jobtype` VARCHAR(25) DEFAULT 'police',
  `profile_picture` TEXT,
  `fingerprint` VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_bulletins` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` TEXT NOT NULL,
  `description` TEXT NOT NULL,
  `author` VARCHAR(50) NOT NULL,
  `time` DATETIME NOT NULL,
  `jobtype` VARCHAR(25) DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `author` VARCHAR(50),
  `title` VARCHAR(255),
  `type` VARCHAR(50),
  `details` TEXT,
  `tags` TEXT,
  `officers_involved` TEXT,
  `civilians_involved` TEXT,
  `gallery` TEXT,
  `time` DATETIME,
  `jobtype` VARCHAR(25) DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `author` VARCHAR(50),
  `title` VARCHAR(50),
  `plate` VARCHAR(50),
  `owner` VARCHAR(50),
  `individual` VARCHAR(50),
  `detail` TEXT,
  `tags` TEXT,
  `gallery` TEXT,
  `officers_involved` TEXT,
  `time` DATETIME,
  `jobtype` VARCHAR(25) DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_convictions` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `user_id` INT,
  `linked_incident_id` INT DEFAULT 0,
  `warrant` VARCHAR(50),
  `guilty` VARCHAR(50),
  `processed` VARCHAR(50),
  `associated` VARCHAR(50) DEFAULT '0',
  `charges` TEXT,
  `fine` INT DEFAULT 0,
  `sentence` INT DEFAULT 0,
  `recommended_fine` INT DEFAULT 0,
  `recommended_sentence` INT DEFAULT 0,
  `time` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `author` VARCHAR(50) NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `details` TEXT NOT NULL,
  `tags` TEXT NOT NULL,
  `officers_involved` TEXT NOT NULL,
  `civilians_involved` TEXT NOT NULL,
  `evidence` TEXT NOT NULL,
  `time` DATETIME,
  `jobtype` VARCHAR(25) DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `text` TEXT NOT NULL,
  `time` DATETIME NOT NULL,
  `jobtype` VARCHAR(25) DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_vehicle_info` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `plate` VARCHAR(50) UNIQUE,
  `information` TEXT NOT NULL DEFAULT '',
  `stolen` BOOLEAN NOT NULL DEFAULT FALSE,
  `code5` BOOLEAN NOT NULL DEFAULT FALSE,
  `image` TEXT NOT NULL DEFAULT '',
  `points` INT DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_weapon_info` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `serial` VARCHAR(50) UNIQUE,
  `owner` VARCHAR(50),
  `information` TEXT NOT NULL DEFAULT '',
  `weapon_class` VARCHAR(50),
  `weapon_model` VARCHAR(50),
  `image` VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_impounds` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `vehicle_id` INT NOT NULL,
  `linked_report_id` INT NOT NULL,
  `fee` INT,
  `time` DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_clocking` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `user_id` INT NOT NULL,
  `clock_in_time` DATETIME NOT NULL,
  `clock_out_time` DATETIME,
  `total_time` INT DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
