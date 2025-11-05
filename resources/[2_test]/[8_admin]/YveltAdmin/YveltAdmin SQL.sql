DROP TABLE IF EXISTS `yvelt_bans`;
CREATE TABLE IF NOT EXISTS `yvelt_bans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` longtext,
  `date` longtext NOT NULL,
  `raison` longtext,
  `auteur` blob,
  `duree` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `yvelt_players`;
CREATE TABLE IF NOT EXISTS `yvelt_players` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` longtext,
  `name` blob,
  `rank` longtext,
  `report_count` int DEFAULT '0',
  `report_notes` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `yvelt_players` (`id`, `identifier`, `name`, `rank`, `report_count`, `report_notes`) VALUES
(0, 'license:3aa062f5ba4f99929980851a973c0857c9252c1c', 0x5976656c742e, 'owner', 0, 0);

DROP TABLE IF EXISTS `yvelt_ranks`;
CREATE TABLE IF NOT EXISTS `yvelt_ranks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` longtext,
  `rank` longtext,
  `perms` longtext,
  `power` int DEFAULT '0',
  `color` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `yvelt_sanctions`;
CREATE TABLE IF NOT EXISTS `yvelt_sanctions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` longtext,
  `staff` blob,
  `name` blob,
  `sanctionType` longtext,
  `sanctionDesc` longtext,
  `date` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `yvelt_teleports`;
CREATE TABLE IF NOT EXISTS `yvelt_teleports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` longtext,
  `label` longtext,
  `coords` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `yvelt_uniqueid`;
CREATE TABLE IF NOT EXISTS `yvelt_uniqueid` (
  `name` blob NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `uid` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `yvelt_jail`;
CREATE TABLE IF NOT EXISTS `yvelt_jail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` longtext,
  `staffName` blob,
  `time` longtext,
  `date` longtext,
  `raison` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
COMMIT;