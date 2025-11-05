-- ==========================================================
--   GuerreRP - Base publique ESX Legacy
--   Développé et maintenu par : Ducratif
--
--   Discord support : https://discord.gg/kpD8pQBBWm
--   Documentation :  https://github.com/Ducratif/guerrerp
--
--   Merci de conserver ces crédits si vous utilisez,
--   modifiez ou redistribuez cette configuration.
-- ==========================================================


CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('bank_savings', 'Savings account', 0),
('caution', 'caution', 0),
('property_black_money', 'Argent Sale Propriété', 0),
('society_ambulance', 'EMS', 1),
('society_ammunation', 'Ammunation', 1),
('society_army_fr', 'Armée Francaise', 1),
('society_army_terre_fr', 'Armée Terre FR', 1),
('society_arp', 'Armée Rouge de Paleto', 1),
('society_banker', 'Bank', 1),
('society_cardealer', 'Cardealer', 1),
('society_chauffeurpl', 'Chauffeur PL', 1),
('society_cit', 'Corps d’Intervention Tactique', 1),
('society_cn', 'Les Chacals Noirs', 1),
('society_cnu', 'CNU', 1),
('society_co', 'Le Cartel de l’Ombre', 1),
('society_df', 'Division Fantôme', 1),
('society_fisherman', 'Fisherman', 1),
('society_fsa', 'FSA', 1),
('society_fueler', 'Fueler', 1),
('society_gotur', 'Götür', 1),
('society_gouv', 'Gouvernement', 1),
('society_ld', 'Les Loups du Désert', 1),
('society_ln', 'Légion Noir', 1),
('society_lr', 'Les Revenants', 1),
('society_lumberjack', 'Lumberjack', 1),
('society_mechanic', 'Mechanic', 1),
('society_miner', 'Miner', 1),
('society_ms', 'La Milice du Sang', 1),
('society_pecheur', 'pecheur', 1),
('society_pharm', 'Pharmacien', 1),
('society_police', 'Police', 1),
('society_reporter', 'Reporter', 1),
('society_rpbc', 'République Populaire de Blaine County', 1),
('society_slaughterer', 'Butcher', 1),
('society_tailor', 'Tailor', 1),
('society_taxi', 'Taxi', 1),
('society_unemployed', 'Unemployed', 1);

-- --------------------------------------------------------

--
-- Structure de la table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `money` bigint(20) DEFAULT NULL,
  `owner` varchar(259) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1, 'society_cardealer', 0, NULL),
(2, 'society_police', 0, NULL),
(3, 'society_ambulance', 60150, NULL),
(4, 'society_mechanic', 6507058, NULL),
(5, 'society_taxi', 0, NULL),
(9, 'society_banker', 0, NULL),
(10, 'bank_savings', 0, 'cf872e2dbff1cf3152fff72b147ca07238315148'),
(11, 'caution', 0, 'cf872e2dbff1cf3152fff72b147ca07238315148'),
(12, 'society_lumberjack', 0, NULL),
(13, 'society_fueler', 0, NULL),
(14, 'society_slaughterer', 0, NULL),
(15, 'society_fisherman', 0, NULL),
(16, 'society_reporter', 0, NULL),
(17, 'society_miner', 0, NULL),
(18, 'society_tailor', 0, NULL),
(19, 'society_unemployed', 0, NULL),
(20, 'society_army_fr', 0, NULL),
(21, 'society_army_terre_fr', 500, NULL),
(22, 'society_gotur', 0, NULL),
(23, 'society_cnu', 0, NULL),
(24, 'society_fsa', 0, NULL),
(25, 'society_ln', 0, NULL),
(26, 'society_rpbc', 0, NULL),
(27, 'society_cit', 0, NULL),
(28, 'society_arp', 0, NULL),
(29, 'society_df', 0, NULL),
(30, 'society_ld', 0, NULL),
(31, 'society_ms', 0, NULL),
(32, 'society_co', 0, NULL),
(33, 'society_cn', 0, NULL),
(34, 'society_lr', 0, NULL),
(35, 'bank_savings', 0, '2e598f707aea8f476eac986e4b4004ea10e8bc5e'),
(36, 'caution', 0, '2e598f707aea8f476eac986e4b4004ea10e8bc5e'),
(37, 'bank_savings', 0, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148'),
(38, 'caution', 0, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148'),
(39, 'bank_savings', 0, 'd621787821b7be9712dd11873dc3decca533bf6a'),
(40, 'caution', 0, 'd621787821b7be9712dd11873dc3decca533bf6a'),
(41, 'bank_savings', 0, 'b42b206cb9676c013317ee3b92d5e19e2314bb26'),
(42, 'caution', 0, 'b42b206cb9676c013317ee3b92d5e19e2314bb26'),
(43, 'bank_savings', 0, 'bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177'),
(44, 'caution', 0, 'bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177'),
(45, 'bank_savings', 0, '2bf7bb148f0f54b434ac370cab06e592866df450'),
(46, 'caution', 0, '2bf7bb148f0f54b434ac370cab06e592866df450'),
(47, 'caution', 0, '4634506b65176f2c2aa6a1af9831d3efbd168ee0'),
(48, 'bank_savings', 0, '4634506b65176f2c2aa6a1af9831d3efbd168ee0'),
(49, 'society_pharm', 0, NULL),
(50, 'society_ammunation', 0, NULL),
(51, 'society_gouv', 0, NULL),
(52, 'property_black_money', 0, 'd621787821b7be9712dd11873dc3decca533bf6a'),
(53, 'property_black_money', 0, 'cf872e2dbff1cf3152fff72b147ca07238315148'),
(54, 'property_black_money', 0, 'b42b206cb9676c013317ee3b92d5e19e2314bb26'),
(55, 'property_black_money', 0, 'bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177'),
(56, 'society_chauffeurpl', 0, NULL),
(57, 'society_pecheur', 0, NULL),
(58, 'property_black_money', 0, '2bf7bb148f0f54b434ac370cab06e592866df450'),
(59, 'bank_savings', 0, '6dfb75f417bec5276010b020f222640f80c91043'),
(60, 'caution', 0, '6dfb75f417bec5276010b020f222640f80c91043'),
(61, 'property_black_money', 0, '6dfb75f417bec5276010b020f222640f80c91043'),
(62, 'property_black_money', 0, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148'),
(63, 'bank_savings', 0, 'char2:cf872e2dbff1cf3152fff72b147ca07238315148'),
(64, 'caution', 0, 'char2:cf872e2dbff1cf3152fff72b147ca07238315148'),
(65, 'property_black_money', 0, 'char2:cf872e2dbff1cf3152fff72b147ca07238315148'),
(66, 'caution', 0, 'char3:cf872e2dbff1cf3152fff72b147ca07238315148'),
(67, 'property_black_money', 0, 'char3:cf872e2dbff1cf3152fff72b147ca07238315148'),
(68, 'bank_savings', 0, 'char3:cf872e2dbff1cf3152fff72b147ca07238315148'),
(69, 'caution', 0, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177'),
(70, 'bank_savings', 0, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177'),
(71, 'property_black_money', 0, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177'),
(72, 'caution', 0, 'char1:d621787821b7be9712dd11873dc3decca533bf6a'),
(73, 'property_black_money', 0, 'char1:d621787821b7be9712dd11873dc3decca533bf6a'),
(74, 'bank_savings', 0, 'char1:d621787821b7be9712dd11873dc3decca533bf6a'),
(75, 'bank_savings', 0, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e'),
(76, 'caution', 0, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e'),
(77, 'property_black_money', 0, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e'),
(78, 'property_black_money', 0, 'char1:2bf7bb148f0f54b434ac370cab06e592866df450'),
(79, 'bank_savings', 0, 'char1:2bf7bb148f0f54b434ac370cab06e592866df450'),
(80, 'caution', 0, 'char1:2bf7bb148f0f54b434ac370cab06e592866df450');

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0),
('society_ambulance', 'EMS', 1),
('society_ammunation', 'Ammunation', 1),
('society_army_fr', 'Armée Francaise', 1),
('society_army_terre_fr', 'Armée Terre FR', 1),
('society_arp', 'Armée Rouge de Paleto', 1),
('society_banker', 'Banker', 1),
('society_cardealer', 'Cardealer', 1),
('society_chauffeurpl', 'Chauffeur PL', 1),
('society_cit', 'Corps d’Intervention Tactique', 1),
('society_cn', 'Les Chacals Noirs', 1),
('society_cnu', 'CNU', 1),
('society_co', 'Le Cartel de l’Ombre', 1),
('society_df', 'Division Fantôme', 1),
('society_fisherman', 'Fisherman', 1),
('society_fsa', 'FSA', 1),
('society_fueler', 'Fueler', 1),
('society_gotur', 'Götür', 1),
('society_gouv', 'Gouvernement', 1),
('society_ld', 'Les Loups du Désert', 1),
('society_ln', 'Légion Noir', 1),
('society_lr', 'Les Revenants', 1),
('society_lumberjack', 'Lumberjack', 1),
('society_mechanic', 'Mechanic', 1),
('society_miner', 'Miner', 1),
('society_ms', 'La Milice du Sang', 1),
('society_pecheur', 'pecheur', 1),
('society_pharm', 'Pharmacien', 1),
('society_police', 'Police', 1),
('society_reporter', 'Reporter', 1),
('society_rpbc', 'République Populaire de Blaine County', 1),
('society_slaughterer', 'Butcher', 1),
('society_tailor', 'Tailor', 1),
('society_taxi', 'Taxi', 1),
('society_unemployed', 'Unemployed', 1);

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(259) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `admin_grades`
--

CREATE TABLE `admin_grades` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `label` varchar(64) NOT NULL,
  `color` varchar(16) DEFAULT '#ffffff',
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`permissions`)),
  `created_by` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `admin_logs`
--

CREATE TABLE `admin_logs` (
  `id` int(11) NOT NULL,
  `staff_identifier` varchar(64) DEFAULT NULL,
  `staff_name` varchar(64) DEFAULT NULL,
  `target_identifier` varchar(64) DEFAULT NULL,
  `action` varchar(64) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `admin_reports`
--

CREATE TABLE `admin_reports` (
  `id` int(11) NOT NULL,
  `reporter_identifier` varchar(64) DEFAULT NULL,
  `reported_identifier` varchar(64) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(16) DEFAULT 'open',
  `assigned_staff` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `closed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `admin_staff`
--

CREATE TABLE `admin_staff` (
  `id` int(11) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `grade_id` int(11) DEFAULT NULL,
  `joined_at` datetime DEFAULT current_timestamp(),
  `in_service` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `admin_staff_settings`
--

CREATE TABLE `admin_staff_settings` (
  `id` int(11) NOT NULL,
  `staff_identifier` varchar(64) NOT NULL,
  `key_name` varchar(32) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `annonce_web`
--

CREATE TABLE `annonce_web` (
  `id` int(11) NOT NULL,
  `titre` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `actif` tinyint(1) DEFAULT 1,
  `link` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `annonce_web`
--

INSERT INTO `annonce_web` (`id`, `titre`, `description`, `actif`, `link`, `created_at`) VALUES
(1, 'Nouveau Panel Staff', '📢 NOUVEAUTÉ — Panel Staff Disponible !\r\n\r\n🎛️ Un tout nouveau Panel Staff a été mis en place pour faciliter la gestion, les suivis, et les actions de modération en un seul endroit !\r\n\r\nCe panel vous permettra désormais de :\r\n🔍 Rechercher des joueurs (nom, SteamID, DiscordID, etc.)\r\n📄 Consulter leur fiche complète (argent, métier, position, historique, etc.)\r\n⚠️ Accéder à l’historique des sanctions (warn, ban, kick, jail)\r\n🧠 Remplir les rapports hebdomadaires obligatoires\r\n🔧 Gérer les actions d’administration (ban, give, setjob, etc.)\r\n\r\n🎯 Ce nouvel outil est là pour structurer et professionnaliser notre gestion interne.\r\n\r\n⚠️ ATTENTION ⚠️\r\nLes fonctions sont trié par niveau de rank, ce qui veux dire que chaque équipe/rank peux ou ne peux faire certaine action !\r\n\r\n🛠️ Des mises à jour régulières seront apportées pour améliorer le panel en fonction de vos retours.\r\n', 1, NULL, '2025-07-18 21:03:44'),
(2, 'Test', 'Ceci est une annonce', 1, NULL, '2025-07-18 21:03:44');

-- --------------------------------------------------------

--
-- Structure de la table `banking`
--

CREATE TABLE `banking` (
  `identifier` varchar(259) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(64) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `balance` bigint(20) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `banking`
--

INSERT INTO `banking` (`identifier`, `type`, `amount`, `time`, `ID`, `balance`, `label`) VALUES
('bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 'WITHDRAW', 200000, 1747755942000, 68, 993691302321, 'WITHDRAW'),
('bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 'WITHDRAW', 20000, 1747760046000, 69, 993691282321, 'WITHDRAW'),
('bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 'WITHDRAW', 650000, 1747761813000, 70, 993690632321, 'WITHDRAW'),
('d621787821b7be9712dd11873dc3decca533bf6a', 'DEPOSIT', 1000000, 1747793609000, 71, 2639751, 'DEPOSIT'),
('d621787821b7be9712dd11873dc3decca533bf6a', 'DEPOSIT', 400000, 1747793635000, 72, 3039751, 'DEPOSIT'),
('bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 'WITHDRAW', 300000, 1747930475000, 73, 993690332321, 'WITHDRAW'),
('bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 'WITHDRAW', 1500000, 1748187171000, 74, 993653082323, 'WITHDRAW'),
('2bf7bb148f0f54b434ac370cab06e592866df450', 'DEPOSIT', 1148, 1748191636000, 75, 2074346, 'DEPOSIT'),
('char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 'WITHDRAW', 650000, 1748870388000, 76, 993652432323, 'WITHDRAW'),
('char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 'WITHDRAW', 700000, 1748872828000, 77, 993651732323, 'WITHDRAW'),
('char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 'WITHDRAW', 380000, 1748874642000, 78, 993651352323, 'WITHDRAW'),
('char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 'WITHDRAW', 1000000, 1748878112000, 79, 993650352323, 'WITHDRAW'),
('char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 'WITHDRAW', 458000, 1748884442000, 80, 993649894323, 'WITHDRAW'),
('char1:d621787821b7be9712dd11873dc3decca533bf6a', 'DEPOSIT', 50000000, 1749681359000, 81, 50022100, 'DEPOSIT'),
('char1:d621787821b7be9712dd11873dc3decca533bf6a', 'WITHDRAW', 1000000, 1750183018000, 82, 48028000, 'WITHDRAW'),
('char1:d621787821b7be9712dd11873dc3decca533bf6a', 'DEPOSIT', 860389, 1752608759000, 83, 48898189, 'DEPOSIT'),
('char1:2bf7bb148f0f54b434ac370cab06e592866df450', 'DEPOSIT', 1015003, 1752798601000, 84, 3095149, 'DEPOSIT');

-- --------------------------------------------------------

--
-- Structure de la table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `codemradar`
--

CREATE TABLE `codemradar` (
  `citizenname` varchar(50) DEFAULT NULL,
  `officername` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `image` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `codemradar`
--

INSERT INTO `codemradar` (`citizenname`, `officername`, `time`, `location`, `description`, `plate`, `image`) VALUES
('michel', 'Martin Bubois', '2025-04-23 21:01', 'Eclipse Boulevard', 'vitesse elvever', '049vo437', 'https://i.imgur.com/G4Wkaxy.png');

-- --------------------------------------------------------

--
-- Structure de la table `codem_adminmenu`
--

CREATE TABLE `codem_adminmenu` (
  `identifier` varchar(259) DEFAULT NULL,
  `permissiondata` longtext DEFAULT NULL,
  `historydata` longtext DEFAULT NULL,
  `bandata` longtext DEFAULT NULL,
  `profiledata` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `codem_adminmenu`
--

INSERT INTO `codem_adminmenu` (`identifier`, `permissiondata`, `historydata`, `bandata`, `profiledata`) VALUES
('cf872e2dbff1cf3152fff72b147ca07238315148', '{\"changejob\":true,\"playername\":true,\"announcement\":true,\"heal\":true,\"showcoords\":true,\"noclip\":true,\"kick\":true,\"givevehicle\":true,\"giveperm\":true,\"clearinventory\":true,\"freeze\":true,\"copyxyz\":true,\"ban\":true,\"bannedplayers\":true,\"offlineban\":true,\"adminduty\":true,\"copyvector4\":true,\"allkick\":true,\"bring\":true,\"gastank\":true,\"takescreenshot\":true,\"invisible\":true,\"playerinfo\":true,\"addmoney\":true,\"weather\":true,\"addvehicletoplayer\":true,\"giveitem\":true,\"repairvehicle\":true,\"spectate\":true,\"armor\":true,\"cleararea\":true,\"kill\":true,\"servertime\":true,\"devlaser\":true,\"openinventory\":true,\"revive\":true,\"copyheading\":true,\"godmode\":true,\"copyvector3\":true,\"sendpm\":true,\"allpermission\":true,\"goto\":true,\"giveclothingmenu\":true,\"clearvehicle\":true}', '[]', '[]', '{\"license\":\"license2:cf872e2dbff1cf3152fff72b147ca07238315148\",\"token\":\"4:a560cfcb071039bc16cddd35e5ed8420dbf1eb2f62a629285ae0ca9232cef58c\",\"ip\":\"87.121.208.15\",\"name\":\"Martin Bubois\",\"identifier\":\"cf872e2dbff1cf3152fff72b147ca07238315148\",\"avatar\":\"https://cdn.discordapp.com/attachments/983471660684423240/1147567519712940044/example-pp.png\",\"steam\":\"steam:11000011799716e\",\"discord\":\"<@1245393309778841702>\"}'),
('2e598f707aea8f476eac986e4b4004ea10e8bc5e', '{\"showcoords\":false,\"adminduty\":false,\"bannedplayers\":false,\"freeze\":false,\"allkick\":false,\"goto\":false,\"copyxyz\":false,\"gastank\":false,\"offlineban\":false,\"devlaser\":false,\"noclip\":false,\"playername\":false,\"godmode\":false,\"armor\":false,\"takescreenshot\":false,\"copyvector4\":false,\"heal\":false,\"bring\":false,\"cleararea\":false,\"addmoney\":false,\"changejob\":false,\"allpermission\":false,\"repairvehicle\":false,\"revive\":false,\"clearinventory\":false,\"copyvector3\":false,\"givevehicle\":false,\"copyheading\":false,\"giveclothingmenu\":false,\"addvehicletoplayer\":false,\"clearvehicle\":false,\"sendpm\":false,\"openinventory\":false,\"ban\":false,\"playerinfo\":false,\"kill\":false,\"kick\":false,\"giveitem\":false,\"weather\":false,\"servertime\":false,\"invisible\":false,\"spectate\":false,\"announcement\":false,\"giveperm\":false}', '[]', '[]', '{\"identifier\":\"2e598f707aea8f476eac986e4b4004ea10e8bc5e\",\"avatar\":\"https://cdn.discordapp.com/attachments/983471660684423240/1147567519712940044/example-pp.png\",\"license\":\"license2:2e598f707aea8f476eac986e4b4004ea10e8bc5e\",\"ip\":\"88.169.181.45\",\"discord\":\"<@610597771870732288>\",\"token\":\"2:5ca36fbd8e4d80577ce900c38fe62d5b42df8ceaf6ca484d8f623cc8e3564783\",\"name\":\"Ivan Dushit\",\"steam\":\"\"}'),
('d621787821b7be9712dd11873dc3decca533bf6a', '{\"bring\":false,\"playername\":false,\"noclip\":false,\"repairvehicle\":false,\"spectate\":false,\"announcement\":false,\"clearinventory\":false,\"adminduty\":false,\"kick\":false,\"allpermission\":false,\"devlaser\":false,\"changejob\":false,\"heal\":false,\"showcoords\":false,\"giveclothingmenu\":false,\"openinventory\":false,\"addmoney\":false,\"sendpm\":false,\"copyxyz\":false,\"invisible\":false,\"revive\":false,\"godmode\":false,\"freeze\":false,\"copyvector3\":false,\"armor\":false,\"takescreenshot\":false,\"gastank\":false,\"giveitem\":false,\"clearvehicle\":false,\"bannedplayers\":false,\"ban\":false,\"offlineban\":false,\"addvehicletoplayer\":false,\"copyvector4\":false,\"copyheading\":false,\"cleararea\":false,\"goto\":false,\"servertime\":false,\"weather\":false,\"kill\":false,\"allkick\":false,\"playerinfo\":false,\"giveperm\":false,\"givevehicle\":false}', '[]', '[]', '{\"license\":\"license2:3ac9d2de8e4214636e15ddfdea0dad8159f7aec6\",\"discord\":\"<@939189874043539607>\",\"steam\":\"\",\"identifier\":\"d621787821b7be9712dd11873dc3decca533bf6a\",\"token\":\"3:2977d058f492146ce0582c0804108d9e736a0e45ee3320d344913f0a28bd6e28\",\"avatar\":\"https://cdn.discordapp.com/attachments/983471660684423240/1147567519712940044/example-pp.png\",\"ip\":\"88.180.216.131\",\"name\":\"Juan Rodriguez\"}'),
('b42b206cb9676c013317ee3b92d5e19e2314bb26', '{\"spectate\":false,\"adminduty\":false,\"copyheading\":false,\"allpermission\":false,\"invisible\":false,\"heal\":false,\"givevehicle\":false,\"sendpm\":false,\"playername\":false,\"godmode\":false,\"clearvehicle\":false,\"takescreenshot\":false,\"gastank\":false,\"allkick\":false,\"clearinventory\":false,\"giveperm\":false,\"copyvector4\":false,\"addmoney\":false,\"revive\":false,\"goto\":false,\"servertime\":false,\"playerinfo\":false,\"copyvector3\":false,\"openinventory\":false,\"giveitem\":false,\"kill\":false,\"weather\":false,\"announcement\":false,\"copyxyz\":false,\"noclip\":false,\"devlaser\":false,\"cleararea\":false,\"addvehicletoplayer\":false,\"armor\":false,\"showcoords\":false,\"ban\":false,\"freeze\":false,\"kick\":false,\"changejob\":false,\"bannedplayers\":false,\"bring\":false,\"repairvehicle\":false,\"giveclothingmenu\":false,\"offlineban\":false}', '[]', '[]', '{\"steam\":\"\",\"ip\":\"90.0.39.86\",\"avatar\":\"https://cdn.discordapp.com/attachments/983471660684423240/1147567519712940044/example-pp.png\",\"name\":\"Dona Kovar\",\"token\":\"3:32f8717dd8f73273334f1a4757f04df4727dda810caa6d7066dd7826ebabcdc5\",\"discord\":\"<@926849925948538891>\",\"license\":\"license2:b42b206cb9676c013317ee3b92d5e19e2314bb26\",\"identifier\":\"b42b206cb9676c013317ee3b92d5e19e2314bb26\"}'),
('bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', '{\"takescreenshot\":false,\"givevehicle\":false,\"servertime\":false,\"sendpm\":false,\"offlineban\":false,\"announcement\":false,\"giveclothingmenu\":false,\"freeze\":false,\"heal\":false,\"copyvector4\":false,\"bannedplayers\":false,\"repairvehicle\":false,\"clearvehicle\":false,\"addmoney\":false,\"copyvector3\":false,\"armor\":false,\"showcoords\":false,\"bring\":false,\"copyxyz\":false,\"playername\":false,\"spectate\":false,\"copyheading\":false,\"godmode\":false,\"changejob\":false,\"devlaser\":false,\"weather\":false,\"openinventory\":false,\"adminduty\":false,\"clearinventory\":false,\"invisible\":false,\"ban\":false,\"allpermission\":false,\"giveitem\":false,\"kill\":false,\"cleararea\":false,\"playerinfo\":false,\"kick\":false,\"allkick\":false,\"revive\":false,\"addvehicletoplayer\":false,\"gastank\":false,\"noclip\":false,\"goto\":false,\"giveperm\":false}', '[]', '[]', '{\"steam\":\"steam:11000016f1641df\",\"avatar\":\"https://cdn.discordapp.com/attachments/983471660684423240/1147567519712940044/example-pp.png\",\"license\":\"license2:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177\",\"identifier\":\"bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177\",\"token\":\"3:8497c1bf37daf61ee2615aed5f317c0981ea2544ebc041dc35333cafb0d2f648\",\"ip\":\"88.180.216.131\",\"name\":\"Enzo Martinez\",\"discord\":\"<@1286255292950253630>\"}'),
('2bf7bb148f0f54b434ac370cab06e592866df450', '{\"takescreenshot\":false,\"givevehicle\":false,\"servertime\":false,\"sendpm\":false,\"offlineban\":false,\"announcement\":false,\"giveperm\":false,\"freeze\":false,\"heal\":false,\"copyvector4\":false,\"bannedplayers\":false,\"repairvehicle\":false,\"clearvehicle\":false,\"addmoney\":false,\"copyvector3\":false,\"armor\":false,\"showcoords\":false,\"bring\":false,\"copyxyz\":false,\"playername\":false,\"spectate\":false,\"copyheading\":false,\"godmode\":false,\"kill\":false,\"devlaser\":false,\"kick\":false,\"openinventory\":false,\"goto\":false,\"revive\":false,\"gastank\":false,\"weather\":false,\"invisible\":false,\"giveitem\":false,\"allkick\":false,\"cleararea\":false,\"adminduty\":false,\"clearinventory\":false,\"changejob\":false,\"ban\":false,\"addvehicletoplayer\":false,\"playerinfo\":false,\"noclip\":false,\"allpermission\":false,\"giveclothingmenu\":false}', '[]', '[]', '{\"steam\":\"\",\"avatar\":\"https://cdn.discordapp.com/attachments/983471660684423240/1147567519712940044/example-pp.png\",\"license\":\"license2:2bf7bb148f0f54b434ac370cab06e592866df450\",\"identifier\":\"2bf7bb148f0f54b434ac370cab06e592866df450\",\"token\":\"3:b0426251955f54551d5b184b9ce4e06816f7f261cb89811b803657453a9d2dea\",\"name\":\"David Lafarge\",\"ip\":\"89.90.30.3\",\"discord\":\"<@334438290918866955>\"}'),
('4634506b65176f2c2aa6a1af9831d3efbd168ee0', '{\"takescreenshot\":false,\"godmode\":false,\"givevehicle\":false,\"giveclothingmenu\":false,\"heal\":false,\"revive\":false,\"playerinfo\":false,\"copyheading\":false,\"devlaser\":false,\"sendpm\":false,\"armor\":false,\"announcement\":false,\"servertime\":false,\"repairvehicle\":false,\"bannedplayers\":false,\"copyxyz\":false,\"ban\":false,\"giveperm\":false,\"invisible\":false,\"showcoords\":false,\"clearinventory\":false,\"spectate\":false,\"adminduty\":false,\"playername\":false,\"allkick\":false,\"copyvector3\":false,\"kill\":false,\"gastank\":false,\"offlineban\":false,\"kick\":false,\"weather\":false,\"addmoney\":false,\"giveitem\":false,\"addvehicletoplayer\":false,\"freeze\":false,\"clearvehicle\":false,\"copyvector4\":false,\"cleararea\":false,\"openinventory\":false,\"noclip\":false,\"bring\":false,\"changejob\":false,\"allpermission\":false,\"goto\":false}', '[]', '[]', '{\"steam\":\"\",\"discord\":\"<@454331101616406528>\",\"name\":\"Miguel\",\"license\":\"license2:4634506b65176f2c2aa6a1af9831d3efbd168ee0\",\"avatar\":\"https://cdn.discordapp.com/attachments/983471660684423240/1147567519712940044/example-pp.png\",\"ip\":\"109.219.132.52\",\"token\":\"5:64ee3c8be4d25a79f63df3fcf00e673c0466c4c43c46d1b6e3367dbf5c36e76e\",\"identifier\":\"4634506b65176f2c2aa6a1af9831d3efbd168ee0\"}'),
('6dfb75f417bec5276010b020f222640f80c91043', '{\"copyvector4\":false,\"clearvehicle\":false,\"copyvector3\":false,\"openinventory\":false,\"takescreenshot\":false,\"allpermission\":false,\"giveclothingmenu\":false,\"adminduty\":false,\"heal\":false,\"devlaser\":false,\"playerinfo\":false,\"showcoords\":false,\"changejob\":false,\"repairvehicle\":false,\"gastank\":false,\"bring\":false,\"addmoney\":false,\"spectate\":false,\"armor\":false,\"invisible\":false,\"sendpm\":false,\"goto\":false,\"bannedplayers\":false,\"weather\":false,\"kick\":false,\"addvehicletoplayer\":false,\"playername\":false,\"offlineban\":false,\"clearinventory\":false,\"announcement\":false,\"servertime\":false,\"allkick\":false,\"kill\":false,\"cleararea\":false,\"giveperm\":false,\"noclip\":false,\"ban\":false,\"copyxyz\":false,\"givevehicle\":false,\"copyheading\":false,\"freeze\":false,\"giveitem\":false,\"godmode\":false,\"revive\":false}', '[]', '[]', '{\"discord\":\"<@1307489461906706444>\",\"identifier\":\"6dfb75f417bec5276010b020f222640f80c91043\",\"steam\":\"\",\"token\":\"3:332748816f1eb177c52513f31236b472712ed4a442614ca587db447d6de37c0e\",\"avatar\":\"https://cdn.discordapp.com/attachments/983471660684423240/1147567519712940044/example-pp.png\",\"name\":\"RUDOX\",\"ip\":\"37.65.31.154\",\"license\":\"license2:6dfb75f417bec5276010b020f222640f80c91043\"}'),
('char1:cf872e2dbff1cf3152fff72b147ca07238315148', '{\"goto\":true,\"allpermission\":true,\"takescreenshot\":true,\"spectate\":true,\"playername\":true,\"gastank\":true,\"kick\":true,\"devlaser\":true,\"clearinventory\":true,\"giveitem\":true,\"allkick\":true,\"weather\":true,\"invisible\":true,\"cleararea\":true,\"sendpm\":true,\"ban\":true,\"noclip\":true,\"openinventory\":true,\"changejob\":true,\"bannedplayers\":true,\"kill\":true,\"givevehicle\":true,\"copyvector3\":true,\"giveclothingmenu\":true,\"heal\":true,\"bring\":true,\"showcoords\":true,\"copyheading\":true,\"servertime\":true,\"giveperm\":true,\"freeze\":true,\"announcement\":true,\"godmode\":true,\"clearvehicle\":true,\"armor\":true,\"addmoney\":true,\"adminduty\":true,\"copyxyz\":true,\"playerinfo\":true,\"offlineban\":true,\"copyvector4\":true,\"revive\":true,\"addvehicletoplayer\":true,\"repairvehicle\":true}', '[]', '[]', '{\"token\":\"4:a560cfcb071039bc16cddd35e5ed8420dbf1eb2f62a629285ae0ca9232cef58c\",\"ip\":\"87.121.209.71\",\"steam\":\"steam:11000011799716e\",\"identifier\":\"char1:cf872e2dbff1cf3152fff72b147ca07238315148\",\"avatar\":\"https://cdn.discordapp.com/attachments/983471660684423240/1147567519712940044/example-pp.png\",\"name\":\"Martin Bubois\",\"discord\":\"<@1245393309778841702>\",\"license\":\"license2:cf872e2dbff1cf3152fff72b147ca07238315148\"}'),
('char2:cf872e2dbff1cf3152fff72b147ca07238315148', '{\"playerinfo\":false,\"playername\":false,\"devlaser\":false,\"gastank\":false,\"kill\":false,\"goto\":false,\"allkick\":false,\"announcement\":false,\"giveperm\":false,\"repairvehicle\":false,\"kick\":false,\"weather\":false,\"clearvehicle\":false,\"giveclothingmenu\":false,\"bring\":false,\"copyxyz\":false,\"invisible\":false,\"freeze\":false,\"addmoney\":false,\"godmode\":false,\"spectate\":false,\"ban\":false,\"adminduty\":false,\"giveitem\":false,\"addvehicletoplayer\":false,\"armor\":false,\"changejob\":false,\"revive\":false,\"copyheading\":false,\"copyvector3\":false,\"sendpm\":false,\"noclip\":false,\"cleararea\":false,\"openinventory\":false,\"showcoords\":false,\"givevehicle\":false,\"copyvector4\":false,\"allpermission\":false,\"servertime\":false,\"clearinventory\":false,\"takescreenshot\":false,\"bannedplayers\":false,\"offlineban\":false,\"heal\":false}', '[]', '[]', '{\"license\":\"license2:cf872e2dbff1cf3152fff72b147ca07238315148\",\"name\":\"Timote Labite\",\"ip\":\"87.121.208.15\",\"identifier\":\"char2:cf872e2dbff1cf3152fff72b147ca07238315148\",\"token\":\"4:a560cfcb071039bc16cddd35e5ed8420dbf1eb2f62a629285ae0ca9232cef58c\",\"avatar\":\"https://cdn.discordapp.com/attachments/983471660684423240/1147567519712940044/example-pp.png\",\"steam\":\"steam:11000011799716e\",\"discord\":\"<@1245393309778841702>\"}'),
('char3:cf872e2dbff1cf3152fff72b147ca07238315148', '{\"playerinfo\":false,\"takescreenshot\":false,\"goto\":false,\"clearvehicle\":false,\"sendpm\":false,\"copyxyz\":false,\"changejob\":false,\"devlaser\":false,\"bring\":false,\"gastank\":false,\"addmoney\":false,\"copyheading\":false,\"givevehicle\":false,\"revive\":false,\"giveperm\":false,\"bannedplayers\":false,\"offlineban\":false,\"clearinventory\":false,\"repairvehicle\":false,\"servertime\":false,\"kick\":false,\"spectate\":false,\"freeze\":false,\"heal\":false,\"allkick\":false,\"adminduty\":false,\"playername\":false,\"allpermission\":false,\"copyvector3\":false,\"ban\":false,\"armor\":false,\"openinventory\":false,\"invisible\":false,\"cleararea\":false,\"giveclothingmenu\":false,\"kill\":false,\"addvehicletoplayer\":false,\"weather\":false,\"noclip\":false,\"announcement\":false,\"copyvector4\":false,\"showcoords\":false,\"godmode\":false,\"giveitem\":false}', '[]', '[]', '{\"name\":\"Martine Bubois\",\"discord\":\"<@1245393309778841702>\",\"identifier\":\"char3:cf872e2dbff1cf3152fff72b147ca07238315148\",\"license\":\"license2:cf872e2dbff1cf3152fff72b147ca07238315148\",\"token\":\"4:a560cfcb071039bc16cddd35e5ed8420dbf1eb2f62a629285ae0ca9232cef58c\",\"ip\":\"87.121.208.15\",\"steam\":\"steam:11000011799716e\",\"avatar\":\"https://cdn.discordapp.com/attachments/983471660684423240/1147567519712940044/example-pp.png\"}'),
('char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', '{\"ban\":false,\"bannedplayers\":false,\"giveclothingmenu\":false,\"gastank\":false,\"playerinfo\":false,\"goto\":false,\"offlineban\":false,\"allpermission\":false,\"showcoords\":false,\"playername\":false,\"copyvector4\":false,\"addvehicletoplayer\":false,\"copyheading\":false,\"freeze\":false,\"sendpm\":false,\"clearvehicle\":false,\"openinventory\":false,\"copyvector3\":false,\"kill\":false,\"revive\":false,\"adminduty\":false,\"copyxyz\":false,\"kick\":false,\"weather\":false,\"heal\":false,\"addmoney\":false,\"devlaser\":false,\"giveitem\":false,\"godmode\":false,\"cleararea\":false,\"giveperm\":false,\"repairvehicle\":false,\"servertime\":false,\"allkick\":false,\"noclip\":false,\"bring\":false,\"clearinventory\":false,\"givevehicle\":false,\"invisible\":false,\"armor\":false,\"takescreenshot\":false,\"spectate\":false,\"announcement\":false,\"changejob\":false}', '[]', '[]', '{\"token\":\"3:8497c1bf37daf61ee2615aed5f317c0981ea2544ebc041dc35333cafb0d2f648\",\"avatar\":\"https://cdn.discordapp.com/attachments/983471660684423240/1147567519712940044/example-pp.png\",\"license\":\"license2:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177\",\"discord\":\"<@1286255292950253630>\",\"name\":\"Enzo Martinez\",\"identifier\":\"char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177\",\"ip\":\"88.180.216.131\",\"steam\":\"steam:11000016f1641df\"}'),
('char1:d621787821b7be9712dd11873dc3decca533bf6a', '{\"kick\":true,\"spectate\":true,\"copyheading\":true,\"armor\":true,\"cleararea\":true,\"invisible\":true,\"ban\":true,\"bannedplayers\":true,\"copyxyz\":true,\"openinventory\":true,\"addmoney\":true,\"allpermission\":true,\"goto\":true,\"clearvehicle\":true,\"devlaser\":true,\"revive\":true,\"giveitem\":true,\"allkick\":true,\"copyvector4\":true,\"godmode\":true,\"clearinventory\":true,\"servertime\":true,\"takescreenshot\":true,\"showcoords\":true,\"playerinfo\":true,\"repairvehicle\":true,\"changejob\":true,\"giveclothingmenu\":true,\"bring\":true,\"giveperm\":true,\"adminduty\":true,\"noclip\":true,\"playername\":true,\"gastank\":true,\"offlineban\":true,\"givevehicle\":true,\"copyvector3\":true,\"addvehicletoplayer\":true,\"weather\":true,\"announcement\":true,\"freeze\":true,\"heal\":true,\"kill\":true,\"sendpm\":true}', '[]', '[]', '{\"token\":\"3:2977d058f492146ce0582c0804108d9e736a0e45ee3320d344913f0a28bd6e28\",\"steam\":\"\",\"name\":\"Juan Rodriguez\",\"identifier\":\"char1:d621787821b7be9712dd11873dc3decca533bf6a\",\"ip\":\"88.180.216.131\",\"avatar\":\"https://cdn.discordapp.com/attachments/983471660684423240/1147567519712940044/example-pp.png\",\"discord\":\"<@939189874043539607>\",\"license\":\"license2:3ac9d2de8e4214636e15ddfdea0dad8159f7aec6\"}'),
('char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', '{\"playername\":false,\"spectate\":false,\"kick\":false,\"copyxyz\":false,\"weather\":false,\"freeze\":false,\"repairvehicle\":false,\"bannedplayers\":false,\"copyvector4\":false,\"ban\":false,\"noclip\":false,\"invisible\":false,\"adminduty\":false,\"offlineban\":false,\"devlaser\":false,\"sendpm\":false,\"givevehicle\":false,\"goto\":false,\"allpermission\":false,\"takescreenshot\":false,\"changejob\":false,\"giveclothingmenu\":false,\"addvehicletoplayer\":false,\"armor\":false,\"cleararea\":false,\"playerinfo\":false,\"gastank\":false,\"kill\":false,\"heal\":false,\"openinventory\":false,\"addmoney\":false,\"revive\":false,\"clearvehicle\":false,\"giveitem\":false,\"copyvector3\":false,\"announcement\":false,\"clearinventory\":false,\"allkick\":false,\"copyheading\":false,\"showcoords\":false,\"giveperm\":false,\"servertime\":false,\"bring\":false,\"godmode\":false}', '[]', '[]', '{\"steam\":\"\",\"avatar\":\"https://cdn.discordapp.com/attachments/983471660684423240/1147567519712940044/example-pp.png\",\"license\":\"license2:2e598f707aea8f476eac986e4b4004ea10e8bc5e\",\"ip\":\"92.149.43.52\",\"name\":\"Ivan Dushit\",\"identifier\":\"char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e\",\"discord\":\"<@610597771870732288>\",\"token\":\"3:6a7e2fdf1ea415ade19962d0e0abf2112d0d1d24c76da7403ba3eabeed2f6541\"}'),
('char1:2bf7bb148f0f54b434ac370cab06e592866df450', '{\"kick\":false,\"spectate\":false,\"copyheading\":false,\"kill\":false,\"cleararea\":false,\"playerinfo\":false,\"ban\":false,\"bannedplayers\":false,\"copyxyz\":false,\"openinventory\":false,\"addmoney\":false,\"allpermission\":false,\"goto\":false,\"clearvehicle\":false,\"devlaser\":false,\"revive\":false,\"takescreenshot\":false,\"allkick\":false,\"copyvector4\":false,\"addvehicletoplayer\":false,\"clearinventory\":false,\"servertime\":false,\"adminduty\":false,\"showcoords\":false,\"weather\":false,\"repairvehicle\":false,\"godmode\":false,\"giveitem\":false,\"bring\":false,\"giveperm\":false,\"invisible\":false,\"noclip\":false,\"playername\":false,\"gastank\":false,\"offlineban\":false,\"armor\":false,\"copyvector3\":false,\"givevehicle\":false,\"giveclothingmenu\":false,\"announcement\":false,\"freeze\":false,\"heal\":false,\"changejob\":false,\"sendpm\":false}', '[]', '[]', '{\"token\":\"3:b0426251955f54551d5b184b9ce4e06816f7f261cb89811b803657453a9d2dea\",\"steam\":\"steam:11000010c185938\",\"name\":\"David Lafarge\",\"identifier\":\"char1:2bf7bb148f0f54b434ac370cab06e592866df450\",\"ip\":\"89.90.30.3\",\"avatar\":\"https://cdn.discordapp.com/attachments/983471660684423240/1147567519712940044/example-pp.png\",\"discord\":\"<@334438290918866955>\",\"license\":\"license2:2bf7bb148f0f54b434ac370cab06e592866df450\"}');

-- --------------------------------------------------------

--
-- Structure de la table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('property', 'Property', 0),
('society_ambulance', 'EMS', 1),
('society_ammunation', 'Ammunation', 1),
('society_army_fr', 'Armée Francaise', 1),
('society_army_terre_fr', 'Armée Terre FR', 1),
('society_arp', 'Armée Rouge de Paleto', 1),
('society_banker', 'Banker', 1),
('society_cardealer', 'Cardealer', 1),
('society_chauffeurpl', 'Chauffeur PL', 1),
('society_cit', 'Corps d’Intervention Tactique', 1),
('society_cn', 'Les Chacals Noirs', 1),
('society_cnu', 'CNU', 1),
('society_co', 'Le Cartel de l’Ombre', 1),
('society_df', 'Division Fantôme', 1),
('society_fisherman', 'Fisherman', 1),
('society_fsa', 'FSA', 1),
('society_fueler', 'Fueler', 1),
('society_gotur', 'Götür', 1),
('society_gouv', 'Gouvernement', 1),
('society_ld', 'Les Loups du Désert', 1),
('society_ln', 'Légion Noir', 1),
('society_lr', 'Les Revenants', 1),
('society_lumberjack', 'Lumberjack', 1),
('society_mechanic', 'Mechanic', 1),
('society_miner', 'Miner', 1),
('society_ms', 'La Milice du Sang', 1),
('society_pecheur', 'pecheur', 1),
('society_pharm', 'Pharmacien', 1),
('society_police', 'Police', 1),
('society_reporter', 'Reporter', 1),
('society_rpbc', 'République Populaire de Blaine County', 1),
('society_slaughterer', 'Butcher', 1),
('society_tailor', 'Tailor', 1),
('society_taxi', 'Taxi', 1),
('society_unemployed', 'Unemployed', 1),
('user_ears', 'Ears', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Mask', 0);

-- --------------------------------------------------------

--
-- Structure de la table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `owner` varchar(259) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1, 'society_police', NULL, '{}'),
(2, 'society_ambulance', NULL, '{}'),
(3, 'society_mechanic', NULL, '{}'),
(4, 'society_taxi', NULL, '{}'),
(5, 'property', NULL, '{}'),
(6, 'property', 'cf872e2dbff1cf3152fff72b147ca07238315148', '{\"dressing\":[{\"skin\":{\"nose_5\":0,\"watches_2\":0,\"sex\":0,\"chain_2\":0,\"neck_thickness\":0,\"makeup_1\":0,\"bags_1\":0,\"eyebrows_1\":0,\"pants_2\":0,\"eye_squint\":0,\"ears_1\":-1,\"grandparents\":0,\"complexion_2\":0,\"glasses_1\":35,\"nose_4\":0,\"pants_1\":7,\"shoes_1\":4,\"glasses_2\":0,\"nose_2\":0,\"watches_1\":2,\"eyebrows_5\":0,\"decals_2\":0,\"bags_2\":0,\"bproof_1\":36,\"beard_4\":0,\"hair_color_1\":0,\"chin_1\":0,\"chain_1\":0,\"lipstick_4\":0,\"lipstick_2\":0,\"shoes_2\":0,\"sun_1\":0,\"cheeks_1\":0,\"cheeks_3\":0,\"sun_2\":0,\"nose_1\":0,\"helmet_2\":-1,\"beard_2\":0,\"chin_3\":0,\"bracelets_2\":0,\"chin_2\":0,\"chest_1\":0,\"nose_3\":0,\"bproof_2\":0,\"chest_2\":0,\"lipstick_1\":0,\"tshirt_2\":0,\"eyebrows_4\":0,\"age_2\":0,\"moles_1\":0,\"age_1\":0,\"dad\":0,\"eye_color\":0,\"ears_2\":0,\"lip_thickness\":0,\"blush_1\":0,\"mom\":0,\"face_g_weight\":0,\"blush_2\":0,\"helmet_1\":-1,\"bracelets_1\":-1,\"cheeks_2\":0,\"eyebrows_2\":0,\"hair_1\":0,\"hair_color_2\":0,\"skin_md_weight\":50,\"makeup_2\":0,\"makeup_4\":0,\"blush_3\":0,\"chest_3\":0,\"bodyb_3\":-1,\"bodyb_1\":-1,\"beard_1\":0,\"bodyb_2\":0,\"torso_2\":0,\"jaw_2\":0,\"decals_1\":0,\"blemishes_1\":0,\"mask_2\":0,\"blemishes_2\":0,\"face_md_weight\":50,\"bodyb_4\":0,\"eyebrows_6\":0,\"beard_3\":0,\"makeup_3\":0,\"torso_1\":162,\"arms\":0,\"jaw_1\":0,\"chin_4\":0,\"complexion_1\":0,\"moles_2\":0,\"lipstick_3\":0,\"eyebrows_3\":0,\"hair_2\":0,\"tshirt_1\":15,\"nose_6\":0,\"mask_1\":0,\"arms_2\":0},\"label\":\"test\"},{\"label\":\"test\",\"skin\":{\"nose_5\":0,\"watches_2\":0,\"blush_3\":0,\"chain_2\":0,\"neck_thickness\":0,\"age_1\":0,\"bags_1\":0,\"eyebrows_1\":0,\"pants_2\":0,\"eye_squint\":0,\"ears_1\":-1,\"grandparents\":0,\"complexion_2\":0,\"glasses_1\":35,\"nose_4\":0,\"complexion_1\":0,\"bodyb_4\":0,\"glasses_2\":0,\"eyebrows_6\":0,\"watches_1\":2,\"eyebrows_5\":0,\"decals_2\":0,\"bags_2\":0,\"bproof_1\":36,\"beard_4\":0,\"makeup_2\":0,\"chin_1\":0,\"chain_1\":0,\"arms\":0,\"lipstick_2\":0,\"shoes_2\":0,\"sun_1\":0,\"cheeks_1\":0,\"cheeks_3\":0,\"sun_2\":0,\"nose_1\":0,\"helmet_2\":-1,\"beard_2\":0,\"chin_3\":0,\"mom\":0,\"mask_2\":0,\"chest_1\":0,\"nose_3\":0,\"face_g_weight\":0,\"chest_2\":0,\"lipstick_1\":0,\"bproof_2\":0,\"eyebrows_4\":0,\"age_2\":0,\"moles_1\":0,\"tshirt_2\":0,\"bracelets_1\":-1,\"eye_color\":0,\"ears_2\":0,\"lip_thickness\":0,\"hair_color_1\":0,\"bracelets_2\":0,\"blemishes_2\":0,\"blush_1\":0,\"helmet_1\":-1,\"sex\":0,\"cheeks_2\":0,\"eyebrows_2\":0,\"hair_1\":0,\"hair_color_2\":0,\"skin_md_weight\":50,\"dad\":0,\"makeup_4\":0,\"mask_1\":0,\"chest_3\":0,\"chin_4\":0,\"bodyb_1\":-1,\"bodyb_3\":-1,\"beard_1\":0,\"lipstick_4\":0,\"shoes_1\":4,\"decals_1\":0,\"blemishes_1\":0,\"bodyb_2\":0,\"jaw_1\":0,\"face_md_weight\":50,\"jaw_2\":0,\"lipstick_3\":0,\"beard_3\":0,\"makeup_3\":0,\"torso_1\":4,\"torso_2\":0,\"nose_2\":0,\"nose_6\":0,\"makeup_1\":0,\"moles_2\":0,\"pants_1\":7,\"eyebrows_3\":0,\"hair_2\":0,\"tshirt_1\":53,\"blush_2\":0,\"chin_2\":0,\"arms_2\":0}}]}'),
(7, 'user_ears', 'cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(8, 'user_glasses', 'cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(9, 'user_mask', 'cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(10, 'user_helmet', 'cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(11, 'society_lumberjack', NULL, '{}'),
(12, 'society_fueler', NULL, '{}'),
(13, 'society_slaughterer', NULL, '{}'),
(14, 'society_banker', NULL, '{}'),
(15, 'society_fisherman', NULL, '{}'),
(16, 'society_reporter', NULL, '{}'),
(17, 'society_cardealer', NULL, '{}'),
(18, 'society_miner', NULL, '{}'),
(19, 'society_tailor', NULL, '{}'),
(20, 'society_unemployed', NULL, '{}'),
(21, 'society_army_fr', NULL, '{}'),
(22, 'society_army_terre_fr', NULL, '{}'),
(23, 'society_gotur', NULL, '{}'),
(24, 'society_cnu', NULL, '{}'),
(25, 'society_fsa', NULL, '{}'),
(26, 'society_ln', NULL, '{}'),
(27, 'society_rpbc', NULL, '{}'),
(28, 'society_cit', NULL, '{}'),
(29, 'society_arp', NULL, '{}'),
(30, 'society_df', NULL, '{}'),
(31, 'society_ld', NULL, '{}'),
(32, 'society_ms', NULL, '{}'),
(33, 'society_co', NULL, '{}'),
(34, 'society_cn', NULL, '{}'),
(35, 'society_lr', NULL, '{}'),
(36, 'property', NULL, '{}'),
(37, 'property', NULL, '{}'),
(38, 'property', NULL, '{}'),
(39, 'property', NULL, '{}'),
(40, 'property', NULL, '{}'),
(41, 'property', NULL, '{}'),
(42, 'property', NULL, '{}'),
(43, 'property', NULL, '{}'),
(44, 'property', NULL, '{}'),
(45, 'property', NULL, '{}'),
(46, 'property', NULL, '{}'),
(47, 'property', NULL, '{}'),
(48, 'property', NULL, '{}'),
(49, 'property', NULL, '{}'),
(50, 'property', NULL, '{}'),
(51, 'property', NULL, '{}'),
(52, 'property', NULL, '{}'),
(53, 'property', NULL, '{}'),
(54, 'property', NULL, '{}'),
(55, 'property', NULL, '{}'),
(56, 'property', NULL, '{}'),
(57, 'property', NULL, '{}'),
(58, 'property', NULL, '{}'),
(59, 'property', NULL, '{}'),
(60, 'property', NULL, '{}'),
(61, 'property', NULL, '{}'),
(62, 'property', NULL, '{}'),
(63, 'property', NULL, '{}'),
(64, 'property', NULL, '{}'),
(65, 'property', NULL, '{}'),
(66, 'property', NULL, '{}'),
(67, 'property', NULL, '{}'),
(68, 'property', NULL, '{}'),
(69, 'property', NULL, '{}'),
(70, 'property', NULL, '{}'),
(71, 'property', NULL, '{}'),
(72, 'property', NULL, '{}'),
(73, 'property', NULL, '{}'),
(74, 'property', NULL, '{}'),
(75, 'property', NULL, '{}'),
(76, 'property', NULL, '{}'),
(77, 'property', NULL, '{}'),
(78, 'property', NULL, '{}'),
(79, 'property', NULL, '{}'),
(80, 'property', NULL, '{}'),
(81, 'property', NULL, '{}'),
(82, 'property', NULL, '{}'),
(83, 'property', NULL, '{}'),
(84, 'property', '2e598f707aea8f476eac986e4b4004ea10e8bc5e', '{\"dressing\":[{\"label\":\"staff-\",\"skin\":{\"bodyb_4\":0,\"chest_2\":0,\"bags_1\":0,\"moles_2\":0,\"grandparents\":0,\"tshirt_1\":130,\"age_1\":0,\"bodyb_2\":0,\"eyebrows_6\":0,\"chin_3\":0,\"mask_2\":0,\"jaw_1\":0,\"chin_4\":0,\"makeup_1\":0,\"age_2\":0,\"shoes_1\":55,\"bags_2\":0,\"hair_color_2\":0,\"bproof_1\":0,\"jaw_2\":0,\"beard_1\":0,\"beard_4\":0,\"beard_3\":0,\"tshirt_2\":0,\"chin_1\":0,\"bodyb_1\":-1,\"torso_1\":178,\"eyebrows_2\":0,\"neck_thickness\":0,\"hair_color_1\":0,\"lip_thickness\":0,\"eyebrows_1\":0,\"eye_squint\":0,\"bproof_2\":0,\"mom\":0,\"blush_2\":0,\"chin_2\":0,\"chain_1\":0,\"bodyb_3\":-1,\"sex\":0,\"eyebrows_3\":0,\"cheeks_3\":0,\"ears_1\":-1,\"blemishes_2\":0,\"nose_1\":0,\"helmet_2\":0,\"complexion_1\":0,\"mask_1\":0,\"lipstick_2\":0,\"shoes_2\":5,\"nose_6\":0,\"torso_2\":5,\"arms_2\":0,\"beard_2\":0,\"bracelets_1\":-1,\"moles_1\":0,\"nose_4\":0,\"glasses_1\":0,\"pants_1\":77,\"lipstick_4\":0,\"chest_3\":0,\"blush_3\":0,\"sun_1\":0,\"skin_md_weight\":50,\"face_md_weight\":50,\"blush_1\":0,\"cheeks_1\":0,\"decals_1\":0,\"bracelets_2\":0,\"eyebrows_5\":0,\"lipstick_1\":0,\"chain_2\":0,\"makeup_3\":0,\"lipstick_3\":0,\"watches_1\":-1,\"watches_2\":0,\"face_g_weight\":0,\"hair_2\":0,\"makeup_4\":0,\"nose_2\":0,\"eyebrows_4\":0,\"nose_3\":0,\"makeup_2\":0,\"glasses_2\":0,\"cheeks_2\":0,\"ears_2\":0,\"dad\":0,\"hair_1\":24,\"chest_1\":0,\"complexion_2\":0,\"helmet_1\":-1,\"nose_5\":0,\"decals_2\":0,\"blemishes_1\":0,\"pants_2\":5,\"sun_2\":0,\"eye_color\":0,\"arms\":0}},{\"label\":\"staff orange\",\"skin\":{\"bodyb_4\":0,\"chest_2\":0,\"blush_2\":0,\"moles_2\":0,\"grandparents\":0,\"tshirt_1\":130,\"age_1\":0,\"bodyb_2\":0,\"eyebrows_6\":0,\"ears_1\":-1,\"mask_2\":0,\"jaw_1\":0,\"dad\":0,\"makeup_1\":0,\"blush_1\":0,\"nose_5\":0,\"bags_2\":0,\"hair_color_2\":0,\"bproof_1\":0,\"mask_1\":0,\"beard_1\":0,\"beard_4\":0,\"beard_3\":0,\"tshirt_2\":0,\"chin_1\":0,\"bodyb_1\":-1,\"torso_1\":178,\"eyebrows_2\":0,\"neck_thickness\":0,\"hair_color_1\":0,\"lip_thickness\":0,\"eyebrows_1\":0,\"eye_squint\":0,\"bproof_2\":0,\"cheeks_2\":0,\"complexion_1\":0,\"chin_2\":0,\"chain_1\":0,\"bodyb_3\":-1,\"glasses_2\":0,\"eyebrows_3\":0,\"cheeks_3\":0,\"face_md_weight\":50,\"blemishes_2\":0,\"nose_1\":0,\"jaw_2\":0,\"hair_2\":0,\"mom\":0,\"sun_1\":0,\"shoes_2\":2,\"nose_6\":0,\"torso_2\":2,\"pants_2\":2,\"beard_2\":0,\"bracelets_1\":-1,\"moles_1\":0,\"nose_4\":0,\"glasses_1\":0,\"pants_1\":77,\"lipstick_4\":0,\"blemishes_1\":0,\"makeup_2\":0,\"lipstick_2\":0,\"arms_2\":0,\"bags_1\":0,\"decals_1\":0,\"cheeks_1\":0,\"chest_1\":0,\"sex\":0,\"chest_3\":0,\"lipstick_1\":0,\"chain_2\":0,\"makeup_3\":0,\"lipstick_3\":0,\"watches_1\":-1,\"helmet_2\":0,\"face_g_weight\":0,\"shoes_1\":55,\"makeup_4\":0,\"nose_2\":0,\"eyebrows_4\":0,\"nose_3\":0,\"age_2\":0,\"bracelets_2\":0,\"eye_color\":0,\"ears_2\":0,\"blush_3\":0,\"hair_1\":24,\"watches_2\":0,\"complexion_2\":0,\"helmet_1\":-1,\"arms\":0,\"decals_2\":0,\"eyebrows_5\":0,\"skin_md_weight\":50,\"sun_2\":0,\"chin_4\":0,\"chin_3\":0}}]}'),
(85, 'user_ears', '2e598f707aea8f476eac986e4b4004ea10e8bc5e', '{}'),
(86, 'user_glasses', '2e598f707aea8f476eac986e4b4004ea10e8bc5e', '{}'),
(87, 'user_mask', '2e598f707aea8f476eac986e4b4004ea10e8bc5e', '{}'),
(88, 'user_helmet', '2e598f707aea8f476eac986e4b4004ea10e8bc5e', '{}'),
(89, 'property', NULL, '{}'),
(90, 'property', NULL, '{}'),
(91, 'property', NULL, '{}'),
(92, 'property', NULL, '{}'),
(93, 'property', NULL, '{}'),
(94, 'property', NULL, '{}'),
(95, 'property', NULL, '{}'),
(96, 'property', NULL, '{}'),
(97, 'property', NULL, '{}'),
(98, 'property', NULL, '{}'),
(99, 'property', NULL, '{}'),
(100, 'property', NULL, '{}'),
(101, 'property', NULL, '{}'),
(102, 'property', NULL, '{}'),
(103, 'property', NULL, '{}'),
(104, 'property', NULL, '{}'),
(105, 'property', NULL, '{}'),
(106, 'property', NULL, '{}'),
(107, 'property', NULL, '{}'),
(108, 'property', NULL, '{}'),
(109, 'property', NULL, '{}'),
(110, 'property', NULL, '{}'),
(111, 'property', NULL, '{}'),
(112, 'property', NULL, '{}'),
(113, 'property', NULL, '{}'),
(114, 'property', NULL, '{}'),
(115, 'property', NULL, '{}'),
(116, 'property', NULL, '{}'),
(117, 'property', NULL, '{}'),
(118, 'property', NULL, '{}'),
(119, 'property', NULL, '{}'),
(120, 'property', NULL, '{}'),
(121, 'property', NULL, '{}'),
(122, 'property', NULL, '{}'),
(123, 'property', NULL, '{}'),
(124, 'property', NULL, '{}'),
(125, 'property', NULL, '{}'),
(126, 'property', NULL, '{}'),
(127, 'property', NULL, '{}'),
(128, 'property', NULL, '{}'),
(129, 'property', NULL, '{}'),
(130, 'property', NULL, '{}'),
(131, 'property', NULL, '{}'),
(132, 'property', NULL, '{}'),
(133, 'property', NULL, '{}'),
(134, 'property', NULL, '{}'),
(135, 'property', NULL, '{}'),
(136, 'property', NULL, '{}'),
(137, 'property', NULL, '{}'),
(138, 'property', NULL, '{}'),
(139, 'property', NULL, '{}'),
(140, 'property', NULL, '{}'),
(141, 'property', NULL, '{}'),
(142, 'property', NULL, '{}'),
(143, 'property', NULL, '{}'),
(144, 'property', NULL, '{}'),
(145, 'property', NULL, '{}'),
(146, 'property', NULL, '{}'),
(147, 'property', NULL, '{}'),
(148, 'property', NULL, '{}'),
(149, 'property', NULL, '{}'),
(150, 'property', NULL, '{}'),
(151, 'property', NULL, '{}'),
(152, 'property', NULL, '{}'),
(153, 'property', NULL, '{}'),
(154, 'property', NULL, '{}'),
(155, 'property', NULL, '{}'),
(156, 'property', NULL, '{}'),
(157, 'property', NULL, '{}'),
(158, 'property', NULL, '{}'),
(159, 'property', NULL, '{}'),
(160, 'property', NULL, '{}'),
(161, 'property', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(162, 'user_mask', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(163, 'user_helmet', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(164, 'user_glasses', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(165, 'user_ears', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(166, 'property', NULL, '{}'),
(167, 'property', NULL, '{}'),
(168, 'property', NULL, '{}'),
(169, 'property', NULL, '{}'),
(170, 'property', NULL, '{}'),
(171, 'property', NULL, '{}'),
(172, 'property', NULL, '{}'),
(173, 'property', NULL, '{}'),
(174, 'property', NULL, '{}'),
(175, 'property', NULL, '{}'),
(176, 'property', NULL, '{}'),
(177, 'property', NULL, '{}'),
(178, 'property', NULL, '{}'),
(179, 'property', NULL, '{}'),
(180, 'property', NULL, '{}'),
(181, 'property', NULL, '{}'),
(182, 'property', NULL, '{}'),
(183, 'property', NULL, '{}'),
(184, 'property', NULL, '{}'),
(185, 'property', NULL, '{}'),
(186, 'property', NULL, '{}'),
(187, 'property', NULL, '{}'),
(188, 'property', NULL, '{}'),
(189, 'property', NULL, '{}'),
(190, 'property', NULL, '{}'),
(191, 'property', NULL, '{}'),
(192, 'property', NULL, '{}'),
(193, 'property', NULL, '{}'),
(194, 'property', NULL, '{}'),
(195, 'property', NULL, '{}'),
(196, 'property', NULL, '{}'),
(197, 'property', NULL, '{}'),
(198, 'property', NULL, '{}'),
(199, 'property', NULL, '{}'),
(200, 'property', NULL, '{}'),
(201, 'property', NULL, '{}'),
(202, 'property', NULL, '{}'),
(203, 'property', NULL, '{}'),
(204, 'property', NULL, '{}'),
(205, 'property', NULL, '{}'),
(206, 'property', NULL, '{}'),
(207, 'property', NULL, '{}'),
(208, 'property', NULL, '{}'),
(209, 'property', NULL, '{}'),
(210, 'property', NULL, '{}'),
(211, 'property', NULL, '{}'),
(212, 'property', NULL, '{}'),
(213, 'property', NULL, '{}'),
(214, 'property', NULL, '{}'),
(215, 'property', NULL, '{}'),
(216, 'property', NULL, '{}'),
(217, 'property', NULL, '{}'),
(218, 'property', NULL, '{}'),
(219, 'property', NULL, '{}'),
(220, 'property', NULL, '{}'),
(221, 'property', NULL, '{}'),
(222, 'property', NULL, '{}'),
(223, 'property', NULL, '{}'),
(224, 'property', NULL, '{}'),
(225, 'property', NULL, '{}'),
(226, 'property', NULL, '{}'),
(227, 'property', NULL, '{}'),
(228, 'property', NULL, '{}'),
(229, 'property', NULL, '{}'),
(230, 'property', NULL, '{}'),
(231, 'property', NULL, '{}'),
(232, 'property', NULL, '{}'),
(233, 'property', NULL, '{}'),
(234, 'property', NULL, '{}'),
(235, 'property', NULL, '{}'),
(236, 'property', NULL, '{}'),
(237, 'property', NULL, '{}'),
(238, 'property', NULL, '{}'),
(239, 'property', NULL, '{}'),
(240, 'property', NULL, '{}'),
(241, 'property', NULL, '{}'),
(242, 'property', NULL, '{}'),
(243, 'property', NULL, '{}'),
(244, 'property', NULL, '{}'),
(245, 'property', NULL, '{}'),
(246, 'property', NULL, '{}'),
(247, 'property', NULL, '{}'),
(248, 'property', NULL, '{}'),
(249, 'property', NULL, '{}'),
(250, 'property', NULL, '{}'),
(251, 'property', NULL, '{}'),
(252, 'property', NULL, '{}'),
(253, 'property', NULL, '{}'),
(254, 'property', NULL, '{}'),
(255, 'property', NULL, '{}'),
(256, 'property', NULL, '{}'),
(257, 'property', NULL, '{}'),
(258, 'property', NULL, '{}'),
(259, 'property', NULL, '{}'),
(260, 'property', 'd621787821b7be9712dd11873dc3decca533bf6a', '{\"dressing\":[{\"skin\":{\"eyebrows_6\":0,\"cheeks_2\":0,\"mom\":18,\"eyebrows_2\":0,\"moles_1\":0,\"bags_2\":0,\"eye_squint\":0,\"skin_md_weight\":45,\"makeup_4\":0,\"lip_thickness\":0,\"beard_4\":0,\"chin_3\":0,\"watches_2\":0,\"blush_2\":0,\"decals_2\":0,\"lipstick_3\":0,\"blush_3\":0,\"glasses_2\":0,\"sex\":0,\"sun_2\":0,\"hair_color_2\":0,\"arms\":0,\"lipstick_2\":0,\"age_2\":0,\"dad\":21,\"bags_1\":81,\"complexion_1\":0,\"chin_2\":0,\"blush_1\":0,\"bodyb_2\":0,\"sun_1\":0,\"nose_6\":0,\"eye_color\":0,\"bproof_1\":0,\"moles_2\":0,\"mask_1\":0,\"cheeks_3\":0,\"glasses_1\":0,\"hair_1\":75,\"lipstick_4\":0,\"bodyb_1\":-1,\"grandparents\":0,\"decals_1\":0,\"shoes_1\":12,\"arms_2\":0,\"beard_1\":0,\"torso_1\":26,\"bodyb_4\":0,\"jaw_2\":0,\"ears_1\":-1,\"pants_2\":1,\"chain_1\":2,\"chest_1\":0,\"torso_2\":0,\"bracelets_1\":1,\"bracelets_2\":0,\"jaw_1\":0,\"complexion_2\":0,\"beard_3\":0,\"chest_3\":0,\"helmet_2\":0,\"nose_2\":0,\"hair_2\":0,\"eyebrows_3\":0,\"chin_1\":0,\"bproof_2\":0,\"ears_2\":0,\"bodyb_3\":-1,\"lipstick_1\":0,\"shoes_2\":10,\"blemishes_2\":0,\"beard_2\":0,\"makeup_2\":0,\"makeup_1\":0,\"chin_4\":0,\"chest_2\":0,\"nose_3\":0,\"pants_1\":4,\"hair_color_1\":0,\"nose_4\":0,\"chain_2\":0,\"tshirt_2\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"nose_1\":0,\"neck_thickness\":0,\"mask_2\":0,\"tshirt_1\":131,\"face_g_weight\":10,\"face_md_weight\":50,\"blemishes_1\":0,\"age_1\":0,\"watches_1\":2,\"helmet_1\":-1,\"nose_5\":0,\"cheeks_1\":0,\"eyebrows_5\":0,\"eyebrows_1\":0},\"label\":\"commandant 1\"}]}'),
(261, 'user_mask', 'd621787821b7be9712dd11873dc3decca533bf6a', '{}'),
(262, 'user_glasses', 'd621787821b7be9712dd11873dc3decca533bf6a', '{}'),
(263, 'user_ears', 'd621787821b7be9712dd11873dc3decca533bf6a', '{}'),
(264, 'user_helmet', 'd621787821b7be9712dd11873dc3decca533bf6a', '{}'),
(265, 'user_ears', 'b42b206cb9676c013317ee3b92d5e19e2314bb26', '{}'),
(266, 'property', 'b42b206cb9676c013317ee3b92d5e19e2314bb26', '{\"dressing\":[{\"skin\":{\"eyebrows_6\":0,\"cheeks_2\":0,\"mom\":0,\"eyebrows_2\":0,\"moles_1\":0,\"bags_2\":0,\"eye_squint\":2,\"skin_md_weight\":49,\"decals_1\":0,\"lip_thickness\":0,\"beard_4\":0,\"chin_3\":0,\"watches_2\":0,\"blush_2\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0,\"glasses_2\":6,\"sex\":0,\"sun_2\":0,\"hair_color_2\":29,\"arms\":15,\"lipstick_2\":0,\"age_2\":0,\"dad\":0,\"bags_1\":45,\"complexion_1\":0,\"chin_2\":0,\"blush_1\":0,\"beard_1\":0,\"sun_1\":0,\"nose_6\":1,\"eye_color\":2,\"bproof_1\":0,\"moles_2\":0,\"mask_1\":0,\"cheeks_3\":0,\"hair_color_1\":33,\"pants_2\":0,\"lipstick_4\":0,\"bodyb_1\":-1,\"grandparents\":0,\"ears_2\":0,\"shoes_1\":25,\"arms_2\":0,\"face_g_weight\":9,\"nose_1\":-10,\"jaw_1\":0,\"jaw_2\":0,\"ears_1\":-1,\"bodyb_4\":0,\"chain_1\":80,\"helmet_1\":-1,\"torso_2\":20,\"nose_2\":0,\"bracelets_2\":0,\"beard_3\":0,\"complexion_2\":0,\"eyebrows_3\":0,\"chest_3\":0,\"helmet_2\":0,\"shoes_2\":0,\"hair_2\":0,\"bracelets_1\":1,\"chin_1\":0,\"chin_4\":0,\"makeup_3\":0,\"bodyb_3\":-1,\"lipstick_1\":0,\"pants_1\":55,\"makeup_4\":0,\"beard_2\":0,\"makeup_2\":0,\"makeup_1\":0,\"bproof_2\":0,\"chest_2\":0,\"nose_3\":1,\"chain_2\":1,\"chest_1\":0,\"nose_4\":7,\"eyebrows_4\":0,\"tshirt_2\":0,\"blemishes_2\":0,\"bodyb_2\":0,\"cheeks_1\":-1,\"neck_thickness\":0,\"hair_1\":42,\"tshirt_1\":57,\"glasses_1\":30,\"face_md_weight\":70,\"blemishes_1\":0,\"mask_2\":0,\"watches_1\":9,\"torso_1\":95,\"nose_5\":5,\"eyebrows_5\":0,\"blush_3\":0,\"eyebrows_1\":0},\"label\":\"joggo\"}]}'),
(267, 'user_glasses', 'b42b206cb9676c013317ee3b92d5e19e2314bb26', '{}'),
(268, 'user_mask', 'b42b206cb9676c013317ee3b92d5e19e2314bb26', '{}'),
(269, 'user_helmet', 'b42b206cb9676c013317ee3b92d5e19e2314bb26', '{}'),
(270, 'property', NULL, '{}'),
(271, 'property', NULL, '{}'),
(272, 'property', NULL, '{}'),
(273, 'property', NULL, '{}'),
(274, 'property', NULL, '{}'),
(275, 'property', NULL, '{}'),
(276, 'property', NULL, '{}'),
(277, 'property', NULL, '{}'),
(278, 'property', NULL, '{}'),
(279, 'property', NULL, '{}'),
(280, 'property', NULL, '{}'),
(281, 'property', NULL, '{}'),
(282, 'property', NULL, '{}'),
(283, 'property', NULL, '{}'),
(284, 'property', NULL, '{}'),
(285, 'property', NULL, '{}'),
(286, 'property', NULL, '{}'),
(287, 'property', NULL, '{}'),
(288, 'property', NULL, '{}'),
(289, 'property', NULL, '{}'),
(290, 'property', NULL, '{}'),
(291, 'property', NULL, '{}'),
(292, 'property', NULL, '{}'),
(293, 'property', NULL, '{}'),
(294, 'property', NULL, '{}'),
(295, 'property', NULL, '{}'),
(296, 'property', NULL, '{}'),
(297, 'property', NULL, '{}'),
(298, 'property', 'bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', '{\"dressing\":[{\"skin\":{\"helmet_1\":-1,\"bproof_2\":2,\"makeup_1\":0,\"beard_1\":6,\"cheeks_3\":0,\"chest_3\":0,\"neck_thickness\":0,\"bags_1\":0,\"torso_2\":0,\"jaw_2\":0,\"watches_2\":0,\"bracelets_2\":0,\"face_g_weight\":0,\"helmet_2\":0,\"glasses_2\":0,\"nose_4\":0,\"beard_2\":10,\"mom\":0,\"makeup_3\":0,\"glasses_1\":0,\"decals_2\":0,\"eyebrows_5\":0,\"chest_1\":0,\"age_1\":0,\"chin_1\":0,\"moles_1\":0,\"age_2\":0,\"chin_3\":0,\"nose_2\":0,\"lipstick_1\":0,\"blemishes_2\":0,\"cheeks_2\":0,\"eyebrows_2\":10,\"torso_1\":205,\"bodyb_3\":-1,\"eyebrows_6\":0,\"mask_2\":0,\"eyebrows_1\":12,\"eyebrows_4\":0,\"tshirt_2\":0,\"chain_1\":0,\"chin_2\":0,\"watches_1\":-1,\"bags_2\":0,\"sun_2\":0,\"shoes_2\":0,\"arms_2\":0,\"blemishes_1\":0,\"beard_3\":1,\"hair_color_1\":2,\"eye_color\":0,\"bproof_1\":14,\"blush_1\":0,\"lipstick_3\":0,\"beard_4\":0,\"jaw_1\":0,\"dad\":0,\"chain_2\":0,\"makeup_2\":0,\"nose_1\":0,\"complexion_2\":0,\"makeup_4\":0,\"grandparents\":0,\"nose_6\":0,\"chin_4\":0,\"cheeks_1\":0,\"pants_1\":33,\"skin_md_weight\":50,\"nose_5\":0,\"hair_color_2\":0,\"blush_2\":0,\"sex\":0,\"lipstick_4\":0,\"decals_1\":16,\"chest_2\":0,\"face_md_weight\":50,\"blush_3\":0,\"shoes_1\":7,\"hair_1\":3,\"tshirt_1\":136,\"eyebrows_3\":0,\"hair_2\":1,\"nose_3\":0,\"ears_1\":-1,\"sun_1\":0,\"mask_1\":0,\"complexion_1\":0,\"arms\":122,\"pants_2\":0,\"bodyb_4\":0,\"bodyb_1\":-1,\"bodyb_2\":0,\"moles_2\":0,\"lip_thickness\":0,\"ears_2\":0,\"eye_squint\":0,\"bracelets_1\":-1,\"lipstick_2\":0},\"label\":\"cool\"},{\"skin\":{\"helmet_1\":-1,\"bproof_2\":2,\"makeup_1\":0,\"beard_1\":6,\"cheeks_3\":0,\"chest_3\":0,\"neck_thickness\":0,\"hair_1\":3,\"torso_2\":3,\"jaw_2\":0,\"watches_2\":0,\"bracelets_2\":0,\"face_g_weight\":0,\"helmet_2\":0,\"glasses_2\":0,\"shoes_1\":7,\"beard_2\":10,\"mom\":0,\"makeup_3\":0,\"glasses_1\":0,\"decals_2\":0,\"eyebrows_5\":0,\"lipstick_4\":0,\"chest_1\":0,\"chin_1\":0,\"moles_1\":0,\"bags_1\":0,\"chin_3\":0,\"eyebrows_4\":0,\"nose_2\":0,\"blemishes_2\":0,\"cheeks_2\":0,\"eyebrows_2\":10,\"torso_1\":167,\"bodyb_3\":-1,\"hair_color_1\":2,\"sun_2\":0,\"eyebrows_1\":12,\"grandparents\":0,\"eyebrows_6\":0,\"chain_1\":0,\"chin_2\":0,\"watches_1\":-1,\"age_2\":0,\"bags_2\":0,\"shoes_2\":0,\"nose_4\":0,\"arms_2\":0,\"makeup_2\":0,\"bproof_1\":14,\"eye_color\":0,\"tshirt_2\":0,\"lip_thickness\":0,\"lipstick_3\":0,\"beard_4\":0,\"mask_2\":0,\"dad\":0,\"chain_2\":0,\"jaw_1\":0,\"chin_4\":0,\"sex\":0,\"makeup_4\":0,\"nose_1\":0,\"nose_6\":0,\"complexion_2\":0,\"blemishes_1\":0,\"blush_1\":0,\"skin_md_weight\":50,\"nose_5\":0,\"hair_color_2\":0,\"blush_2\":0,\"pants_1\":25,\"hair_2\":1,\"ears_1\":-1,\"chest_2\":0,\"age_1\":0,\"blush_3\":0,\"cheeks_1\":0,\"lipstick_2\":0,\"tshirt_1\":72,\"eyebrows_3\":0,\"decals_1\":16,\"nose_3\":0,\"mask_1\":0,\"sun_1\":0,\"lipstick_1\":0,\"complexion_1\":0,\"arms\":122,\"pants_2\":0,\"bodyb_4\":0,\"bodyb_1\":-1,\"bodyb_2\":0,\"moles_2\":0,\"face_md_weight\":50,\"ears_2\":0,\"eye_squint\":0,\"bracelets_1\":-1,\"beard_3\":1},\"label\":\"simple\"},{\"skin\":{\"age_1\":0,\"eyebrows_4\":0,\"makeup_1\":0,\"beard_1\":6,\"cheeks_3\":0,\"chest_3\":0,\"neck_thickness\":0,\"hair_1\":3,\"torso_2\":0,\"jaw_2\":0,\"watches_2\":0,\"bracelets_2\":0,\"face_g_weight\":0,\"helmet_2\":0,\"glasses_2\":0,\"shoes_1\":7,\"beard_2\":10,\"mom\":0,\"makeup_3\":0,\"glasses_1\":0,\"decals_2\":0,\"eyebrows_5\":0,\"beard_3\":1,\"lipstick_4\":0,\"chin_1\":0,\"moles_1\":0,\"eyebrows_6\":0,\"chin_3\":0,\"bproof_1\":4,\"nose_2\":0,\"blemishes_2\":0,\"cheeks_2\":0,\"bags_1\":0,\"torso_1\":21,\"bodyb_3\":-1,\"bracelets_1\":-1,\"blush_3\":0,\"eyebrows_1\":12,\"chest_1\":0,\"age_2\":0,\"chain_1\":0,\"chin_2\":0,\"watches_1\":-1,\"bags_2\":0,\"nose_4\":0,\"shoes_2\":0,\"mask_1\":0,\"lipstick_2\":0,\"makeup_2\":0,\"hair_color_1\":2,\"eye_color\":0,\"tshirt_2\":0,\"face_md_weight\":50,\"lipstick_3\":0,\"beard_4\":0,\"mask_2\":0,\"dad\":0,\"chain_2\":0,\"jaw_1\":0,\"arms_2\":0,\"sun_2\":0,\"makeup_4\":0,\"nose_1\":0,\"nose_6\":0,\"complexion_2\":0,\"blemishes_1\":0,\"grandparents\":0,\"skin_md_weight\":50,\"nose_5\":0,\"hair_color_2\":0,\"blush_2\":0,\"lipstick_1\":0,\"pants_1\":33,\"ears_1\":-1,\"chest_2\":0,\"lip_thickness\":0,\"chin_4\":0,\"sex\":0,\"hair_2\":1,\"tshirt_1\":22,\"eyebrows_3\":0,\"blush_1\":0,\"nose_3\":0,\"helmet_1\":-1,\"sun_1\":0,\"cheeks_1\":0,\"complexion_1\":0,\"arms\":31,\"pants_2\":0,\"bodyb_4\":0,\"bodyb_1\":-1,\"bodyb_2\":0,\"moles_2\":0,\"decals_1\":16,\"ears_2\":0,\"eye_squint\":0,\"eyebrows_2\":10,\"bproof_2\":0},\"label\":\"gerre\"}]}'),
(299, 'user_ears', 'bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', '{}'),
(300, 'user_helmet', 'bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', '{}'),
(301, 'user_glasses', 'bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', '{}'),
(302, 'user_mask', 'bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', '{}'),
(303, 'property', NULL, '{}'),
(304, 'property', NULL, '{}'),
(305, 'property', NULL, '{}'),
(306, 'property', NULL, '{}'),
(307, 'property', NULL, '{}'),
(308, 'property', NULL, '{}'),
(309, 'property', NULL, '{}'),
(310, 'user_glasses', '2bf7bb148f0f54b434ac370cab06e592866df450', '{}'),
(311, 'user_ears', '2bf7bb148f0f54b434ac370cab06e592866df450', '{}'),
(312, 'user_helmet', '2bf7bb148f0f54b434ac370cab06e592866df450', '{}'),
(313, 'property', '2bf7bb148f0f54b434ac370cab06e592866df450', '{}'),
(314, 'user_mask', '2bf7bb148f0f54b434ac370cab06e592866df450', '{}'),
(315, 'property', NULL, '{}'),
(316, 'property', NULL, '{}'),
(317, 'property', NULL, '{}'),
(318, 'property', NULL, '{}'),
(319, 'property', NULL, '{}'),
(320, 'property', NULL, '{}'),
(321, 'property', NULL, '{}'),
(322, 'property', NULL, '{}'),
(323, 'property', NULL, '{}'),
(324, 'property', NULL, '{}'),
(325, 'property', NULL, '{}'),
(326, 'property', NULL, '{}'),
(327, 'property', NULL, '{}'),
(328, 'property', NULL, '{}'),
(329, 'user_ears', '4634506b65176f2c2aa6a1af9831d3efbd168ee0', '{}'),
(330, 'user_glasses', '4634506b65176f2c2aa6a1af9831d3efbd168ee0', '{}'),
(331, 'property', '4634506b65176f2c2aa6a1af9831d3efbd168ee0', '{}'),
(332, 'user_mask', '4634506b65176f2c2aa6a1af9831d3efbd168ee0', '{}'),
(333, 'user_helmet', '4634506b65176f2c2aa6a1af9831d3efbd168ee0', '{}'),
(334, 'property', NULL, '{}'),
(335, 'property', NULL, '{}'),
(336, 'property', NULL, '{}'),
(337, 'property', NULL, '{}'),
(338, 'property', NULL, '{}'),
(339, 'property', NULL, '{}'),
(340, 'property', NULL, '{}'),
(341, 'property', NULL, '{}'),
(342, 'society_pharm', NULL, '{}'),
(343, 'property', NULL, '{}'),
(344, 'property', NULL, '{}'),
(345, 'property', NULL, '{}'),
(346, 'property', NULL, '{}'),
(347, 'property', NULL, '{}'),
(348, 'property', NULL, '{}'),
(349, 'property', NULL, '{}'),
(350, 'society_ammunation', NULL, '\'{}\''),
(351, 'society_gouv', NULL, '\'{}\''),
(352, 'property', NULL, '{}'),
(353, 'property', NULL, '{}'),
(354, 'property', NULL, '{}'),
(355, 'property', NULL, '{}'),
(356, 'property', NULL, '{}'),
(357, 'property', NULL, '{}'),
(358, 'property', NULL, '{}'),
(359, 'property', NULL, '{}'),
(360, 'property', NULL, '{}'),
(361, 'property', NULL, '{}'),
(362, 'property', NULL, '{}'),
(363, 'property', NULL, '{}'),
(364, 'property', NULL, '{}'),
(365, 'society_chauffeurpl', NULL, '{}'),
(366, 'property', NULL, '{}'),
(367, 'property', NULL, '{}'),
(368, 'property', NULL, '{}'),
(369, 'property', NULL, '{}'),
(370, 'property', NULL, '{}'),
(371, 'property', NULL, '{}'),
(372, 'property', NULL, '{}'),
(373, 'property', NULL, '{}'),
(374, 'property', NULL, '{}'),
(375, 'property', NULL, '{}'),
(376, 'property', NULL, '{}'),
(377, 'property', NULL, '{}'),
(378, 'property', NULL, '{}'),
(379, 'property', NULL, '{}'),
(380, 'property', NULL, '{}'),
(381, 'property', NULL, '{}'),
(382, 'property', NULL, '{}'),
(383, 'property', NULL, '{}'),
(384, 'society_pecheur', NULL, '{}'),
(385, 'property', NULL, '{}'),
(386, 'property', NULL, '{}'),
(387, 'property', NULL, '{}'),
(388, 'property', NULL, '{}'),
(389, 'property', NULL, '{}'),
(390, 'property', NULL, '{}'),
(391, 'property', NULL, '{}'),
(392, 'property', NULL, '{}'),
(393, 'property', NULL, '{}'),
(394, 'property', NULL, '{}'),
(395, 'property', NULL, '{}'),
(396, 'property', NULL, '{}'),
(397, 'property', NULL, '{}'),
(398, 'property', NULL, '{}'),
(399, 'property', NULL, '{}'),
(400, 'property', NULL, '{}'),
(401, 'property', NULL, '{}'),
(402, 'property', NULL, '{}'),
(403, 'property', NULL, '{}'),
(404, 'property', NULL, '{}'),
(405, 'property', NULL, '{}'),
(406, 'property', NULL, '{}'),
(407, 'property', NULL, '{}'),
(408, 'property', NULL, '{}'),
(409, 'property', NULL, '{}'),
(410, 'property', NULL, '{}'),
(411, 'property', NULL, '{}'),
(412, 'property', NULL, '{}'),
(413, 'property', NULL, '{}'),
(414, 'property', NULL, '{}'),
(415, 'property', NULL, '{}'),
(416, 'property', NULL, '{}'),
(417, 'property', NULL, '{}'),
(418, 'property', NULL, '{}'),
(419, 'property', NULL, '{}'),
(420, 'property', NULL, '{}'),
(421, 'property', NULL, '{}'),
(422, 'property', NULL, '{}'),
(423, 'property', NULL, '{}'),
(424, 'property', NULL, '{}'),
(425, 'property', NULL, '{}'),
(426, 'property', NULL, '{}'),
(427, 'property', NULL, '{}'),
(428, 'property', NULL, '{}'),
(429, 'property', NULL, '{}'),
(430, 'property', NULL, '{}'),
(431, 'property', NULL, '{}'),
(432, 'property', NULL, '{}'),
(433, 'property', NULL, '{}'),
(434, 'property', NULL, '{}'),
(435, 'property', NULL, '{}'),
(436, 'property', NULL, '{}'),
(437, 'property', NULL, '{}'),
(438, 'property', NULL, '{}'),
(439, 'property', '6dfb75f417bec5276010b020f222640f80c91043', '{}'),
(440, 'user_glasses', '6dfb75f417bec5276010b020f222640f80c91043', '{}'),
(441, 'user_ears', '6dfb75f417bec5276010b020f222640f80c91043', '{}'),
(442, 'user_mask', '6dfb75f417bec5276010b020f222640f80c91043', '{}'),
(443, 'user_helmet', '6dfb75f417bec5276010b020f222640f80c91043', '{}'),
(444, 'property', NULL, '{}'),
(445, 'property', NULL, '{}'),
(446, 'property', NULL, '{}'),
(447, 'property', NULL, '{}'),
(448, 'property', NULL, '{}'),
(449, 'property', NULL, '{}'),
(450, 'property', NULL, '{}'),
(451, 'property', NULL, '{}'),
(452, 'property', NULL, '{}'),
(453, 'property', NULL, '{}'),
(454, 'property', NULL, '{}'),
(455, 'property', NULL, '{}'),
(456, 'property', NULL, '{}'),
(457, 'property', NULL, '{}'),
(458, 'property', NULL, '{}'),
(459, 'property', NULL, '{}'),
(460, 'property', NULL, '{}'),
(461, 'property', NULL, '{}'),
(462, 'property', NULL, '{}'),
(463, 'property', NULL, '{}'),
(464, 'property', NULL, '{}'),
(465, 'property', NULL, '{}'),
(466, 'property', NULL, '{}'),
(467, 'property', NULL, '{}'),
(468, 'property', NULL, '{}'),
(469, 'property', NULL, '{}'),
(470, 'property', NULL, '{}'),
(471, 'property', NULL, '{}'),
(472, 'property', NULL, '{}'),
(473, 'property', NULL, '{}'),
(474, 'property', NULL, '{}'),
(475, 'property', NULL, '{}'),
(476, 'property', NULL, '{}'),
(477, 'property', NULL, '{}'),
(478, 'property', NULL, '{}'),
(479, 'property', NULL, '{}'),
(480, 'property', NULL, '{}'),
(481, 'property', NULL, '{}'),
(482, 'property', NULL, '{}'),
(483, 'property', NULL, '{}'),
(484, 'property', NULL, '{}'),
(485, 'property', NULL, '{}'),
(486, 'property', NULL, '{}'),
(487, 'property', NULL, '{}'),
(488, 'property', NULL, '{}'),
(489, 'property', NULL, '{}'),
(490, 'property', NULL, '{}'),
(491, 'property', NULL, '{}'),
(492, 'property', NULL, '{}'),
(493, 'property', NULL, '{}'),
(494, 'property', NULL, '{}'),
(495, 'property', NULL, '{}'),
(496, 'property', NULL, '{}'),
(497, 'property', NULL, '{}'),
(498, 'property', NULL, '{}'),
(499, 'property', NULL, '{}'),
(500, 'property', NULL, '{}'),
(501, 'property', NULL, '{}'),
(502, 'property', NULL, '{}'),
(503, 'property', NULL, '{}'),
(504, 'property', NULL, '{}'),
(505, 'property', NULL, '{}'),
(506, 'property', NULL, '{}'),
(507, 'property', NULL, '{}'),
(508, 'property', NULL, '{}'),
(509, 'property', NULL, '{}'),
(510, 'property', NULL, '{}'),
(511, 'property', NULL, '{}'),
(512, 'property', NULL, '{}'),
(513, 'property', NULL, '{}'),
(514, 'property', NULL, '{}'),
(515, 'property', NULL, '{}'),
(516, 'property', NULL, '{}'),
(517, 'property', NULL, '{}'),
(518, 'property', NULL, '{}'),
(519, 'property', NULL, '{}'),
(520, 'property', NULL, '{}'),
(521, 'property', NULL, '{}'),
(522, 'property', NULL, '{}'),
(523, 'property', NULL, '{}'),
(524, 'property', NULL, '{}'),
(525, 'property', NULL, '{}'),
(526, 'property', NULL, '{}'),
(527, 'property', NULL, '{}'),
(528, 'property', NULL, '{}'),
(529, 'property', NULL, '{}'),
(530, 'property', NULL, '{}'),
(531, 'property', NULL, '{}'),
(532, 'property', NULL, '{}'),
(533, 'property', NULL, '{}'),
(534, 'property', NULL, '{}'),
(535, 'property', NULL, '{}'),
(536, 'property', NULL, '{}'),
(537, 'property', NULL, '{}'),
(538, 'property', NULL, '{}'),
(539, 'property', NULL, '{}'),
(540, 'property', NULL, '{}'),
(541, 'property', NULL, '{}'),
(542, 'property', NULL, '{}'),
(543, 'property', NULL, '{}'),
(544, 'property', NULL, '{}'),
(545, 'property', NULL, '{}'),
(546, 'property', NULL, '{}'),
(547, 'property', NULL, '{}'),
(548, 'property', NULL, '{}'),
(549, 'property', NULL, '{}'),
(550, 'property', NULL, '{}'),
(551, 'property', NULL, '{}'),
(552, 'property', NULL, '{}'),
(553, 'property', NULL, '{}'),
(554, 'property', NULL, '{}'),
(555, 'property', NULL, '{}'),
(556, 'property', NULL, '{}'),
(557, 'property', NULL, '{}'),
(558, 'property', NULL, '{}'),
(559, 'property', NULL, '{}'),
(560, 'property', NULL, '{}'),
(561, 'property', NULL, '{}'),
(562, 'property', NULL, '{}'),
(563, 'property', NULL, '{}'),
(564, 'property', NULL, '{}'),
(565, 'property', NULL, '{}'),
(566, 'property', NULL, '{}'),
(567, 'property', NULL, '{}'),
(568, 'property', NULL, '{}'),
(569, 'property', NULL, '{}'),
(570, 'property', NULL, '{}'),
(571, 'property', NULL, '{}'),
(572, 'property', NULL, '{}'),
(573, 'property', NULL, '{}'),
(574, 'property', NULL, '{}'),
(575, 'property', NULL, '{}'),
(576, 'property', NULL, '{}'),
(577, 'property', NULL, '{}'),
(578, 'property', NULL, '{}'),
(579, 'property', NULL, '{}'),
(580, 'property', NULL, '{}'),
(581, 'property', NULL, '{}'),
(582, 'property', NULL, '{}'),
(583, 'user_ears', 'char2:cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(584, 'property', 'char2:cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(585, 'user_mask', 'char2:cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(586, 'user_glasses', 'char2:cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(587, 'user_helmet', 'char2:cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(588, 'user_glasses', 'char3:cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(589, 'user_helmet', 'char3:cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(590, 'property', 'char3:cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(591, 'user_mask', 'char3:cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(592, 'user_ears', 'char3:cf872e2dbff1cf3152fff72b147ca07238315148', '{}'),
(593, 'property', 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', '{}'),
(594, 'user_ears', 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', '{}'),
(595, 'user_glasses', 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', '{}'),
(596, 'user_mask', 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', '{}'),
(597, 'user_helmet', 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', '{}'),
(598, 'user_ears', 'char1:d621787821b7be9712dd11873dc3decca533bf6a', '{}'),
(599, 'property', 'char1:d621787821b7be9712dd11873dc3decca533bf6a', '{\"dressing\":[{\"label\":\"police 1\",\"skin\":{\"eyebrows_4\":0,\"bodyb_2\":0,\"helmet_1\":-1,\"eyebrows_5\":0,\"lipstick_3\":0,\"blush_3\":0,\"sun_2\":0,\"bracelets_1\":-1,\"eyebrows_6\":0,\"eye_squint\":0,\"eyebrows_2\":0,\"nose_4\":0,\"lip_thickness\":0,\"age_2\":0,\"hair_color_1\":0,\"makeup_4\":0,\"hair_2\":0,\"torso_1\":319,\"sun_1\":0,\"beard_4\":0,\"glasses_1\":0,\"mask_1\":0,\"mask_2\":0,\"chain_1\":0,\"decals_1\":0,\"ears_2\":0,\"blemishes_1\":0,\"bodyb_3\":-1,\"moles_2\":0,\"chin_2\":0,\"chin_4\":0,\"bags_2\":0,\"nose_2\":0,\"pants_2\":1,\"face_g_weight\":0,\"glasses_2\":0,\"shoes_1\":7,\"blemishes_2\":0,\"decals_2\":0,\"bags_1\":44,\"blush_1\":0,\"neck_thickness\":0,\"chin_1\":0,\"watches_2\":0,\"jaw_2\":0,\"cheeks_2\":0,\"shoes_2\":0,\"watches_1\":-1,\"grandparents\":0,\"hair_1\":75,\"beard_3\":0,\"complexion_2\":0,\"dad\":2,\"tshirt_2\":0,\"chest_1\":0,\"bproof_2\":1,\"cheeks_3\":0,\"lipstick_2\":0,\"skin_md_weight\":50,\"nose_3\":0,\"makeup_3\":0,\"eyebrows_3\":0,\"chest_3\":0,\"jaw_1\":0,\"bodyb_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"nose_1\":0,\"chin_3\":0,\"eyebrows_1\":2,\"blush_2\":0,\"nose_6\":0,\"cheeks_1\":0,\"age_1\":0,\"hair_color_2\":0,\"arms\":0,\"beard_2\":0,\"sex\":0,\"mom\":6,\"tshirt_1\":58,\"bproof_1\":1,\"chain_2\":0,\"nose_5\":0,\"torso_2\":0,\"complexion_1\":0,\"bracelets_2\":0,\"arms_2\":0,\"chest_2\":0,\"makeup_1\":0,\"chin_13\":0,\"makeup_2\":0,\"bodyb_4\":0,\"ears_1\":-1,\"moles_1\":0,\"eye_color\":0,\"beard_1\":0,\"face_md_weight\":50,\"pants_1\":1,\"lipstick_4\":0}},{\"label\":\"chill\",\"skin\":{\"eyebrows_4\":0,\"bodyb_2\":0,\"helmet_1\":-1,\"eyebrows_5\":0,\"beard_1\":0,\"cheeks_1\":0,\"sun_2\":0,\"bracelets_1\":-1,\"eyebrows_6\":0,\"eye_squint\":0,\"eyebrows_2\":0,\"nose_4\":0,\"lip_thickness\":0,\"makeup_2\":0,\"hair_color_1\":0,\"makeup_4\":0,\"hair_2\":0,\"torso_1\":105,\"sun_1\":0,\"beard_4\":0,\"glasses_1\":0,\"mask_1\":0,\"mask_2\":0,\"chain_1\":0,\"face_g_weight\":0,\"ears_2\":0,\"blemishes_1\":0,\"bodyb_3\":-1,\"moles_2\":0,\"chin_2\":0,\"chin_4\":0,\"bags_2\":0,\"nose_2\":0,\"pants_2\":2,\"chin_3\":0,\"tshirt_2\":0,\"shoes_1\":7,\"blemishes_2\":0,\"decals_2\":0,\"bags_1\":0,\"blush_1\":0,\"neck_thickness\":0,\"chest_2\":0,\"watches_2\":0,\"age_2\":0,\"cheeks_2\":0,\"blush_3\":0,\"watches_1\":-1,\"grandparents\":0,\"hair_1\":75,\"beard_3\":0,\"shoes_2\":0,\"bodyb_1\":-1,\"dad\":2,\"chest_1\":0,\"bproof_2\":0,\"cheeks_3\":0,\"lipstick_2\":0,\"skin_md_weight\":50,\"nose_3\":0,\"makeup_3\":0,\"eyebrows_3\":0,\"chest_3\":0,\"complexion_2\":0,\"jaw_2\":0,\"lipstick_1\":0,\"eye_color\":0,\"nose_1\":0,\"glasses_2\":0,\"eyebrows_1\":2,\"blush_2\":0,\"chin_1\":0,\"arms_2\":0,\"age_1\":0,\"hair_color_2\":0,\"arms\":0,\"nose_5\":0,\"sex\":0,\"nose_6\":0,\"tshirt_1\":139,\"mom\":6,\"chain_2\":0,\"face_md_weight\":50,\"torso_2\":1,\"complexion_1\":0,\"bracelets_2\":0,\"beard_2\":0,\"lipstick_3\":0,\"makeup_1\":0,\"chin_13\":0,\"ears_1\":-1,\"bodyb_4\":0,\"helmet_2\":0,\"moles_1\":0,\"jaw_1\":0,\"bproof_1\":0,\"decals_1\":0,\"pants_1\":3,\"lipstick_4\":0}},{\"label\":\"chill1\",\"skin\":{\"eyebrows_4\":0,\"tshirt_2\":0,\"helmet_1\":-1,\"eyebrows_5\":0,\"beard_1\":0,\"blush_3\":0,\"sun_2\":0,\"bracelets_1\":-1,\"eyebrows_6\":0,\"eye_squint\":0,\"eyebrows_2\":0,\"nose_4\":0,\"lip_thickness\":0,\"age_2\":0,\"hair_color_1\":0,\"makeup_4\":0,\"hair_2\":0,\"torso_1\":226,\"sun_1\":0,\"beard_4\":0,\"glasses_1\":0,\"mask_1\":0,\"mask_2\":0,\"chain_1\":0,\"decals_1\":0,\"ears_2\":0,\"chest_2\":0,\"bodyb_3\":-1,\"moles_2\":0,\"complexion_1\":0,\"chin_4\":0,\"mom\":6,\"nose_2\":0,\"pants_2\":2,\"chin_3\":0,\"face_g_weight\":0,\"shoes_1\":7,\"blemishes_2\":0,\"decals_2\":0,\"bags_1\":0,\"blush_1\":0,\"nose_1\":0,\"makeup_3\":0,\"watches_2\":0,\"bodyb_2\":0,\"cheeks_2\":0,\"blemishes_1\":0,\"watches_1\":-1,\"grandparents\":0,\"hair_1\":75,\"beard_3\":0,\"bags_2\":0,\"dad\":2,\"eyebrows_3\":0,\"chest_1\":0,\"bproof_2\":0,\"shoes_2\":0,\"lipstick_2\":0,\"cheeks_3\":0,\"bodyb_1\":-1,\"nose_6\":0,\"jaw_2\":0,\"skin_md_weight\":50,\"jaw_1\":0,\"nose_3\":0,\"lipstick_1\":0,\"eye_color\":0,\"chest_3\":0,\"glasses_2\":0,\"eyebrows_1\":2,\"neck_thickness\":0,\"blush_2\":0,\"complexion_2\":0,\"age_1\":0,\"hair_color_2\":0,\"arms\":0,\"arms_2\":0,\"sex\":0,\"chin_1\":0,\"tshirt_1\":140,\"chain_2\":0,\"chin_2\":0,\"face_md_weight\":50,\"torso_2\":0,\"bproof_1\":0,\"bracelets_2\":0,\"beard_2\":0,\"cheeks_1\":0,\"makeup_1\":0,\"chin_13\":0,\"nose_5\":0,\"bodyb_4\":0,\"lipstick_3\":0,\"moles_1\":0,\"ears_1\":-1,\"helmet_2\":0,\"makeup_2\":0,\"pants_1\":3,\"lipstick_4\":0}}]}'),
(600, 'user_glasses', 'char1:d621787821b7be9712dd11873dc3decca533bf6a', '{}'),
(601, 'user_mask', 'char1:d621787821b7be9712dd11873dc3decca533bf6a', '{}'),
(602, 'user_helmet', 'char1:d621787821b7be9712dd11873dc3decca533bf6a', '{}'),
(603, 'property', 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', '{}'),
(604, 'user_ears', 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', '{}'),
(605, 'user_glasses', 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', '{}'),
(606, 'user_mask', 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', '{}'),
(607, 'user_helmet', 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', '{}'),
(608, 'property', 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', '{}'),
(609, 'user_glasses', 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', '{}'),
(610, 'user_ears', 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', '{}'),
(611, 'user_helmet', 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', '{}'),
(612, 'user_mask', 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `deliveriesdealer`
--

CREATE TABLE `deliveriesdealer` (
  `id` int(11) NOT NULL,
  `cid` varchar(50) NOT NULL,
  `itemdata` varchar(50) NOT NULL,
  `timestart` varchar(50) NOT NULL,
  `timestop` varchar(50) DEFAULT NULL,
  `maxtime` varchar(50) NOT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `discord_users`
--

CREATE TABLE `discord_users` (
  `discord_id` varchar(50) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT 0,
  `admin` tinyint(1) DEFAULT 0,
  `pin` varchar(10) DEFAULT NULL,
  `rank` varchar(50) DEFAULT NULL,
  `extra_permissions` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `discord_users`
--

INSERT INTO `discord_users` (`discord_id`, `identifier`, `banned`, `admin`, `pin`, `rank`, `extra_permissions`, `created_at`, `updated_at`, `last_login`) VALUES
('1162435586901155982', '303456f8aeaf3cb2e22adbc83872ffead699bff3', 0, 0, NULL, NULL, NULL, '2025-07-18 16:40:32', '2025-07-18 16:40:32', NULL),
('1245393309778841702', 'cf872e2dbff1cf3152fff72b147ca07238315148', 0, 1, '1234', 'fondateur', NULL, '2025-07-18 16:40:32', '2025-07-18 22:39:31', NULL),
('1286255292950253630', 'bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, NULL, NULL, NULL, '2025-07-18 16:40:32', '2025-07-18 16:40:32', NULL),
('1321406379042541578', 'dbbfc5ccb945a08cf80712e009770f858fc23010', 0, 0, NULL, NULL, NULL, '2025-07-18 16:40:32', '2025-07-18 16:40:32', NULL),
('1336024072131186820', 'e94478c680b754d3843d49162b577aca76e43703', 0, 0, NULL, NULL, NULL, '2025-07-18 16:40:32', '2025-07-18 16:40:32', NULL),
('334438290918866955', '2bf7bb148f0f54b434ac370cab06e592866df450', 0, 1, NULL, NULL, NULL, '2025-07-18 16:40:32', '2025-07-20 11:41:09', NULL),
('610597771870732288', '2e598f707aea8f476eac986e4b4004ea10e8bc5e', 0, 1, NULL, NULL, NULL, '2025-07-18 16:40:32', '2025-07-20 11:40:49', NULL),
('810543242280960050', '7065f8638dfc6c4046af4c46774f66a1d818e3ce', 0, 0, NULL, NULL, NULL, '2025-07-18 16:40:32', '2025-07-18 16:40:32', NULL),
('939189874043539607', 'd621787821b7be9712dd11873dc3decca533bf6a', 0, 1, NULL, NULL, NULL, '2025-07-18 16:40:32', '2025-07-20 11:40:26', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `dnz_donator_codes`
--

CREATE TABLE `dnz_donator_codes` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `used` int(11) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `usedby` varchar(50) DEFAULT NULL,
  `createdbyname` varchar(50) DEFAULT NULL,
  `usedbyname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `dnz_donator_codes`
--

INSERT INTO `dnz_donator_codes` (`id`, `type`, `item`, `amount`, `code`, `used`, `createdby`, `usedby`, `createdbyname`, `usedbyname`) VALUES
(617, 'money', 'cash', 5000, '=+4TuL9XtjWK-auM8', 1, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'Martin Bubois'),
(618, 'money', 'cash', 5000, 'nr=o!?jQP@>A+-+yMo@', 1, 'd621787821b7be9712dd11873dc3decca533bf6a', 'd621787821b7be9712dd11873dc3decca533bf6a', 'Juan Rodriguez', 'Juan Rodriguez'),
(619, 'money', 'cash', 5000, '#efIoXjIjRc<9Xl7W=!m5=mz%hYA=I<7', 1, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 'Martin Bubois', 'Enzo Martinez');

-- --------------------------------------------------------

--
-- Structure de la table `drugrep`
--

CREATE TABLE `drugrep` (
  `id` int(11) NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `drugrep` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ducrachat_messages`
--

CREATE TABLE `ducrachat_messages` (
  `id` int(11) NOT NULL,
  `sender` varchar(64) NOT NULL,
  `receiver` varchar(64) NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `deliver_at` datetime NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ducrachat_messages`
--

INSERT INTO `ducrachat_messages` (`id`, `sender`, `receiver`, `message`, `timestamp`, `deliver_at`, `is_read`) VALUES
(12, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'char1:621787821b7be9712dd11873dc3decca533bf6a', 'Hey !', '2025-06-30 22:05:24', '2025-06-30 22:05:24', 0),
(13, 'char1:621787821b7be9712dd11873dc3decca533bf6a', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Hey ! Ca va ?!', '2025-06-30 22:06:24', '2025-06-30 22:08:24', 1),
(14, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 'Salut', '2025-07-01 20:52:56', '2025-07-01 20:52:56', 1),
(15, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'salut', '2025-07-01 20:53:57', '2025-07-01 20:53:57', 1),
(16, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 'ca va ?', '2025-07-01 20:54:13', '2025-07-01 20:54:13', 1),
(17, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'char1:621787821b7be9712dd11873dc3decca533bf6a', 'cc', '2025-07-13 17:27:46', '2025-07-13 17:27:46', 0),
(18, 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'cc', '2025-07-17 20:59:06', '2025-07-17 21:09:06', 1),
(19, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', 'Salut', '2025-07-17 21:00:14', '2025-07-17 21:00:14', 1),
(20, 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Copain', '2025-07-17 21:01:01', '2025-07-17 21:11:01', 1),
(21, 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'oui', '2025-07-17 22:36:06', '2025-07-17 22:46:06', 1),
(23, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'BAISE LE SANG DE TOUT TES MORT', '2025-07-17 22:37:54', '2025-07-17 22:37:54', 1),
(24, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'bredgberhre', '2025-07-17 22:38:04', '2025-07-17 22:38:04', 1),
(25, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'J\'AI RECU LE SANS DE TOUT TES MORT', '2025-07-17 22:38:19', '2025-07-17 22:38:19', 1),
(26, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', '(TCHOUTCHOU)', '2025-07-17 22:38:26', '2025-07-17 22:38:26', 1),
(27, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'oui', '2025-07-17 22:38:39', '2025-07-17 22:38:39', 1),
(28, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'hallah wakbahhhhhhhhh', '2025-07-17 22:38:46', '2025-07-17 22:38:46', 1),
(29, 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Salut a tous c\'est LaSalle', '2025-07-17 22:38:49', '2025-07-17 22:48:49', 1),
(30, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'salut a tous c lasalle', '2025-07-17 22:39:04', '2025-07-17 22:39:04', 1),
(31, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', 'polyamnesia', '2025-07-17 22:40:25', '2025-07-17 22:40:25', 0),
(32, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', 't\'es sous frozen ?', '2025-07-17 22:41:04', '2025-07-17 22:41:04', 0),
(33, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', 't\'es ban perm', '2025-07-17 22:41:10', '2025-07-17 22:41:10', 0),
(34, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', 'bravo', '2025-07-17 22:41:13', '2025-07-17 22:41:13', 0),
(35, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', 'délinquant', '2025-07-17 22:41:15', '2025-07-17 22:41:15', 0),
(36, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'char1:621787821b7be9712dd11873dc3decca533bf6a', 'fzefzegerg', '2025-07-19 10:59:31', '2025-07-19 10:59:31', 0),
(37, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ok', '2025-07-19 10:59:43', '2025-07-19 10:59:43', 0);

-- --------------------------------------------------------

--
-- Structure de la table `ducrachat_users`
--

CREATE TABLE `ducrachat_users` (
  `id` int(11) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `id_telegram` varchar(24) NOT NULL,
  `can_read` tinyint(1) NOT NULL DEFAULT 0,
  `delay_override` int(11) DEFAULT 600
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ducrachat_users`
--

INSERT INTO `ducrachat_users` (`id`, `identifier`, `id_telegram`, `can_read`, `delay_override`) VALUES
(1, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', '5AIXE97F', 1, 0),
(2, 'char1:621787821b7be9712dd11873dc3decca533bf6a', 'TESTUSER2', 0, 600),
(3, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', '4L0783RD', 1, 0),
(4, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'XLTVI53L', 1, 0),
(5, 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', '8KB06AAV', 0, 600);

-- --------------------------------------------------------

--
-- Structure de la table `esx_clotheshop`
--

CREATE TABLE `esx_clotheshop` (
  `id` int(11) NOT NULL,
  `owner` varchar(259) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `outfit` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`outfit`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Misuse of a horn', 30, 0),
(2, 'Illegally Crossing a continuous Line', 40, 0),
(3, 'Driving on the wrong side of the road', 250, 0),
(4, 'Illegal U-Turn', 250, 0),
(5, 'Illegally Driving Off-road', 170, 0),
(6, 'Refusing a Lawful Command', 30, 0),
(7, 'Illegally Stopping a Vehicle', 150, 0),
(8, 'Illegal Parking', 70, 0),
(9, 'Failing to Yield to the right', 70, 0),
(10, 'Failure to comply with Vehicle Information', 90, 0),
(11, 'Failing to stop at a Stop Sign ', 105, 0),
(12, 'Failing to stop at a Red Light', 130, 0),
(13, 'Illegal Passing', 100, 0),
(14, 'Driving an illegal Vehicle', 100, 0),
(15, 'Driving without a License', 1500, 0),
(16, 'Hit and Run', 800, 0),
(17, 'Exceeding Speeds Over < 5 mph', 90, 0),
(18, 'Exceeding Speeds Over 5-15 mph', 120, 0),
(19, 'Exceeding Speeds Over 15-30 mph', 180, 0),
(20, 'Exceeding Speeds Over > 30 mph', 300, 0),
(21, 'Impeding traffic flow', 110, 1),
(22, 'Public Intoxication', 90, 1),
(23, 'Disorderly conduct', 90, 1),
(24, 'Obstruction of Justice', 130, 1),
(25, 'Insults towards Civilans', 75, 1),
(26, 'Disrespecting of an LEO', 110, 1),
(27, 'Verbal Threat towards a Civilan', 90, 1),
(28, 'Verbal Threat towards an LEO', 150, 1),
(29, 'Providing False Information', 250, 1),
(30, 'Attempt of Corruption', 1500, 1),
(31, 'Brandishing a weapon in city Limits', 120, 2),
(32, 'Brandishing a Lethal Weapon in city Limits', 300, 2),
(33, 'No Firearms License', 600, 2),
(34, 'Possession of an Illegal Weapon', 700, 2),
(35, 'Possession of Burglary Tools', 300, 2),
(36, 'Grand Theft Auto', 1800, 2),
(37, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2),
(38, 'Frabrication of an Illegal Substance', 1500, 2),
(39, 'Possession of an Illegal Substance ', 650, 2),
(40, 'Kidnapping of a Civilan', 1500, 2),
(41, 'Kidnapping of an LEO', 2000, 2),
(42, 'Robbery', 650, 2),
(43, 'Armed Robbery of a Store', 650, 2),
(44, 'Armed Robbery of a Bank', 1500, 2),
(45, 'Assault on a Civilian', 2000, 3),
(46, 'Assault of an LEO', 2500, 3),
(47, 'Attempt of Murder of a Civilian', 3000, 3),
(48, 'Attempt of Murder of an LEO', 5000, 3),
(49, 'Murder of a Civilian', 10000, 3),
(50, 'Murder of an LEO', 30000, 3),
(51, 'Involuntary manslaughter', 1800, 3),
(52, 'Fraud', 2000, 2);

-- --------------------------------------------------------

--
-- Structure de la table `gacha_playlists`
--

CREATE TABLE `gacha_playlists` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `owner` varchar(259) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gacha_playlists`
--

INSERT INTO `gacha_playlists` (`id`, `name`, `owner`) VALUES
(1, 'Test', 'license:cf872e2dbff1cf3152fff72b147ca07238315148');

-- --------------------------------------------------------

--
-- Structure de la table `gacha_playlists_users`
--

CREATE TABLE `gacha_playlists_users` (
  `id` int(11) NOT NULL,
  `license` varchar(255) NOT NULL DEFAULT '',
  `playlist` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gacha_playlists_users`
--

INSERT INTO `gacha_playlists_users` (`id`, `license`, `playlist`) VALUES
(1, 'license:cf872e2dbff1cf3152fff72b147ca07238315148', 1);

-- --------------------------------------------------------

--
-- Structure de la table `gacha_playlist_songs`
--

CREATE TABLE `gacha_playlist_songs` (
  `id` int(11) NOT NULL,
  `playlist` int(11) NOT NULL DEFAULT 0,
  `song` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gacha_playlist_songs`
--

INSERT INTO `gacha_playlist_songs` (`id`, `playlist`, `song`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `gacha_songs`
--

CREATE TABLE `gacha_songs` (
  `id` int(11) NOT NULL,
  `url` varchar(50) NOT NULL DEFAULT '0',
  `name` varchar(150) NOT NULL DEFAULT '0',
  `author` varchar(50) NOT NULL DEFAULT '0',
  `maxDuration` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gacha_songs`
--

INSERT INTO `gacha_songs` (`id`, `url`, `name`, `author`, `maxDuration`) VALUES
(1, 'Ow07uqhyYwo', 'Keblack - Mood (Clip Officiel)', 'Keblack', 174),
(2, 'qvVGbUWorUo', 'Dr. Yaro - Simba (Clip Officiel)', 'Dr. Yaro', 129),
(3, 'KG6ft_YDp5k', 'GIMS - CIEL (Clip officiel)', 'GIMS', 192);

-- --------------------------------------------------------

--
-- Structure de la table `gps_favorites`
--

CREATE TABLE `gps_favorites` (
  `id` int(11) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `frequency` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gps_favorites`
--

INSERT INTO `gps_favorites` (`id`, `identifier`, `frequency`) VALUES
(25, 'cf872e2dbff1cf3152fff72b147ca07238315148', '1'),
(20, 'cf872e2dbff1cf3152fff72b147ca07238315148', '4'),
(21, 'cf872e2dbff1cf3152fff72b147ca07238315148', '5'),
(22, 'cf872e2dbff1cf3152fff72b147ca07238315148', '6'),
(26, 'cf872e2dbff1cf3152fff72b147ca07238315148', '8'),
(16, 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', '40'),
(15, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', '39'),
(13, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', '1'),
(14, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', '854'),
(27, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', '999'),
(12, 'd621787821b7be9712dd11873dc3decca533bf6a', '1');

-- --------------------------------------------------------

--
-- Structure de la table `gps_frequencies`
--

CREATE TABLE `gps_frequencies` (
  `id` int(11) NOT NULL,
  `frequency` varchar(10) NOT NULL,
  `owner_identifier` varchar(64) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  `webhook` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gps_frequencies`
--

INSERT INTO `gps_frequencies` (`id`, `frequency`, `owner_identifier`, `password`, `webhook`, `created_at`) VALUES
(1, '1', 'cf872e2dbff1cf3152fff72b147ca07238315148', '9999', NULL, '2025-05-18 21:15:56'),
(2, '2', 'cf872e2dbff1cf3152fff72b147ca07238315148', '9090', 'https://discord.com/api/webhooks/test_web', '2025-05-18 21:17:18'),
(3, '3', 'cf872e2dbff1cf3152fff72b147ca07238315148', NULL, NULL, '2025-05-18 21:30:53'),
(4, '4', 'cf872e2dbff1cf3152fff72b147ca07238315148', NULL, NULL, '2025-05-18 21:48:10'),
(5, '10', 'cf872e2dbff1cf3152fff72b147ca07238315148', '0000', NULL, '2025-05-18 22:15:33'),
(6, '12', 'cf872e2dbff1cf3152fff72b147ca07238315148', '1111', NULL, '2025-05-19 00:32:31'),
(7, '58', 'cf872e2dbff1cf3152fff72b147ca07238315148', '8888', NULL, '2025-05-19 01:21:19'),
(8, '100', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', NULL, NULL, '2025-06-01 21:43:53'),
(9, '800', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', '800', NULL, '2025-06-03 00:11:14'),
(10, '854', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', '0000', NULL, '2025-07-13 16:52:09'),
(11, '900', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', '1111', NULL, '2025-07-13 17:37:04'),
(12, '8', 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', '0000', NULL, '2025-07-17 23:07:31');

-- --------------------------------------------------------

--
-- Structure de la table `historique_achat_web`
--

CREATE TABLE `historique_achat_web` (
  `id` int(11) NOT NULL,
  `cfx` varchar(60) NOT NULL,
  `perso` tinyint(1) DEFAULT 0,
  `commands` varchar(100) NOT NULL,
  `date_heure` varchar(50) NOT NULL,
  `produit` varchar(100) NOT NULL,
  `key` varchar(50) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `historique_achat_web`
--

INSERT INTO `historique_achat_web` (`id`, `cfx`, `perso`, `commands`, `date_heure`, `produit`, `key`, `price`) VALUES
(1, 'cf872e2dbff1cf3152fff72b147ca07238315148', 1, '76CAE0A4', '2025-07-18 13:25:10', 'Ajouter un personnage', 'addperso', 1000),
(2, 'cf872e2dbff1cf3152fff72b147ca07238315148', 1, '27CCDF56', '2025-07-18 13:25:50', 'Ajouter un personnage', 'addperso', 1000),
(3, 'cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'ducratif', '2025-07-18 13:48:10', 'Ajouter un personnage', 'guerrerp', 50000),
(4, 'cf872e2dbff1cf3152fff72b147ca07238315148', 1, '151488DE', '2025-07-18 15:08:19', '1 Million de $ en banque', 'money_1million', 1000),
(5, 'cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'B01482AF', '2025-07-18 15:08:52', '1 Million de $ en banque', 'money_1million', 1000),
(6, 'cf872e2dbff1cf3152fff72b147ca07238315148', 2, '904CEC48', '2025-07-18 15:09:30', '1 Million de $ en banque', 'money_1million', 1000),
(7, 'cf872e2dbff1cf3152fff72b147ca07238315148', 2, 'CF5A6E72', '2025-07-18 15:10:16', '1 Million de $ en banque', 'money_1million', 1000),
(8, 'cf872e2dbff1cf3152fff72b147ca07238315148', 2, '8DDE2101', '2025-07-18 15:10:39', '1 Million de $ en banque', 'money_1million', 1000),
(9, 'cf872e2dbff1cf3152fff72b147ca07238315148', 2, '0AB38C57', '2025-07-18 15:11:02', '1 Million de $ en banque', 'money_1million', 1000),
(10, 'cf872e2dbff1cf3152fff72b147ca07238315148', 1, '5EC4C9B9', '2025-07-18 15:11:54', '1 Million de $ en banque', 'money_1million', 1000),
(11, 'cf872e2dbff1cf3152fff72b147ca07238315148', 2, 'D55AD3EE', '2025-07-18 15:22:45', '2 Million +500k GRATUIT de $ en banque', 'money_2.5million', 2000),
(12, 'cf872e2dbff1cf3152fff72b147ca07238315148', 2, 'F81F3957', '2025-07-18 15:25:22', '1 Million de $ en banque', 'money_1million', 1000),
(13, 'cf872e2dbff1cf3152fff72b147ca07238315148', 2, '4B77B1A0', '2025-07-18 15:25:46', '2 Million +500k GRATUIT de $ en banque', 'money_2.5million', 2000),
(14, 'cf872e2dbff1cf3152fff72b147ca07238315148', 1, '05EF77EB', '2025-07-18 15:54:01', '100 score personnel PaintBall', 'personnel_point_100', 500),
(15, 'cf872e2dbff1cf3152fff72b147ca07238315148', 2, '8DAF1316', '2025-07-18 16:03:39', '500 milles $ en banque', 'money_500k', 500);

-- --------------------------------------------------------

--
-- Structure de la table `insto_accounts`
--

CREATE TABLE `insto_accounts` (
  `id` int(11) NOT NULL,
  `forename` varchar(50) NOT NULL DEFAULT '0',
  `surname` varchar(50) NOT NULL DEFAULT '0',
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `insto_instas`
--

CREATE TABLE `insto_instas` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) DEFAULT NULL,
  `message` varchar(256) NOT NULL,
  `image` varchar(256) NOT NULL,
  `filters` varchar(256) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `insto_likes`
--

CREATE TABLE `insto_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `inapId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  `limit` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `limit`) VALUES
('alive_chicken', 'Living chicken', 1, 0, 1, ''),
('ammonium_nitrate', 'Ammonium nitrate', 1, 0, 1, ''),
('apple', 'Pomme', 3, 0, 1, ''),
('applejuice', 'Jus de pomme', 2, 0, 1, ''),
('baking_soda', 'Baking Soda', 1, 0, 1, ''),
('bandage', 'Bandage', 2, 0, 1, ''),
('blowpipe', 'Blowtorch', 2, 0, 1, ''),
('blue_phone', 'Telephone bleu', 1, 0, 1, '0'),
('bread', 'Bread', 1, 0, 1, ''),
('cannabis', 'Cannabis', 3, 0, 1, ''),
('carbon', 'Carbon', 1, 0, 1, ''),
('carokit', 'Body Kit', 3, 0, 1, ''),
('carotool', 'Tools', 2, 0, 1, ''),
('chiffon', 'Chiffon', 1, 0, 1, ''),
('churn', 'Churn', 1, 0, 1, ''),
('clothe', 'Cloth', 1, 0, 1, ''),
('cocaine_cut', 'Cut Cocaine', 1, 0, 1, ''),
('cocaine_packaged', 'Packaged Cocaine', 1, 0, 1, ''),
('cocaine_uncut', 'Uncut Cocaine', 1, 0, 1, ''),
('codeine', 'Codeine', 1, 0, 1, ''),
('coke_access', 'Access card', 1, 0, 1, ''),
('coke_box', 'Box with Coke', 1, 0, 1, ''),
('coke_figure', 'Action Figure', 1, 0, 1, ''),
('coke_figurebroken', 'Pieces of Action Figure', 1, 0, 1, ''),
('coke_figureempty', 'Action Figure', 1, 0, 1, ''),
('coke_leaf', 'Coca Leaf', 1, 0, 1, ''),
('coke_pure', 'Pure Coke', 1, 0, 1, ''),
('coke_raw', 'Raw Coke', 1, 0, 1, ''),
('copper', 'Copper', 1, 0, 1, ''),
('crack', 'Crack', 1, 0, 1, ''),
('crack_pipe', 'Crack Pipe', 1, 0, 1, ''),
('cupcake', 'Cupcake', 1, 0, 1, ''),
('cutted_wood', 'Cut wood', 1, 0, 1, ''),
('cut_money', 'Counterfeit Cash - Cut', 1, 0, 1, ''),
('diamond', 'Diamond', 1, 0, 1, ''),
('drink_sprite', 'Sprite', 1, 0, 1, ''),
('drug_ecstasy', 'Ecstasy', 1, 0, 1, ''),
('drug_lean', 'Lean', 1, 0, 1, ''),
('drug_lsd', 'LSD', 1, 0, 1, ''),
('drug_meth', 'Meth', 1, 0, 1, ''),
('ecstasy1', 'Ecstasy', 1, 0, 1, ''),
('ecstasy2', 'Ecstasy', 1, 0, 1, ''),
('ecstasy3', 'Ecstasy', 1, 0, 1, ''),
('ecstasy4', 'Ecstasy', 1, 0, 1, ''),
('ecstasy5', 'Ecstasy', 1, 0, 1, ''),
('essence', 'Gas', 1, 0, 1, ''),
('fabric', 'Fabric', 1, 0, 1, ''),
('fish', 'Fish', 1, 0, 1, ''),
('fixkit', 'Repair Kit', 3, 0, 1, ''),
('fixtool', 'Repair Tools', 2, 0, 1, ''),
('gamepad', 'Gamepad', 1, 0, 1, ''),
('gazbottle', 'Gas Bottle', 2, 0, 1, ''),
('glue', 'Glue', 1, 0, 1, ''),
('gold', 'Gold', 1, 0, 1, ''),
('gpsill', 'GPS Tracker', 1, 0, 1, '3'),
('green_phone', 'Telephone Vert', 1, 0, 1, '0'),
('hammer', 'Hammer', 1, 0, 1, ''),
('heroin', 'Heroin', 1, 0, 1, ''),
('heroin_syringe', 'Heroin Syringe', 1, 0, 1, ''),
('hydrogen', 'Hydrogen', 1, 0, 1, ''),
('ice', 'Ice', 1, 0, 1, ''),
('iron', 'Iron', 1, 0, 1, ''),
('jolly_ranchers', 'Jolly Ranchers', 1, 0, 1, ''),
('jumelle', 'Jumelle', 1, 0, 0, ''),
('liquid_sulfur', 'Liquid Sulfur', 1, 0, 1, ''),
('lsd1', 'LSD', 1, 0, 1, ''),
('lsd2', 'LSD', 1, 0, 1, ''),
('lsd3', 'LSD', 1, 0, 1, ''),
('lsd4', 'LSD', 1, 0, 1, ''),
('lsd5', 'LSD', 1, 0, 1, ''),
('magicmushroom', 'Mushroom', 1, 0, 1, ''),
('marijuana', 'Marijuana', 2, 0, 1, ''),
('medikit', 'Medikit', 2, 0, 1, ''),
('melon', 'Cutted Melon', 1, 0, 1, ''),
('melonseed', 'Pumpkin Seed', 1, 0, 1, ''),
('meth_access', 'Access card', 1, 0, 1, ''),
('meth_amoniak', 'Ammonia', 1, 0, 1, ''),
('meth_bag', 'Meth bag', 1, 0, 1, ''),
('meth_emptysacid', 'Empty Canister', 1, 0, 1, ''),
('meth_glass', 'Tray with meth', 1, 0, 1, ''),
('meth_packaged', 'Packaged Meth', 1, 0, 1, ''),
('meth_pipe', 'Meth Pipe', 1, 0, 1, ''),
('meth_raw', 'Raw Meth', 1, 0, 1, ''),
('meth_sacid', 'Sodium Benzoate Canister', 1, 0, 1, ''),
('meth_sharp', 'Tray with smashed meth', 1, 0, 1, ''),
('meth_syringe', 'Meth Syringe', 1, 0, 1, ''),
('milkbottle', 'Milk Bottle', 1, 0, 1, ''),
('muriatic_acid', 'Muriatic Acid', 1, 0, 1, ''),
('nitrogen', 'Nitrogen', 1, 0, 1, ''),
('oxygen', 'Oxygen', 1, 0, 1, ''),
('packaged_chicken', 'Chicken fillet', 1, 0, 1, ''),
('packaged_plank', 'Packaged wood', 1, 0, 1, ''),
('petrol', 'Oil', 1, 0, 1, ''),
('petrol_raffin', 'Processed oil', 1, 0, 1, ''),
('phone', 'Phone', 1, 0, 1, ''),
('plastic_bag', 'Plastic bag', 1, 0, 1, ''),
('poppyplant', 'Poppy Plant', 1, 0, 1, ''),
('pseudoefedrine', 'Pseudoefedrine', 1, 0, 1, ''),
('pumpkin', 'Cutted Pumpkin', 1, 0, 1, ''),
('pumpkinseed', 'Pumpkin Seed', 1, 0, 1, ''),
('radio', 'Radio', 1, 0, 1, ''),
('raker', 'Raker', 1, 0, 1, ''),
('red_sulfur', 'Red Sulfur', 1, 0, 1, ''),
('scale', 'Scale', 1, 0, 1, ''),
('scissors', 'Scissors', 1, 0, 1, ''),
('shovel', 'Shovel', 1, 0, 1, ''),
('slaughtered_chicken', 'Slaughtered chicken', 1, 0, 1, ''),
('snickers', 'Snickers', 1, 0, 1, ''),
('sodium_hydroxide', 'Sodium hydroxide', 1, 0, 1, ''),
('sorted_money', 'Counterfeit Cash - Sorted', 1, 0, 1, ''),
('stone', 'Stone', 1, 0, 1, ''),
('syringe', 'Syringe', 1, 0, 1, ''),
('trowel', 'Trowel', 1, 0, 1, ''),
('washed_stone', 'Washed stone', 1, 0, 1, ''),
('water', 'Water', 1, 0, 1, ''),
('wateringcan', 'Watering Can', 1, 0, 1, ''),
('weed_access', 'Access card', 1, 0, 1, ''),
('weed_blunt', 'Blunt', 1, 0, 1, ''),
('weed_bud', 'Weed Bud', 1, 0, 1, ''),
('weed_budclean', 'Weed Bud', 1, 0, 1, ''),
('weed_joint', 'Joint', 1, 0, 1, ''),
('weed_package', 'Weed Bag', 1, 0, 1, ''),
('weed_packaged', 'Packaged Weed', 1, 0, 1, ''),
('weed_papers', 'Weed papers', 1, 0, 1, ''),
('weed_untrimmed', 'Untrimmed Weed', 1, 0, 1, ''),
('weed_wrap', 'Blunt wraps', 1, 0, 1, ''),
('wheat', 'Wheat', 1, 0, 1, ''),
('wheatseed', 'Wheat Seed', 1, 0, 1, ''),
('white_phone', 'Telephone Blanc', 1, 0, 1, '0'),
('wood', 'Wood', 1, 0, 1, ''),
('wool', 'Wool', 1, 0, 1, ''),
('xanaxpack', 'Pack of Xanax', 1, 0, 1, ''),
('xanaxpill', 'Xanax pill', 1, 0, 1, ''),
('xanaxplate', 'Plate of Xanax', 1, 0, 1, '');

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  `enable_billing` int(1) DEFAULT 0,
  `can_rob` int(1) DEFAULT 0,
  `can_handcuff` int(1) DEFAULT 0,
  `can_lockpick_cars` int(1) DEFAULT 0,
  `can_wash_vehicles` int(1) DEFAULT 0,
  `can_repair_vehicles` int(1) DEFAULT 0,
  `can_impound_vehicles` int(1) DEFAULT 0,
  `can_check_identity` int(1) DEFAULT 0,
  `can_check_vehicle_owner` int(1) DEFAULT 0,
  `nedpoeni` int(11) DEFAULT 0,
  `mespoeni` int(11) DEFAULT 0,
  `poeni` int(11) DEFAULT 0,
  `handyservice` varchar(2) NOT NULL DEFAULT '0',
  `hasapp` int(2) NOT NULL DEFAULT 0,
  `onlyboss` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`, `enable_billing`, `can_rob`, `can_handcuff`, `can_lockpick_cars`, `can_wash_vehicles`, `can_repair_vehicles`, `can_impound_vehicles`, `can_check_identity`, `can_check_vehicle_owner`, `nedpoeni`, `mespoeni`, `poeni`, `handyservice`, `hasapp`, `onlyboss`) VALUES
('ambulance', 'EMS', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('ammunation', 'Ammunation', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('army_terre_fr', 'Armée Terre FR', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('arp', 'Armée Rouge de Paleto', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('cardealer', 'Cardealer', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('chauffeurpl', 'Chauffeur PL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('cit', 'Corps d’Intervention Tactique', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('cn', 'Les Chacals Noirs', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('cnu', 'CNU', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('co', 'Le Cartel de l’Ombre', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('df', 'Division Fantôme', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('fsa', 'FSA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('gotur', 'Götür', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('gouv', 'Gouvernement', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('ld', 'Les Loups du Désert', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('ln', 'Légion Noir', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('lr', 'Les Revenants', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('mechanic', 'Mechanic', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('ms', 'La Milice du Sang', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('pecheur', 'pecheur', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('pharm', 'Pharmacien', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('police', 'Police Local', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('rpbc', 'République Populaire de Blaine County', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0),
('unemployed', 'Unemployed', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `jobs_armories`
--

CREATE TABLE `jobs_armories` (
  `id` int(11) NOT NULL,
  `weapon` varchar(50) NOT NULL,
  `components` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `ammo` int(10) UNSIGNED NOT NULL,
  `tint` int(11) NOT NULL,
  `marker_id` int(11) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs_data`
--

CREATE TABLE `jobs_data` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `coords` varchar(300) NOT NULL DEFAULT '',
  `min_grade` smallint(6) NOT NULL DEFAULT 0,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `blip_id` int(11) DEFAULT NULL,
  `blip_color` int(11) DEFAULT 0,
  `blip_scale` float DEFAULT 1,
  `label` varchar(50) DEFAULT NULL,
  `marker_type` int(11) DEFAULT 1,
  `marker_scale_x` float DEFAULT 1.5,
  `marker_scale_y` float DEFAULT 1.5,
  `marker_scale_z` float DEFAULT 0.5,
  `marker_color_red` int(3) DEFAULT 150,
  `marker_color_green` int(3) DEFAULT 150,
  `marker_color_blue` int(3) DEFAULT 0,
  `marker_color_alpha` int(3) DEFAULT 50,
  `ped` varchar(50) DEFAULT NULL,
  `ped_heading` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `jobs_data`
--

INSERT INTO `jobs_data` (`id`, `job_name`, `type`, `coords`, `min_grade`, `data`, `blip_id`, `blip_color`, `blip_scale`, `label`, `marker_type`, `marker_scale_x`, `marker_scale_y`, `marker_scale_z`, `marker_color_red`, `marker_color_green`, `marker_color_blue`, `marker_color_alpha`, `ped`, `ped_heading`) VALUES
(2, 'army_terre_fr', 'boss', '{\"x\":251.21,\"y\":-728.1,\"z\":53.95}', 13, '{\"washMoneyReturnPercentage\":50,\"canDeposit\":true,\"canEmployees\":true,\"canWashMoney\":true,\"canGrades\":false,\"canWithdraw\":true,\"washMoneyGoesToSocietyAccount\":true}', NULL, 0, 1, 'Général', 1, 1.5, 1.5, 0.5, 150, 150, 0, 50, NULL, NULL),
(6, 'army_terre_fr', 'job_outfit', '{\"x\":249.75,\"y\":-722.62,\"z\":53.95}', 0, NULL, NULL, 0, 1, 'Default', 1, 1.5, 1.5, 0.5, 150, 150, 0, 50, NULL, NULL),
(7, 'cnu', 'stash', '{\"z\":23.65,\"x\":3928.42,\"y\":1723.26}', 6, NULL, NULL, NULL, NULL, 'Planque', 1, 1.5, 1.5, 0.5, 0, 153, 230, 50, NULL, NULL),
(8, 'cnu', 'boss', '{\"z\":23.65,\"x\":3933.33,\"y\":1721.8}', 7, '{\"canDeposit\":true,\"canEmployees\":true,\"canWashMoney\":false,\"canWithdraw\":false,\"canGrades\":false}', NULL, 0, 1, 'Gestion', 1, 1.5, 1.5, 0.5, 150, 150, 0, 50, NULL, NULL),
(9, 'cnu', 'wardrobe', '{\"z\":23.65,\"x\":3926.77,\"y\":1739.85}', 0, NULL, NULL, 0, 1, 'Tenues', 1, 1.5, 1.5, 0.5, 150, 150, 0, 50, NULL, NULL),
(10, 'cnu', 'garage', '{\"z\":23.65,\"x\":3938.05,\"y\":1734.9}', 0, '{\"spawnCoords\":{\"z\":\"22.28\",\"x\":\"3963.65\",\"y\":\"1743.28\"},\"heading\":\"100.11\",\"vehicles\":{\"barracks\":{\"secondaryColor\":\"#111111\",\"primaryColor\":\"#000000\"},\"vetir\":{\"secondaryColor\":\"#111111\",\"primaryColor\":\"#111111\"},\"hasrad\":{\"secondaryColor\":\"#111111\",\"primaryColor\":\"#111111\"},\"crusader\":{\"secondaryColor\":\"#111111\",\"primaryColor\":\"#111111\"}}}', NULL, 0, 1, 'Véhicule temporaires', 1, 1.5, 1.5, 0.5, 150, 150, 0, 50, NULL, NULL),
(11, 'cnu', 'garage_buyable', '{\"z\":23.65,\"x\":3935.43,\"y\":1735.68}', 3, '{\"spawnCoords\":{\"z\":22.28,\"y\":1713.13,\"x\":3944.71},\"vehicles\":[],\"heading\":181.02}', NULL, NULL, NULL, 'Véhicule achetables', 1, 1.5, 1.5, 0.5, 30, 255, 0, 50, NULL, NULL),
(12, 'cnu', 'garage_owned', '{\"z\":22.45,\"x\":3935.26,\"y\":1742.69}', 0, '{\"spawnCoords\":{\"z\":22.45,\"x\":3925.63,\"y\":1747.19},\"heading\":265.33}', NULL, NULL, NULL, 'Véhicule Posseder', 1, 1.5, 1.5, 0.5, 0, 209, 206, 50, NULL, NULL),
(13, 'cnu', 'garage', '{\"z\":22.45,\"x\":3930.2,\"y\":1742.68}', 7, '{\"spawnCoords\":{\"z\":\"22.45\",\"x\":\"3939.31\",\"y\":\"1759.05\"},\"heading\":\"190.85\",\"vehicles\":{\"camoescalade\":{\"secondaryColor\":\"#111111\",\"primaryColor\":\"#111111\"}}}', NULL, NULL, NULL, 'Garage Patron', 1, 1.5, 1.5, 0.5, 255, 0, 0, 50, NULL, NULL),
(15, 'cnu', 'shop', '{\"z\":23.65,\"x\":3934.36,\"y\":1728.54}', 7, '{\"itemsOnSale\":{\"WEAPON_SNIPERRIFLE\":{\"price\":250000,\"blackMoney\":false},\"WEAPON_GRENADE\":{\"price\":20000,\"blackMoney\":false},\"WEAPON_SMOKEGRENADE\":{\"price\":2000,\"blackMoney\":false},\"WEAPON_CARBINERIFLE\":{\"price\":50000,\"blackMoney\":false},\"WEAPON_PISTOL\":{\"price\":5000,\"blackMoney\":false},\"WEAPON_FLASHLIGHT\":{\"price\":1000,\"blackMoney\":false},\"WEAPON_SMG\":{\"price\":30000,\"blackMoney\":false},\"WEAPON_KNIFE\":{\"price\":500,\"blackMoney\":false},\"WEAPON_FLARE\":{\"price\":5000,\"blackMoney\":false}}}', NULL, NULL, NULL, 'Boutique', 1, 1.5, 1.5, 0.5, 17, 255, 0, 50, NULL, NULL),
(16, 'cnu', 'shop', '{\"z\":23.65,\"x\":3936.54,\"y\":1721.55}', 6, '{\"itemsOnSale\":{\"ammo-flare\":{\"price\":6,\"blackMoney\":false},\"ammo-rocket\":{\"price\":15,\"blackMoney\":false},\"ammo-9\":{\"price\":5,\"blackMoney\":false},\"ammo-firework\":{\"price\":10,\"blackMoney\":false},\"ammo-grenade\":{\"price\":10,\"blackMoney\":false},\"ammo-shotgun\":{\"price\":6,\"blackMoney\":false},\"ammo-rifle\":{\"price\":1,\"blackMoney\":false},\"ammo-rifle2\":{\"price\":6,\"blackMoney\":false},\"ammo-emp\":{\"price\":5,\"blackMoney\":false}}}', NULL, NULL, NULL, 'Munition', 1, 1.5, 1.5, 0.5, 0, 132, 255, 50, NULL, NULL),
(17, 'cnu', 'shop', '{\"z\":22.28,\"x\":3993.52,\"y\":1842.28}', 0, '{\"itemsOnSale\":{\"WEAPON_SMG\":{\"price\":500000,\"blackMoney\":false},\"WEAPON_KNUCKLE\":{\"price\":300000,\"blackMoney\":false},\"WEAPON_SMOKEGRENADE\":{\"price\":100000,\"blackMoney\":false},\"WEAPON_CARBINERIFLE\":{\"price\":1250000,\"blackMoney\":false},\"WEAPON_PUMPSHOTGUN_MK2\":{\"price\":1000000,\"blackMoney\":false},\"WEAPON_PISTOL\":{\"price\":250000,\"blackMoney\":false},\"WEAPON_GRENADE\":{\"price\":50000,\"blackMoney\":false}}}', NULL, 0, 1, 'Arme Soldat', 1, 1.5, 1.5, 0.5, 150, 150, 0, 50, NULL, NULL),
(18, 'cnu', 'shop', '{\"z\":22.28,\"x\":3993.57,\"y\":1845.52}', 0, '{\"itemsOnSale\":{\"ammo-38\":{\"price\":10,\"blackMoney\":false},\"ammo-flare\":{\"price\":10,\"blackMoney\":false},\"ammo-rocket\":{\"price\":100,\"blackMoney\":false},\"ammo-50\":{\"price\":10,\"blackMoney\":false},\"ammo-22\":{\"price\":10,\"blackMoney\":false},\"ammo-sniper\":{\"price\":10,\"blackMoney\":false},\"ammo-rifle\":{\"price\":10,\"blackMoney\":false},\"ammo-rifle2\":{\"price\":10,\"blackMoney\":false},\"ammo-grenade\":{\"price\":10,\"blackMoney\":false},\"ammo-9\":{\"price\":10,\"blackMoney\":false},\"ammo-45\":{\"price\":10,\"blackMoney\":false},\"ammo-emp\":{\"price\":10,\"blackMoney\":false},\"ammo-shotgun\":{\"price\":10,\"blackMoney\":false}}}', NULL, NULL, NULL, 'Munition Soldat', 1, 1.5, 1.5, 0.5, 77, 255, 0, 50, NULL, NULL),
(19, 'fsa', 'boss', '{\"z\":20.34,\"x\":-1085.86,\"y\":-2748.25}', 13, '{\"canDeposit\":true,\"canEmployees\":true,\"canWashMoney\":false,\"canWithdraw\":false,\"canGrades\":false}', NULL, 0, 1, 'Patron', 1, 1.5, 1.5, 0.5, 150, 150, 0, 50, NULL, NULL),
(20, 'fsa', 'shop', '{\"z\":20.34,\"x\":-1084.39,\"y\":-2753.14}', 13, '{\"itemsOnSale\":{\"WEAPON_SNIPERRIFLE\":{\"blackMoney\":false,\"price\":200000},\"ammo-sniper\":{\"blackMoney\":false,\"price\":1},\"ammo-shotgun\":{\"blackMoney\":false,\"price\":1},\"WEAPON_CARBINERIFLE\":{\"blackMoney\":false,\"price\":150000},\"ammo-rifle\":{\"blackMoney\":false,\"price\":1},\"WEAPON_PUMPSHOTGUN\":{\"blackMoney\":false,\"price\":200000},\"WEAPON_PISTOL\":{\"blackMoney\":false,\"price\":100000},\"ammo-9\":{\"blackMoney\":false,\"price\":1}}}', NULL, NULL, NULL, 'Arme/Munition', 1, 1.5, 1.5, 0.5, 0, 110, 255, 50, NULL, NULL),
(21, 'fsa', 'shop', '{\"z\":20.34,\"x\":-1032.1,\"y\":-2765.02}', 0, '{\"itemsOnSale\":{\"ammo-shotgun\":{\"blackMoney\":false,\"price\":10},\"WEAPON_CARBINERIFLE\":{\"blackMoney\":false,\"price\":300000},\"ammo-rifle\":{\"blackMoney\":false,\"price\":10},\"ammo-9\":{\"blackMoney\":false,\"price\":10},\"ammo-sniper\":{\"blackMoney\":false,\"price\":10},\"WEAPON_PISTOL\":{\"blackMoney\":false,\"price\":150000}}}', NULL, NULL, NULL, 'Boutique Soldat', 1, 1.5, 1.5, 0.5, 77, 255, 0, 50, NULL, NULL),
(22, 'fsa', 'garage', '{\"z\":19.17,\"x\":-1041.12,\"y\":-2731.18}', 0, '{\"heading\":\"236.38\",\"spawnCoords\":{\"z\":\"19.12\",\"x\":\"-1040.89\",\"y\":\"-2724.99\"},\"vehicles\":{\"baller6\":{\"secondaryColor\":\"#111111\",\"primaryColor\":\"#111111\"},\"limo2\":{\"secondaryColor\":\"#111111\",\"primaryColor\":\"#111111\"},\"schafter6\":{\"secondaryColor\":\"#111111\",\"primaryColor\":\"#111111\"},\"dukes2\":{\"secondaryColor\":\"#111111\",\"primaryColor\":\"#111111\"},\"burrito3\":{\"secondaryColor\":\"#111111\",\"primaryColor\":\"#111111\"}}}', NULL, NULL, NULL, 'Véhicule Temporaire', 1, 1.5, 1.5, 0.5, 77, 255, 0, 50, NULL, NULL),
(23, 'arp', 'boss', '{\"y\":5998.6,\"z\":30.72,\"x\":-436.99}', 5, '{\"canDeposit\":true,\"canEmployees\":true,\"canWashMoney\":false,\"canWithdraw\":false,\"canGrades\":false}', NULL, NULL, NULL, 'Boss', 1, 1.5, 1.5, 0.5, 0, 251, 255, 50, NULL, NULL),
(24, 'arp', 'shop', '{\"y\":5986.05,\"z\":30.72,\"x\":-441.44}', 0, '{\"itemsOnSale\":{\"WEAPON_PUMPSHOTGUN\":{\"price\":200000,\"blackMoney\":false},\"WEAPON_CARBINERIFLE\":{\"price\":300000,\"blackMoney\":false},\"ammo-9\":{\"price\":10,\"blackMoney\":false},\"WEAPON_PISTOL\":{\"price\":150000,\"blackMoney\":false},\"ammo-rifle\":{\"price\":10,\"blackMoney\":false},\"ammo-shotgun\":{\"price\":10,\"blackMoney\":false}}}', NULL, NULL, NULL, 'Arme/Munition', 1, 1.5, 1.5, 0.5, 255, 0, 0, 50, NULL, NULL),
(25, 'arp', 'garage', '{\"y\":6003.27,\"z\":30.49,\"x\":-449.93}', 0, '{\"vehicles\":{\"zl1\":{\"secondaryColor\":\"#ff0000\",\"primaryColor\":\"#ff0000\"},\"rrphantom\":{\"secondaryColor\":\"#f70202\",\"primaryColor\":\"#fe0606\"},\"speeddemonrb\":{\"secondaryColor\":\"#f70202\",\"primaryColor\":\"#fa0000\"}},\"spawnCoords\":{\"y\":\"6009.45\",\"z\":\"30.34\",\"x\":\"-461.64\"},\"heading\":\"82.60\"}', NULL, NULL, NULL, 'Véhicule Temporaire', 1, 1.5, 1.5, 0.5, 29, 248, 252, 50, NULL, NULL),
(26, 'arp', 'garage', '{\"y\":6001.95,\"z\":30.3,\"x\":-470.55}', 0, '{\"vehicles\":{\"eheli\":{\"secondaryColor\":\"#f50000\",\"primaryColor\":\"#ef0101\"}},\"spawnCoords\":{\"y\":\"5987.49\",\"z\":\"30.34\",\"x\":\"-476.44\"},\"heading\":\"315.53\"}', NULL, NULL, NULL, 'Helico', 1, 1.5, 1.5, 0.5, 255, 0, 0, 50, NULL, NULL),
(27, 'cit', 'boss', '{\"x\":1672.96,\"z\":52.01,\"y\":3282.68}', 10, '{\"canDeposit\":true,\"canEmployees\":true,\"canWashMoney\":false,\"canWithdraw\":false,\"canGrades\":false}', NULL, NULL, NULL, 'Patron', 1, 1.5, 1.5, 0.5, 0, 251, 255, 50, NULL, NULL),
(28, 'cit', 'shop', '{\"x\":1759.17,\"z\":40.12,\"y\":3312.32}', 0, '{\"itemsOnSale\":{\"WEAammo-9PON_PISTOL\":{\"blackMoney\":false,\"price\":1},\"WEAPON_PISTOL\":{\"blackMoney\":false,\"price\":150000}}}', NULL, NULL, NULL, 'arme/munition', 1, 1.5, 1.5, 0.5, 255, 0, 0, 50, NULL, NULL),
(29, 'cit', 'garage', '{\"x\":1768.68,\"z\":41.09,\"y\":3319.75}', 0, '{\"heading\":\"310.50\",\"vehicles\":{\"cargobob\":{\"primaryColor\":\"#3e3d3d\",\"secondaryColor\":\"#303030\"},\"buzzard2\":{\"primaryColor\":\"#111111\",\"secondaryColor\":\"#111111\"}},\"spawnCoords\":{\"x\":\"1774.81\",\"z\":\"41.09\",\"y\":\"3332.31\"}}', NULL, NULL, NULL, 'Hélico', 1, 1.5, 1.5, 0.5, 0, 132, 255, 50, NULL, NULL),
(30, 'cit', 'garage', '{\"x\":1700.05,\"z\":40.15,\"y\":3299.08}', 0, '{\"heading\":\"191.55\",\"vehicles\":{\"besra\":{\"primaryColor\":\"#4d4c4c\",\"secondaryColor\":\"#111111\"},\"lazer\":{\"primaryColor\":\"#0b0404\",\"secondaryColor\":\"#111111\"}},\"spawnCoords\":{\"x\":\"1711.6\",\"z\":\"40.16\",\"y\":\"3299.42\"}}', NULL, NULL, NULL, 'Avion', 1, 1.5, 1.5, 0.5, 0, 17, 255, 50, NULL, NULL),
(31, 'cit', 'garage', '{\"x\":1762.02,\"z\":40.15,\"y\":3303.43}', 0, '{\"heading\":\"187.22\",\"vehicles\":{\"winky\":{\"primaryColor\":\"#5a5858\",\"secondaryColor\":\"#111111\"},\"technical\":{\"primaryColor\":\"#636363\",\"secondaryColor\":\"#111111\"}},\"spawnCoords\":{\"x\":\"1754.29\",\"z\":\"40.15\",\"y\":\"3306.5\"}}', NULL, NULL, NULL, 'Voiture', 1, 1.5, 1.5, 0.5, 4, 255, 0, 50, NULL, NULL),
(32, 'df', 'boss', '{\"y\":2221.84,\"x\":3079.85,\"z\":3.93}', 7, '{\"canDeposit\":true,\"canEmployees\":true,\"canWashMoney\":false,\"canWithdraw\":false,\"canGrades\":false}', NULL, NULL, NULL, 'Patron', 1, 1.5, 1.5, 0.5, 0, 0, 0, 50, NULL, NULL),
(33, 'df', 'shop', '{\"y\":2201.08,\"x\":3074.98,\"z\":3.92}', 0, '{\"itemsOnSale\":{\"WEAPON_SNIPERRIFLE\":{\"price\":200000,\"blackMoney\":false},\"ammo-sniper\":{\"price\":10,\"blackMoney\":false},\"WEAPON_CARBINERIFLE\":{\"price\":300000,\"blackMoney\":false},\"ammo-rifle\":{\"price\":10,\"blackMoney\":false},\"WEAPON_PISTOL\":{\"price\":150000,\"blackMoney\":false},\"ammo-shotgun\":{\"price\":10,\"blackMoney\":false},\"ammo-9\":{\"price\":10,\"blackMoney\":false},\"WEAPON_PUMPSHOTGUN\":{\"price\":200000,\"blackMoney\":false}}}', NULL, NULL, NULL, 'Arme/Munition', 1, 1.5, 1.5, 0.5, 55, 255, 0, 50, NULL, NULL),
(34, 'df', 'harvest', '{\"y\":2223.63,\"x\":3076.83,\"z\":8.95}', 0, '{\"itemMinQuantity\":1,\"itemName\":\"trash_burger\",\"itemMaxQuantity\":3,\"itemTime\":15,\"animations\":[{\"animDict\":\"anim@mp_radio@garage@high\",\"animName\":\"action_a\",\"type\":\"animation\",\"animDuration\":6}]}', NULL, NULL, NULL, 'recolte aliment burger', 1, 1.5, 1.5, 0.5, 1, 142, 10, 50, NULL, NULL),
(36, 'df', 'process', '{\"y\":2223.44,\"x\":3080.62,\"z\":8.95}', 0, '{\"timeToProcess\":20,\"itemToRemoveName\":\"trash_burger\",\"itemToAddName\":\"burger\",\"itemToAddQuantity\":1,\"itemToRemoveQuantity\":50,\"animations\":[{\"animDict\":\"special_ped@baygor@monologue_2@monologue_2h\",\"animName\":\"you_can_ignore_me_7\",\"type\":\"animation\",\"animDuration\":9}]}', NULL, NULL, NULL, 'Process', 1, 1.5, 1.5, 0.5, 68, 255, 0, 50, NULL, NULL),
(37, 'df', 'garage', '{\"y\":2230.63,\"x\":3089.29,\"z\":2.1}', 0, '{\"heading\":\"184.26\",\"spawnCoords\":{\"y\":\"2212.59\",\"x\":\"3095.46\",\"z\":\"-0.83\"},\"vehicles\":{\"seashark\":{\"primaryColor\":\"#0c0808\",\"secondaryColor\":\"#111111\"},\"dinghy5\":{\"primaryColor\":\"#696969\",\"secondaryColor\":\"#111111\"},\"avisa\":{\"primaryColor\":\"#595959\",\"secondaryColor\":\"#111111\"},\"dinghy2\":{\"primaryColor\":\"#111111\",\"secondaryColor\":\"#111111\"}}}', NULL, NULL, NULL, 'Bateau', 1, 1.5, 1.5, 0.5, 0, 255, 191, 50, NULL, NULL),
(38, 'df', 'garage', '{\"y\":1691.93,\"x\":2862.28,\"z\":23.27}', 0, '{\"heading\":\"121.20\",\"spawnCoords\":{\"y\":\"1687.9\",\"x\":\"2861.64\",\"z\":\"23.37\"},\"vehicles\":{\"guardian\":{\"primaryColor\":\"#0d0202\",\"secondaryColor\":\"#111111\"},\"patriot3\":{\"primaryColor\":\"#110303\",\"secondaryColor\":\"#111111\"}}}', NULL, NULL, NULL, 'Voiture', 1, 1.5, 1.5, 0.5, 0, 37, 97, 50, NULL, NULL),
(39, 'ln', 'boss', '{\"y\":-2404.06,\"x\":1006.1,\"z\":29.14}', 8, '{\"washMoneyReturnPercentage\":20,\"canDeposit\":true,\"canEmployees\":true,\"canWashMoney\":true,\"canGrades\":false,\"canWithdraw\":false,\"washMoneyGoesToSocietyAccount\":false}', NULL, NULL, NULL, 'patron', 1, 1.5, 1.5, 0.5, 0, 64, 92, 50, NULL, NULL),
(40, 'ln', 'garage', '{\"y\":-2390.62,\"x\":990.97,\"z\":29.44}', 0, '{\"heading\":\"173.50\",\"spawnCoords\":{\"y\":\"-2401.19\",\"x\":\"988.13\",\"z\":\"29.51\"},\"vehicles\":{\"vstr\":{\"primaryColor\":\"#0c0909\",\"secondaryColor\":\"#111111\"},\"xls2\":{\"primaryColor\":\"#090606\",\"secondaryColor\":\"#111111\"},\"thrust\":{\"primaryColor\":\"#0e0c0c\",\"secondaryColor\":\"#111111\"}}}', NULL, NULL, NULL, 'voiture', 1, 1.5, 1.5, 0.5, 0, 179, 255, 50, NULL, NULL),
(41, 'lr', 'boss', '{\"y\":-193.61,\"x\":-814.09,\"z\":40.44}', 6, '{\"washMoneyReturnPercentage\":20,\"canDeposit\":true,\"canEmployees\":true,\"canWashMoney\":true,\"canGrades\":false,\"canWithdraw\":false,\"washMoneyGoesToSocietyAccount\":false}', NULL, NULL, NULL, 'patron', 1, 1.5, 1.5, 0.5, 141, 64, 2, 50, NULL, NULL),
(42, 'lr', 'garage', '{\"y\":-195.69,\"x\":-794.87,\"z\":36.38}', 0, '{\"heading\":\"308.08\",\"spawnCoords\":{\"y\":\"-191.04\",\"x\":\"-794.18\",\"z\":\"36.38\"},\"vehicles\":{\"warrener\":{\"primaryColor\":\"#ffffff\",\"secondaryColor\":\"#111111\"}}}', NULL, NULL, NULL, 'Voiture', 1, 1.5, 1.5, 0.5, 255, 77, 0, 50, NULL, NULL),
(43, 'rpbc', 'boss', '{\"z\":49.52,\"y\":3048.52,\"x\":1986.06}', 8, '{\"canDeposit\":true,\"canEmployees\":true,\"canWashMoney\":false,\"canWithdraw\":false,\"canGrades\":false}', NULL, NULL, NULL, 'Patron', 1, 1.5, 1.5, 0.5, 255, 200, 0, 50, NULL, NULL),
(44, 'rpbc', 'garage', '{\"z\":46.03,\"y\":3039.28,\"x\":1997.1}', 0, '{\"spawnCoords\":{\"z\":\"46.21\",\"y\":\"3038.9\",\"x\":\"2002.68\"},\"vehicles\":{\"primo\":{\"secondaryColor\":\"#111111\",\"primaryColor\":\"#b87d00\"}},\"heading\":\"143.97\"}', NULL, NULL, NULL, 'Voiture temporaire', 1, 1.5, 1.5, 0.5, 138, 138, 0, 50, NULL, NULL),
(45, 'ld', 'boss', '{\"y\":5834.09,\"x\":-670.29,\"z\":16.33}', 6, '{\"canDeposit\":true,\"canEmployees\":true,\"canWashMoney\":false,\"canWithdraw\":false,\"canGrades\":false}', NULL, NULL, NULL, 'Patron', 1, 1.5, 1.5, 0.5, 41, 188, 1, 50, NULL, NULL),
(46, 'ld', 'garage', '{\"y\":5827.82,\"x\":-671.94,\"z\":16.33}', 0, '{\"heading\":\"99.34\",\"vehicles\":{\"slamvan\":{\"secondaryColor\":\"#ff7b00\",\"primaryColor\":\"#ff7b00\"}},\"spawnCoords\":{\"y\":\"5826.87\",\"x\":\"-664.08\",\"z\":\"16.33\"}}', NULL, NULL, NULL, 'Voiture temporaire', 1, 1.5, 1.5, 0.5, 255, 136, 0, 50, NULL, NULL),
(47, 'ms', 'boss', '{\"x\":171.16,\"z\":45.18,\"y\":2785.19}', 6, '{\"canDeposit\":true,\"canEmployees\":true,\"canWashMoney\":false,\"canWithdraw\":false,\"canGrades\":false}', NULL, NULL, NULL, 'Patron', 1, 1.5, 1.5, 0.5, 255, 0, 0, 50, NULL, NULL),
(48, 'co', 'boss', '{\"x\":-666.17,\"z\":42.54,\"y\":-154.68}', 7, '{\"canDeposit\":true,\"canEmployees\":true,\"canWashMoney\":false,\"canWithdraw\":false,\"canGrades\":false}', NULL, NULL, NULL, 'Patron', 1, 1.5, 1.5, 0.5, 255, 0, 0, 50, NULL, NULL),
(49, 'cn', 'boss', '{\"x\":-23.27,\"z\":32.14,\"y\":-1394.55}', 6, '{\"canDeposit\":true,\"canEmployees\":true,\"canWashMoney\":false,\"canWithdraw\":false,\"canGrades\":false}', NULL, NULL, NULL, 'Patron', 1, 1.5, 1.5, 0.5, 11, 11, 9, 50, NULL, NULL),
(50, 'ambulance', 'boss', '{\"z\":46.28,\"x\":341.91,\"y\":-583.13}', 3, '{\"canEmployees\":true,\"canWashMoney\":false,\"canGrades\":false,\"canDeposit\":true,\"canWithdraw\":false}', NULL, NULL, NULL, 'patron', 1, 1.5, 1.5, 0.5, 47, 151, 2, 50, NULL, NULL),
(51, 'pharm', 'boss', '{\"y\":14.99,\"z\":66.77,\"x\":106.65}', 4, '{\"canWithdraw\":true,\"canWashMoney\":false,\"canGrades\":false,\"canDeposit\":true,\"canEmployees\":true}', NULL, NULL, NULL, 'Patron', 1, 1.5, 1.5, 0.5, 0, 255, 76, 50, NULL, NULL),
(54, 'pharm', 'garage', '{\"x\":117.48,\"y\":4.19,\"z\":66.85}', 0, '{\"vehicles\":{\"pharm\":{\"primaryColor\":\"#fcfcfc\",\"secondaryColor\":\"#f5f5f5\"}},\"heading\":\"162.57\",\"spawnCoords\":{\"x\":\"120.11\",\"y\":\"-1.6\",\"z\":\"66.77\"}}', NULL, NULL, NULL, 'Véhicules temp', 1, 1.5, 1.5, 0.5, 30, 255, 0, 50, NULL, NULL),
(55, 'pharm', 'harvest', '{\"x\":-1606.83,\"z\":64.99,\"y\":2294.07}', 0, '{\"itemName\":\"coton\",\"itemMaxQuantity\":2,\"itemMinQuantity\":1,\"itemTime\":5}', NULL, 0, 1, 'coton', 1, 1.5, 1.5, 0.5, 150, 150, 0, 50, NULL, NULL),
(56, 'pharm', 'harvest', '{\"x\":109.2,\"z\":26.08,\"y\":-1797.48}', 0, '{\"itemName\":\"pochette_vide\",\"itemMaxQuantity\":2,\"itemMinQuantity\":1,\"itemTime\":5}', NULL, NULL, NULL, 'pochette_vide', 1, 1.5, 1.5, 0.5, 43, 255, 0, 50, NULL, NULL),
(57, 'pharm', 'harvest', '{\"x\":1226.16,\"z\":5.03,\"y\":-3105.92}', 0, '{\"itemName\":\"gaze\",\"itemMaxQuantity\":2,\"itemMinQuantity\":1,\"itemTime\":5}', NULL, NULL, NULL, 'gaze', 1, 1.5, 1.5, 0.5, 49, 167, 6, 50, NULL, NULL),
(58, 'pharm', 'harvest', '{\"x\":-315.55,\"z\":6.55,\"y\":-2698.79}', 0, '{\"itemName\":\"sparadrap\",\"itemMaxQuantity\":2,\"itemMinQuantity\":1,\"itemTime\":10}', NULL, NULL, NULL, 'sparadrap', 1, 1.5, 1.5, 0.5, 30, 87, 0, 50, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `jobs_garages`
--

CREATE TABLE `jobs_garages` (
  `vehicle_id` int(11) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `marker_id` int(11) NOT NULL,
  `vehicle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `vehicle_props` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `jobs_garages`
--

INSERT INTO `jobs_garages` (`vehicle_id`, `identifier`, `marker_id`, `vehicle`, `vehicle_props`, `plate`) VALUES
(1, 'cf872e2dbff1cf3152fff72b147ca07238315148', 11, 'mrap', '{}', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `jobs_shops`
--

CREATE TABLE `jobs_shops` (
  `id` int(11) NOT NULL,
  `marker_id` int(11) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_type` varchar(50) NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs_wardrobes`
--

CREATE TABLE `jobs_wardrobes` (
  `id` int(11) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `label` varchar(50) NOT NULL,
  `outfit` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `jobs_wardrobes`
--

INSERT INTO `jobs_wardrobes` (`id`, `identifier`, `label`, `outfit`) VALUES
(1, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'test', '{\"nose_6\":0,\"sex\":0,\"arms_2\":0,\"hair_color_2\":0,\"beard_4\":0,\"chin_1\":0,\"chest_1\":0,\"lip_thickness\":0,\"dad\":0,\"chin_3\":0,\"jaw_1\":0,\"nose_4\":0,\"torso_1\":4,\"ears_1\":-1,\"complexion_1\":0,\"lipstick_1\":0,\"face_g_weight\":0,\"mask_2\":0,\"cheeks_3\":0,\"lipstick_2\":0,\"torso_2\":0,\"beard_3\":0,\"age_1\":0,\"bracelets_2\":0,\"chain_2\":0,\"glasses_2\":0,\"bproof_2\":0,\"ears_2\":0,\"chest_2\":0,\"chain_1\":0,\"arms\":0,\"jaw_2\":0,\"shoes_1\":0,\"sun_2\":0,\"decals_2\":0,\"bags_2\":0,\"chin_4\":0,\"hair_1\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"makeup_3\":0,\"makeup_2\":0,\"blush_2\":0,\"bags_1\":0,\"bproof_1\":36,\"eyebrows_1\":0,\"bodyb_3\":-1,\"eye_color\":0,\"hair_color_1\":0,\"nose_5\":0,\"tshirt_2\":0,\"tshirt_1\":0,\"moles_1\":0,\"complexion_2\":0,\"helmet_1\":-1,\"eye_squint\":0,\"eyebrows_2\":0,\"pants_1\":112,\"sun_1\":0,\"mom\":0,\"bodyb_4\":0,\"bracelets_1\":-1,\"decals_1\":0,\"eyebrows_3\":0,\"makeup_1\":0,\"grandparents\":0,\"age_2\":0,\"beard_2\":0,\"chest_3\":0,\"nose_3\":0,\"lipstick_4\":0,\"mask_1\":0,\"hair_2\":0,\"eyebrows_6\":0,\"neck_thickness\":0,\"nose_2\":0,\"lipstick_3\":0,\"blemishes_2\":0,\"face_md_weight\":50,\"bodyb_2\":0,\"watches_1\":-1,\"blemishes_1\":0,\"moles_2\":0,\"glasses_1\":35,\"helmet_2\":-1,\"watches_2\":0,\"pants_2\":0,\"skin_md_weight\":50,\"cheeks_1\":0,\"chin_2\":0,\"eyebrows_5\":0,\"blush_1\":0,\"blush_3\":0,\"nose_1\":0,\"bodyb_1\":-1,\"beard_1\":0,\"shoes_2\":0,\"cheeks_2\":0}');

-- --------------------------------------------------------

--
-- Structure de la table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Unemployed', 100, '{}', '{}'),
(2, 'police', 0, 'recruit', 'Recrue', 20, '{}', '{}'),
(3, 'police', 1, 'officer', 'Officer', 40, '{}', '{}'),
(4, 'police', 2, 'sergeant', 'Sergent', 60, '{}', '{}'),
(5, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
(6, 'police', 4, 'boss', 'Commandant', 100, '{}', '{}'),
(11, 'cardealer', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
(12, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
(13, 'cardealer', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
(14, 'cardealer', 3, 'boss', 'Boss', 0, '{}', '{}'),
(22, 'ambulance', 0, 'ambulance', 'Recrue', 20, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(23, 'ambulance', 1, 'doctor', 'Ambulancier', 40, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(24, 'ambulance', 2, 'chief_doctor', 'Chef Ambulancier', 60, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(25, 'ambulance', 3, 'boss', 'Superviseur', 80, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(26, 'mechanic', 0, 'recrue', 'Recruit', 12, '{}', '{}'),
(27, 'mechanic', 1, 'novice', 'Novice', 24, '{}', '{}'),
(28, 'mechanic', 2, 'experimente', 'Experienced', 36, '{}', '{}'),
(29, 'mechanic', 3, 'chief', 'Leader', 48, '{}', '{}'),
(30, 'mechanic', 4, 'boss', 'Boss', 0, '{}', '{}'),
(41, 'army_terre_fr', 0, 'soldat', 'Soldat', 100, '{}', '{}'),
(42, 'army_terre_fr', 1, 'caporal', 'Caporal', 100, '{}', '{}'),
(43, 'army_terre_fr', 2, 'sergent', 'Sergent', 100, '{}', '{}'),
(44, 'army_terre_fr', 3, 'sergent_chef', 'Sergent Chef', 100, '{}', '{}'),
(45, 'army_terre_fr', 4, 'adjudant', 'Adjudant', 100, '{}', '{}'),
(46, 'army_terre_fr', 5, 'adjudant_chef', 'Adjudant Chef', 100, '{}', '{}'),
(47, 'army_terre_fr', 6, 'major', 'major', 100, '{}', '{}'),
(48, 'army_terre_fr', 7, 'aspirant', 'Aspirant', 100, '{}', '{}'),
(49, 'army_terre_fr', 8, 'sous_lieutenant', 'Sous Lieutenant', 100, '{}', '{}'),
(50, 'army_terre_fr', 9, 'lieutenant', 'Lieutenant', 100, '{}', '{}'),
(51, 'army_terre_fr', 10, 'capitaine', 'Capitaine', 100, '{}', '{}'),
(52, 'army_terre_fr', 11, 'commandant', 'Commandant', 100, '{}', '{}'),
(53, 'army_terre_fr', 12, 'colonel', 'colonel', 100, '{}', '{}'),
(54, 'army_terre_fr', 13, 'general_de_brigade', 'Général De Brigade', 100, '{}', '{}'),
(55, 'gotur', 0, 'recrue', 'Recrue', 12, '{}', '{}'),
(56, 'gotur', 1, 'boss', 'Patron', 0, '{}', '{}'),
(57, 'cnu', 0, 'soldat_de_la_paix', 'Soldat de la Paix', 100, '{}', '{}'),
(58, 'cnu', 1, 'caporal', 'Caporal ', 100, '{}', '{}'),
(59, 'cnu', 2, 'sergent_chef', 'Sergent Chef', 100, '{}', '{}'),
(60, 'cnu', 3, 'lieutenant', 'Lieutenant', 100, '{}', '{}'),
(61, 'cnu', 4, 'capitaine', 'Capitaine', 100, '{}', '{}'),
(62, 'cnu', 5, 'colonel', 'Colonel', 100, '{}', '{}'),
(63, 'cnu', 6, 'general_de_brigade', 'Général de Brigade', 100, '{}', '{}'),
(64, 'cnu', 7, 'commandant_des_forces_du_cnu', 'Commandant des Forces du CNU', 100, '{}', '{}'),
(65, 'fsa', 0, 'soldat', 'Soldat', 100, '{}', '{}'),
(66, 'fsa', 1, 'soldat_de_1re_classe', 'Soldat de 1ère Classe', 100, '{}', '{}'),
(67, 'fsa', 2, 'caporal', 'Caporal', 100, '{}', '{}'),
(68, 'fsa', 3, 'sergent', 'Sergent', 100, '{}', '{}'),
(69, 'fsa', 4, 'sergent_chef', 'Sergent-Chef', 100, '{}', '{}'),
(70, 'fsa', 5, 'adjudant_chef', 'Adjudant-Chef', 100, '{}', '{}'),
(71, 'fsa', 6, 'sous_lieutenant', 'Sous-Lieutenant', 100, '{}', '{}'),
(72, 'fsa', 7, 'lieutenant', 'Lieutenant', 100, '{}', '{}'),
(73, 'fsa', 8, 'capitaine', 'Capitaine', 100, '{}', '{}'),
(74, 'fsa', 9, 'commandant', 'Commandant', 100, '{}', '{}'),
(75, 'fsa', 10, 'lieutenant_colonel', 'Lieutenant-Colonel', 100, '{}', '{}'),
(76, 'fsa', 11, 'colonel', 'Colonel', 100, '{}', '{}'),
(77, 'fsa', 12, 'general_de_division', 'Général de Division', 100, '{}', '{}'),
(78, 'fsa', 13, 'general_en_chef', 'Général en Chef', 100, '{}', '{}'),
(79, 'ln', 0, 'recrue', 'Recrue', 100, '{}', '{}'),
(80, 'ln', 1, 'tireur', 'Tireur', 100, '{}', '{}'),
(81, 'ln', 2, 'executeur', 'Exécuteur', 100, '{}', '{}'),
(82, 'ln', 3, 'sergent_des_sables', 'Sergent des Sables ', 100, '{}', '{}'),
(83, 'ln', 4, 'veteran', 'Vétéran', 100, '{}', '{}'),
(84, 'ln', 5, 'lieutenant_des_operations', 'Lieutenant des Opérations', 100, '{}', '{}'),
(85, 'ln', 6, 'capitaine_mercenaire', 'Capitaine Mercenaire', 100, '{}', '{}'),
(86, 'ln', 7, 'commandant_de_l_ombre', 'Commandant de l’Ombre', 100, '{}', '{}'),
(87, 'ln', 8, 'seigneur_de_guerre', 'Seigneur de Guerre', 100, '{}', '{}'),
(88, 'rpbc', 0, 'volontaire_arme', 'Volontaire Armé', 100, '{}', '{}'),
(89, 'rpbc', 1, 'guerrier_du_peuple', 'Guerrier du Peuple', 100, '{}', '{}'),
(90, 'rpbc', 2, 'sergent_rouge', 'Sergent Rouge', 100, '{}', '{}'),
(91, 'rpbc', 3, 'lieutenant_revolutionnaire', 'Lieutenant Révolutionnaire', 100, '{}', '{}'),
(92, 'rpbc', 4, 'capitaine_du_front', 'Capitaine du Front', 100, '{}', '{}'),
(93, 'rpbc', 5, 'commandant_de_brigade', 'Commandant de Brigade', 100, '{}', '{}'),
(94, 'rpbc', 6, 'colonel_insurge', 'Colonel Insurgé', 100, '{}', '{}'),
(95, 'rpbc', 7, 'general_du_peuple', 'Général du Peuple', 100, '{}', '{}'),
(96, 'rpbc', 8, 'president_de_la_revolution', 'Président de la Révolution', 100, '{}', '{}'),
(97, 'cit', 0, 'attente_formation', 'Attente Formation', 50, '{}', '{}'),
(98, 'cit', 1, 'technicien_de_reconnaissance', 'Technicien de Reconnaissance', 100, '{}', '{}'),
(99, 'cit', 2, 'pilote_tactique', 'Pilote Tactique', 100, '{}', '{}'),
(100, 'cit', 3, 'agent_d_assaut', 'Agent d’Assaut', 100, '{}', '{}'),
(101, 'cit', 4, 'tireur_d_elite', 'Tireur d’Élite', 100, '{}', '{}'),
(102, 'cit', 5, 'operateur_drone', 'Opérateur Drone', 100, '{}', '{}'),
(103, 'cit', 6, 'sergent_de_choc', 'Sergent de Choc', 100, '{}', '{}'),
(104, 'cit', 7, 'lieutenant_operationnel', 'Lieutenant Opérationnel', 100, '{}', '{}'),
(105, 'cit', 8, 'capitaine_d_intervention', 'Capitaine d’Intervention', 100, '{}', '{}'),
(106, 'cit', 9, 'commandant_tactique', 'Commandant Tactique', 100, '{}', '{}'),
(107, 'cit', 10, 'do', 'Directeur des Opérations (DO)', 100, '{}', '{}'),
(108, 'arp', 0, 'volontaire_rouge', 'Volontaire Rouge', 100, '{}', '{}'),
(109, 'arp', 1, 'milicien_de_paleto', 'Milicien de Paleto', 100, '{}', '{}'),
(110, 'arp', 2, 'sergent_revolutionnaire', 'Sergent Révolutionnaire', 100, '{}', '{}'),
(111, 'arp', 3, 'capitaine_rouge', 'Capitaine Rouge', 100, '{}', '{}'),
(112, 'arp', 4, 'colonel_du_peuple', 'Colonel du Peuple', 100, '{}', '{}'),
(113, 'arp', 5, 'commandant_supreme', 'Commandant Suprême', 100, '{}', '{}'),
(114, 'df', 0, 'recrue_de_l_ombre', 'Recrue de l’Ombre', 100, '{}', '{}'),
(115, 'df', 1, 'operateur_fantome', 'Opérateur Fantôme', 100, '{}', '{}'),
(116, 'df', 2, 'tireur_silencieux', 'Tireur Silencieux', 100, '{}', '{}'),
(117, 'df', 3, 'eclaireur_nocturne', 'Éclaireur Nocturne', 100, '{}', '{}'),
(118, 'df', 4, 'infiltrateur', 'Infiltrateur', 100, '{}', '{}'),
(119, 'df', 5, 'agent_fantome', 'Agent Fantôme', 100, '{}', '{}'),
(120, 'df', 6, 'commandant_spectre', 'Commandant Spectre', 100, '{}', '{}'),
(121, 'df', 7, 'maitre_fantome', 'Maître Fantôme', 100, '{}', '{}'),
(122, 'ld', 0, 'louveteau', 'Louveteau', 100, '{}', '{}'),
(123, 'ld', 1, 'chacal', 'Chacal', 100, '{}', '{}'),
(124, 'ld', 2, 'passeur', 'Passeur', 100, '{}', '{}'),
(125, 'ld', 3, 'mercenaire_du_sable', 'Mercenaire du Sable', 100, '{}', '{}'),
(126, 'ld', 4, 'chef_de_meute', 'Chef de Meute', 100, '{}', '{}'),
(127, 'ld', 5, 'beta', 'Bêta', 100, '{}', '{}'),
(128, 'ld', 6, 'alpha', 'Alpha', 100, '{}', '{}'),
(129, 'ms', 0, 'converti', 'Converti', 100, '{}', '{}'),
(130, 'ms', 1, 'incendiaire', 'Incendiaire', 100, '{}', '{}'),
(131, 'ms', 2, 'faucheur', 'Faucheur', 100, '{}', '{}'),
(132, 'ms', 3, 'boucher', 'Boucher', 100, '{}', '{}'),
(133, 'ms', 4, 'carnassier', 'Carnassier', 100, '{}', '{}'),
(134, 'ms', 5, 'executeur_cramoisi', 'Exécuteur Cramoisi', 100, '{}', '{}'),
(135, 'ms', 6, 'prophete_du_sang', 'Prophète du Sang', 100, '{}', '{}'),
(136, 'co', 0, 'soldado', 'Soldado', 100, '{}', '{}'),
(137, 'co', 1, 'coyote', 'Coyote', 100, '{}', '{}'),
(138, 'co', 2, 'remora', 'Rémora', 100, '{}', '{}'),
(139, 'co', 3, 'sicario', 'Sicario', 100, '{}', '{}'),
(140, 'co', 4, 'capo_de_la_poudre', 'Capo de la Poudre', 100, '{}', '{}'),
(141, 'co', 5, 'capo_de_la_route', 'Capo de la Route', 100, '{}', '{}'),
(142, 'co', 6, 'mano_negra', 'Mano Negra', 100, '{}', '{}'),
(143, 'co', 7, 'el_fantasma', 'El Fantasma', 100, '{}', '{}'),
(144, 'cn', 0, 'charognard', 'Charognard', 100, '{}', '{}'),
(145, 'cn', 1, 'saboteur', 'Saboteur', 100, '{}', '{}'),
(146, 'cn', 2, 'pilleur', 'Pilleur', 100, '{}', '{}'),
(147, 'cn', 3, 'maraudeur', 'Maraudeur', 100, '{}', '{}'),
(148, 'cn', 4, 'commandant_de_meute', 'Commandant de Meute', 500, '{}', '{}'),
(149, 'cn', 5, 'chacal_alpha', 'Chacal Alpha', 100, '{}', '{}'),
(150, 'cn', 6, 'seigneur_noir', 'Seigneur Noir', 100, '{}', '{}'),
(151, 'lr', 0, 'novice_de_l_ombre', 'Novice de l’Ombre', 100, '{}', '{}'),
(152, 'lr', 1, 'saboteur_silencieux', 'Saboteur Silencieux', 100, '{}', '{}'),
(153, 'lr', 2, 'chasseur', 'Chasseur', 100, '{}', '{}'),
(154, 'lr', 3, 'disparu', 'Disparu', 100, '{}', '{}'),
(155, 'lr', 4, 'faucheur', 'Faucheur', 100, '{}', '{}'),
(156, 'lr', 5, 'l_ombre', 'L’Ombre', 100, '{}', '{}'),
(157, 'lr', 6, 'le_spectre', 'Le Spectre', 100, '{}', '{}'),
(158, 'pharm', 0, 'recrue', 'Stagiaire', 100, '{}', '{}'),
(159, 'pharm', 1, 'preparateur', 'Préparateur en pharmacie', 100, '{}', '{}'),
(160, 'pharm', 2, 'vendeur', 'Vendeur', 100, '{}', '{}'),
(161, 'pharm', 3, 'assistant', 'Assistant Pharmacien', 100, '{}', '{}'),
(162, 'pharm', 4, 'pharmacien', 'Pharmacien', 100, '{}', '{}'),
(163, 'pharm', 5, 'chef', 'Chef Pharmacien', 100, '{}', '{}'),
(164, 'gouv', 0, 'recrue', 'Employé', 100, '', ''),
(165, 'gouv', 1, 'secretaire', 'Secretaire', 100, '', ''),
(166, 'gouv', 2, 'ministre', 'Ministre', 250, '', ''),
(167, 'gouv', 3, 'boss', 'Président', 500, '', ''),
(168, 'ammunation', 0, 'recrue', 'Recrue', 20, '', ''),
(169, 'ammunation', 1, 'member', 'Ammunation', 40, '', ''),
(170, 'ammunation', 2, 'leader', 'Chef de Chaine', 60, '', ''),
(171, 'ammunation', 3, 'boss', 'Patron', 80, '', ''),
(172, 'chauffeurpl', 0, 'stagiaire', 'Interim', 50, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(173, 'chauffeurpl', 1, 'apprenti', 'Apprenti Chauffeur PL', 75, '{\"tshirt_2\":1,\"hair_color_1\":2,\"glasses_2\":1,\"shoes\":10,\"torso_2\":5,\"hair_color_2\":1,\"pants_1\":26,\"glasses_1\":5,\"hair_1\":3,\"sex\":0,\"decals_2\":1,\"tshirt_1\":16,\"helmet_1\":10,\"helmet_2\":1,\"arms\":95,\"face\":20,\"decals_1\":62,\"torso_1\":18,\"hair_2\":1,\"skin\":35,\"pants_2\":6}', '{\"tshirt_2\":2,\"decals_2\":1,\"glasses\":1,\"hair_1\":3,\"torso_1\":74,\"shoes\":2,\"hair_color_2\":1,\"glasses_1\":20,\"skin\":14,\"face\":7,\"pants_2\":6,\"tshirt_1\":76,\"pants_1\":38,\"helmet_1\":58,\"torso_2\":1,\"arms\":15,\"sex\":1,\"glasses_2\":1,\"decals_1\":1,\"hair_2\":1,\"helmet_2\":1,\"hair_color_1\":1}'),
(174, 'chauffeurpl', 2, 'chauffeur_pl', 'Chauffeur PL', 85, '{\"tshirt_2\":2,\"hair_color_1\":3,\"glasses_2\":2,\"shoes\":11,\"torso_2\":6,\"hair_color_2\":2,\"pants_1\":28,\"glasses_1\":6,\"hair_1\":4,\"sex\":0,\"decals_2\":2,\"tshirt_1\":17,\"helmet_1\":11,\"helmet_2\":2,\"arms\":98,\"face\":21,\"decals_1\":64,\"torso_1\":20,\"hair_2\":2,\"skin\":36,\"pants_2\":7}', '{\"tshirt_2\":3,\"decals_2\":2,\"glasses\":2,\"hair_1\":4,\"torso_1\":75,\"shoes\":3,\"hair_color_2\":2,\"glasses_1\":21,\"skin\":15,\"face\":8,\"pants_2\":7,\"tshirt_1\":77,\"pants_1\":39,\"helmet_1\":59,\"torso_2\":2,\"arms\":16,\"sex\":1,\"glasses_2\":2,\"decals_1\":2,\"hair_2\":2,\"helmet_2\":2,\"hair_color_1\":2}'),
(175, 'chauffeurpl', 3, 'chauffeur_pl_exp', 'Chauffeur PL Expérimenté', 95, '{\"tshirt_2\":3,\"hair_color_1\":4,\"glasses_2\":3,\"shoes\":12,\"torso_2\":7,\"hair_color_2\":3,\"pants_1\":30,\"glasses_1\":7,\"hair_1\":5,\"sex\":0,\"decals_2\":3,\"tshirt_1\":18,\"helmet_1\":12,\"helmet_2\":3,\"arms\":100,\"face\":22,\"decals_1\":66,\"torso_1\":22,\"hair_2\":3,\"skin\":37,\"pants_2\":8}', '{\"tshirt_2\":4,\"decals_2\":3,\"glasses\":3,\"hair_1\":5,\"torso_1\":76,\"shoes\":4,\"hair_color_2\":3,\"glasses_1\":22,\"skin\":16,\"face\":9,\"pants_2\":8,\"tshirt_1\":78,\"pants_1\":40,\"helmet_1\":60,\"torso_2\":3,\"arms\":17,\"sex\":1,\"glasses_2\":3,\"decals_1\":3,\"hair_2\":3,\"helmet_2\":3,\"hair_color_1\":3}'),
(176, 'chauffeurpl', 4, 'chef_equipe', 'Chef d\'équipe', 100, '{\"tshirt_2\":4,\"hair_color_1\":5,\"glasses_2\":4,\"shoes\":13,\"torso_2\":8,\"hair_color_2\":4,\"pants_1\":32,\"glasses_1\":8,\"hair_1\":6,\"sex\":0,\"decals_2\":4,\"tshirt_1\":19,\"helmet_1\":13,\"helmet_2\":4,\"arms\":102,\"face\":23,\"decals_1\":68,\"torso_1\":24,\"hair_2\":4,\"skin\":38,\"pants_2\":9}', '{\"tshirt_2\":5,\"decals_2\":4,\"glasses\":4,\"hair_1\":6,\"torso_1\":77,\"shoes\":5,\"hair_color_2\":4,\"glasses_1\":23,\"skin\":17,\"face\":10,\"pants_2\":9,\"tshirt_1\":79,\"pants_1\":41,\"helmet_1\":61,\"torso_2\":4,\"arms\":18,\"sex\":1,\"glasses_2\":4,\"decals_1\":4,\"hair_2\":4,\"helmet_2\":4,\"hair_color_1\":4}'),
(177, 'chauffeurpl', 5, 'patron', 'Patron', 110, '{\"tshirt_2\":5,\"hair_color_1\":6,\"glasses_2\":5,\"shoes\":14,\"torso_2\":9,\"hair_color_2\":5,\"pants_1\":34,\"glasses_1\":9,\"hair_1\":7,\"sex\":0,\"decals_2\":5,\"tshirt_1\":20,\"helmet_1\":14,\"helmet_2\":5,\"arms\":104,\"face\":24,\"decals_1\":70,\"torso_1\":26,\"hair_2\":5,\"skin\":39,\"pants_2\":10}', '{\"tshirt_2\":6,\"decals_2\":5,\"glasses\":5,\"hair_1\":7,\"torso_1\":78,\"shoes\":6,\"hair_color_2\":5,\"glasses_1\":24,\"skin\":18,\"face\":11,\"pants_2\":10,\"tshirt_1\":80,\"pants_1\":42,\"helmet_1\":62,\"torso_2\":5,\"arms\":19,\"sex\":1,\"glasses_2\":5,\"decals_1\":5,\"hair_2\":5,\"helmet_2\":5,\"hair_color_1\":5}'),
(178, 'pecheur', 0, 'pecheur', 'pecheur', 0, '', '');

-- --------------------------------------------------------

--
-- Structure de la table `lbc_annonces`
--

CREATE TABLE `lbc_annonces` (
  `id` int(11) NOT NULL,
  `seller_identifier` varchar(64) NOT NULL,
  `seller_name` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_label` varchar(64) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(25) NOT NULL DEFAULT 'en_vente',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `pending_money` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lbc_annonces`
--

INSERT INTO `lbc_annonces` (`id`, `seller_identifier`, `seller_name`, `item_name`, `item_label`, `amount`, `price`, `image_url`, `description`, `status`, `created_at`, `pending_money`) VALUES
(1, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'eau', 1, 50, '', 'fezfze', 'vendu', '2025-06-24 18:01:38', 0),
(2, 'char2:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin V2.0', 'water', 'de la bonne eau', 1, 10, '', '', 'vendu', '2025-06-24 18:36:30', 0),
(3, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Eau fraiche ca mere', 1, 10, '', '', 'vendu', '2025-06-24 22:02:26', 0),
(13, 'steam:11000010abcd02', 'Lea Renault', 'burger', 'Burger Gourmand', 6, 30, '', 'Un burger avec sauce maison !', 'vendu', '2025-06-24 23:34:59', 120),
(22, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 'Juan Rodriguez', 'water', 'eau frais chakal', 1, 4, 'https://i.ibb.co/84Pvy114/icone-vecteur-realiste-bouteille-eau-plastique-isole-fond-blanc-boisson-maquette-boisson.png', '', 'vendu', '2025-06-24 23:42:32', 0),
(23, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Eau fraiche', 1, 10, 'https://i.ibb.co/k2jQHRyj/logo-guerrerp-np.png', 'De la bonne eau de source !', 'vendu', '2025-06-25 00:03:24', 0),
(24, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Eau fraiche', 1, 10, 'https://i.ibb.co/k2jQHRyj/logo-guerrerp-np.png', 'De la bonne eau de source !', 'vendu', '2025-06-25 00:11:26', 0),
(25, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Eau', 1, 10, '', '', 'supprimee', '2025-06-25 20:55:20', 0),
(26, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'test 01', 1, 10, '', '', 'supprimee', '2025-06-25 21:58:34', 0),
(27, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Vitel', 1, 100, '', 'C\'est une eau très rare a trouver en ce moment !!', 'supprimee', '2025-06-29 12:07:20', 0),
(28, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Vitel', 1, 100, '', 'C\'est une eau très rare a trouver en ce moment !!', 'supprimee', '2025-06-29 12:07:50', 0),
(29, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Vitel', 1, 100, '', 'C\'est une eau très rare a trouver en ce moment !!', 'supprimee', '2025-06-29 12:08:13', 0),
(30, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Vitel', 1, 100, '', 'C\'est une eau très rare a trouver en ce moment !!', 'supprimee', '2025-06-29 12:08:47', 0),
(31, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Vitel', 1, 100, '', 'C\'est une eau très rare a trouver en ce moment !!', 'supprimee', '2025-06-29 12:09:10', 0),
(32, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Vitel', 1, 100, '', 'C\'est une eau très rare a trouver en ce moment !!', 'supprimee', '2025-06-29 12:09:17', 0),
(33, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Vitel', 1, 100, '', 'C\'est une eau très rare a trouver en ce moment !!', 'supprimee', '2025-06-29 12:13:53', 0),
(34, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Vitel', 1, 100, '', 'C\'est une eau très rare a trouver en ce moment !!', 'vendu', '2025-06-29 12:14:50', 0),
(35, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Test Defi (Eau)', 1, 10, '', '', 'supprimee', '2025-06-30 16:56:27', 0),
(36, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Eau de source', 1, 1, '', '', 'supprimee', '2025-06-30 18:48:04', 0),
(37, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Eau de source', 1, 1, '', '', 'supprimee', '2025-06-30 18:52:11', 0),
(38, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 'water', 'eau de source', 1, 1, '', '', 'vendu', '2025-06-30 18:52:49', 0),
(39, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 'water', 'mia khalifa', 1, 1, '', '', 'supprimee', '2025-06-30 18:53:08', 0),
(40, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'burger', 'Un bon Mcdonald', 1, 1, '', '', 'supprimee', '2025-06-30 19:00:18', 0),
(41, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'burger', 'Un bon Mcdonald', 1, 1, 'https://i.ibb.co/fzg84BhH/logo-revolte-plaque.png', '', 'supprimee', '2025-06-30 19:08:16', 0),
(42, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 'water', 'mia khalifa', 1, 500, 'https://i.ibb.co/yBRf9QB9/miak.png', 'fait la total pour 500$ fonce c\'est une expert', 'vendu', '2025-06-30 19:13:41', 0),
(43, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'burger', 'BigMac', 1, 5, '', 'ceci est de l\'eau', 'vendu', '2025-07-13 17:32:41', 0),
(44, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'burger', 'BigMac Promo', 9, 500, '', 'Bouboule en sueur', 'vendu', '2025-07-13 17:33:12', 0),
(45, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 'Juan Rodriguez', 'water', 'eau', 1, 2, '', '', 'vendu', '2025-07-16 10:43:09', 0),
(46, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 'water', 'mia khalifa suce bien', 1, 50, '', 'mia elle suce bien je vous jure', 'vendu', '2025-07-17 22:43:12', 0),
(47, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 'water', 'polyamnesia', 1, 1000, '', 'mia elle suce bien je vous jure', 'en_vente', '2025-07-17 22:52:55', 0),
(48, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Eau de source', 1, 10, '', '', 'vendu', '2025-07-17 22:54:28', 0),
(49, 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', 'David Lafarge', 'water', 'Evian', 1, 2, '', 'De la bonne Evian sa mére elle raffraichi bien', 'vendu', '2025-07-17 22:54:36', 0),
(50, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 'Juan Rodriguez', 'water', 'eau glacé', 1, 2, '', '', 'vendu', '2025-07-17 22:55:20', 0),
(51, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Eau de source', 1, 10, '', '', 'vendu', '2025-07-17 22:55:47', 0),
(52, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Eau de source', 1, 10, '', '', 'en_vente', '2025-07-19 10:48:07', 0);

-- --------------------------------------------------------

--
-- Structure de la table `lbc_badges`
--

CREATE TABLE `lbc_badges` (
  `id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lbc_badges`
--

INSERT INTO `lbc_badges` (`id`, `code`, `name`, `description`, `image_url`) VALUES
(1, 'certifie', 'Vendeur certifié', 'Attribué manuellement par Ducratif pour les vendeurs sûrs.', 'assets/badge_certifie.png'),
(2, '10sales', 'Nouveau actif', 'Attribué après 10 ventes réussi !', 'assets/badge_10sale.png');

-- --------------------------------------------------------

--
-- Structure de la table `lbc_historique`
--

CREATE TABLE `lbc_historique` (
  `id` int(11) NOT NULL,
  `annonce_id` int(11) NOT NULL,
  `buyer_identifier` varchar(64) NOT NULL,
  `buyer_name` varchar(64) NOT NULL,
  `price` int(11) NOT NULL,
  `bought_at` timestamp NULL DEFAULT current_timestamp(),
  `seller_identifier` varchar(64) NOT NULL,
  `seller_name` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_label` varchar(64) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lbc_historique`
--

INSERT INTO `lbc_historique` (`id`, `annonce_id`, `buyer_identifier`, `buyer_name`, `price`, `bought_at`, `seller_identifier`, `seller_name`, `item_name`, `item_label`, `amount`) VALUES
(1, 2, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 10, '2025-06-24 21:39:36', 'char2:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin V2.0', 'water', 'de la bonne eau', 1),
(2, 1, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 'Juan Rodriguez', 50, '2025-06-24 21:55:15', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'eau', 1),
(3, 3, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 'Juan Rodriguez', 10, '2025-06-24 22:02:46', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Eau fraiche ca mere', 1),
(4, 13, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 30, '2025-06-24 23:35:11', 'steam:11000010abcd02', 'Lea Renault', 'burger', 'Burger Gourmand', 6),
(5, 22, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 4, '2025-06-24 23:59:54', 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 'Juan Rodriguez', 'water', 'eau frais chakal', 1),
(6, 23, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 'Juan Rodriguez', 10, '2025-06-25 00:03:59', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Eau fraiche', 1),
(7, 24, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 'Juan Rodriguez', 10, '2025-06-25 00:11:51', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Eau fraiche', 1),
(8, 25, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 'Juan Rodriguez', 10, '2025-06-25 22:06:50', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Eau', 1),
(9, 22, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 4, '2025-06-29 10:20:18', 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 'Juan Rodriguez', 'water', 'eau frais chakal', 1),
(10, 13, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 30, '2025-06-29 10:20:44', 'steam:11000010abcd02', 'Lea Renault', 'burger', 'Burger Gourmand', 6),
(11, 22, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 4, '2025-06-29 12:12:56', 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 'Juan Rodriguez', 'water', 'eau frais chakal', 1),
(12, 13, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 30, '2025-06-29 12:13:16', 'steam:11000010abcd02', 'Lea Renault', 'burger', 'Burger Gourmand', 6),
(13, 22, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 4, '2025-06-30 16:58:05', 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 'Juan Rodriguez', 'water', 'eau frais chakal', 1),
(14, 34, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 100, '2025-06-30 18:42:28', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Vitel', 1),
(15, 24, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 10, '2025-06-30 18:42:30', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Eau fraiche', 1),
(16, 13, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 30, '2025-06-30 18:42:32', 'steam:11000010abcd02', 'Lea Renault', 'burger', 'Burger Gourmand', 6),
(17, 38, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 1, '2025-06-30 18:53:21', 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 'water', 'eau de source', 1),
(18, 42, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 500, '2025-06-30 19:16:49', 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 'water', 'mia khalifa', 1),
(19, 22, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 4, '2025-07-17 18:22:52', 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 'Juan Rodriguez', 'water', 'eau frais chakal', 1),
(20, 43, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 5, '2025-07-17 18:22:54', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'burger', 'BigMac', 1),
(21, 44, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 500, '2025-07-17 18:22:59', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'burger', 'BigMac Promo', 9),
(22, 45, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 2, '2025-07-17 18:23:00', 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 'Juan Rodriguez', 'water', 'eau', 1),
(23, 48, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 10, '2025-07-17 22:55:12', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Eau de source', 1),
(24, 51, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 10, '2025-07-17 22:58:45', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 'water', 'Eau de source', 1),
(25, 50, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 2, '2025-07-17 22:58:47', 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 'Juan Rodriguez', 'water', 'eau glacé', 1),
(26, 49, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 2, '2025-07-17 22:58:49', 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', 'David Lafarge', 'water', 'Evian', 1),
(27, 46, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 50, '2025-07-17 22:59:01', 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 'water', 'mia khalifa suce bien', 1);

-- --------------------------------------------------------

--
-- Structure de la table `lbc_user_badges`
--

CREATE TABLE `lbc_user_badges` (
  `id` int(11) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `badge_code` varchar(32) NOT NULL,
  `granted_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lbc_user_badges`
--

INSERT INTO `lbc_user_badges` (`id`, `identifier`, `badge_code`, `granted_at`) VALUES
(1, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'certifie', '2025-06-24 23:12:59'),
(2, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', '10sales', '2025-07-17 22:55:12');

-- --------------------------------------------------------

--
-- Structure de la table `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('boat', 'Permis Bateau'),
('dmv', 'Code de la route\''),
('drive', 'Permis de conduire'),
('drive_bike', 'Permis moto'),
('drive_truck', 'Permis camion'),
('farm_processing', 'License Pomme'),
('weapon', 'License d\'arme'),
('weed_processing', 'License Traitement Weed');

-- --------------------------------------------------------

--
-- Structure de la table `lootboxes`
--

CREATE TABLE `lootboxes` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `short_description` text NOT NULL,
  `long_description` text NOT NULL,
  `image_url` text NOT NULL,
  `is_random` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `category` varchar(50) DEFAULT 'Autre',
  `tags` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lootboxes`
--

INSERT INTO `lootboxes` (`id`, `name`, `short_description`, `long_description`, `image_url`, `is_random`, `is_active`, `category`, `tags`) VALUES
(3, 'Caisse Fondateur', 'Récompense pour le fondateur', 'Contient des objets pour la participation a l\'evenement', 'https://i.ibb.co/nsT369L4/download.gif', 1, 0, 'Fondateur', '[\"ducratif\",\"fondateur\"]'),
(18, 'Armement AntiZombie', 'Il faut bien s\'armée fasse a la menace !', 'Certaine menace peuvent être plus difficile de d\'autre a éliminé, que cela sois du vivant ou non, votre vie est précieuse non ? Au pire c\'est votre probleme.', 'https://i.ibb.co/GfZM0Z69/key-zombie-5keys.png', 1, 1, 'zombie', '[\"armement\"]'),
(19, 'BoomBoom Zombie', 'Une grenade et pouf les zombies', 'Moi jdit on balance une grenade et piou piou y é mort !', 'https://i.ibb.co/LXPWkH59/key-zombie-10keys.png', 1, 1, 'zombie', '[\"armement\"]'),
(20, '1 Balle 1 Mort', 'Petite arme de point', 'Aller combattre sans arme c\'est du suicide !\nEquipe toi d\'une arme de point et d\'un chargeur pour bien débuté!', 'https://i.ibb.co/twhdDqRm/key-zombie-15keys.png', 1, 1, 'zombie', '[\"armement\",\"munition\"]'),
(21, 'Malette de billets', 'Cool tu a trouver de l\'argent !', 'Cette malette contient une bonne somme d\'argent.', 'https://i.ibb.co/jZ5wFxMM/cash-bundle.png', 1, 1, 'argent', '[]'),
(22, 'Lingot d\'argent -> Money', 'Echange ton lingot d\'argent contre de la money', 'Pratique quand tu es en galere d\'argent, on reprend ton lingot d\'argent et en échange on te donne de la money', 'https://i.ibb.co/N2M2fkzh/argent-bar.png', 1, 1, 'argent', '[\"money\"]'),
(23, 'Lingot d\'or -> Money', 'Super tu a un lingot d\'or ?', 'Echange nous ton lingot d\'or contre de l\'argent.', 'https://i.ibb.co/r869BSf/gold-bar.png', 1, 1, 'argent', '[\"money\"]'),
(24, 'Carte bancaire prépayée', 'Vous avez recu une carte prépayée ?', 'Echange ta Carte bancaire prépayée contre de l\'argent !', 'https://i.ibb.co/SwsQHVKC/bank-card-prepay.png', 1, 1, 'argent', '[\"money\"]'),
(25, 'Boss Zombie', 'Bravo tu a tué le boss des zombies', 'Avec beaucoup d\'effort il faut bien récompenser !\nJe te propose de bonne récompense, profite bien et utilise les bien !', 'https://i.ibb.co/N2CXGZLj/key-zombie-boss.png', 1, 1, 'zombie', '[\"boss\"]'),
(26, 'Starter Pack', 'Parfait pour commencer !', 'Nouvelle aventure, ce qui veux dire que vous avez rien.\nPas de souci a ce faire, on vous aide!', 'https://i.ibb.co/kV8BMkRx/starter-pack.png', 1, 1, 'starter pack', '[]'),
(27, 'Paintball Rookie', 'L’essentiel pour débuter !', 'La caisse idéale pour rejoindre l’arène : medikit, cash, munitions, tout pour un premier run réussi avec ta team.', 'https://i.ibb.co/nMhM3gHx/100.png', 1, 1, 'paintball', '[]'),
(28, 'Paintball Escarmouche', 'Booste ta team pour les premiers combats.', 'Plus de munitions, une grenade BZGAS, un medikit supplémentaire et un joli bonus cash : tout ce qu’il faut pour dominer les premières batailles !', 'https://i.ibb.co/232mgvQ0/250.png', 1, 1, 'paintball', '[]'),
(29, 'Paintball Assaut', 'L’arsenal pour passer à l’offensive.', 'Caisse renforcée contenant grenades, armes, gros paquet de munitions et belle récompense cash. Passe à la vitesse supérieure avec ton équipe !', 'https://i.ibb.co/qM5ykKmS/500.png', 1, 1, 'paintball', '[]'),
(30, 'Paintball Tactique', 'Pour les stratèges du paintball.', 'Un pistolet et des munitions en quantité pour jouer malin, surprendre tes adversaires et retourner la partie à tout moment.', 'https://i.ibb.co/Rk7PndH7/750.png', 1, 1, 'paintball', '[]'),
(31, 'Paintball Prestige', 'Le pack des vrais compétiteurs.', 'Medikit, grenades, carte prépayée exclusive GuerreRP et énorme stock de munitions : tout pour écraser la concurrence sur plusieurs games d’affilée !', 'https://i.ibb.co/v6hP5z8C/1000.png', 1, 1, 'paintball', '[]'),
(32, 'Paintball Élite', 'Le meilleur équipement pour l’élite.', 'Fusil à pompe paintball, boîte de 50 cartouches spéciales, caisse rare à réserver aux teams qui veulent marquer l’histoire du serveur !', 'https://i.ibb.co/1GBsV1kK/1500.png', 1, 1, 'paintball', '[]'),
(33, 'Paintball Légende', 'Récompense ultime des champions.', 'La caisse légendaire, full black & gold : SMG premium, 150 munitions et design unique. Pour les teams qui veulent la gloire… et la victoire éternelle !', 'https://i.ibb.co/S74G5q5C/2500.png', 1, 1, 'paintball', '[]'),
(34, '🎁 Caisse 50', 'Un petit coup de pouce pour bien commencer', 'Cette caisse contient de quoi survivre à une première escarmouche : un medikit pour te soigner, des munitions pour riposter, et un petit billet pour l\'effort.', 'https://i.ibb.co/d05gBm2k/50.png', 1, 1, 'paintball', '[\"personnel\"]'),
(35, '💣 Caisse 150', 'L’explosif entre en scène', 'Prépare-toi à faire du grabuge avec une grenade, un medikit pour encaisser, et assez de munitions pour faire fuir les moins téméraires.', 'https://i.ibb.co/nqg1KPZv/150.png', 1, 1, 'paintball', '[\"personnel\"]'),
(36, '🔫 Caisse 300', 'Premier armement sérieux', 'L’arme de poing fait son entrée : découvre un pistolet prêt à l’emploi, livré directement dans ta caisse pour passer à l’action sans attendre.', 'https://i.ibb.co/rKpZKxsZ/300.png', 1, 1, 'paintball', '[\"personnel\"]'),
(37, '💼 Caisse 500', 'Le pactole personnel', 'Une réserve de munitions, un medikit, et surtout un joli pactole de 5000$ pour te permettre d’investir, recruter ou juste t’amuser avec les moyens.', 'https://i.ibb.co/QjFF6YN6/500.png', 1, 1, 'paintball', '[\"personnel\"]');

-- --------------------------------------------------------

--
-- Structure de la table `lootbox_category_access`
--

CREATE TABLE `lootbox_category_access` (
  `category` varchar(50) DEFAULT NULL,
  `identifier` varchar(259) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lootbox_category_access`
--

INSERT INTO `lootbox_category_access` (`category`, `identifier`) VALUES
('Fondateur', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148'),
('Événement', 'char1:cfx2');

-- --------------------------------------------------------

--
-- Structure de la table `lootbox_contents`
--

CREATE TABLE `lootbox_contents` (
  `id` int(11) NOT NULL,
  `lootbox_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 1,
  `rarity` varchar(20) DEFAULT 'common'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lootbox_contents`
--

INSERT INTO `lootbox_contents` (`id`, `lootbox_id`, `item_name`, `amount`, `rarity`) VALUES
(6, 3, 'WEAPON_ASSAULTRIFLE', 1, 'epic'),
(7, 3, 'ammo-rifle2', 50, 'rare'),
(23, 3, 'WEAPON_ASSAULTRIFLE', 1, 'epic'),
(26, 18, 'WEAPON_BZGAS', 1, 'epic'),
(27, 19, 'WEAPON_GRENADE', 1, 'epic'),
(28, 20, 'WEAPON_PISTOL', 1, 'Epic'),
(29, 20, 'ammo-9', 30, 'Rare'),
(30, 21, 'money', 15000, 'Common'),
(31, 22, 'money', 30000, 'Common'),
(32, 23, 'money', 50000, 'Common'),
(33, 24, 'money', 10000, 'Common'),
(34, 25, 'WEAPON_SMG', 1, 'Epic'),
(35, 25, 'ammo-9', 150, 'Rare'),
(36, 25, 'stimulant_vitesse', 1, 'Legendary'),
(37, 25, 'anti_zombie', 1, 'Legendary'),
(38, 25, 'chiffon', 2, 'Common'),
(39, 25, 'burger', 2, 'Common'),
(40, 25, 'gpsill', 1, 'Rare'),
(41, 25, 'money', 10000, 'Common'),
(42, 26, 'medikit', 1, 'rare'),
(43, 26, 'cash_bundle', 1, 'rare'),
(44, 26, 'water', 2, 'common'),
(45, 26, 'burger', 2, 'common'),
(46, 27, 'medikit', 1, 'Rare'),
(47, 27, 'ammo-9', 30, 'Rare'),
(48, 27, 'money', 500, 'common'),
(49, 28, 'medikit', 2, 'Rare'),
(50, 28, 'WEAPON_BZGAS', 1, 'Epic'),
(51, 28, 'ammo-9', 65, 'Rare'),
(52, 28, 'money', 1250, 'Common'),
(53, 29, 'WEAPON_BZGAS', 2, 'Epic'),
(54, 29, 'WEAPON_GRENADE', 1, 'Epic'),
(55, 29, 'money', 2000, 'Common'),
(56, 29, 'ammo-9', 150, 'Rare'),
(57, 30, 'WEAPON_PISTOL', 1, 'Epic'),
(58, 30, 'ammo-9', 30, 'Rare'),
(59, 31, 'medikit', 4, 'Rare'),
(60, 31, 'WEAPON_BZGAS', 3, 'Rare'),
(61, 31, 'WEAPON_GRENADE', 3, 'Epic'),
(62, 31, 'bank_card_prepay', 1, 'Rare'),
(63, 31, 'ammo-9', 400, 'Rare'),
(64, 32, 'WEAPON_PUMPSHOTGUN', 1, 'Epic'),
(65, 32, 'ammo-shotgun', 50, 'Rare'),
(66, 33, 'WEAPON_SMG', 1, 'Epic'),
(67, 33, 'ammo-9', 150, 'Rare'),
(68, 34, 'medikit', 1, 'common'),
(69, 34, 'ammo-9', 30, 'rare'),
(70, 34, 'money', 500, 'common'),
(71, 35, 'WEAPON_GRENADE', 1, 'epic'),
(72, 35, 'medikit', 1, 'common'),
(73, 35, 'ammo-9', 75, 'rare'),
(74, 36, 'WEAPON_PISTOL', 1, 'Epic'),
(75, 37, 'ammo-9', 250, 'rare'),
(76, 37, 'medikit', 2, 'common'),
(77, 37, 'money', 5000, 'common');

-- --------------------------------------------------------

--
-- Structure de la table `lootbox_history`
--

CREATE TABLE `lootbox_history` (
  `id` int(11) NOT NULL,
  `buyer_identifier` varchar(64) DEFAULT NULL,
  `lootbox_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `payment_type` varchar(20) DEFAULT NULL,
  `items_given` text DEFAULT NULL,
  `bought_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lootbox_history`
--

INSERT INTO `lootbox_history` (`id`, `buyer_identifier`, `lootbox_id`, `team_id`, `payment_type`, `items_given`, `bought_at`) VALUES
(1, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"amount\":5,\"item_name\":\"water\"},{\"amount\":5,\"item_name\":\"bread\"},{\"amount\":2,\"item_name\":\"bandage\"}]', '2025-06-08 21:04:53'),
(2, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"amount\":5,\"item_name\":\"water\"},{\"amount\":5,\"item_name\":\"bread\"},{\"amount\":2,\"item_name\":\"bandage\"}]', '2025-06-08 21:05:42'),
(3, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"item_name\":\"water\",\"amount\":5},{\"item_name\":\"bread\",\"amount\":5},{\"item_name\":\"bandage\",\"amount\":2}]', '2025-06-08 21:11:37'),
(4, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"amount\":5,\"item_name\":\"water\"},{\"amount\":5,\"item_name\":\"bread\"},{\"amount\":2,\"item_name\":\"bandage\"}]', '2025-06-08 21:12:41'),
(5, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"amount\":5,\"item_name\":\"water\"},{\"amount\":5,\"item_name\":\"bread\"},{\"amount\":2,\"item_name\":\"bandage\"}]', '2025-06-08 21:15:33'),
(6, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"amount\":5,\"item_name\":\"water\"},{\"amount\":5,\"item_name\":\"bread\"},{\"amount\":2,\"item_name\":\"bandage\"}]', '2025-06-08 21:18:41'),
(7, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"item_name\":\"water\",\"amount\":5},{\"item_name\":\"bread\",\"amount\":5},{\"item_name\":\"bandage\",\"amount\":2}]', '2025-06-08 21:19:27'),
(8, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"item_name\":\"water\",\"amount\":5},{\"item_name\":\"bread\",\"amount\":5},{\"item_name\":\"bandage\",\"amount\":2}]', '2025-06-08 21:25:53'),
(9, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 3, NULL, 'item', '[{\"amount\":1,\"item_name\":\"WEAPON_ASSAULTRIFLE\"},{\"amount\":50,\"item_name\":\"ammo-rifle2\"}]', '2025-06-08 21:39:29'),
(10, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 3, NULL, 'item', '[{\"amount\":1,\"item_name\":\"WEAPON_ASSAULTRIFLE\"},{\"amount\":50,\"item_name\":\"ammo-rifle2\"}]', '2025-06-08 21:41:34'),
(11, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 3, NULL, 'item', '[{\"amount\":1,\"item_name\":\"WEAPON_ASSAULTRIFLE\"},{\"amount\":50,\"item_name\":\"ammo-rifle2\"}]', '2025-06-08 21:42:31'),
(12, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"amount\":5,\"item_name\":\"water\"},{\"amount\":5,\"item_name\":\"bread\"},{\"amount\":2,\"item_name\":\"bandage\"}]', '2025-06-08 21:42:45'),
(13, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 10, NULL, 'money', '[{\"amount\":5000,\"item_name\":\"money\"},{\"amount\":1,\"item_name\":\"phone\"}]', '2025-06-09 07:57:41'),
(14, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 10, NULL, 'player_points', '[{\"amount\":100000,\"item_name\":\"money\"},{\"amount\":1,\"item_name\":\"phone\"}]', '2025-06-09 19:11:09'),
(15, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 20, 'team_points', 'Récompense différée', '2025-06-09 19:12:07'),
(16, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 20, 'team_points', 'Récompense différée', '2025-06-09 19:40:14'),
(17, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 20, 'team_points', 'Récompense différée', '2025-06-09 19:40:53'),
(18, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 20, 'team_points', 'Récompense différée', '2025-06-09 19:41:13'),
(19, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 20, 'team_points', 'Récompense différée', '2025-06-09 20:07:48'),
(20, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 20, 'team_points', 'Récompense différée', '2025-06-09 20:11:03'),
(21, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 20, 'team_points', 'Récompense différée', '2025-06-09 20:12:19'),
(22, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 20, 'team_points', 'Récompense différée', '2025-06-09 20:13:47'),
(23, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 20, 'team_points', 'Récompense différée', '2025-06-09 20:16:16'),
(24, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 20, 'team_points', 'Récompense différée', '2025-06-09 20:16:29'),
(25, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 20, 'team_points', 'Récompense différée', '2025-06-09 20:16:45'),
(26, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 20, 'team_points', 'Récompense différée', '2025-06-09 20:16:58'),
(27, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 20, 'team_points', 'Récompense différée', '2025-06-09 20:18:52'),
(28, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 10, NULL, 'money', '[{\"amount\":100000,\"item_name\":\"money\"},{\"amount\":1,\"item_name\":\"phone\"}]', '2025-06-09 20:19:49'),
(29, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 10, NULL, 'money', '[{\"amount\":100000,\"item_name\":\"money\"},{\"amount\":1,\"item_name\":\"phone\"}]', '2025-06-09 20:20:29'),
(30, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 10, NULL, 'money', '[{\"item_name\":\"money\",\"amount\":100000},{\"item_name\":\"phone\",\"amount\":1}]', '2025-06-09 20:25:49'),
(31, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 10, NULL, 'money', '[{\"amount\":100000,\"item_name\":\"money\"},{\"amount\":1,\"item_name\":\"phone\"}]', '2025-06-09 20:34:10'),
(32, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 12, NULL, 'player_points', '[{\"amount\":1,\"item_name\":\"phone\"}]', '2025-06-09 20:35:56'),
(33, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 12, NULL, 'player_points', '[{\"amount\":1,\"item_name\":\"phone\"}]', '2025-06-09 20:36:09'),
(34, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 12, NULL, 'player_points', '[{\"amount\":1,\"item_name\":\"phone\"}]', '2025-06-09 20:37:46'),
(35, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 20, 'team_points', 'Récompense différée', '2025-06-09 20:38:37'),
(36, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 12, NULL, 'player_points', '[{\"amount\":1,\"item_name\":\"phone\"}]', '2025-06-09 20:39:11'),
(37, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"amount\":5,\"item_name\":\"water\"},{\"amount\":5,\"item_name\":\"bread\"},{\"amount\":2,\"item_name\":\"bandage\"}]', '2025-06-09 20:39:37'),
(38, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 13, NULL, 'item', '[{\"amount\":1,\"item_name\":\"stimulant_vitesse\"}]', '2025-06-09 21:07:06'),
(39, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 12, NULL, 'player_points', '[{\"amount\":1,\"item_name\":\"phone\"}]', '2025-06-09 21:09:34'),
(40, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 20, 'team_points', 'Récompense différée', '2025-06-09 21:10:06'),
(41, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 3, NULL, 'item', '[{\"amount\":1,\"item_name\":\"WEAPON_ASSAULTRIFLE\"},{\"amount\":50,\"item_name\":\"ammo-rifle2\"}]', '2025-06-09 21:11:06'),
(42, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"amount\":5,\"item_name\":\"water\"},{\"amount\":5,\"item_name\":\"bread\"},{\"amount\":2,\"item_name\":\"bandage\"}]', '2025-06-10 20:58:14'),
(43, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 20, 'team_points', 'Récompense différée', '2025-06-10 21:00:23'),
(44, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 12, NULL, 'player_points', '[{\"amount\":1,\"item_name\":\"phone\"}]', '2025-06-10 21:02:20'),
(45, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 3, NULL, 'item', '[{\"amount\":1,\"item_name\":\"WEAPON_ASSAULTRIFLE\"},{\"amount\":50,\"item_name\":\"ammo-rifle2\"}]', '2025-06-10 21:02:58'),
(46, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 15, NULL, 'item', '[{\"amount\":500000,\"item_name\":\"money\"}]', '2025-06-10 21:07:18'),
(47, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 12, NULL, 'player_points', '[{\"amount\":1,\"item_name\":\"phone\"}]', '2025-06-10 21:19:05'),
(48, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 12, NULL, 'player_points', '[{\"amount\":1,\"item_name\":\"phone\"}]', '2025-06-11 21:32:16'),
(49, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 20, 'team_points', 'Récompense différée', '2025-06-11 21:36:00'),
(50, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, NULL, 'money', '[{\"amount\":5,\"item_name\":\"water\"},{\"amount\":5,\"item_name\":\"bread\"},{\"amount\":2,\"item_name\":\"bandage\"}]', '2025-06-11 21:37:54'),
(51, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 3, NULL, 'money', '[{\"amount\":1,\"item_name\":\"WEAPON_ASSAULTRIFLE\"},{\"amount\":50,\"item_name\":\"ammo-rifle2\"}]', '2025-06-11 21:46:34'),
(52, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 3, NULL, 'item', '[{\"amount\":1,\"item_name\":\"WEAPON_ASSAULTRIFLE\"},{\"amount\":50,\"item_name\":\"ammo-rifle2\"}]', '2025-06-11 22:26:10'),
(53, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"amount\":5,\"item_name\":\"water\"},{\"amount\":5,\"item_name\":\"bread\"},{\"amount\":2,\"item_name\":\"bandage\"}]', '2025-06-15 13:22:37'),
(54, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"item_name\":\"water\",\"amount\":5},{\"item_name\":\"bread\",\"amount\":5},{\"item_name\":\"bandage\",\"amount\":2}]', '2025-06-15 13:33:04'),
(55, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"amount\":5,\"item_name\":\"water\"},{\"amount\":5,\"item_name\":\"bread\"},{\"amount\":2,\"item_name\":\"bandage\"}]', '2025-06-15 13:37:29'),
(56, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"item_name\":\"water\",\"amount\":5},{\"item_name\":\"bread\",\"amount\":5},{\"item_name\":\"bandage\",\"amount\":2}]', '2025-06-15 13:39:35'),
(57, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"item_name\":\"water\",\"amount\":5},{\"item_name\":\"bread\",\"amount\":5},{\"item_name\":\"bandage\",\"amount\":2}]', '2025-06-15 13:43:03'),
(58, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"amount\":5,\"item_name\":\"water\"},{\"amount\":5,\"item_name\":\"bread\"},{\"amount\":2,\"item_name\":\"bandage\"}]', '2025-06-15 13:52:50'),
(59, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 3, NULL, 'money', '[{\"item_name\":\"WEAPON_ASSAULTRIFLE\",\"amount\":1},{\"item_name\":\"ammo-rifle2\",\"amount\":50}]', '2025-06-15 14:45:30'),
(60, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"item_name\":\"water\",\"amount\":5},{\"item_name\":\"bread\",\"amount\":5},{\"item_name\":\"bandage\",\"amount\":2}]', '2025-06-15 14:45:47'),
(61, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"item_name\":\"water\",\"amount\":5},{\"item_name\":\"bread\",\"amount\":5},{\"item_name\":\"bandage\",\"amount\":2}]', '2025-06-15 18:45:43'),
(62, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 16, NULL, 'money', '[{\"item_name\":\"money\",\"amount\":500}]', '2025-06-15 18:45:54'),
(63, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"item_name\":\"water\",\"amount\":5,\"rarity\":\"common\"},{\"item_name\":\"bread\",\"amount\":5,\"rarity\":\"common\"},{\"item_name\":\"bandage\",\"amount\":2,\"rarity\":\"rare\"}]', '2025-06-15 18:46:29'),
(64, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 16, NULL, 'money', '[{\"item_name\":\"money\",\"amount\":500,\"rarity\":\"legendaire\"}]', '2025-06-15 18:46:39'),
(65, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, NULL, 'money', '[{\"item_name\":\"water\",\"amount\":5,\"rarity\":\"common\"},{\"item_name\":\"bread\",\"amount\":5,\"rarity\":\"common\"},{\"item_name\":\"bandage\",\"amount\":2,\"rarity\":\"rare\"}]', '2025-06-15 18:48:30'),
(66, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, NULL, 'money', '[{\"rarity\":\"common\",\"amount\":5,\"item_name\":\"water\"},{\"rarity\":\"common\",\"amount\":5,\"item_name\":\"bread\"},{\"rarity\":\"rare\",\"amount\":2,\"item_name\":\"bandage\"}]', '2025-06-15 19:33:23'),
(67, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, NULL, 'money', '[{\"rarity\":\"common\",\"amount\":5,\"item_name\":\"water\"},{\"rarity\":\"common\",\"amount\":5,\"item_name\":\"bread\"},{\"rarity\":\"rare\",\"amount\":2,\"item_name\":\"bandage\"}]', '2025-06-15 19:33:54'),
(68, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, NULL, 'money', '[{\"rarity\":\"common\",\"amount\":5,\"item_name\":\"water\"},{\"rarity\":\"common\",\"amount\":5,\"item_name\":\"bread\"},{\"rarity\":\"rare\",\"amount\":2,\"item_name\":\"bandage\"}]', '2025-06-15 19:34:23'),
(69, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 16, NULL, 'money', '[{\"rarity\":\"legendaire\",\"amount\":500,\"item_name\":\"money\"}]', '2025-06-15 20:58:43'),
(70, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 16, NULL, 'money', '[{\"item_name\":\"money\",\"amount\":500,\"rarity\":\"legendaire\"}]', '2025-06-22 21:51:52'),
(71, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, NULL, 'money', '[{\"item_name\":\"water\",\"amount\":5,\"rarity\":\"common\"},{\"item_name\":\"bread\",\"amount\":5,\"rarity\":\"common\"},{\"item_name\":\"bandage\",\"amount\":2,\"rarity\":\"rare\"}]', '2025-06-22 21:52:07'),
(72, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 3, NULL, 'money', '[{\"rarity\":\"epic\",\"item_name\":\"WEAPON_ASSAULTRIFLE\",\"amount\":1},{\"rarity\":\"rare\",\"item_name\":\"ammo-rifle2\",\"amount\":50},{\"rarity\":\"epic\",\"item_name\":\"WEAPON_ASSAULTRIFLE\",\"amount\":1}]', '2025-06-30 18:33:21'),
(73, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 17, NULL, 'item', '[{\"rarity\":\"rare\",\"item_name\":\"money\",\"amount\":500}]', '2025-06-30 18:37:35'),
(74, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 17, NULL, 'item', '[{\"rarity\":\"rare\",\"item_name\":\"money\",\"amount\":500}]', '2025-06-30 18:37:38'),
(75, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 16, NULL, 'money', '[{\"rarity\":\"legendaire\",\"item_name\":\"money\",\"amount\":500}]', '2025-06-30 18:40:35'),
(76, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 1, NULL, 'money', '[{\"rarity\":\"common\",\"item_name\":\"water\",\"amount\":5},{\"rarity\":\"common\",\"item_name\":\"bread\",\"amount\":5},{\"rarity\":\"rare\",\"item_name\":\"bandage\",\"amount\":2}]', '2025-06-30 18:40:43');

-- --------------------------------------------------------

--
-- Structure de la table `lootbox_payments`
--

CREATE TABLE `lootbox_payments` (
  `id` int(11) NOT NULL,
  `lootbox_id` int(11) NOT NULL,
  `payment_type` enum('money','item','player_points','team_points') NOT NULL,
  `payment_value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lootbox_payments`
--

INSERT INTO `lootbox_payments` (`id`, `lootbox_id`, `payment_type`, `payment_value`) VALUES
(3, 3, 'item', 'key_zombie_boss'),
(16, 3, 'money', '100000'),
(19, 18, 'item', 'key_zombie'),
(20, 19, 'item', 'key_zombie2'),
(21, 20, 'item', 'key_zombie3'),
(22, 21, 'item', 'cash_bundle'),
(23, 22, 'item', 'argent_bar'),
(24, 23, 'item', 'gold_bar'),
(25, 24, 'item', 'bank_card_prepay'),
(26, 25, 'item', 'key_zombie_boss'),
(27, 26, 'item', 'start_pack'),
(28, 27, 'team_points', '100'),
(29, 28, 'team_points', '250'),
(30, 29, 'team_points', '500'),
(31, 30, 'team_points', '750'),
(32, 31, 'team_points', '1000'),
(33, 32, 'team_points', '1500'),
(34, 33, 'team_points', '2500'),
(35, 34, 'player_points', '50'),
(36, 35, 'player_points', '150'),
(37, 36, 'player_points', '300'),
(38, 37, 'player_points', '500');

-- --------------------------------------------------------

--
-- Structure de la table `lootbox_rewards`
--

CREATE TABLE `lootbox_rewards` (
  `id` int(11) NOT NULL,
  `player_identifier` varchar(64) DEFAULT NULL,
  `lootbox_id` int(11) DEFAULT NULL,
  `redeemed` tinyint(1) DEFAULT 0,
  `granted_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lootbox_rewards`
--

INSERT INTO `lootbox_rewards` (`id`, `player_identifier`, `lootbox_id`, `redeemed`, `granted_at`) VALUES
(18, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 3, 1, '2025-06-10 17:54:39'),
(19, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 1, '2025-06-10 17:55:41'),
(20, 'char2:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 0, '2025-06-10 17:55:51'),
(21, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 12, 1, '2025-06-10 18:15:39'),
(22, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 1, '2025-06-10 20:55:40'),
(23, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 1, '2025-06-10 21:00:23'),
(24, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 15, 1, '2025-06-10 21:07:45'),
(25, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 1, '2025-06-10 21:10:40'),
(26, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 11, 1, '2025-06-11 21:36:00'),
(27, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 11, 1, '2025-06-11 21:36:00'),
(28, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 3, 1, '2025-06-11 21:40:58'),
(29, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 1, 0, '2025-06-30 18:43:27'),
(30, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 34, 0, '2025-07-13 17:46:44');

-- --------------------------------------------------------

--
-- Structure de la table `lootbox_saisonpasse`
--

CREATE TABLE `lootbox_saisonpasse` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `max_level` int(11) NOT NULL DEFAULT 10,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lootbox_saisonpasse`
--

INSERT INTO `lootbox_saisonpasse` (`id`, `name`, `description`, `max_level`, `start_date`, `end_date`) VALUES
(4, 'Saison 1: Le commencement', 'Le début d\'une aventure !', 20, '2025-07-13 00:00:00', '2025-09-13 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `lootbox_saisonpass_challenges`
--

CREATE TABLE `lootbox_saisonpass_challenges` (
  `id` int(11) NOT NULL,
  `key` varchar(100) NOT NULL,
  `label` varchar(255) NOT NULL,
  `type` enum('kill','playtime','action','buy_item','change_clothes','get_tempjob','talk_pnj','market') NOT NULL,
  `data` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lootbox_saisonpass_challenges`
--

INSERT INTO `lootbox_saisonpass_challenges` (`id`, `key`, `label`, `type`, `data`) VALUES
(1, 'kill_player', 'Tuer un joueur', 'kill', '1'),
(2, 'play_minute', 'Jouer 10 minute', 'playtime', '1'),
(3, 'open_lootbox', 'Ouvrir une caisse', 'action', '1'),
(4, 'kill_10player', 'Tuer 10 Joueurs', 'kill', '10'),
(5, 'visit_zone1', 'Visiter la zone Apocalypse !', 'action', '1'),
(6, 'walk_km', 'Parcourir 1 kilomètres à pied', 'action', '1000'),
(7, 'drive_km', 'Parcourir 1 kilomètres en véhicule', 'action', '1000'),
(8, 'open_lootbox_1', 'Ouvrir la caisse Starter Pack', 'action', '1'),
(9, 'have_item_1', 'Avoir un téléphone sur soi', 'action', '1'),
(10, 'have_item_2', 'Avoir de l\'eau sur soi', 'action', '2'),
(11, 'find_epic_loot', 'Trouver un objet épique dans une caisse', 'action', '3'),
(12, 'find_rare_loot', 'Trouver un objet rare dans une caisse', 'action', '2'),
(13, 'find_common_loot', 'Trouver un objet Commun dans une caisse', 'action', '1'),
(14, 'find_legendaire_loot', 'Trouver un objet legendaire dans une caisse', 'action', '4'),
(15, 'enter_adder', 'Monter dans une Adder', 'action', '1'),
(16, 'drive_adder_1km', 'Parcourir 1km avec une Adder', 'action', '1'),
(17, 'stay_zone_1', 'Rester 1min dans la zone PaintBall', 'action', '1'),
(18, 'acheter_item_boutique', 'Faire un achat dans une boutique', 'buy_item', '1'),
(19, 'change_vetement', 'Changer de tenue dans un magasin', 'change_clothes', '1'),
(20, 'get_tempjob', 'Devenir ChauffeurPL ou Pecheur', 'get_tempjob', '1'),
(21, 'talk_vieux_port', 'Parler au vieux du port', 'talk_pnj', '1'),
(22, 'talk_vendeur_armes', 'Parler au vendeur louche', 'talk_pnj', '1'),
(23, 'market_create', 'Créer une annonce sur le Market', 'market', '1'),
(24, 'market_delete', 'Supprimer une annonce sur le Market', 'market', '1'),
(25, 'market_buy', 'Acheter un objet sur le Market', 'market', '1'),
(26, 'market_sell', 'Vendre un objet sur le Market', 'market', '1');

-- --------------------------------------------------------

--
-- Structure de la table `lootbox_saisonpass_claims`
--

CREATE TABLE `lootbox_saisonpass_claims` (
  `id` int(11) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `saison_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lootbox_saisonpass_claims`
--

INSERT INTO `lootbox_saisonpass_claims` (`id`, `identifier`, `saison_id`, `level`) VALUES
(42, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 1, 1),
(3, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 1),
(4, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 2),
(5, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 3),
(6, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 4),
(7, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 5),
(8, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 6),
(9, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 7),
(10, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 8),
(11, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 9),
(12, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 10),
(13, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 11),
(14, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 12),
(15, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 13),
(16, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 14),
(18, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 15),
(19, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 16),
(20, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 17),
(21, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 18),
(22, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 19),
(23, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 20),
(30, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 21),
(31, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 22),
(32, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 23),
(33, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 24),
(34, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 25),
(35, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 26),
(36, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 27),
(37, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 28),
(38, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 29),
(39, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 30),
(40, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 31),
(41, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 32),
(43, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 33),
(17, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 1),
(24, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 2),
(25, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 3),
(26, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 4),
(27, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 5),
(28, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 6),
(29, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 7);

-- --------------------------------------------------------

--
-- Structure de la table `lootbox_saisonpass_logs`
--

CREATE TABLE `lootbox_saisonpass_logs` (
  `id` int(11) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `saison_id` int(11) DEFAULT NULL,
  `event` varchar(100) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lootbox_saisonpass_logs`
--

INSERT INTO `lootbox_saisonpass_logs` (`id`, `identifier`, `saison_id`, `event`, `details`, `timestamp`) VALUES
(1, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : play_minute → Niveau 1', '2025-06-12 22:55:57'),
(2, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : play_minute → Niveau 2', '2025-06-12 22:58:26'),
(3, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 1 (money x500)', '2025-06-12 23:49:50'),
(4, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 2 (phone x1)', '2025-06-13 00:13:44'),
(5, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : play_minute → Niveau 1', '2025-06-13 00:35:43'),
(7, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 2, 'progression', 'Défi validé : play_minute → Niveau 1', '2025-06-12 22:55:57'),
(8, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 1 (phone x1)', '2025-06-15 13:15:07'),
(9, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : open_lootbox → Niveau 2', '2025-06-15 13:22:37'),
(10, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 2 (money x500)', '2025-06-15 13:22:43'),
(11, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : open_lootbox → Niveau 3', '2025-06-15 13:33:04'),
(12, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 3 (money x8000)', '2025-06-15 13:34:16'),
(13, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : open_lootbox → Niveau 4', '2025-06-15 13:37:29'),
(14, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 4 (money x20000)', '2025-06-15 13:37:36'),
(15, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : open_lootbox → Niveau 5', '2025-06-15 13:39:35'),
(16, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 5 (money x1)', '2025-06-15 13:39:38'),
(17, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : open_lootbox → Niveau 6', '2025-06-15 13:43:03'),
(18, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 6 (money x1)', '2025-06-15 13:43:10'),
(19, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : open_lootbox → Niveau 7', '2025-06-15 13:52:50'),
(20, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 7 (money x1)', '2025-06-15 13:52:53'),
(21, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : visit_zone1 → Niveau 8', '2025-06-15 14:14:29'),
(22, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : drive_km → Niveau 9', '2025-06-15 14:32:25'),
(23, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 8 (money x500)', '2025-06-15 14:32:42'),
(24, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 9 (key_zombie x1)', '2025-06-15 14:33:03'),
(25, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : open_lootbox_1 → Niveau 10', '2025-06-15 14:45:47'),
(26, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 10 (money x500)', '2025-06-15 15:03:20'),
(27, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : have_item_1 → Niveau 11', '2025-06-15 15:12:38'),
(28, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 11 (money x1000)', '2025-06-15 15:12:54'),
(29, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : have_item_2 → Niveau 12', '2025-06-15 15:15:29'),
(30, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 12 (money x1000)', '2025-06-15 15:18:32'),
(31, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : have_item_1 → Niveau 13', '2025-06-15 15:18:51'),
(32, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 13 (money x100)', '2025-06-15 15:18:58'),
(33, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : have_item_2 → Niveau 14', '2025-06-15 15:21:08'),
(34, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 14 (money x1)', '2025-06-15 15:21:18'),
(35, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 'progression', 'Défi validé : play_minute → Niveau 1', '2025-06-15 17:41:55'),
(36, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 'claim', 'Level 1 (phone x1)', '2025-06-15 17:42:08'),
(37, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : find_legendaire_loot → Niveau 15', '2025-06-15 18:46:39'),
(38, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 15 (money x15000)', '2025-06-15 18:48:17'),
(39, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : find_common_loot → Niveau 16', '2025-06-15 18:48:30'),
(40, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 16 (money x5000)', '2025-06-15 18:48:41'),
(41, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : enter_adder → Niveau 17', '2025-06-15 18:56:04'),
(42, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 17 (money x1)', '2025-06-15 18:56:14'),
(43, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : drive_adder_1km → Niveau 18', '2025-06-15 19:02:17'),
(44, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 18 (money x500000)', '2025-06-15 19:04:45'),
(45, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : drive_adder_1km → Niveau 19', '2025-06-15 19:04:57'),
(46, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 19 (money x500)', '2025-06-15 19:07:00'),
(47, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : drive_adder_1km → Niveau 20', '2025-06-15 19:25:15'),
(48, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 20 (money x500)', '2025-06-15 19:26:54'),
(49, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 'progression', 'Défi validé : open_lootbox → Niveau 2', '2025-06-15 19:33:23'),
(50, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 'progression', 'Défi validé : open_lootbox → Niveau 3', '2025-06-15 19:33:23'),
(51, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 'claim', 'Level 2 (money x500)', '2025-06-15 19:33:35'),
(52, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 'claim', 'Level 3 (money x8000)', '2025-06-15 19:33:42'),
(53, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 'progression', 'Défi validé : open_lootbox → Niveau 4', '2025-06-15 19:33:54'),
(54, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 'progression', 'Défi validé : open_lootbox → Niveau 5', '2025-06-15 19:33:54'),
(55, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 'claim', 'Level 4 (money x20000)', '2025-06-15 19:33:59'),
(56, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 'claim', 'Level 5 (money x1)', '2025-06-15 19:34:03'),
(57, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 'progression', 'Défi validé : open_lootbox → Niveau 6', '2025-06-15 19:34:23'),
(58, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 'progression', 'Défi validé : open_lootbox → Niveau 7', '2025-06-15 19:34:23'),
(59, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 'claim', 'Level 6 (money x1)', '2025-06-15 19:34:29'),
(60, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 1, 'claim', 'Level 7 (money x1)', '2025-06-15 19:34:33'),
(61, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : drive_adder_1km → Niveau 21', '2025-06-15 20:57:22'),
(62, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 21 (money x500)', '2025-06-15 20:57:43'),
(63, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : find_legendaire_loot → Niveau 22', '2025-06-15 20:58:43'),
(64, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 22 (money x500)', '2025-06-15 20:59:00'),
(65, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : acheter_item_boutique → Niveau 23', '2025-06-16 14:57:21'),
(66, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 23 (money x800)', '2025-06-16 14:57:38'),
(67, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : acheter_item_boutique → Niveau 24', '2025-06-16 14:59:30'),
(68, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 24 (money x1)', '2025-06-16 14:59:41'),
(69, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : change_vetement → Niveau 25', '2025-06-16 15:31:45'),
(70, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 25 (money x800)', '2025-06-16 15:31:59'),
(71, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : change_vetement → Niveau 26', '2025-06-16 15:36:50'),
(72, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 26 (money x1)', '2025-06-16 15:37:03'),
(73, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : get_tempjob → Niveau 27', '2025-06-16 15:59:49'),
(74, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 27 (money x1)', '2025-06-16 15:59:56'),
(75, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : talk_vendeur_armes → Niveau 28', '2025-06-16 16:21:11'),
(76, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 28 (money x500)', '2025-06-16 16:21:17'),
(77, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : talk_vieux_port → Niveau 29', '2025-06-16 16:23:06'),
(78, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 29 (money x1)', '2025-06-16 16:23:12'),
(79, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 1, 'progression', 'Défi validé : play_minute → Niveau 1', '2025-06-22 16:44:26'),
(80, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : market_create → Niveau 30', '2025-06-30 16:56:27'),
(81, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 30 (money x1)', '2025-06-30 16:56:42'),
(82, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : market_delete → Niveau 31', '2025-06-30 16:57:04'),
(83, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 31 (money x1)', '2025-06-30 16:57:18'),
(84, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : market_buy → Niveau 32', '2025-06-30 16:58:05'),
(85, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 32 (money x1)', '2025-06-30 16:58:18'),
(86, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'progression', 'Défi validé : market_sell → Niveau 33', '2025-06-30 18:04:22'),
(87, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 1, 'progression', 'Défi validé : play_minute → Niveau 1', '2025-06-30 18:07:09'),
(88, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 1, 'progression', 'Défi validé : open_lootbox → Niveau 2', '2025-06-30 18:33:21'),
(89, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 1, 'progression', 'Défi validé : open_lootbox → Niveau 3', '2025-06-30 18:33:21'),
(90, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 1, 'progression', 'Défi validé : open_lootbox → Niveau 4', '2025-06-30 18:37:35'),
(91, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 1, 'progression', 'Défi validé : open_lootbox → Niveau 5', '2025-06-30 18:37:35'),
(92, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 1, 'claim', 'Level 1 (phone x1)', '2025-06-30 18:39:43'),
(93, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 1, 'progression', 'Défi validé : open_lootbox → Niveau 6', '2025-06-30 18:40:35'),
(94, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 1, 'progression', 'Défi validé : open_lootbox → Niveau 7', '2025-06-30 18:40:35'),
(95, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 1, 'claim', 'Level 33 (money x1)', '2025-07-06 17:21:47');

-- --------------------------------------------------------

--
-- Structure de la table `lootbox_saisonpass_rewards`
--

CREATE TABLE `lootbox_saisonpass_rewards` (
  `id` int(11) NOT NULL,
  `saison_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `reward_type` enum('item','money','points') NOT NULL,
  `reward_value` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 1,
  `challenge_key` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lootbox_saisonpass_rewards`
--

INSERT INTO `lootbox_saisonpass_rewards` (`id`, `saison_id`, `level`, `label`, `reward_type`, `reward_value`, `amount`, `challenge_key`) VALUES
(39, 4, 1, '50$ en liquide', 'money', 'money', 50, 'kill_player'),
(40, 4, 2, 'Un bon Burger', 'item', 'burger', 1, 'play_minute'),
(41, 4, 3, '150$ en liquide', 'money', 'money', 150, 'open_lootbox'),
(42, 4, 4, '50 point personnel', 'points', 'player_points', 50, 'market_create'),
(43, 4, 5, '1 Vélo pour le tour de France', 'item', 'velo', 1, 'talk_vieux_port'),
(44, 4, 6, '5 Bouteille d\'eau de source', 'item', 'water', 5, 'have_item_2'),
(45, 4, 7, '1000$ en liquide', 'money', 'money', 1000, 'have_item_1'),
(46, 4, 8, '1 caisse Starter Pack', 'item', 'start_pack', 1, 'enter_adder'),
(47, 4, 9, '50 Jeton', 'item', 'jeton', 50, 'change_vetement'),
(48, 4, 10, '500$ en liquide', 'money', 'money', 500, 'acheter_item_boutique'),
(49, 4, 11, '1 clé de zombie', 'item', 'key_zombie', 1, 'market_delete'),
(50, 4, 12, '5 Burger pour grossir', 'item', 'burger', 5, 'market_buy'),
(51, 4, 13, '100 Point personnel', 'points', 'player_points', 100, 'market_sell'),
(52, 4, 14, 'Une mallette d\'argent', 'item', 'cash_bundle', 1, 'talk_vendeur_armes'),
(53, 4, 15, '50 Point de team', 'points', 'team_points', 50, 'get_tempjob'),
(54, 4, 16, '30 Munition 9Mn', 'item', 'ammo-9', 30, 'open_lootbox_1'),
(55, 4, 17, 'Clé de zombie Niveau 2', 'item', 'key_zombie2', 1, 'visit_zone1'),
(56, 4, 18, '80 Jeton', 'item', 'jeton', 80, 'drive_km'),
(57, 4, 19, 'Une carte prépayée', 'item', 'bank_card_prepay', 1, 'walk_km'),
(58, 4, 20, '2000$ en liquide', 'money', 'money', 2000, 'find_common_loot');

-- --------------------------------------------------------

--
-- Structure de la table `lootbox_saisonpass_user`
--

CREATE TABLE `lootbox_saisonpass_user` (
  `id` int(11) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `saison_id` int(11) NOT NULL,
  `current_level` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lootbox_saisonpass_user`
--

INSERT INTO `lootbox_saisonpass_user` (`id`, `identifier`, `saison_id`, `current_level`) VALUES
(5, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 4, 0),
(6, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 4, 0),
(7, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 4, 0),
(8, 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', 4, 0);

-- --------------------------------------------------------

--
-- Structure de la table `lootbox_saisonpass_zones`
--

CREATE TABLE `lootbox_saisonpass_zones` (
  `id` int(11) NOT NULL,
  `data` int(11) NOT NULL,
  `coords` varchar(50) NOT NULL,
  `radius` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lootbox_saisonpass_zones`
--

INSERT INTO `lootbox_saisonpass_zones` (`id`, `data`, `coords`, `radius`, `time`) VALUES
(1, 1, '-1827.6046,-777.6716,8.0848', 200, 10);

-- --------------------------------------------------------

--
-- Structure de la table `multicharacter_slots`
--

CREATE TABLE `multicharacter_slots` (
  `identifier` varchar(259) NOT NULL,
  `slots` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `multicharacter_slots`
--

INSERT INTO `multicharacter_slots` (`identifier`, `slots`) VALUES
('cf872e2dbff1cf3152fff72b147ca07238315148', 7);

-- --------------------------------------------------------

--
-- Structure de la table `m_hud_playlists`
--

CREATE TABLE `m_hud_playlists` (
  `id` int(11) NOT NULL,
  `owner` longtext DEFAULT NULL,
  `name` longtext NOT NULL,
  `cover` longtext DEFAULT NULL,
  `likes` longtext NOT NULL,
  `creatorname` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `m_hud_playlist_songs`
--

CREATE TABLE `m_hud_playlist_songs` (
  `id` int(11) NOT NULL,
  `playlist_id` int(11) DEFAULT NULL,
  `url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `m_hud_stress`
--

CREATE TABLE `m_hud_stress` (
  `identifier` varchar(259) DEFAULT NULL,
  `stress` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `npwd_darkchat_channels`
--

CREATE TABLE `npwd_darkchat_channels` (
  `id` int(11) NOT NULL,
  `channel_identifier` varchar(191) NOT NULL,
  `label` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `npwd_darkchat_channels`
--

INSERT INTO `npwd_darkchat_channels` (`id`, `channel_identifier`, `label`) VALUES
(20, '8', '8');

-- --------------------------------------------------------

--
-- Structure de la table `npwd_match_profiles`
--

CREATE TABLE `npwd_match_profiles` (
  `id` int(11) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `name` varchar(90) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` varchar(512) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `tags` varchar(255) NOT NULL DEFAULT '',
  `voiceMessage` varchar(512) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `npwd_match_profiles`
--

INSERT INTO `npwd_match_profiles` (`id`, `identifier`, `name`, `image`, `bio`, `location`, `job`, `tags`, `voiceMessage`, `createdAt`, `updatedAt`) VALUES
(1, 'cf872e2dbff1cf3152fff72b147ca07238315148', '6113168080', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2025-03-24 20:52:32', '2025-03-24 20:52:32');

-- --------------------------------------------------------

--
-- Structure de la table `npwd_messages_conversations`
--

CREATE TABLE `npwd_messages_conversations` (
  `id` int(11) NOT NULL,
  `conversation_list` varchar(225) NOT NULL,
  `label` varchar(60) DEFAULT '',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_message_id` int(11) DEFAULT NULL,
  `is_group_chat` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `owned_properties`
--

CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(259) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `owned_properties`
--

INSERT INTO `owned_properties` (`id`, `name`, `price`, `rented`, `owner`) VALUES
(1, 'kevin', 250000000, 0, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177');

-- --------------------------------------------------------

--
-- Structure de la table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `amigos` longtext DEFAULT NULL,
  `owner` varchar(259) DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Etat de la voiture',
  `garageperso` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Garage Personnel',
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  `parking` varchar(60) DEFAULT NULL,
  `pound` varchar(60) DEFAULT NULL,
  `calle` varchar(60) DEFAULT NULL,
  `mileage` float DEFAULT 0,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  `lastparking` longtext DEFAULT NULL,
  `lastposition` longtext DEFAULT NULL,
  `carseller` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `owned_vehicles`
--

INSERT INTO `owned_vehicles` (`amigos`, `owner`, `state`, `garageperso`, `plate`, `vehicle`, `type`, `job`, `stored`, `parking`, `pound`, `calle`, `mileage`, `glovebox`, `trunk`, `lastparking`, `lastposition`, `carseller`) VALUES
(NULL, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 0, 0, '3M571430', '{\"livery\":-1,\"modVanityPlate\":-1,\"modShifterLeavers\":-1,\"plate\":\"3M571430\",\"modStruts\":-1,\"interiorColor\":0,\"neonEnabled\":[false,false,false,false],\"modPlateHolder\":-1,\"wheelSize\":1.0,\"modTransmission\":-1,\"modSteeringWheel\":-1,\"modEngineBlock\":-1,\"windowTint\":-1,\"modSeats\":-1,\"tankHealth\":1000,\"modLivery\":-1,\"paintType2\":7,\"wheels\":7,\"modXenon\":false,\"modSubwoofer\":-1,\"modGrille\":-1,\"modRoofLivery\":-1,\"modLightbar\":-1,\"modFrame\":-1,\"modDial\":-1,\"modExhaust\":-1,\"windows\":[4,5,7],\"modArchCover\":-1,\"bodyHealth\":997,\"modNitrous\":-1,\"engineHealth\":999,\"color2\":0,\"doors\":[],\"fuelLevel\":37,\"modTrimB\":-1,\"modFender\":-1,\"modWindows\":-1,\"modTrimA\":-1,\"modSmokeEnabled\":false,\"modSideSkirt\":-1,\"modHood\":-1,\"modFrontWheels\":-1,\"modRightFender\":-1,\"plateIndex\":0,\"modHorns\":-1,\"driftTyres\":false,\"model\":-1216765807,\"neonColor\":[255,0,255],\"extras\":{\"10\":0,\"1\":0,\"12\":1},\"modBrakes\":-1,\"modAerials\":-1,\"modOrnaments\":-1,\"tyres\":[],\"dashboardColor\":0,\"modArmor\":-1,\"modDoorSpeaker\":-1,\"oilLevel\":5,\"modRearBumper\":-1,\"modCustomTiresF\":false,\"modTrunk\":-1,\"wheelColor\":156,\"modAPlate\":-1,\"modSpeakers\":-1,\"modEngine\":-1,\"modSpoilers\":-1,\"modAirFilter\":-1,\"pearlescentColor\":7,\"modBackWheels\":-1,\"modFrontBumper\":-1,\"modTurbo\":false,\"color1\":1,\"tyreSmokeColor\":[255,255,255],\"modSuspension\":-1,\"wheelWidth\":1.0,\"paintType1\":7,\"modRoof\":-1,\"modCustomTiresR\":false,\"dirtLevel\":1,\"bulletProofTyres\":true,\"modHydraulics\":false,\"modDashboard\":-1,\"modTank\":-1,\"modDoorR\":-1,\"modHydrolic\":-1,\"xenonColor\":255}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, '[{\"name\":\"WEAPON_HEAVYSNIPER\",\"slot\":7,\"count\":1,\"metadata\":{\"serial\":\"404019QCX499201\",\"components\":[],\"durability\":100,\"ammo\":0,\"registered\":\"Juan Rodriguez\"}}]', NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 0, 0, 'AIC 378', '{\"modExhaust\":-1,\"modDial\":-1,\"modHydrolic\":-1,\"bulletProofTyres\":true,\"modSpeakers\":-1,\"model\":-697151129,\"modAirFilter\":-1,\"modSuspension\":-1,\"modDashboard\":-1,\"neonColor\":[255,0,255],\"tankHealth\":926,\"modTrimA\":-1,\"modRightFender\":-1,\"modSubwoofer\":-1,\"modRoof\":-1,\"modBrakes\":2,\"modGrille\":-1,\"modVanityPlate\":-1,\"tyreSmokeColor\":[255,255,255],\"modPlateHolder\":-1,\"modRearBumper\":-1,\"modTurbo\":true,\"color1\":[61,61,61],\"modNitrous\":-1,\"modRoofLivery\":-1,\"modSeats\":-1,\"livery\":0,\"modLightbar\":-1,\"paintType1\":7,\"modAPlate\":-1,\"modFender\":-1,\"xenonColor\":2,\"wheels\":0,\"modSmokeEnabled\":false,\"modFrontWheels\":-1,\"plateIndex\":1,\"fuelLevel\":59,\"modTrimB\":-1,\"windowTint\":1,\"modEngineBlock\":-1,\"modTransmission\":3,\"modArchCover\":-1,\"modHorns\":-1,\"wheelWidth\":1.0,\"modCustomTiresR\":false,\"tyres\":[],\"modXenon\":true,\"paintType2\":7,\"modDoorR\":-1,\"modFrame\":-1,\"modTrunk\":-1,\"engineHealth\":883,\"plate\":\"AIC 378 \",\"modShifterLeavers\":-1,\"dirtLevel\":6,\"oilLevel\":5,\"color2\":[46,46,46],\"modDoorSpeaker\":-1,\"modOrnaments\":-1,\"modSideSkirt\":-1,\"modSpoilers\":-1,\"modArmor\":4,\"modLivery\":-1,\"dashboardColor\":134,\"driftTyres\":false,\"neonEnabled\":[false,false,false,false],\"wheelSize\":1.0,\"wheelColor\":156,\"modTank\":-1,\"modFrontBumper\":-1,\"windows\":[2,3,4,5,7],\"bodyHealth\":584,\"modBackWheels\":-1,\"modWindows\":-1,\"interiorColor\":134,\"modEngine\":4,\"modSteeringWheel\":-1,\"pearlescentColor\":0,\"modHood\":-1,\"modCustomTiresF\":false,\"modHydraulics\":false,\"doors\":[],\"modStruts\":-1,\"modAerials\":-1,\"extras\":[null,1,1,0]}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'ALB 709', '{\"modStruts\":-1,\"modRearBumper\":-1,\"modArmor\":-1,\"modHydraulics\":false,\"modHorns\":-1,\"modDial\":-1,\"wheelWidth\":1.0,\"livery\":-1,\"tyres\":[],\"plateIndex\":1,\"dirtLevel\":6,\"modDoorSpeaker\":-1,\"modTrimB\":-1,\"oilLevel\":5,\"engineHealth\":998,\"color2\":0,\"modSteeringWheel\":-1,\"modArchCover\":-1,\"neonEnabled\":[false,false,false,false],\"modTransmission\":2,\"modOrnaments\":-1,\"modLightbar\":-1,\"modSuspension\":2,\"modDoorR\":-1,\"driftTyres\":false,\"modFender\":-1,\"modSpoilers\":-1,\"modCustomTiresR\":false,\"modAPlate\":-1,\"modAirFilter\":-1,\"modExhaust\":-1,\"xenonColor\":255,\"modFrontWheels\":-1,\"paintType2\":7,\"bulletProofTyres\":true,\"modSideSkirt\":-1,\"modNitrous\":-1,\"extras\":[1,0],\"bodyHealth\":966,\"paintType1\":7,\"windowTint\":1,\"windows\":[1,2,3,4,5],\"dashboardColor\":0,\"modFrame\":-1,\"modTank\":-1,\"color1\":29,\"modLivery\":-1,\"plate\":\"ALB 709 \",\"modWindows\":-1,\"modTrunk\":-1,\"modTrimA\":-1,\"modPlateHolder\":-1,\"modBrakes\":2,\"modGrille\":-1,\"modSmokeEnabled\":false,\"neonColor\":[255,0,255],\"modEngineBlock\":-1,\"wheelColor\":0,\"tyreSmokeColor\":[255,255,255],\"wheelSize\":1.0,\"model\":391411149,\"modEngine\":3,\"modCustomTiresF\":false,\"modSpeakers\":-1,\"modSeats\":-1,\"doors\":[],\"tankHealth\":991,\"modSubwoofer\":-1,\"modAerials\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modTurbo\":true,\"pearlescentColor\":0,\"modRoof\":-1,\"modHydrolic\":-1,\"fuelLevel\":41,\"modVanityPlate\":-1,\"modShifterLeavers\":-1,\"modRoofLivery\":-1,\"modRightFender\":-1,\"wheels\":7,\"interiorColor\":0,\"modFrontBumper\":-1,\"modBackWheels\":-1,\"modXenon\":false}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:4634506b65176f2c2aa6a1af9831d3efbd168ee0', 0, 0, 'AOA 701', '{\"model\":1157349776,\"plate\":\"AOA 701\"}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 0, 0, 'BGJ 210', '{\"wheelSize\":1.0,\"modTrimA\":-1,\"modFrame\":-1,\"modSmokeEnabled\":true,\"modAerials\":-1,\"modOrnaments\":-1,\"windows\":[0,1,2,3,4,5,6,7],\"modEngine\":3,\"modFender\":-1,\"dashboardColor\":0,\"model\":-1684776591,\"modHood\":-1,\"windowTint\":5,\"modBrakes\":2,\"interiorColor\":0,\"modFrontBumper\":-1,\"wheelWidth\":1.0,\"pearlescentColor\":27,\"modDial\":-1,\"tyreSmokeColor\":[255,3,3],\"dirtLevel\":0,\"bulletProofTyres\":true,\"modTrunk\":-1,\"modSeats\":-1,\"modTurbo\":true,\"extras\":[],\"xenonColor\":8,\"modTransmission\":2,\"color2\":[255,0,0],\"oilLevel\":5,\"bodyHealth\":998,\"modSubwoofer\":-1,\"modArmor\":4,\"modWindows\":-1,\"modRearBumper\":-1,\"neonEnabled\":[true,true,true,true],\"modFrontWheels\":-1,\"modTank\":-1,\"modPlateHolder\":-1,\"modShifterLeavers\":-1,\"modCustomTiresR\":false,\"livery\":1,\"doors\":[],\"modEngineBlock\":-1,\"modRoof\":-1,\"modAirFilter\":-1,\"modXenon\":true,\"color1\":[255,0,0],\"modDoorSpeaker\":-1,\"tyres\":[],\"modBackWheels\":-1,\"modRoofLivery\":-1,\"modDashboard\":-1,\"modHydrolic\":-1,\"fuelLevel\":63,\"modCustomTiresF\":false,\"plate\":\"BGJ 210 \",\"modSpoilers\":-1,\"modArchCover\":-1,\"wheels\":0,\"modGrille\":-1,\"paintType2\":7,\"paintType1\":7,\"driftTyres\":false,\"modLightbar\":-1,\"plateIndex\":1,\"modLivery\":-1,\"modAPlate\":-1,\"modExhaust\":-1,\"modVanityPlate\":-1,\"engineHealth\":1000,\"modHorns\":-1,\"wheelColor\":0,\"modSideSkirt\":-1,\"modRightFender\":-1,\"modDoorR\":-1,\"modHydraulics\":false,\"modSuspension\":3,\"modTrimB\":-1,\"neonColor\":[255,0,0],\"modNitrous\":-1,\"modSteeringWheel\":-1,\"modSpeakers\":-1,\"tankHealth\":1000,\"modStruts\":-1}', 'car', NULL, 1, 'Arcadius Business Centre Garage', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 0, 0, 'BHL 403', '{\"modEngine\":3,\"modDoorR\":-1,\"modVanityPlate\":-1,\"modFrame\":-1,\"modXenon\":true,\"driftTyres\":false,\"modSteeringWheel\":-1,\"modTrunk\":-1,\"modCustomTiresF\":false,\"modTurbo\":true,\"dirtLevel\":1,\"modArchCover\":-1,\"modSuspension\":2,\"modDoorSpeaker\":-1,\"modFender\":-1,\"fuelLevel\":63,\"modAerials\":-1,\"neonEnabled\":[true,true,true,true],\"modRightFender\":-1,\"modBrakes\":2,\"interiorColor\":0,\"modTank\":-1,\"windowTint\":1,\"tankHealth\":985,\"oilLevel\":5,\"modHorns\":45,\"modTrimB\":-1,\"modBackWheels\":-1,\"modLivery\":-1,\"wheelWidth\":1.0,\"modHydraulics\":false,\"modSeats\":-1,\"modDashboard\":-1,\"bodyHealth\":601,\"modSmokeEnabled\":true,\"wheelSize\":1.0,\"modRoof\":-1,\"plate\":\"BHL 403 \",\"paintType1\":7,\"wheels\":0,\"doors\":[],\"modSpeakers\":-1,\"modTrimA\":-1,\"modFrontWheels\":-1,\"modRoofLivery\":-1,\"windows\":[0,1,2,3,4,5,6,7],\"modLightbar\":-1,\"color1\":[0,255,17],\"modArmor\":4,\"modDial\":-1,\"wheelColor\":134,\"livery\":-1,\"color2\":[255,242,242],\"xenonColor\":4,\"modGrille\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[0,255,25],\"pearlescentColor\":10,\"modStruts\":-1,\"modSubwoofer\":-1,\"paintType2\":7,\"bulletProofTyres\":true,\"modHydrolic\":-1,\"modAPlate\":-1,\"modAirFilter\":-1,\"modWindows\":-1,\"tyres\":[],\"extras\":[1],\"model\":1680501288,\"modSideSkirt\":-1,\"modExhaust\":-1,\"modEngineBlock\":-1,\"engineHealth\":608,\"modRearBumper\":-1,\"modHood\":-1,\"modSpoilers\":-1,\"modCustomTiresR\":false,\"modOrnaments\":-1,\"neonColor\":[0,255,8],\"dashboardColor\":0,\"modNitrous\":-1,\"modTransmission\":2,\"modShifterLeavers\":-1,\"plateIndex\":1,\"modPlateHolder\":-1}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'BMI 321', '{\"modAPlate\":-1,\"modTransmission\":2,\"wheels\":7,\"modExhaust\":-1,\"modSpoilers\":-1,\"modLivery\":-1,\"extras\":[1,null,null,1,null,null,null,null,null,0],\"modBackWheels\":-1,\"modNitrous\":-1,\"modTank\":-1,\"modEngine\":3,\"color1\":1,\"wheelWidth\":1.0,\"modRoofLivery\":-1,\"driftTyres\":false,\"modGrille\":-1,\"modFender\":-1,\"interiorColor\":9,\"modDashboard\":-1,\"modFrame\":-1,\"modWindows\":-1,\"engineHealth\":1000,\"wheelColor\":7,\"modTrimA\":-1,\"modLightbar\":-1,\"modSubwoofer\":-1,\"color2\":3,\"dirtLevel\":2,\"modCustomTiresR\":false,\"paintType2\":7,\"bodyHealth\":1000,\"windowTint\":-1,\"modXenon\":false,\"oilLevel\":5,\"modVanityPlate\":-1,\"modPlateHolder\":-1,\"modDial\":-1,\"modTrunk\":-1,\"modSideSkirt\":-1,\"modDoorR\":-1,\"modHydraulics\":false,\"modRearBumper\":-1,\"modTrimB\":-1,\"modRightFender\":-1,\"modEngineBlock\":-1,\"modSmokeEnabled\":false,\"modHood\":-1,\"modAerials\":-1,\"neonEnabled\":[false,false,false,false],\"modSuspension\":3,\"modAirFilter\":-1,\"modBrakes\":2,\"plate\":\"BMI 321 \",\"modSteeringWheel\":-1,\"paintType1\":7,\"dashboardColor\":12,\"modHorns\":-1,\"livery\":-1,\"modFrontWheels\":-1,\"model\":1801414482,\"modSpeakers\":-1,\"xenonColor\":255,\"neonColor\":[255,0,255],\"bulletProofTyres\":true,\"windows\":[4,5],\"modCustomTiresF\":false,\"modRoof\":-1,\"modTurbo\":true,\"tyres\":[],\"modShifterLeavers\":-1,\"tankHealth\":1000,\"modStruts\":-1,\"modHydrolic\":-1,\"pearlescentColor\":5,\"wheelSize\":1.0,\"fuelLevel\":32,\"modOrnaments\":-1,\"doors\":[],\"modDoorSpeaker\":-1,\"modArmor\":4,\"modSeats\":-1,\"tyreSmokeColor\":[255,255,255],\"modArchCover\":-1,\"plateIndex\":0,\"modFrontBumper\":-1}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 0, 0, 'BYO 927', '{\"modStruts\":-1,\"modRearBumper\":-1,\"modArmor\":4,\"modHydraulics\":false,\"modHorns\":-1,\"modDial\":-1,\"wheelWidth\":0.61521738767623,\"livery\":-1,\"tyres\":[],\"plateIndex\":1,\"dirtLevel\":1,\"modDoorSpeaker\":-1,\"modTrimB\":-1,\"oilLevel\":5,\"engineHealth\":913,\"modBrakes\":-1,\"modSteeringWheel\":-1,\"modArchCover\":-1,\"model\":2103567117,\"wheels\":7,\"modOrnaments\":-1,\"modLightbar\":-1,\"tankHealth\":989,\"modDoorR\":-1,\"driftTyres\":false,\"modFender\":-1,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"modAPlate\":-1,\"modAirFilter\":-1,\"modExhaust\":-1,\"xenonColor\":2,\"modFrontWheels\":6,\"paintType2\":7,\"bulletProofTyres\":true,\"modSideSkirt\":-1,\"modHydrolic\":-1,\"extras\":[],\"bodyHealth\":929,\"paintType1\":7,\"windowTint\":1,\"windows\":[],\"dashboardColor\":0,\"modFrame\":-1,\"modTank\":-1,\"color1\":[46,46,46],\"modLivery\":-1,\"plate\":\"BYO 927 \",\"modWindows\":-1,\"modTrunk\":-1,\"modTrimA\":-1,\"modPlateHolder\":-1,\"neonEnabled\":[false,false,false,false],\"interiorColor\":0,\"modSmokeEnabled\":true,\"modRightFender\":-1,\"modEngineBlock\":-1,\"wheelColor\":0,\"tyreSmokeColor\":[255,255,255],\"wheelSize\":0.67607074975967,\"modTurbo\":true,\"modSuspension\":2,\"modCustomTiresF\":false,\"modSpeakers\":-1,\"doors\":[],\"modCustomTiresR\":false,\"modSeats\":-1,\"modNitrous\":-1,\"modGrille\":-1,\"neonColor\":[255,0,255],\"modDashboard\":-1,\"modSubwoofer\":-1,\"pearlescentColor\":0,\"fuelLevel\":41,\"modRoofLivery\":-1,\"modEngine\":3,\"modXenon\":true,\"modTransmission\":2,\"modHood\":-1,\"color2\":[255,255,255],\"modShifterLeavers\":-1,\"modRoof\":-1,\"modFrontBumper\":-1,\"modBackWheels\":-1,\"modAerials\":-1}', 'car', NULL, 1, 'Auto Impound', '1', NULL, 0, '[{\"metadata\":{\"description\":\"\\n   · Plaque d\'immatriculation:  BYO 927   \\n   · Models: e55\",\"plate\":\"BYO 927\"},\"slot\":1,\"name\":\"carkey\",\"count\":1}]', NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 0, 0, 'CAH 739', '{\"model\":1058535905,\"bodyHealth\":1000.0,\"dirtLevel\":2.0,\"neonColor\":[255,0,255],\"tyreSmokeColor\":[255,255,255],\"modArchCover\":-1,\"wheelColor\":156,\"modWindows\":-1,\"plate\":\"CAH 739\",\"fuelLevel\":66.2,\"dashboardColor\":0,\"modDial\":-1,\"modSmokeEnabled\":false,\"modPlateHolder\":-1,\"engineHealth\":1000.0,\"modEngine\":-1,\"modShifterLeavers\":-1,\"modLivery\":0,\"windowsBroken\":{\"4\":false,\"3\":false,\"2\":false,\"1\":false,\"0\":false,\"7\":false,\"6\":false,\"5\":false},\"modVanityPlate\":-1,\"modFrontWheels\":-1,\"modGrille\":-1,\"modExhaust\":-1,\"windowTint\":-1,\"modRightFender\":-1,\"modTransmission\":-1,\"modSuspension\":-1,\"modRoof\":-1,\"doorsBroken\":{\"4\":false,\"3\":false,\"2\":false,\"1\":false,\"0\":false,\"6\":false,\"5\":false},\"modCustomBackWheels\":false,\"tankHealth\":1000.0,\"modRearBumper\":-1,\"modArmor\":-1,\"modSteeringWheel\":-1,\"modDoorSpeaker\":-1,\"modXenon\":false,\"wheels\":0,\"neonEnabled\":[false,false,false,false],\"modHood\":-1,\"xenonColor\":255,\"modSpeakers\":-1,\"modBrakes\":-1,\"modSideSkirt\":-1,\"pearlescentColor\":0,\"modBackWheels\":-1,\"color2\":27,\"modTrimA\":-1,\"interiorColor\":0,\"modAirFilter\":-1,\"modTrunk\":-1,\"modLightbar\":-1,\"extras\":{\"12\":false,\"1\":false},\"modHydrolic\":-1,\"modStruts\":-1,\"plateIndex\":4,\"modAPlate\":-1,\"modTank\":-1,\"modTrimB\":-1,\"modFrame\":-1,\"color1\":27,\"modAerials\":-1,\"modEngineBlock\":-1,\"modCustomFrontWheels\":false,\"tyresCanBurst\":1,\"modSeats\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"modFender\":-1,\"tyreBurst\":{\"0\":false,\"4\":false,\"5\":false,\"1\":false},\"modSpoilers\":-1,\"modHorns\":-1,\"modTurbo\":false,\"modOrnaments\":-1,\"modRoofLivery\":-1}', 'car', 'ambulance', 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 0, 0, 'DUJ 869', '{\"neonEnabled\":[false,false,false,false],\"windows\":[4,5],\"windowTint\":-1,\"modSpoilers\":-1,\"modEngineBlock\":-1,\"modDashboard\":-1,\"modExhaust\":-1,\"modSideSkirt\":-1,\"modAPlate\":-1,\"modRoofLivery\":-1,\"engineHealth\":986,\"modSuspension\":-1,\"modBackWheels\":-1,\"modLivery\":-1,\"modNitrous\":-1,\"modDoorR\":-1,\"modTrimA\":-1,\"livery\":-1,\"paintType2\":7,\"xenonColor\":255,\"modHood\":-1,\"color1\":2,\"modHydrolic\":-1,\"modSteeringWheel\":-1,\"modStruts\":-1,\"tyres\":[],\"modFrontWheels\":-1,\"modLightbar\":-1,\"modBrakes\":-1,\"modSeats\":-1,\"modTransmission\":-1,\"driftTyres\":false,\"wheelColor\":156,\"modRightFender\":-1,\"modXenon\":false,\"modArmor\":-1,\"modOrnaments\":-1,\"doors\":[],\"modHydraulics\":false,\"dirtLevel\":6,\"modRearBumper\":-1,\"modFrame\":-1,\"modVanityPlate\":-1,\"modPlateHolder\":-1,\"tankHealth\":999,\"wheelSize\":0.0,\"modDoorSpeaker\":-1,\"modWindows\":-1,\"tyreSmokeColor\":[255,255,255],\"modCustomTiresF\":false,\"modFrontBumper\":-1,\"model\":577497474,\"modHorns\":-1,\"modShifterLeavers\":-1,\"oilLevel\":12,\"interiorColor\":0,\"modSubwoofer\":-1,\"wheels\":0,\"dashboardColor\":0,\"neonColor\":[255,0,255],\"fuelLevel\":21,\"modAirFilter\":-1,\"plate\":\"DUJ 869 \",\"modCustomTiresR\":false,\"modTrunk\":-1,\"modDial\":-1,\"extras\":[],\"modFender\":-1,\"wheelWidth\":0.0,\"modRoof\":-1,\"modSpeakers\":-1,\"modGrille\":-1,\"modTank\":-1,\"bulletProofTyres\":true,\"modAerials\":-1,\"modSmokeEnabled\":false,\"modTurbo\":false,\"pearlescentColor\":7,\"modTrimB\":-1,\"modArchCover\":-1,\"modEngine\":-1,\"bodyHealth\":990,\"color2\":2,\"paintType1\":7,\"plateIndex\":3}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char2:cf872e2dbff1cf3152fff72b147ca07238315148', 0, 0, 'EXE 656', '{\"extras\":[0],\"modExhaust\":-1,\"modSpeakers\":-1,\"modShifterLeavers\":-1,\"plateIndex\":1,\"modAerials\":-1,\"fuelLevel\":77,\"modGrille\":-1,\"modDial\":-1,\"modBackWheels\":-1,\"modTank\":-1,\"modLivery\":-1,\"wheelColor\":0,\"dirtLevel\":1,\"interiorColor\":31,\"modAirFilter\":-1,\"modTrimA\":-1,\"bulletProofTyres\":true,\"windows\":[2,3,4,5,7],\"modPlateHolder\":-1,\"oilLevel\":5,\"modSteeringWheel\":-1,\"dashboardColor\":31,\"driftTyres\":false,\"neonEnabled\":[false,false,false,false],\"paintType1\":7,\"modCustomTiresF\":false,\"plate\":\"EXE 656 \",\"modHydraulics\":false,\"modEngineBlock\":-1,\"livery\":-1,\"modTrimB\":-1,\"modAPlate\":-1,\"tankHealth\":1000,\"modFrontBumper\":-1,\"modSpoilers\":-1,\"modRightFender\":-1,\"paintType2\":7,\"modSubwoofer\":-1,\"bodyHealth\":999,\"modDoorR\":-1,\"modTransmission\":-1,\"modFender\":-1,\"modDoorSpeaker\":-1,\"modVanityPlate\":-1,\"wheelSize\":1.0,\"tyreSmokeColor\":[255,255,255],\"windowTint\":-1,\"modXenon\":false,\"modHorns\":-1,\"modSmokeEnabled\":false,\"color2\":112,\"modSeats\":-1,\"modRoof\":-1,\"modSideSkirt\":-1,\"modArchCover\":-1,\"modLightbar\":-1,\"modCustomTiresR\":false,\"modDashboard\":-1,\"modStruts\":-1,\"modWindows\":-1,\"engineHealth\":1000,\"modHood\":-1,\"xenonColor\":255,\"modNitrous\":-1,\"modFrame\":-1,\"modHydrolic\":-1,\"modFrontWheels\":-1,\"wheelWidth\":1.0,\"modEngine\":-1,\"doors\":[],\"pearlescentColor\":112,\"tyres\":[],\"wheels\":7,\"color1\":112,\"modArmor\":-1,\"model\":-1087050610,\"modTrunk\":-1,\"modTurbo\":false,\"modBrakes\":-1,\"modOrnaments\":-1,\"modRoofLivery\":-1,\"modSuspension\":-1,\"modRearBumper\":-1,\"neonColor\":[255,0,255]}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 0, 0, 'FBX 058', '{\"model\":-1323681073,\"plate\":\"FBX 058\"}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 0, 0, 'FNA 814', '{\"modExhaust\":-1,\"modDial\":-1,\"modHydrolic\":-1,\"bulletProofTyres\":true,\"modSpeakers\":-1,\"model\":336470085,\"modAirFilter\":-1,\"modSuspension\":3,\"modDashboard\":-1,\"neonColor\":[255,0,255],\"tankHealth\":998,\"modTrimA\":-1,\"modRightFender\":-1,\"modSubwoofer\":-1,\"modRoof\":-1,\"modBrakes\":2,\"modGrille\":-1,\"modVanityPlate\":-1,\"tyreSmokeColor\":[255,255,255],\"modPlateHolder\":-1,\"modRearBumper\":-1,\"modTurbo\":true,\"color1\":1,\"modNitrous\":-1,\"modRoofLivery\":-1,\"modSeats\":-1,\"livery\":-1,\"modLightbar\":-1,\"paintType1\":7,\"modAPlate\":-1,\"modFender\":-1,\"xenonColor\":2,\"wheels\":7,\"modSmokeEnabled\":false,\"modFrontWheels\":6,\"plateIndex\":1,\"fuelLevel\":53,\"modTrimB\":-1,\"windowTint\":1,\"modEngineBlock\":-1,\"modTransmission\":2,\"modArchCover\":-1,\"modHorns\":-1,\"wheelWidth\":0.50576162338256,\"modCustomTiresR\":false,\"tyres\":[],\"modXenon\":true,\"paintType2\":7,\"modDoorR\":-1,\"modFrame\":-1,\"modTrunk\":-1,\"engineHealth\":991,\"plate\":\"FNA 814 \",\"modShifterLeavers\":-1,\"dirtLevel\":0,\"oilLevel\":6,\"color2\":1,\"modDoorSpeaker\":-1,\"modOrnaments\":-1,\"modSideSkirt\":-1,\"modSpoilers\":-1,\"modArmor\":-1,\"modLivery\":-1,\"dashboardColor\":0,\"driftTyres\":false,\"neonEnabled\":[false,false,false,false],\"wheelSize\":0.69871515035629,\"wheelColor\":1,\"modTank\":-1,\"modFrontBumper\":-1,\"windows\":[4,5],\"bodyHealth\":978,\"modBackWheels\":-1,\"modWindows\":-1,\"interiorColor\":0,\"modEngine\":3,\"modSteeringWheel\":-1,\"pearlescentColor\":1,\"modHood\":-1,\"modCustomTiresF\":false,\"modHydraulics\":false,\"doors\":[],\"modStruts\":-1,\"modAerials\":-1,\"extras\":[]}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'FST 714', '{\"modLivery\":-1,\"modGrille\":-1,\"bulletProofTyres\":true,\"modArchCover\":-1,\"paintType2\":7,\"modSuspension\":2,\"modSeats\":-1,\"modFrame\":-1,\"modStruts\":-1,\"modSpoilers\":-1,\"modBackWheels\":-1,\"modNitrous\":-1,\"extras\":[],\"wheelWidth\":0.46999809145927,\"modFender\":-1,\"modHydraulics\":false,\"modXenon\":true,\"model\":979439968,\"modFrontWheels\":4,\"modShifterLeavers\":-1,\"modDial\":-1,\"driftTyres\":false,\"dashboardColor\":0,\"modSpeakers\":-1,\"modTrunk\":-1,\"modSmokeEnabled\":false,\"modCustomTiresR\":false,\"neonEnabled\":[false,false,false,false],\"neonColor\":[255,0,255],\"modOrnaments\":-1,\"color1\":62,\"modTransmission\":2,\"windows\":[2,3,4,5],\"tankHealth\":1000,\"engineHealth\":994,\"modHorns\":-1,\"modRoof\":-1,\"modSubwoofer\":-1,\"modRightFender\":-1,\"modLightbar\":-1,\"modCustomTiresF\":false,\"modFrontBumper\":-1,\"modEngine\":3,\"modAerials\":-1,\"fuelLevel\":32,\"modTurbo\":true,\"modRoofLivery\":-1,\"modHydrolic\":-1,\"xenonColor\":2,\"modAirFilter\":-1,\"modSteeringWheel\":-1,\"modEngineBlock\":-1,\"tyres\":[],\"paintType1\":7,\"modWindows\":-1,\"plateIndex\":1,\"modTank\":-1,\"modAPlate\":-1,\"wheels\":7,\"modDashboard\":-1,\"tyreSmokeColor\":[255,255,255],\"modRearBumper\":-1,\"wheelColor\":134,\"interiorColor\":0,\"oilLevel\":7,\"modTrimB\":-1,\"plate\":\"FST 714 \",\"modBrakes\":2,\"pearlescentColor\":69,\"modExhaust\":-1,\"modHood\":-1,\"modSideSkirt\":-1,\"modPlateHolder\":-1,\"wheelSize\":0.62000000476837,\"windowTint\":1,\"doors\":[],\"color2\":64,\"modArmor\":2,\"modTrimA\":-1,\"modDoorSpeaker\":-1,\"modVanityPlate\":-1,\"livery\":0,\"dirtLevel\":6,\"modDoorR\":-1,\"bodyHealth\":996}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'HWZ 848', '{\"model\":319992222,\"tyreSmokeColor\":[255,255,255],\"modFrame\":-1,\"fuelLevel\":91,\"plateIndex\":1,\"modSteeringWheel\":-1,\"color1\":0,\"wheels\":6,\"wheelWidth\":1.0,\"paintType1\":7,\"wheelSize\":1.0,\"modTrimB\":-1,\"xenonColor\":8,\"modEngineBlock\":-1,\"paintType2\":7,\"modTurbo\":true,\"modBrakes\":2,\"modStruts\":-1,\"modCustomTiresF\":false,\"modRearBumper\":-1,\"windowTint\":1,\"modSeats\":-1,\"modNitrous\":-1,\"modRoofLivery\":-1,\"engineHealth\":1000,\"bodyHealth\":673,\"dirtLevel\":9,\"modDoorSpeaker\":-1,\"doors\":[],\"modEngine\":3,\"modXenon\":true,\"dashboardColor\":200,\"modCustomTiresR\":false,\"plate\":\"HWZ 848 \",\"modWindows\":-1,\"color2\":0,\"modTransmission\":2,\"modSpoilers\":-1,\"modSuspension\":4,\"modRoof\":-1,\"modAerials\":-1,\"modAirFilter\":-1,\"modTrunk\":-1,\"modPlateHolder\":-1,\"modLivery\":-1,\"modHorns\":-1,\"modOrnaments\":-1,\"neonEnabled\":[false,false,false,false],\"bulletProofTyres\":true,\"modShifterLeavers\":-1,\"extras\":[],\"modArchCover\":-1,\"modExhaust\":-1,\"modAPlate\":-1,\"tankHealth\":847,\"modDoorR\":-1,\"modSpeakers\":-1,\"modTrimA\":-1,\"livery\":-1,\"modSubwoofer\":-1,\"modDashboard\":-1,\"modRightFender\":-1,\"modLightbar\":-1,\"modSideSkirt\":-1,\"modFrontWheels\":-1,\"interiorColor\":240,\"windows\":[0,1,2,3,4,5,6,7],\"modVanityPlate\":-1,\"modHydraulics\":false,\"modDial\":-1,\"modHood\":-1,\"modFender\":-1,\"modHydrolic\":-1,\"driftTyres\":false,\"oilLevel\":5,\"wheelColor\":252,\"modFrontBumper\":-1,\"modArmor\":-1,\"modBackWheels\":-1,\"pearlescentColor\":156,\"modGrille\":-1,\"neonColor\":[255,0,255],\"tyres\":[],\"modSmokeEnabled\":false,\"modTank\":-1}', 'car', NULL, 1, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 0, 0, 'IAH 111', '{\"wheelSize\":1.0,\"modTrimA\":-1,\"modFrame\":-1,\"modSmokeEnabled\":true,\"modAerials\":-1,\"modOrnaments\":-1,\"windows\":[1,2,3,4,5,6,7],\"modEngine\":3,\"modFender\":-1,\"dashboardColor\":0,\"model\":-663740674,\"modHood\":-1,\"windowTint\":1,\"modBrakes\":2,\"interiorColor\":0,\"modFrontBumper\":-1,\"wheelWidth\":1.0,\"pearlescentColor\":62,\"modDial\":-1,\"tyreSmokeColor\":[0,17,255],\"dirtLevel\":1,\"bulletProofTyres\":true,\"modTrunk\":-1,\"modSeats\":-1,\"modTurbo\":true,\"extras\":[],\"xenonColor\":1,\"modTransmission\":2,\"color2\":[0,0,0],\"oilLevel\":12,\"bodyHealth\":694,\"modSubwoofer\":-1,\"modArmor\":4,\"modWindows\":-1,\"modRearBumper\":-1,\"neonEnabled\":[true,true,true,true],\"modFrontWheels\":-1,\"modTank\":-1,\"modPlateHolder\":-1,\"modShifterLeavers\":-1,\"modCustomTiresR\":false,\"livery\":-1,\"doors\":[],\"modEngineBlock\":-1,\"modRoof\":-1,\"modAirFilter\":-1,\"modXenon\":true,\"color1\":[0,0,0],\"modDoorSpeaker\":-1,\"tyres\":[],\"modBackWheels\":-1,\"modRoofLivery\":-1,\"modDashboard\":-1,\"modHydrolic\":-1,\"fuelLevel\":38,\"modCustomTiresF\":false,\"plate\":\"IAH 111 \",\"modSpoilers\":-1,\"modArchCover\":-1,\"wheels\":0,\"modGrille\":-1,\"paintType2\":0,\"paintType1\":0,\"driftTyres\":false,\"modLightbar\":-1,\"plateIndex\":1,\"modLivery\":-1,\"modAPlate\":-1,\"modExhaust\":-1,\"modVanityPlate\":-1,\"engineHealth\":971,\"modHorns\":-1,\"wheelColor\":64,\"modSideSkirt\":-1,\"modRightFender\":-1,\"modDoorR\":-1,\"modHydraulics\":false,\"modSuspension\":3,\"modTrimB\":-1,\"neonColor\":[64,0,255],\"modNitrous\":-1,\"modSteeringWheel\":-1,\"modSpeakers\":-1,\"tankHealth\":944,\"modStruts\":-1}', 'car', NULL, 1, 'Arcadius Business Centre Garage', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 0, 0, 'IEA 685', '{\"model\":-1323681073,\"plate\":\"IEA 685\"}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 0, 0, 'ISH 166', '{\"modEngine\":-1,\"modDoorR\":-1,\"modVanityPlate\":-1,\"modFrame\":-1,\"modXenon\":false,\"driftTyres\":false,\"modSteeringWheel\":-1,\"modTrunk\":-1,\"modCustomTiresF\":false,\"modTurbo\":false,\"dirtLevel\":7,\"modArchCover\":-1,\"modSuspension\":-1,\"modDoorSpeaker\":-1,\"modFender\":-1,\"fuelLevel\":23,\"modAerials\":-1,\"neonEnabled\":[false,false,false,false],\"modRightFender\":-1,\"modBrakes\":-1,\"interiorColor\":0,\"modTank\":-1,\"windowTint\":-1,\"tankHealth\":997,\"oilLevel\":5,\"modHorns\":-1,\"modTrimB\":-1,\"modBackWheels\":-1,\"modLivery\":-1,\"wheelWidth\":1.0,\"modHydraulics\":false,\"modSeats\":-1,\"modDashboard\":-1,\"bodyHealth\":977,\"modSmokeEnabled\":false,\"wheelSize\":1.0,\"modRoof\":-1,\"plate\":\"ISH 166 \",\"paintType1\":7,\"wheels\":0,\"doors\":[],\"modSpeakers\":-1,\"modTrimA\":-1,\"modFrontWheels\":-1,\"modRoofLivery\":-1,\"windows\":[],\"modLightbar\":-1,\"color1\":112,\"modArmor\":-1,\"modDial\":-1,\"wheelColor\":0,\"livery\":-1,\"color2\":120,\"xenonColor\":255,\"modGrille\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"pearlescentColor\":2,\"modStruts\":-1,\"modSubwoofer\":-1,\"paintType2\":7,\"bulletProofTyres\":true,\"modHydrolic\":-1,\"modAPlate\":-1,\"modAirFilter\":-1,\"modWindows\":-1,\"tyres\":[],\"extras\":[null,1],\"model\":-1323681073,\"modSideSkirt\":-1,\"modExhaust\":-1,\"modEngineBlock\":-1,\"engineHealth\":999,\"modRearBumper\":-1,\"modHood\":-1,\"modSpoilers\":-1,\"modCustomTiresR\":false,\"modOrnaments\":-1,\"neonColor\":[255,0,255],\"dashboardColor\":0,\"modNitrous\":-1,\"modTransmission\":-1,\"modShifterLeavers\":-1,\"plateIndex\":2,\"modPlateHolder\":-1}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 0, 0, 'ITX 795', '{\"modExhaust\":-1,\"modDial\":-1,\"modHydrolic\":-1,\"bulletProofTyres\":true,\"modSpeakers\":-1,\"model\":-1323681073,\"modAirFilter\":-1,\"modSuspension\":-1,\"modDashboard\":-1,\"neonColor\":[255,0,255],\"tankHealth\":997,\"modTrimA\":-1,\"modRightFender\":-1,\"modSubwoofer\":-1,\"modRoof\":-1,\"modBrakes\":-1,\"modGrille\":-1,\"modVanityPlate\":-1,\"tyreSmokeColor\":[255,255,255],\"modPlateHolder\":-1,\"modRearBumper\":-1,\"modTurbo\":false,\"color1\":112,\"modNitrous\":-1,\"modRoofLivery\":-1,\"modSeats\":-1,\"livery\":-1,\"modLightbar\":-1,\"paintType1\":7,\"modAPlate\":-1,\"modFender\":-1,\"xenonColor\":255,\"wheels\":0,\"modSmokeEnabled\":false,\"modFrontWheels\":-1,\"plateIndex\":1,\"fuelLevel\":39,\"modTrimB\":-1,\"windowTint\":-1,\"modEngineBlock\":-1,\"modTransmission\":-1,\"modArchCover\":-1,\"modHorns\":-1,\"wheelWidth\":1.0,\"modCustomTiresR\":false,\"tyres\":[],\"modXenon\":false,\"paintType2\":7,\"modDoorR\":-1,\"modFrame\":-1,\"modTrunk\":-1,\"engineHealth\":996,\"plate\":\"ITX 795 \",\"modShifterLeavers\":-1,\"dirtLevel\":4,\"oilLevel\":5,\"color2\":120,\"modDoorSpeaker\":-1,\"modOrnaments\":-1,\"modSideSkirt\":-1,\"modSpoilers\":-1,\"modArmor\":-1,\"modLivery\":-1,\"dashboardColor\":0,\"driftTyres\":false,\"neonEnabled\":[false,false,false,false],\"wheelSize\":1.0,\"wheelColor\":0,\"modTank\":-1,\"modFrontBumper\":-1,\"windows\":[],\"bodyHealth\":982,\"modBackWheels\":-1,\"modWindows\":-1,\"interiorColor\":0,\"modEngine\":-1,\"modSteeringWheel\":-1,\"pearlescentColor\":2,\"modHood\":-1,\"modCustomTiresF\":false,\"modHydraulics\":false,\"doors\":[],\"modStruts\":-1,\"modAerials\":-1,\"extras\":[null,1]}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 0, 0, 'IUV 689', '{\"modExhaust\":2,\"modDial\":-1,\"modHydrolic\":-1,\"bulletProofTyres\":true,\"modSpeakers\":-1,\"model\":2009317678,\"modAirFilter\":-1,\"modSuspension\":3,\"modDashboard\":-1,\"neonColor\":[255,0,255],\"tankHealth\":999,\"modTrimA\":-1,\"modRightFender\":-1,\"modSubwoofer\":-1,\"modRoof\":-1,\"modBrakes\":2,\"modGrille\":-1,\"modVanityPlate\":-1,\"tyreSmokeColor\":[255,255,255],\"modPlateHolder\":-1,\"modRearBumper\":3,\"modTurbo\":true,\"color1\":[26,26,26],\"modNitrous\":-1,\"modRoofLivery\":-1,\"modSeats\":-1,\"livery\":-1,\"modLightbar\":-1,\"paintType1\":7,\"modAPlate\":-1,\"modFender\":-1,\"xenonColor\":2,\"wheels\":7,\"modSmokeEnabled\":true,\"modFrontWheels\":4,\"plateIndex\":1,\"fuelLevel\":62,\"modTrimB\":-1,\"windowTint\":1,\"modEngineBlock\":-1,\"modTransmission\":2,\"modArchCover\":-1,\"modHorns\":-1,\"wheelWidth\":0.51200306415557,\"modCustomTiresR\":false,\"tyres\":[],\"modXenon\":true,\"paintType2\":7,\"modDoorR\":-1,\"modFrame\":-1,\"modTrunk\":-1,\"engineHealth\":999,\"plate\":\"IUV 689 \",\"modShifterLeavers\":-1,\"dirtLevel\":1,\"oilLevel\":5,\"color2\":[255,255,255],\"modDoorSpeaker\":-1,\"modOrnaments\":-1,\"modSideSkirt\":1,\"modSpoilers\":2,\"modArmor\":4,\"modLivery\":-1,\"dashboardColor\":117,\"driftTyres\":false,\"neonEnabled\":[false,false,false,false],\"wheelSize\":0.6958023905754,\"wheelColor\":121,\"modTank\":-1,\"modFrontBumper\":5,\"windows\":[4,5],\"bodyHealth\":998,\"modBackWheels\":-1,\"modWindows\":-1,\"interiorColor\":27,\"modEngine\":3,\"modSteeringWheel\":-1,\"pearlescentColor\":0,\"modHood\":2,\"modCustomTiresF\":false,\"modHydraulics\":false,\"doors\":[],\"modStruts\":-1,\"modAerials\":-1,\"extras\":[]}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'JHQ 512', '{\"modStruts\":-1,\"modRearBumper\":-1,\"modArmor\":2,\"modHydraulics\":false,\"modHorns\":-1,\"modDial\":-1,\"wheelWidth\":1.0,\"livery\":-1,\"tyres\":[],\"plateIndex\":1,\"dirtLevel\":1,\"modDoorSpeaker\":-1,\"modTrimB\":-1,\"oilLevel\":12,\"engineHealth\":997,\"color2\":0,\"modSteeringWheel\":-1,\"modArchCover\":-1,\"neonEnabled\":[false,false,false,false],\"modTransmission\":2,\"modOrnaments\":-1,\"modLightbar\":-1,\"modSuspension\":2,\"modDoorR\":-1,\"driftTyres\":false,\"modFender\":-1,\"modSpoilers\":-1,\"modCustomTiresR\":false,\"modAPlate\":-1,\"modAirFilter\":-1,\"modExhaust\":-1,\"xenonColor\":8,\"modFrontWheels\":-1,\"paintType2\":7,\"bulletProofTyres\":true,\"modSideSkirt\":-1,\"modNitrous\":-1,\"extras\":[],\"bodyHealth\":997,\"paintType1\":7,\"windowTint\":1,\"windows\":[4,5],\"dashboardColor\":0,\"modFrame\":-1,\"modTank\":-1,\"color1\":[0,0,0],\"modLivery\":-1,\"plate\":\"JHQ 512 \",\"modWindows\":-1,\"modTrunk\":-1,\"modTrimA\":-1,\"modPlateHolder\":-1,\"modBrakes\":2,\"modGrille\":-1,\"modSmokeEnabled\":true,\"neonColor\":[255,0,255],\"modEngineBlock\":-1,\"wheelColor\":2,\"tyreSmokeColor\":[255,255,255],\"wheelSize\":1.0,\"model\":577497474,\"modEngine\":3,\"modCustomTiresF\":false,\"modSpeakers\":-1,\"modSeats\":-1,\"doors\":[],\"tankHealth\":1000,\"modSubwoofer\":-1,\"modAerials\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modTurbo\":true,\"pearlescentColor\":0,\"modRoof\":-1,\"modHydrolic\":-1,\"fuelLevel\":96,\"modVanityPlate\":-1,\"modShifterLeavers\":-1,\"modRoofLivery\":-1,\"modRightFender\":-1,\"wheels\":0,\"interiorColor\":0,\"modFrontBumper\":-1,\"modBackWheels\":-1,\"modXenon\":true}', 'car', NULL, 1, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'JKP 582', '{\"wheels\":5,\"modSmokeEnabled\":false,\"windows\":[4,5,7],\"modHood\":1,\"modTrimA\":-1,\"modDial\":-1,\"xenonColor\":8,\"plate\":\"JKP 582 \",\"modBackWheels\":-1,\"livery\":0,\"modTransmission\":3,\"tyres\":[],\"modRearBumper\":2,\"modWindows\":-1,\"paintType2\":7,\"modArchCover\":-1,\"neonColor\":[255,0,255],\"wheelColor\":0,\"modAPlate\":-1,\"modHydraulics\":false,\"paintType1\":7,\"modShifterLeavers\":-1,\"interiorColor\":0,\"modLightbar\":-1,\"oilLevel\":5,\"modEngine\":4,\"modFender\":1,\"modFrame\":-1,\"doors\":[],\"modRightFender\":3,\"extras\":[null,null,null,null,null,null,0,1],\"modStruts\":-1,\"modSpeakers\":-1,\"modAirFilter\":-1,\"pearlescentColor\":0,\"neonEnabled\":[false,false,false,false],\"modSuspension\":2,\"driftTyres\":false,\"modSeats\":-1,\"modHydrolic\":-1,\"modSpoilers\":-1,\"bulletProofTyres\":true,\"modGrille\":-1,\"modExhaust\":1,\"bodyHealth\":936,\"modSideSkirt\":6,\"modHorns\":-1,\"modLivery\":-1,\"modBrakes\":2,\"modSubwoofer\":-1,\"modEngineBlock\":-1,\"color1\":[0,0,0],\"fuelLevel\":60,\"modFrontBumper\":2,\"modPlateHolder\":-1,\"modXenon\":true,\"dashboardColor\":0,\"model\":-1573472920,\"plateIndex\":1,\"wheelSize\":1.0,\"modCustomTiresR\":false,\"modRoofLivery\":-1,\"tankHealth\":993,\"modNitrous\":-1,\"modCustomTiresF\":false,\"modTank\":-1,\"modTrunk\":-1,\"modTurbo\":true,\"tyreSmokeColor\":[255,255,255],\"modVanityPlate\":-1,\"modDoorR\":-1,\"modSteeringWheel\":-1,\"color2\":[41,44,46],\"modDoorSpeaker\":-1,\"modAerials\":-1,\"modFrontWheels\":-1,\"engineHealth\":915,\"windowTint\":4,\"modDashboard\":-1,\"modTrimB\":-1,\"modRoof\":-1,\"wheelWidth\":1.0,\"modOrnaments\":-1,\"modArmor\":2,\"dirtLevel\":2}', 'car', NULL, 1, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 0, 0, 'JRT 518', '{\"plate\":\"JRT 939\"}', 'car', NULL, 1, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 0, 0, 'JUG 820', '{\"plate\":\"JUG 820\",\"model\":826601543}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 0, 0, 'KTB 471', '{\"modCustomTiresF\":false,\"modFrontWheels\":-1,\"plate\":\"KTB 471 \",\"modDashboard\":-1,\"color2\":121,\"modAirFilter\":-1,\"doors\":[],\"wheelSize\":1.0,\"modLightbar\":-1,\"modVanityPlate\":-1,\"fuelLevel\":54,\"tyres\":[],\"modStruts\":-1,\"extras\":[null,1,1,1],\"neonColor\":[255,0,255],\"modArchCover\":-1,\"modGrille\":-1,\"modXenon\":false,\"modRoofLivery\":-1,\"windows\":[4,5],\"modOrnaments\":-1,\"interiorColor\":134,\"color1\":8,\"model\":-697151129,\"modSteeringWheel\":-1,\"livery\":0,\"windowTint\":-1,\"modSubwoofer\":-1,\"plateIndex\":0,\"modPlateHolder\":-1,\"modHydraulics\":false,\"modShifterLeavers\":-1,\"dashboardColor\":134,\"bulletProofTyres\":true,\"modBrakes\":-1,\"wheelColor\":156,\"paintType1\":7,\"modRightFender\":-1,\"modTurbo\":false,\"wheelWidth\":1.0,\"engineHealth\":999,\"dirtLevel\":5,\"modFrame\":-1,\"modExhaust\":-1,\"modWindows\":-1,\"bodyHealth\":999,\"modSmokeEnabled\":false,\"pearlescentColor\":131,\"modArmor\":-1,\"modTrimA\":-1,\"modDoorSpeaker\":-1,\"paintType2\":7,\"modAPlate\":-1,\"modEngineBlock\":-1,\"modHorns\":-1,\"oilLevel\":5,\"modSuspension\":-1,\"modFender\":-1,\"modRearBumper\":-1,\"modSideSkirt\":-1,\"xenonColor\":255,\"modTrunk\":-1,\"modRoof\":-1,\"modSpoilers\":-1,\"modFrontBumper\":-1,\"modLivery\":-1,\"modCustomTiresR\":false,\"modTank\":-1,\"modDial\":-1,\"wheels\":0,\"modSeats\":-1,\"neonEnabled\":[false,false,false,false],\"modNitrous\":-1,\"driftTyres\":false,\"modDoorR\":-1,\"modEngine\":-1,\"modSpeakers\":-1,\"modTransmission\":-1,\"modHood\":-1,\"modHydrolic\":-1,\"tyreSmokeColor\":[255,255,255],\"modBackWheels\":-1,\"modAerials\":-1,\"modTrimB\":-1,\"tankHealth\":1000}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:b42b206cb9676c013317ee3b92d5e19e2314bb26', 0, 0, 'KUF 660', '{\"modCustomTiresF\":false,\"modFrontWheels\":-1,\"plate\":\"KUF 660 \",\"modTransmission\":2,\"color2\":63,\"modAirFilter\":-1,\"doors\":[],\"wheelSize\":1.0,\"modLightbar\":-1,\"modVanityPlate\":-1,\"fuelLevel\":55,\"tyres\":[],\"modStruts\":-1,\"extras\":[0],\"neonColor\":[255,0,255],\"modArchCover\":-1,\"modGrille\":-1,\"modXenon\":true,\"modRoofLivery\":-1,\"windows\":[4,5],\"modOrnaments\":-1,\"interiorColor\":0,\"tyreSmokeColor\":[255,0,195],\"model\":-448744104,\"modSteeringWheel\":-1,\"livery\":0,\"windowTint\":1,\"modExhaust\":-1,\"plateIndex\":1,\"modPlateHolder\":-1,\"modHydraulics\":false,\"modShifterLeavers\":-1,\"dashboardColor\":0,\"bulletProofTyres\":true,\"modBrakes\":2,\"modHood\":-1,\"paintType1\":7,\"modRightFender\":-1,\"modTurbo\":true,\"wheelWidth\":1.0,\"engineHealth\":999,\"modWindows\":-1,\"modSpoilers\":-1,\"modFender\":-1,\"modAPlate\":-1,\"bodyHealth\":969,\"modSmokeEnabled\":false,\"pearlescentColor\":5,\"modArmor\":4,\"modTrimA\":-1,\"modDoorSpeaker\":-1,\"paintType2\":7,\"dirtLevel\":0,\"modEngineBlock\":-1,\"modHorns\":-1,\"modNitrous\":-1,\"modSuspension\":3,\"modSubwoofer\":-1,\"modRearBumper\":-1,\"modBackWheels\":-1,\"xenonColor\":10,\"modTrunk\":-1,\"modRoof\":-1,\"modLivery\":-1,\"modFrontBumper\":-1,\"modDashboard\":-1,\"modCustomTiresR\":false,\"modEngine\":3,\"modDial\":-1,\"wheels\":0,\"color1\":[0,0,0],\"neonEnabled\":[true,true,true,true],\"oilLevel\":5,\"driftTyres\":false,\"modDoorR\":-1,\"modTank\":-1,\"modSpeakers\":-1,\"modSeats\":-1,\"tankHealth\":998,\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modTrimB\":-1,\"modAerials\":-1,\"wheelColor\":156,\"modFrame\":-1}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'LEQ 119', '{\"bulletProofTyres\":true,\"modAerials\":-1,\"windows\":[4,5,6],\"tankHealth\":990,\"doors\":[],\"modRearBumper\":-1,\"modNitrous\":-1,\"wheels\":7,\"tyreSmokeColor\":[255,255,255],\"modRoof\":-1,\"driftTyres\":false,\"dirtLevel\":7,\"interiorColor\":0,\"modHydraulics\":false,\"modCustomTiresF\":false,\"modBrakes\":2,\"modCustomTiresR\":false,\"neonColor\":[255,0,255],\"plate\":\"LEQ 119 \",\"modEngineBlock\":-1,\"modLightbar\":-1,\"modTrimA\":-1,\"modFrontBumper\":-1,\"tyres\":[],\"modArmor\":4,\"modBackWheels\":-1,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modDoorSpeaker\":-1,\"windowTint\":1,\"modSideSkirt\":-1,\"modAPlate\":-1,\"modEngine\":3,\"modDashboard\":-1,\"xenonColor\":8,\"modAirFilter\":-1,\"neonEnabled\":[false,false,false,false],\"modHydrolic\":-1,\"modSpeakers\":-1,\"paintType2\":0,\"modSeats\":-1,\"modTank\":-1,\"modPlateHolder\":-1,\"modHorns\":-1,\"pearlescentColor\":0,\"fuelLevel\":14,\"modVanityPlate\":-1,\"modRightFender\":-1,\"color1\":[0,0,0],\"modHood\":-1,\"dashboardColor\":0,\"oilLevel\":5,\"modSuspension\":3,\"modTrunk\":-1,\"modSpoilers\":-1,\"modSmokeEnabled\":false,\"plateIndex\":1,\"modSubwoofer\":-1,\"wheelWidth\":1.0,\"modGrille\":-1,\"wheelColor\":156,\"modExhaust\":-1,\"modDoorR\":-1,\"modSteeringWheel\":-1,\"paintType1\":1,\"modTrimB\":-1,\"modStruts\":-1,\"modFrame\":-1,\"modTurbo\":true,\"modOrnaments\":-1,\"modRoofLivery\":-1,\"modFender\":-1,\"engineHealth\":1000,\"modShifterLeavers\":-1,\"bodyHealth\":914,\"modTransmission\":2,\"modLivery\":-1,\"modDial\":-1,\"livery\":-1,\"modXenon\":true,\"color2\":[255,0,0],\"modWindows\":-1,\"model\":-37895182,\"wheelSize\":1.0,\"extras\":[]}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'LQH 000', '{\"modStruts\":-1,\"modRearBumper\":-1,\"modArmor\":-1,\"modHydraulics\":false,\"modHorns\":-1,\"modDial\":-1,\"wheelWidth\":0.0,\"livery\":-1,\"tyres\":[],\"plateIndex\":1,\"dirtLevel\":3,\"modDoorSpeaker\":-1,\"modTrimB\":-1,\"oilLevel\":5,\"engineHealth\":998,\"color2\":[255,0,0],\"modSteeringWheel\":-1,\"modArchCover\":-1,\"neonEnabled\":[false,false,false,false],\"modTransmission\":-1,\"modOrnaments\":-1,\"modLightbar\":-1,\"modSuspension\":-1,\"modDoorR\":-1,\"driftTyres\":false,\"modFender\":-1,\"modSpoilers\":-1,\"modCustomTiresR\":false,\"modAPlate\":-1,\"modAirFilter\":-1,\"modExhaust\":-1,\"xenonColor\":8,\"modFrontWheels\":-1,\"paintType2\":0,\"bulletProofTyres\":true,\"modSideSkirt\":-1,\"modNitrous\":-1,\"extras\":[],\"bodyHealth\":999,\"paintType1\":0,\"windowTint\":1,\"windows\":[4,5],\"dashboardColor\":0,\"modFrame\":-1,\"modTank\":-1,\"color1\":[0,0,0],\"modLivery\":-1,\"plate\":\"LQH 000 \",\"modWindows\":-1,\"modTrunk\":-1,\"modTrimA\":-1,\"modPlateHolder\":-1,\"modBrakes\":-1,\"modGrille\":-1,\"modSmokeEnabled\":false,\"neonColor\":[255,0,255],\"modEngineBlock\":-1,\"wheelColor\":156,\"tyreSmokeColor\":[255,255,255],\"wheelSize\":0.0,\"model\":-228528329,\"modEngine\":-1,\"modCustomTiresF\":false,\"modSpeakers\":-1,\"modSeats\":-1,\"doors\":[],\"tankHealth\":1000,\"modSubwoofer\":-1,\"modAerials\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modTurbo\":true,\"pearlescentColor\":0,\"modRoof\":-1,\"modHydrolic\":-1,\"fuelLevel\":43,\"modVanityPlate\":-1,\"modShifterLeavers\":-1,\"modRoofLivery\":-1,\"modRightFender\":-1,\"wheels\":5,\"interiorColor\":0,\"modFrontBumper\":-1,\"modBackWheels\":-1,\"modXenon\":true}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 0, 0, 'LZF 092', '{\"plate\":\"LZF 092 \",\"modTransmission\":2,\"wheels\":7,\"modArchCover\":-1,\"modSpoilers\":-1,\"modLivery\":-1,\"extras\":[],\"modBackWheels\":-1,\"modNitrous\":-1,\"modTank\":-1,\"modEngine\":3,\"color1\":[0,0,0],\"wheelWidth\":0.59639757871627,\"modRoofLivery\":-1,\"driftTyres\":false,\"modRoof\":-1,\"modFender\":-1,\"interiorColor\":0,\"modDashboard\":-1,\"modFrame\":-1,\"modWindows\":-1,\"engineHealth\":1000,\"wheelColor\":0,\"modTrimA\":-1,\"modLightbar\":-1,\"tankHealth\":1000,\"color2\":[255,0,0],\"dirtLevel\":0,\"modHorns\":-1,\"paintType2\":7,\"bodyHealth\":999,\"windowTint\":1,\"modXenon\":true,\"tyreSmokeColor\":[255,255,255],\"modVanityPlate\":-1,\"modShifterLeavers\":-1,\"modRightFender\":-1,\"modTrimB\":-1,\"modSubwoofer\":-1,\"modPlateHolder\":-1,\"oilLevel\":5,\"modSideSkirt\":-1,\"modDoorR\":-1,\"modArmor\":4,\"modEngineBlock\":-1,\"modSmokeEnabled\":false,\"modTrunk\":-1,\"modAPlate\":-1,\"modExhaust\":-1,\"modSuspension\":-1,\"modAirFilter\":-1,\"modBrakes\":2,\"modSpeakers\":-1,\"modSteeringWheel\":-1,\"paintType1\":7,\"modTurbo\":true,\"modGrille\":-1,\"livery\":6,\"modFrontWheels\":4,\"model\":-1684776591,\"dashboardColor\":0,\"xenonColor\":2,\"modFrontBumper\":-1,\"bulletProofTyres\":true,\"windows\":[0,1,2,3,4,5,6,7],\"modCustomTiresF\":false,\"neonColor\":[255,0,255],\"modHydraulics\":false,\"tyres\":[],\"neonEnabled\":[false,false,false,false],\"modCustomTiresR\":false,\"modStruts\":-1,\"modHydrolic\":-1,\"pearlescentColor\":6,\"wheelSize\":0.69500505924224,\"fuelLevel\":200,\"modOrnaments\":-1,\"doors\":[],\"modDoorSpeaker\":-1,\"modDial\":-1,\"modSeats\":-1,\"modHood\":-1,\"modAerials\":-1,\"plateIndex\":1,\"modRearBumper\":-1}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'MEZ 008', '{\"modExhaust\":-1,\"driftTyres\":false,\"plate\":\"MEZ 008 \",\"windows\":[2,4,5,7],\"tankHealth\":990,\"modSubwoofer\":-1,\"modDashboard\":-1,\"fuelLevel\":75,\"modTrimB\":-1,\"tyreSmokeColor\":[255,255,255],\"modTrunk\":-1,\"modPlateHolder\":-1,\"modFender\":-1,\"color2\":[255,0,0],\"modBackWheels\":-1,\"modHood\":-1,\"livery\":-1,\"modHydrolic\":-1,\"modSpoilers\":-1,\"modArmor\":2,\"oilLevel\":12,\"modSteeringWheel\":-1,\"modTrimA\":-1,\"color1\":[255,255,255],\"modDoorSpeaker\":-1,\"pearlescentColor\":0,\"modBrakes\":2,\"modRightFender\":-1,\"neonEnabled\":[false,false,false,false],\"modEngineBlock\":-1,\"extras\":[],\"modSmokeEnabled\":false,\"modFrontBumper\":-1,\"paintType1\":7,\"dirtLevel\":11,\"modSeats\":-1,\"modTank\":-1,\"engineHealth\":999,\"modVanityPlate\":-1,\"modRearBumper\":-1,\"wheelSize\":0.69428825378417,\"modCustomTiresR\":false,\"bulletProofTyres\":true,\"modTransmission\":2,\"modRoof\":-1,\"modShifterLeavers\":-1,\"interiorColor\":0,\"modSideSkirt\":-1,\"doors\":[],\"modRoofLivery\":-1,\"model\":-842422329,\"modDial\":-1,\"modLivery\":-1,\"wheelWidth\":0.55756855010986,\"modGrille\":-1,\"modAirFilter\":-1,\"modOrnaments\":-1,\"modHorns\":-1,\"modXenon\":true,\"modNitrous\":-1,\"modArchCover\":-1,\"neonColor\":[255,0,255],\"plateIndex\":1,\"modCustomTiresF\":false,\"modAerials\":-1,\"wheels\":7,\"modFrontWheels\":4,\"modStruts\":-1,\"bodyHealth\":946,\"modHydraulics\":false,\"modFrame\":-1,\"modSpeakers\":-1,\"tyres\":[],\"xenonColor\":8,\"modWindows\":-1,\"modLightbar\":-1,\"modSuspension\":2,\"modDoorR\":-1,\"dashboardColor\":0,\"modTurbo\":true,\"paintType2\":7,\"wheelColor\":134,\"modEngine\":3,\"modAPlate\":-1,\"windowTint\":1}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'MHV 358', '{\"modStruts\":-1,\"modRearBumper\":-1,\"modArmor\":4,\"modHydraulics\":false,\"modHorns\":-1,\"modDial\":-1,\"wheelWidth\":1.0,\"livery\":-1,\"tyres\":[],\"plateIndex\":1,\"dirtLevel\":5,\"modDoorSpeaker\":-1,\"modTrimB\":-1,\"oilLevel\":5,\"engineHealth\":1000,\"color2\":[0,0,0],\"modSteeringWheel\":-1,\"modArchCover\":-1,\"neonEnabled\":[false,false,false,false],\"modTransmission\":2,\"modOrnaments\":-1,\"modLightbar\":-1,\"modSuspension\":3,\"modDoorR\":-1,\"driftTyres\":false,\"modFender\":-1,\"modSpoilers\":-1,\"modCustomTiresR\":false,\"modAPlate\":-1,\"modAirFilter\":-1,\"modExhaust\":-1,\"xenonColor\":8,\"modFrontWheels\":-1,\"paintType2\":1,\"bulletProofTyres\":true,\"modSideSkirt\":-1,\"modNitrous\":-1,\"extras\":[0],\"bodyHealth\":988,\"paintType1\":1,\"windowTint\":1,\"windows\":[4,5],\"dashboardColor\":0,\"modFrame\":-1,\"modTank\":-1,\"color1\":[41,41,41],\"modLivery\":-1,\"plate\":\"MHV 358 \",\"modWindows\":-1,\"modTrunk\":-1,\"modTrimA\":-1,\"modPlateHolder\":-1,\"modBrakes\":2,\"modGrille\":-1,\"modSmokeEnabled\":false,\"neonColor\":[255,0,255],\"modEngineBlock\":-1,\"wheelColor\":8,\"tyreSmokeColor\":[255,255,255],\"wheelSize\":1.0,\"model\":-698663530,\"modEngine\":3,\"modCustomTiresF\":false,\"modSpeakers\":-1,\"modSeats\":-1,\"doors\":[],\"tankHealth\":1000,\"modSubwoofer\":-1,\"modAerials\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modTurbo\":true,\"pearlescentColor\":16,\"modRoof\":-1,\"modHydrolic\":-1,\"fuelLevel\":35,\"modVanityPlate\":-1,\"modShifterLeavers\":-1,\"modRoofLivery\":-1,\"modRightFender\":-1,\"wheels\":1,\"interiorColor\":0,\"modFrontBumper\":-1,\"modBackWheels\":-1,\"modXenon\":true}', 'car', NULL, 1, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 0, 0, 'MRV 868', '{\"model\":-842422329,\"plate\":\"MRV 868\"}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `owned_vehicles` (`amigos`, `owner`, `state`, `garageperso`, `plate`, `vehicle`, `type`, `job`, `stored`, `parking`, `pound`, `calle`, `mileage`, `glovebox`, `trunk`, `lastparking`, `lastposition`, `carseller`) VALUES
(NULL, 'char1:b42b206cb9676c013317ee3b92d5e19e2314bb26', 0, 0, 'NDL 743', '{\"modCustomTiresF\":false,\"modFrontWheels\":-1,\"plate\":\"NDL 743 \",\"modTransmission\":-1,\"color2\":[8,8,8],\"modAirFilter\":-1,\"doors\":[],\"wheelSize\":1.0,\"modLightbar\":-1,\"modVanityPlate\":-1,\"fuelLevel\":80,\"tyres\":[],\"modStruts\":-1,\"extras\":[],\"neonColor\":[255,0,255],\"modArchCover\":-1,\"modGrille\":-1,\"modXenon\":false,\"modRoofLivery\":-1,\"windows\":[4,5,7],\"modOrnaments\":-1,\"interiorColor\":0,\"tyreSmokeColor\":[255,255,255],\"model\":-33136529,\"modSteeringWheel\":-1,\"livery\":0,\"windowTint\":-1,\"modExhaust\":-1,\"plateIndex\":3,\"modPlateHolder\":-1,\"modHydraulics\":false,\"modShifterLeavers\":-1,\"dashboardColor\":0,\"bulletProofTyres\":true,\"modBrakes\":-1,\"modHood\":-1,\"paintType1\":7,\"modRightFender\":-1,\"modTurbo\":false,\"wheelWidth\":1.0,\"engineHealth\":988,\"modWindows\":-1,\"modSpoilers\":-1,\"modFender\":-1,\"modAPlate\":-1,\"bodyHealth\":945,\"modSmokeEnabled\":false,\"pearlescentColor\":16,\"modArmor\":-1,\"modTrimA\":-1,\"modDoorSpeaker\":-1,\"paintType2\":7,\"dirtLevel\":2,\"modEngineBlock\":-1,\"modHorns\":-1,\"modNitrous\":-1,\"modSuspension\":-1,\"modSubwoofer\":-1,\"modRearBumper\":-1,\"modBackWheels\":-1,\"xenonColor\":255,\"modTrunk\":-1,\"modRoof\":-1,\"modLivery\":-1,\"modFrontBumper\":-1,\"modDashboard\":-1,\"modCustomTiresR\":false,\"modEngine\":-1,\"modDial\":-1,\"wheels\":4,\"color1\":[0,0,0],\"neonEnabled\":[false,false,false,false],\"oilLevel\":5,\"driftTyres\":false,\"modDoorR\":-1,\"modTank\":-1,\"modSpeakers\":-1,\"modSeats\":-1,\"tankHealth\":985,\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modTrimB\":-1,\"modAerials\":-1,\"wheelColor\":1,\"modFrame\":-1}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, '[{\"metadata\":{\"plate\":\"UIU 947\",\"description\":\"\\n   · Plaque d\'immatriculation:  UIU 947   \\n   · Models: DLRS3\"},\"name\":\"carkey\",\"slot\":1,\"count\":1}]', NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 0, 0, 'NZB 328', '{\"livery\":0,\"modVanityPlate\":-1,\"modShifterLeavers\":-1,\"plate\":\"NZB 328 \",\"modStruts\":-1,\"interiorColor\":134,\"neonEnabled\":[false,false,false,false],\"modPlateHolder\":-1,\"wheelSize\":1.0,\"modTransmission\":-1,\"modSteeringWheel\":-1,\"modEngineBlock\":-1,\"windowTint\":-1,\"modSeats\":-1,\"tankHealth\":1000,\"modLivery\":-1,\"wheelWidth\":1.0,\"wheels\":0,\"pearlescentColor\":131,\"modSubwoofer\":-1,\"modGrille\":-1,\"modRoofLivery\":-1,\"modLightbar\":-1,\"modFrame\":-1,\"bulletProofTyres\":true,\"modExhaust\":-1,\"windows\":[4,5],\"modArchCover\":-1,\"bodyHealth\":994,\"modNitrous\":-1,\"engineHealth\":994,\"color2\":121,\"doors\":[],\"fuelLevel\":100,\"modTrimB\":-1,\"modHydrolic\":-1,\"modWindows\":-1,\"modTrimA\":-1,\"modSmokeEnabled\":false,\"modSideSkirt\":-1,\"modHood\":-1,\"modFrontWheels\":-1,\"modRightFender\":-1,\"plateIndex\":0,\"modHorns\":-1,\"driftTyres\":false,\"model\":-697151129,\"neonColor\":[255,0,255],\"extras\":[null,1,1,0],\"modSpeakers\":-1,\"modAerials\":-1,\"modOrnaments\":-1,\"modSpoilers\":-1,\"dashboardColor\":134,\"modArmor\":-1,\"modDoorSpeaker\":-1,\"paintType1\":7,\"modBrakes\":-1,\"modDashboard\":-1,\"oilLevel\":5,\"wheelColor\":156,\"modAPlate\":-1,\"tyres\":[],\"modEngine\":-1,\"tyreSmokeColor\":[255,255,255],\"modAirFilter\":-1,\"modDoorR\":-1,\"paintType2\":7,\"modHydraulics\":false,\"modTrunk\":-1,\"color1\":8,\"modSuspension\":-1,\"modTurbo\":false,\"modBackWheels\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"modRoof\":-1,\"dirtLevel\":5,\"modDial\":-1,\"modXenon\":false,\"modCustomTiresF\":false,\"modTank\":-1,\"modCustomTiresR\":false,\"modFender\":-1,\"xenonColor\":255}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:4634506b65176f2c2aa6a1af9831d3efbd168ee0', 0, 0, 'NZY 218', '{\"model\":718169509,\"plate\":\"NZY 218\"}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 0, 0, 'OLL 948', '{\"modStruts\":-1,\"modRearBumper\":-1,\"modArmor\":2,\"modHydraulics\":false,\"modHorns\":-1,\"modDial\":-1,\"wheelWidth\":0.68161070346832,\"livery\":-1,\"tyres\":[],\"plateIndex\":1,\"dirtLevel\":1,\"modDoorSpeaker\":-1,\"modTrimB\":-1,\"oilLevel\":12,\"engineHealth\":999,\"modBrakes\":2,\"modSteeringWheel\":-1,\"modArchCover\":-1,\"model\":577497474,\"wheels\":7,\"modOrnaments\":-1,\"modLightbar\":-1,\"tankHealth\":1000,\"modDoorR\":-1,\"driftTyres\":false,\"modFender\":-1,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"modAPlate\":-1,\"modAirFilter\":-1,\"modExhaust\":-1,\"xenonColor\":2,\"modFrontWheels\":6,\"paintType2\":7,\"bulletProofTyres\":true,\"modSideSkirt\":-1,\"modHydrolic\":-1,\"extras\":[],\"bodyHealth\":999,\"paintType1\":7,\"windowTint\":1,\"windows\":[4,5],\"dashboardColor\":0,\"modFrame\":-1,\"modTank\":-1,\"color1\":[39,26,59],\"modLivery\":-1,\"plate\":\"OLL 948 \",\"modWindows\":-1,\"modTrunk\":-1,\"modTrimA\":-1,\"modPlateHolder\":-1,\"neonEnabled\":[false,false,false,false],\"interiorColor\":0,\"modSmokeEnabled\":true,\"modRightFender\":-1,\"modEngineBlock\":-1,\"wheelColor\":0,\"tyreSmokeColor\":[0,0,0],\"wheelSize\":0.70891845226287,\"modTurbo\":true,\"modSuspension\":2,\"modCustomTiresF\":false,\"modSpeakers\":-1,\"doors\":[],\"modCustomTiresR\":false,\"modSeats\":-1,\"modNitrous\":-1,\"modGrille\":-1,\"neonColor\":[255,0,255],\"modDashboard\":-1,\"modSubwoofer\":-1,\"pearlescentColor\":0,\"fuelLevel\":97,\"modRoofLivery\":-1,\"modEngine\":3,\"modXenon\":true,\"modTransmission\":2,\"modHood\":-1,\"color2\":[255,255,255],\"modShifterLeavers\":-1,\"modRoof\":-1,\"modFrontBumper\":-1,\"modBackWheels\":-1,\"modAerials\":-1}', 'car', NULL, 1, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'OMT 717', '{\"bodyHealth\":999,\"modStruts\":-1,\"modFender\":-1,\"modDial\":-1,\"livery\":-1,\"modArmor\":-1,\"modAPlate\":-1,\"modFrontWheels\":-1,\"modBackWheels\":-1,\"tyres\":[],\"modTank\":-1,\"model\":100509671,\"modFrontBumper\":-1,\"plateIndex\":0,\"modWindows\":-1,\"neonEnabled\":[false,false,false,false],\"windowTint\":-1,\"pearlescentColor\":50,\"wheelSize\":0.0,\"modGrille\":-1,\"modFrame\":-1,\"windows\":[4,5],\"paintType2\":7,\"doors\":[],\"modSpoilers\":-1,\"modBrakes\":-1,\"oilLevel\":5,\"modRoofLivery\":-1,\"color2\":27,\"modHood\":-1,\"modLivery\":-1,\"engineHealth\":999,\"modSubwoofer\":-1,\"modAerials\":-1,\"modEngineBlock\":-1,\"modRearBumper\":-1,\"modSmokeEnabled\":false,\"bulletProofTyres\":true,\"wheelWidth\":0.0,\"interiorColor\":0,\"plate\":\"OMT 717 \",\"modShifterLeavers\":-1,\"modCustomTiresF\":false,\"fuelLevel\":38,\"modTrimB\":-1,\"modXenon\":false,\"modSideSkirt\":-1,\"modLightbar\":-1,\"modOrnaments\":-1,\"modRightFender\":-1,\"neonColor\":[255,0,255],\"modHorns\":-1,\"modAirFilter\":-1,\"wheels\":0,\"modVanityPlate\":-1,\"color1\":50,\"modTransmission\":-1,\"extras\":[0,0,0],\"modArchCover\":-1,\"tyreSmokeColor\":[255,255,255],\"dashboardColor\":0,\"dirtLevel\":7,\"paintType1\":7,\"modSeats\":-1,\"modHydrolic\":-1,\"modHydraulics\":false,\"tankHealth\":1000,\"modEngine\":-1,\"modPlateHolder\":-1,\"modExhaust\":-1,\"modDoorSpeaker\":-1,\"modDoorR\":-1,\"wheelColor\":3,\"modTrunk\":-1,\"modNitrous\":-1,\"modSpeakers\":-1,\"modTurbo\":false,\"modSteeringWheel\":-1,\"driftTyres\":false,\"modTrimA\":-1,\"modCustomTiresR\":false,\"modSuspension\":-1,\"xenonColor\":255,\"modDashboard\":-1,\"modRoof\":-1}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'ONB 618', '{\"plate\":\"ONB 618\",\"model\":-48052524}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 0, 0, 'OXU 685', '{\"neonColor\":[255,0,255],\"wheelColor\":156,\"dirtLevel\":3.0,\"modFender\":-1,\"modFrontWheels\":-1,\"modSmokeEnabled\":false,\"extras\":{\"11\":1,\"10\":false},\"bodyHealth\":1000.0,\"modArchCover\":-1,\"modTank\":-1,\"dashboardColor\":0,\"engineHealth\":1000.0,\"modAerials\":-1,\"modArmor\":-1,\"modBrakes\":-1,\"fuelLevel\":25.1,\"doorsBroken\":{\"0\":false,\"6\":false,\"5\":false,\"4\":false,\"3\":false,\"2\":false,\"1\":false},\"modSideSkirt\":-1,\"xenonColor\":255,\"modHydrolic\":-1,\"windowTint\":-1,\"modStruts\":-1,\"modTurbo\":false,\"modEngine\":-1,\"modGrille\":-1,\"color1\":27,\"modSeats\":-1,\"modTransmission\":-1,\"modFrame\":-1,\"modRightFender\":-1,\"modShifterLeavers\":-1,\"modRoofLivery\":-1,\"modHood\":-1,\"modEngineBlock\":-1,\"modDashboard\":-1,\"modTrimA\":-1,\"modAPlate\":-1,\"windowsBroken\":{\"0\":false,\"7\":false,\"6\":false,\"5\":true,\"4\":true,\"3\":false,\"2\":false,\"1\":false},\"tyreSmokeColor\":[255,255,255],\"wheels\":4,\"modOrnaments\":-1,\"modLightbar\":-1,\"plate\":\"OXU 685\",\"modDoorSpeaker\":-1,\"modDial\":-1,\"modHorns\":-1,\"modWindows\":-1,\"tyreBurst\":{\"0\":false,\"4\":false,\"1\":false,\"5\":false},\"modRearBumper\":-1,\"modTrimB\":-1,\"modSuspension\":-1,\"pearlescentColor\":0,\"model\":-1680180336,\"modRoof\":-1,\"modXenon\":false,\"modAirFilter\":-1,\"modSteeringWheel\":-1,\"modBackWheels\":-1,\"modSpoilers\":-1,\"modSpeakers\":-1,\"color2\":27,\"modPlateHolder\":-1,\"modCustomFrontWheels\":false,\"modTrunk\":-1,\"tankHealth\":1000.0,\"neonEnabled\":[false,false,false,false],\"modCustomBackWheels\":false,\"modFrontBumper\":-1,\"plateIndex\":4,\"modExhaust\":-1,\"interiorColor\":0,\"tyresCanBurst\":1,\"modLivery\":0,\"modVanityPlate\":-1}', 'car', 'ambulance', 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'PBC 531', '{\"wheels\":7,\"modStruts\":-1,\"modFender\":-1,\"modDial\":-1,\"livery\":-1,\"modArmor\":4,\"modAPlate\":-1,\"modFrontWheels\":33,\"modBackWheels\":-1,\"tyres\":[],\"modTank\":-1,\"model\":-532475078,\"modFrontBumper\":-1,\"plateIndex\":1,\"modWindows\":-1,\"neonEnabled\":[false,false,false,false],\"modTurbo\":true,\"pearlescentColor\":0,\"wheelSize\":0.74264937639236,\"modGrille\":-1,\"modFrame\":-1,\"windows\":[4,5,7],\"modCustomTiresF\":false,\"doors\":[],\"modXenon\":false,\"tyreSmokeColor\":[255,255,255],\"modSideSkirt\":-1,\"modRoofLivery\":-1,\"color2\":[8,8,8],\"modHood\":-1,\"modAirFilter\":-1,\"engineHealth\":999,\"modSubwoofer\":-1,\"modAerials\":-1,\"modEngineBlock\":-1,\"modRearBumper\":-1,\"modSmokeEnabled\":false,\"bulletProofTyres\":true,\"interiorColor\":0,\"modSeats\":-1,\"modSpoilers\":-1,\"modLivery\":-1,\"modSteeringWheel\":-1,\"fuelLevel\":87,\"plate\":\"PBC 531 \",\"modHydraulics\":false,\"modHorns\":-1,\"modTrimB\":-1,\"modOrnaments\":-1,\"modRightFender\":-1,\"modLightbar\":-1,\"bodyHealth\":993,\"windowTint\":-1,\"modArchCover\":-1,\"color1\":[8,8,8],\"modNitrous\":-1,\"modTransmission\":2,\"extras\":[1],\"modVanityPlate\":-1,\"paintType1\":7,\"dashboardColor\":0,\"dirtLevel\":0,\"modTrunk\":-1,\"modEngine\":3,\"modHydrolic\":-1,\"modBrakes\":2,\"oilLevel\":5,\"modShifterLeavers\":-1,\"modPlateHolder\":-1,\"modExhaust\":-1,\"modDoorSpeaker\":-1,\"modDoorR\":-1,\"tankHealth\":998,\"modSpeakers\":-1,\"paintType2\":7,\"neonColor\":[255,0,255],\"wheelColor\":156,\"modDashboard\":-1,\"driftTyres\":false,\"modTrimA\":-1,\"modCustomTiresR\":false,\"modSuspension\":3,\"xenonColor\":255,\"wheelWidth\":0.64002066850662,\"modRoof\":-1}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'PGP 719', '{\"modStruts\":-1,\"modRearBumper\":-1,\"modArmor\":2,\"modHydraulics\":false,\"modHorns\":-1,\"modDial\":-1,\"wheelWidth\":0.65741223096847,\"livery\":-1,\"tyres\":[],\"plateIndex\":1,\"dirtLevel\":0,\"modDoorSpeaker\":-1,\"modTrimB\":-1,\"oilLevel\":6,\"engineHealth\":999,\"color2\":[255,255,255],\"modSteeringWheel\":-1,\"modArchCover\":-1,\"neonEnabled\":[false,false,false,false],\"modTransmission\":2,\"modOrnaments\":-1,\"modLightbar\":-1,\"modSuspension\":2,\"modDoorR\":-1,\"driftTyres\":false,\"modFender\":-1,\"modSpoilers\":-1,\"modCustomTiresR\":false,\"modAPlate\":-1,\"modAirFilter\":-1,\"modExhaust\":-1,\"xenonColor\":2,\"modFrontWheels\":24,\"paintType2\":7,\"bulletProofTyres\":true,\"modSideSkirt\":-1,\"modNitrous\":-1,\"extras\":[0,null,1,1,1],\"bodyHealth\":942,\"paintType1\":7,\"windowTint\":1,\"windows\":[0,1,2,3,4,5,7],\"dashboardColor\":0,\"modFrame\":-1,\"modTank\":-1,\"color1\":[255,0,0],\"modLivery\":-1,\"plate\":\"PGP 719 \",\"modWindows\":-1,\"modTrunk\":-1,\"modTrimA\":-1,\"modPlateHolder\":-1,\"modBrakes\":2,\"modGrille\":-1,\"modSmokeEnabled\":false,\"neonColor\":[255,0,255],\"modEngineBlock\":-1,\"wheelColor\":134,\"tyreSmokeColor\":[255,255,255],\"wheelSize\":0.68245059251785,\"model\":-910466076,\"modEngine\":3,\"modCustomTiresF\":false,\"modSpeakers\":-1,\"modSeats\":-1,\"doors\":[],\"tankHealth\":1000,\"modSubwoofer\":-1,\"modAerials\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modTurbo\":true,\"pearlescentColor\":0,\"modRoof\":-1,\"modHydrolic\":-1,\"fuelLevel\":90,\"modVanityPlate\":-1,\"modShifterLeavers\":-1,\"modRoofLivery\":-1,\"modRightFender\":-1,\"wheels\":7,\"interiorColor\":0,\"modFrontBumper\":-1,\"modBackWheels\":-1,\"modXenon\":true}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 0, 0, 'QFF 705', '{\"plate\":\"QFF 705\",\"model\":-1047713792}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 0, 0, 'RAF 840', '{\"model\":-1323681073,\"plate\":\"RAF 840\"}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 0, 0, 'RBO 611', '{\"fuelLevel\":57,\"modLivery\":-1,\"modOrnaments\":-1,\"model\":2009317678,\"tyreSmokeColor\":[255,255,255],\"pearlescentColor\":0,\"modTransmission\":2,\"modNitrous\":-1,\"modHood\":4,\"windowTint\":1,\"modDashboard\":-1,\"modShifterLeavers\":-1,\"modTrimB\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modEngine\":3,\"windows\":[4,5],\"livery\":-1,\"modSteeringWheel\":-1,\"bodyHealth\":913,\"modRearBumper\":3,\"modAPlate\":-1,\"modStruts\":-1,\"modHydrolic\":-1,\"modHydraulics\":false,\"engineHealth\":993,\"wheelWidth\":1.0,\"extras\":[],\"dirtLevel\":2,\"color2\":0,\"plateIndex\":1,\"modTurbo\":true,\"modRoof\":-1,\"modArmor\":1,\"wheelSize\":1.0,\"plate\":\"RBO 611 \",\"modRoofLivery\":-1,\"modSmokeEnabled\":false,\"modGrille\":-1,\"neonEnabled\":[true,true,true,true],\"modExhaust\":2,\"modTank\":-1,\"xenonColor\":11,\"modDoorR\":-1,\"driftTyres\":false,\"modWindows\":-1,\"wheels\":0,\"modSpeakers\":-1,\"modLightbar\":-1,\"tyres\":[],\"dashboardColor\":117,\"modBrakes\":2,\"paintType1\":7,\"modBackWheels\":-1,\"interiorColor\":27,\"modCustomTiresF\":false,\"modXenon\":true,\"modFrontWheels\":-1,\"modFrontBumper\":5,\"modCustomTiresR\":false,\"neonColor\":[140,0,255],\"modFrame\":-1,\"modAerials\":-1,\"oilLevel\":5,\"modHorns\":-1,\"modSubwoofer\":-1,\"modSeats\":-1,\"modSideSkirt\":2,\"modRightFender\":-1,\"bulletProofTyres\":true,\"modFender\":-1,\"modTrunk\":-1,\"modDial\":-1,\"paintType2\":7,\"modDoorSpeaker\":-1,\"wheelColor\":0,\"tankHealth\":993,\"modVanityPlate\":-1,\"modSpoilers\":3,\"doors\":[],\"color1\":[72,0,255],\"modAirFilter\":-1,\"modTrimA\":-1,\"modEngineBlock\":-1,\"modPlateHolder\":-1}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 0, 0, 'RJJ 670', '{\"model\":497572160,\"plate\":\"RJJ 670\"}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 0, 0, 'RUC 114', '{\"modRearBumper\":-1,\"modTrimB\":-1,\"modSuspension\":-1,\"bodyHealth\":999,\"modCustomTiresR\":false,\"modArchCover\":-1,\"modFrame\":-1,\"wheels\":7,\"livery\":-1,\"modSmokeEnabled\":true,\"modSpeakers\":-1,\"modCustomTiresF\":false,\"driftTyres\":false,\"engineHealth\":1000,\"bulletProofTyres\":true,\"modSubwoofer\":-1,\"modRightFender\":-1,\"pearlescentColor\":0,\"plate\":\"RUC 114 \",\"modLightbar\":-1,\"modWindows\":-1,\"modStruts\":-1,\"modShifterLeavers\":-1,\"paintType2\":7,\"modArmor\":2,\"modLivery\":-1,\"modSideSkirt\":-1,\"modTrimA\":-1,\"modTrunk\":-1,\"modTurbo\":true,\"modHorns\":-1,\"modNitrous\":-1,\"extras\":[],\"neonColor\":[0,221,255],\"paintType1\":7,\"modSteeringWheel\":-1,\"modFender\":-1,\"modEngineBlock\":-1,\"fuelLevel\":52,\"modAPlate\":-1,\"modHood\":-1,\"modExhaust\":-1,\"modXenon\":true,\"wheelColor\":0,\"modDial\":-1,\"modTransmission\":3,\"modDoorR\":-1,\"color1\":[0,174,255],\"modDoorSpeaker\":-1,\"model\":836213613,\"neonEnabled\":[true,true,true,true],\"oilLevel\":5,\"tankHealth\":1000,\"modPlateHolder\":-1,\"modBackWheels\":-1,\"modEngine\":4,\"modHydraulics\":false,\"modVanityPlate\":-1,\"tyreSmokeColor\":[0,229,255],\"interiorColor\":31,\"modTank\":-1,\"modDashboard\":-1,\"modSeats\":-1,\"doors\":[],\"modRoofLivery\":-1,\"windowTint\":1,\"modGrille\":-1,\"wheelWidth\":1.0,\"modAerials\":-1,\"windows\":[],\"modSpoilers\":-1,\"xenonColor\":2,\"modAirFilter\":-1,\"tyres\":[],\"modHydrolic\":-1,\"wheelSize\":1.0,\"color2\":112,\"modFrontWheels\":-1,\"modBrakes\":2,\"dashboardColor\":31,\"modFrontBumper\":-1,\"modRoof\":-1,\"plateIndex\":1,\"modOrnaments\":-1,\"dirtLevel\":10}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', 0, 0, 'RWV 160', '{\"modDial\":-1,\"modRightFender\":-1,\"dashboardColor\":0,\"modTank\":-1,\"fuelLevel\":68,\"engineHealth\":956,\"plateIndex\":1,\"wheels\":0,\"modVanityPlate\":-1,\"modAPlate\":-1,\"color1\":[115,0,255],\"modTurbo\":false,\"modTrimA\":-1,\"modTrimB\":-1,\"modFrontWheels\":-1,\"modHorns\":-1,\"tankHealth\":980,\"modXenon\":true,\"pearlescentColor\":2,\"modRoofLivery\":-1,\"modDoorR\":-1,\"modSuspension\":-1,\"wheelWidth\":1.0,\"modPlateHolder\":-1,\"modSpeakers\":-1,\"modNitrous\":-1,\"modTransmission\":-1,\"modSeats\":-1,\"modRoof\":-1,\"modDashboard\":-1,\"modArchCover\":-1,\"modTrunk\":-1,\"modAirFilter\":-1,\"modHydrolic\":-1,\"paintType1\":0,\"livery\":-1,\"dirtLevel\":11,\"driftTyres\":false,\"modGrille\":-1,\"modHood\":-1,\"bodyHealth\":924,\"tyreSmokeColor\":[255,255,255],\"modHydraulics\":false,\"modShifterLeavers\":-1,\"modLivery\":-1,\"color2\":120,\"oilLevel\":5,\"modCustomTiresF\":false,\"modFrame\":-1,\"modBackWheels\":-1,\"modFender\":-1,\"modRearBumper\":-1,\"tyres\":[],\"modSteeringWheel\":-1,\"modSmokeEnabled\":false,\"modLightbar\":-1,\"interiorColor\":0,\"modBrakes\":-1,\"modFrontBumper\":-1,\"extras\":[null,1],\"bulletProofTyres\":true,\"modAerials\":-1,\"windows\":[],\"modDoorSpeaker\":-1,\"modCustomTiresR\":false,\"modWindows\":-1,\"model\":-1323681073,\"modSpoilers\":-1,\"modSubwoofer\":-1,\"modExhaust\":-1,\"modOrnaments\":-1,\"wheelColor\":0,\"modArmor\":-1,\"doors\":[],\"plate\":\"RWV 160 \",\"modSideSkirt\":-1,\"neonEnabled\":[true,true,true,true],\"modStruts\":-1,\"neonColor\":[174,0,255],\"xenonColor\":11,\"windowTint\":1,\"paintType2\":7,\"wheelSize\":1.0,\"modEngineBlock\":-1,\"modEngine\":-1}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'SBG 761', '{\"modStruts\":-1,\"modRearBumper\":-1,\"modArmor\":2,\"modHydraulics\":false,\"modHorns\":-1,\"modDial\":-1,\"wheelWidth\":1.0,\"livery\":-1,\"tyres\":[],\"plateIndex\":1,\"dirtLevel\":9,\"modDoorSpeaker\":-1,\"modTrimB\":-1,\"oilLevel\":5,\"engineHealth\":1000,\"color2\":[255,255,255],\"modSteeringWheel\":-1,\"modArchCover\":-1,\"neonEnabled\":[false,false,false,false],\"modTransmission\":2,\"modOrnaments\":-1,\"modLightbar\":-1,\"modSuspension\":2,\"modDoorR\":-1,\"driftTyres\":false,\"modFender\":-1,\"modSpoilers\":-1,\"modCustomTiresR\":false,\"modAPlate\":-1,\"modAirFilter\":-1,\"modExhaust\":-1,\"xenonColor\":8,\"modFrontWheels\":-1,\"paintType2\":1,\"bulletProofTyres\":true,\"modSideSkirt\":-1,\"modNitrous\":-1,\"extras\":[],\"bodyHealth\":993,\"paintType1\":1,\"windowTint\":1,\"windows\":[4,5],\"dashboardColor\":0,\"modFrame\":-1,\"modTank\":-1,\"color1\":[0,212,255],\"modLivery\":-1,\"plate\":\"SBG 761 \",\"modWindows\":-1,\"modTrunk\":-1,\"modTrimA\":-1,\"modPlateHolder\":-1,\"modBrakes\":2,\"modGrille\":-1,\"modSmokeEnabled\":false,\"neonColor\":[255,0,255],\"modEngineBlock\":-1,\"wheelColor\":0,\"tyreSmokeColor\":[255,255,255],\"wheelSize\":1.0,\"model\":-208864293,\"modEngine\":3,\"modCustomTiresF\":false,\"modSpeakers\":-1,\"modSeats\":-1,\"doors\":[],\"tankHealth\":998,\"modSubwoofer\":-1,\"modAerials\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modTurbo\":true,\"pearlescentColor\":0,\"modRoof\":-1,\"modHydrolic\":-1,\"fuelLevel\":20,\"modVanityPlate\":-1,\"modShifterLeavers\":-1,\"modRoofLivery\":-1,\"modRightFender\":-1,\"wheels\":0,\"interiorColor\":0,\"modFrontBumper\":-1,\"modBackWheels\":-1,\"modXenon\":true}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:4634506b65176f2c2aa6a1af9831d3efbd168ee0', 0, 0, 'SUG 387', '{\"model\":-842422329,\"plate\":\"SUG 387\"}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'TMB 065', '{\"oilLevel\":5,\"modTrunk\":-1,\"modGrille\":-1,\"modWindows\":-1,\"bodyHealth\":982,\"modCustomTiresR\":false,\"modEngine\":3,\"modPlateHolder\":-1,\"modOrnaments\":-1,\"modRoof\":-1,\"modHydrolic\":-1,\"modSpeakers\":-1,\"paintType1\":1,\"modBrakes\":2,\"modFender\":-1,\"modSubwoofer\":-1,\"windowTint\":1,\"tankHealth\":999,\"neonEnabled\":[false,false,false,false],\"color1\":[255,255,255],\"pearlescentColor\":0,\"modXenon\":true,\"modHood\":-1,\"color2\":[255,0,0],\"extras\":[1],\"modShifterLeavers\":-1,\"tyres\":[],\"modFrontWheels\":-1,\"fuelLevel\":20,\"modTransmission\":2,\"modStruts\":-1,\"modAirFilter\":-1,\"modCustomTiresF\":false,\"model\":123242153,\"wheelSize\":1.0,\"paintType2\":1,\"windows\":[],\"engineHealth\":1000,\"plateIndex\":1,\"modLivery\":-1,\"modHydraulics\":false,\"modAPlate\":-1,\"modNitrous\":-1,\"modAerials\":-1,\"dashboardColor\":0,\"modLightbar\":-1,\"modExhaust\":3,\"modVanityPlate\":-1,\"modDoorR\":-1,\"modFrame\":-1,\"xenonColor\":8,\"bulletProofTyres\":true,\"wheelColor\":156,\"dirtLevel\":8,\"wheelWidth\":1.0,\"modEngineBlock\":-1,\"modBackWheels\":-1,\"modHorns\":-1,\"modTurbo\":true,\"modRearBumper\":-1,\"modSmokeEnabled\":false,\"modDoorSpeaker\":-1,\"modDashboard\":-1,\"wheels\":0,\"modSeats\":-1,\"modArchCover\":-1,\"modArmor\":-1,\"modSideSkirt\":2,\"modSteeringWheel\":-1,\"tyreSmokeColor\":[255,255,255],\"modTank\":-1,\"modRoofLivery\":-1,\"livery\":1,\"modSuspension\":-1,\"modFrontBumper\":4,\"driftTyres\":false,\"plate\":\"TMB 065 \",\"modRightFender\":-1,\"modTrimB\":-1,\"modDial\":-1,\"interiorColor\":0,\"modSpoilers\":7,\"modTrimA\":-1,\"doors\":[],\"neonColor\":[255,0,255]}', 'car', NULL, 1, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:4634506b65176f2c2aa6a1af9831d3efbd168ee0', 0, 0, 'TQN 469', '{\"model\":1093254796,\"plate\":\"TQN 469\"}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 0, 0, 'TRD 667', '{\"modCustomTiresR\":false,\"modTransmission\":2,\"modSuspension\":3,\"windows\":[],\"paintType1\":0,\"modAPlate\":-1,\"modPlateHolder\":-1,\"modLightbar\":-1,\"modRoofLivery\":-1,\"modStruts\":-1,\"modRoof\":-1,\"modArchCover\":-1,\"modHydrolic\":-1,\"color2\":120,\"windowTint\":1,\"modLivery\":-1,\"modAerials\":-1,\"modDoorSpeaker\":-1,\"bodyHealth\":1000,\"modEngineBlock\":-1,\"doors\":[],\"tyreSmokeColor\":[183,0,255],\"modNitrous\":-1,\"neonEnabled\":[true,true,true,true],\"paintType2\":7,\"modSideSkirt\":-1,\"wheelWidth\":1.0,\"oilLevel\":5,\"modSubwoofer\":-1,\"modTank\":-1,\"modFender\":-1,\"modBrakes\":2,\"modBackWheels\":-1,\"modSpoilers\":-1,\"model\":-1323681073,\"dashboardColor\":0,\"wheels\":0,\"modXenon\":true,\"modTrunk\":-1,\"plate\":\"TRD 667 \",\"modFrame\":-1,\"modRightFender\":-1,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"interiorColor\":0,\"fuelLevel\":68,\"modDial\":-1,\"tankHealth\":1000,\"modDashboard\":-1,\"dirtLevel\":8,\"wheelColor\":0,\"color1\":[123,0,255],\"driftTyres\":false,\"bulletProofTyres\":true,\"modSeats\":-1,\"modGrille\":-1,\"xenonColor\":11,\"plateIndex\":1,\"modRearBumper\":-1,\"modArmor\":4,\"modSmokeEnabled\":true,\"extras\":[null,0],\"tyres\":[],\"modTurbo\":true,\"modHood\":-1,\"modVanityPlate\":-1,\"modFrontBumper\":-1,\"modSteeringWheel\":-1,\"wheelSize\":1.0,\"modTrimA\":-1,\"modWindows\":-1,\"modSpeakers\":-1,\"neonColor\":[183,0,255],\"modTrimB\":-1,\"modDoorR\":-1,\"modCustomTiresF\":false,\"engineHealth\":1000,\"pearlescentColor\":0,\"modHydraulics\":false,\"livery\":-1,\"modOrnaments\":-1,\"modFrontWheels\":-1,\"modEngine\":3,\"modHorns\":-1,\"modExhaust\":-1}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 0, 0, 'TRV 434', '{\"model\":577497474,\"plate\":\"TRV 434\"}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 0, 0, 'TYY 908', '{\"wheelWidth\":1.0,\"modArchCover\":-1,\"modStruts\":-1,\"modFrontBumper\":-1,\"modDashboard\":-1,\"modFrame\":-1,\"modTrimB\":-1,\"tyreSmokeColor\":[255,0,0],\"wheelSize\":1.0,\"modHorns\":-1,\"xenonColor\":2,\"modDoorSpeaker\":-1,\"modGrille\":-1,\"doors\":[],\"modTrunk\":-1,\"engineHealth\":1000,\"modHood\":-1,\"extras\":[0,0],\"color1\":[0,0,0],\"tyres\":[],\"modOrnaments\":-1,\"plate\":\"TYY 908 \",\"oilLevel\":5,\"driftTyres\":false,\"dashboardColor\":2,\"modBackWheels\":-1,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"interiorColor\":11,\"modEngineBlock\":-1,\"modSpoilers\":-1,\"modCustomTiresR\":false,\"modSpeakers\":-1,\"color2\":[0,0,0],\"modEngine\":3,\"modCustomTiresF\":false,\"modShifterLeavers\":-1,\"windows\":[4,5],\"modSteeringWheel\":-1,\"modTrimA\":-1,\"windowTint\":1,\"dirtLevel\":0,\"modWindows\":-1,\"modSeats\":-1,\"modAirFilter\":-1,\"modNitrous\":-1,\"modTurbo\":true,\"paintType2\":7,\"modDoorR\":-1,\"bulletProofTyres\":true,\"pearlescentColor\":10,\"livery\":0,\"modHydraulics\":false,\"modLightbar\":-1,\"modAerials\":-1,\"modBrakes\":2,\"modExhaust\":-1,\"wheelColor\":111,\"model\":651296914,\"plateIndex\":1,\"bodyHealth\":988,\"modVanityPlate\":-1,\"modHydrolic\":-1,\"modSuspension\":3,\"modAPlate\":-1,\"paintType1\":7,\"modRightFender\":-1,\"modTransmission\":2,\"modRoofLivery\":-1,\"modXenon\":true,\"modSubwoofer\":-1,\"wheels\":3,\"modPlateHolder\":-1,\"modSideSkirt\":-1,\"modDial\":-1,\"modRearBumper\":-1,\"neonColor\":[255,0,0],\"modRoof\":-1,\"modTank\":-1,\"tankHealth\":999,\"modFrontWheels\":-1,\"modLivery\":-1,\"fuelLevel\":48,\"modArmor\":4,\"modSmokeEnabled\":true}', 'car', NULL, 1, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'UIH 486', '{\"modBackWheels\":-1,\"wheelColor\":156,\"modEngine\":3,\"modBrakes\":2,\"windows\":[4,5],\"modSpeakers\":-1,\"modRoofLivery\":-1,\"doors\":[],\"modFrontBumper\":6,\"xenonColor\":8,\"modCustomTiresR\":false,\"pearlescentColor\":0,\"tyres\":[],\"color1\":[255,255,255],\"modTransmission\":2,\"modExhaust\":-1,\"oilLevel\":12,\"modSuspension\":2,\"modArmor\":4,\"modFrame\":-1,\"neonColor\":[255,0,255],\"modSteeringWheel\":-1,\"modDashboard\":-1,\"modXenon\":true,\"modTrunk\":-1,\"modWindows\":-1,\"modSeats\":-1,\"modOrnaments\":-1,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modRightFender\":-1,\"modTrimA\":-1,\"modRearBumper\":-1,\"modHorns\":-1,\"interiorColor\":0,\"modEngineBlock\":-1,\"modTrimB\":-1,\"modHood\":1,\"driftTyres\":false,\"bodyHealth\":992,\"modRoof\":-1,\"modArchCover\":-1,\"modFender\":-1,\"modLightbar\":-1,\"dirtLevel\":1,\"dashboardColor\":0,\"modLivery\":-1,\"plateIndex\":1,\"tankHealth\":999,\"wheelSize\":1.01374781131744,\"neonEnabled\":[false,false,false,false],\"modNitrous\":-1,\"plate\":\"UIH 486 \",\"modAPlate\":-1,\"modSubwoofer\":-1,\"modHydraulics\":false,\"modDoorSpeaker\":-1,\"modSpoilers\":2,\"windowTint\":1,\"livery\":-1,\"modSmokeEnabled\":false,\"model\":-842422329,\"modGrille\":-1,\"modTank\":-1,\"wheels\":0,\"color2\":[255,0,0],\"extras\":[],\"modCustomTiresF\":false,\"modFrontWheels\":53,\"fuelLevel\":91,\"paintType2\":7,\"paintType1\":7,\"modTurbo\":true,\"modDoorR\":-1,\"modAirFilter\":-1,\"modAerials\":-1,\"modPlateHolder\":-1,\"bulletProofTyres\":true,\"engineHealth\":987,\"modDial\":-1,\"tyreSmokeColor\":[255,255,255],\"modSideSkirt\":1,\"modHydrolic\":-1,\"wheelWidth\":1.07134532928466,\"modStruts\":-1}', 'car', NULL, 1, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:b42b206cb9676c013317ee3b92d5e19e2314bb26', 0, 0, 'UIU 947', '{\"modCustomTiresF\":false,\"modFrontWheels\":4,\"plate\":\"UIU 947 \",\"modTransmission\":2,\"color2\":[0,0,0],\"modAirFilter\":-1,\"doors\":[],\"wheelSize\":0.6958023905754,\"modLightbar\":-1,\"modVanityPlate\":-1,\"fuelLevel\":94,\"tyres\":[],\"modStruts\":-1,\"extras\":[],\"neonColor\":[255,0,255],\"modArchCover\":-1,\"modGrille\":-1,\"modXenon\":true,\"modRoofLivery\":-1,\"windows\":[4,5],\"modOrnaments\":-1,\"interiorColor\":27,\"tyreSmokeColor\":[255,255,255],\"model\":2009317678,\"modSteeringWheel\":-1,\"livery\":-1,\"windowTint\":1,\"modExhaust\":2,\"plateIndex\":1,\"modPlateHolder\":-1,\"modHydraulics\":false,\"modShifterLeavers\":-1,\"dashboardColor\":117,\"bulletProofTyres\":true,\"modBrakes\":2,\"modHood\":4,\"paintType1\":7,\"modRightFender\":-1,\"modTurbo\":true,\"wheelWidth\":0.51200306415557,\"engineHealth\":997,\"modWindows\":-1,\"modSpoilers\":1,\"modFender\":-1,\"modAPlate\":-1,\"bodyHealth\":996,\"modSmokeEnabled\":false,\"pearlescentColor\":0,\"modArmor\":4,\"modTrimA\":-1,\"modDoorSpeaker\":-1,\"paintType2\":7,\"dirtLevel\":0,\"modEngineBlock\":-1,\"modHorns\":-1,\"modNitrous\":-1,\"modSuspension\":3,\"modSubwoofer\":-1,\"modRearBumper\":3,\"modBackWheels\":-1,\"xenonColor\":1,\"modTrunk\":-1,\"modRoof\":-1,\"modLivery\":-1,\"modFrontBumper\":5,\"modDashboard\":-1,\"modCustomTiresR\":false,\"modEngine\":3,\"modDial\":-1,\"wheels\":7,\"color1\":[0,0,0],\"neonEnabled\":[false,false,false,false],\"oilLevel\":5,\"driftTyres\":false,\"modDoorR\":-1,\"modTank\":-1,\"modSpeakers\":-1,\"modSeats\":-1,\"tankHealth\":999,\"modHydrolic\":-1,\"modSideSkirt\":2,\"modTrimB\":-1,\"modAerials\":-1,\"wheelColor\":0,\"modFrame\":-1}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'UMN 250', '{\"modStruts\":-1,\"modRearBumper\":-1,\"modArmor\":-1,\"modHydraulics\":false,\"modHorns\":-1,\"modDial\":-1,\"wheelWidth\":0.52881008386611,\"livery\":-1,\"tyres\":[],\"plateIndex\":1,\"dirtLevel\":1,\"modDoorSpeaker\":-1,\"modTrimB\":-1,\"oilLevel\":7,\"engineHealth\":996,\"color2\":0,\"modSteeringWheel\":-1,\"modArchCover\":-1,\"neonEnabled\":[false,false,false,false],\"modTransmission\":-1,\"modOrnaments\":-1,\"modLightbar\":-1,\"modSuspension\":3,\"modDoorR\":-1,\"driftTyres\":false,\"modFender\":-1,\"modSpoilers\":-1,\"modCustomTiresR\":false,\"modAPlate\":-1,\"modAirFilter\":-1,\"modExhaust\":-1,\"xenonColor\":255,\"modFrontWheels\":24,\"paintType2\":7,\"bulletProofTyres\":true,\"modSideSkirt\":-1,\"modNitrous\":-1,\"extras\":[],\"bodyHealth\":997,\"paintType1\":7,\"windowTint\":1,\"windows\":[],\"dashboardColor\":0,\"modFrame\":-1,\"modTank\":-1,\"color1\":0,\"modLivery\":-1,\"plate\":\"UMN 250 \",\"modWindows\":-1,\"modTrunk\":-1,\"modTrimA\":-1,\"modPlateHolder\":-1,\"modBrakes\":2,\"modGrille\":-1,\"modSmokeEnabled\":false,\"neonColor\":[255,0,255],\"modEngineBlock\":-1,\"wheelColor\":111,\"tyreSmokeColor\":[255,255,255],\"wheelSize\":0.73554015159606,\"model\":-985643932,\"modEngine\":3,\"modCustomTiresF\":false,\"modSpeakers\":-1,\"modSeats\":-1,\"doors\":[],\"tankHealth\":1000,\"modSubwoofer\":-1,\"modAerials\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modTurbo\":true,\"pearlescentColor\":6,\"modRoof\":-1,\"modHydrolic\":-1,\"fuelLevel\":96,\"modVanityPlate\":-1,\"modShifterLeavers\":-1,\"modRoofLivery\":-1,\"modRightFender\":-1,\"wheels\":7,\"interiorColor\":0,\"modFrontBumper\":-1,\"modBackWheels\":-1,\"modXenon\":false}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 0, 0, 'UVF 723', '{\"modFrontWheels\":4,\"neonColor\":[255,0,255],\"modPlateHolder\":-1,\"modTurbo\":true,\"modNitrous\":-1,\"modCustomTiresR\":false,\"modBrakes\":2,\"modDoorR\":-1,\"modSideSkirt\":1,\"modHood\":2,\"modFrontBumper\":3,\"modAPlate\":-1,\"modTrimA\":-1,\"wheels\":7,\"doors\":[],\"modSmokeEnabled\":false,\"modWindows\":-1,\"modSeats\":-1,\"windowTint\":1,\"modLightbar\":-1,\"modFender\":-1,\"wheelSize\":0.6958023905754,\"modRoofLivery\":-1,\"modDial\":-1,\"tyreSmokeColor\":[255,255,255],\"paintType1\":7,\"modTank\":-1,\"modOrnaments\":-1,\"modBackWheels\":-1,\"modSpoilers\":2,\"modRightFender\":-1,\"modHydrolic\":-1,\"wheelWidth\":0.51200306415557,\"modSuspension\":1,\"modVanityPlate\":-1,\"plateIndex\":1,\"color1\":[36,36,36],\"modCustomTiresF\":false,\"model\":2009317678,\"bodyHealth\":931,\"modArchCover\":-1,\"interiorColor\":27,\"modTrimB\":-1,\"modExhaust\":2,\"modXenon\":true,\"modRoof\":-1,\"modHydraulics\":false,\"color2\":[36,36,36],\"modEngineBlock\":-1,\"engineHealth\":998,\"modSpeakers\":-1,\"bulletProofTyres\":true,\"modLivery\":-1,\"modHorns\":-1,\"plate\":\"UVF 723 \",\"modGrille\":-1,\"modDoorSpeaker\":-1,\"fuelLevel\":56,\"dashboardColor\":117,\"neonEnabled\":[false,false,false,false],\"modStruts\":-1,\"dirtLevel\":3,\"pearlescentColor\":0,\"tyres\":[],\"modEngine\":3,\"wheelColor\":0,\"modShifterLeavers\":-1,\"paintType2\":7,\"driftTyres\":false,\"modAerials\":-1,\"modSubwoofer\":-1,\"modAirFilter\":-1,\"oilLevel\":5,\"xenonColor\":2,\"modArmor\":2,\"modTransmission\":2,\"modRearBumper\":2,\"modSteeringWheel\":-1,\"modTrunk\":-1,\"modFrame\":-1,\"livery\":-1,\"extras\":[],\"windows\":[2,3,4,5,7],\"modDashboard\":-1,\"tankHealth\":993}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'VBL 161', '{\"wheels\":3,\"modStruts\":-1,\"modFender\":-1,\"modDial\":-1,\"livery\":-1,\"modArmor\":2,\"modAPlate\":-1,\"modFrontWheels\":-1,\"modBackWheels\":-1,\"tyres\":[],\"modTank\":-1,\"model\":1326776111,\"modFrontBumper\":-1,\"plateIndex\":1,\"modWindows\":-1,\"neonEnabled\":[false,false,false,false],\"modTurbo\":true,\"pearlescentColor\":0,\"wheelSize\":1.0,\"modGrille\":-1,\"modFrame\":-1,\"windows\":[],\"modCustomTiresF\":false,\"doors\":[],\"modXenon\":true,\"tyreSmokeColor\":[255,255,255],\"modSideSkirt\":-1,\"modRoofLivery\":-1,\"color2\":[255,255,255],\"modHood\":-1,\"modAirFilter\":-1,\"engineHealth\":996,\"modSubwoofer\":-1,\"modAerials\":-1,\"modEngineBlock\":-1,\"modRearBumper\":-1,\"modSmokeEnabled\":false,\"bulletProofTyres\":true,\"interiorColor\":0,\"modSeats\":-1,\"modSpoilers\":-1,\"modLivery\":-1,\"modSteeringWheel\":-1,\"fuelLevel\":76,\"plate\":\"VBL 161 \",\"modHydraulics\":false,\"modHorns\":-1,\"modTrimB\":-1,\"modOrnaments\":-1,\"modRightFender\":-1,\"modLightbar\":-1,\"bodyHealth\":996,\"windowTint\":2,\"modArchCover\":-1,\"color1\":0,\"modNitrous\":-1,\"modTransmission\":2,\"extras\":[null,null,1,1,1,0],\"modVanityPlate\":-1,\"paintType1\":7,\"dashboardColor\":0,\"dirtLevel\":9,\"modTrunk\":-1,\"modEngine\":3,\"modHydrolic\":-1,\"modBrakes\":2,\"oilLevel\":6,\"modShifterLeavers\":-1,\"modPlateHolder\":-1,\"modExhaust\":-1,\"modDoorSpeaker\":-1,\"modDoorR\":-1,\"tankHealth\":1000,\"modSpeakers\":-1,\"paintType2\":0,\"neonColor\":[255,0,255],\"wheelColor\":156,\"modDashboard\":-1,\"driftTyres\":false,\"modTrimA\":-1,\"modCustomTiresR\":false,\"modSuspension\":2,\"xenonColor\":2,\"wheelWidth\":1.0,\"modRoof\":-1}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 0, 0, 'VDH 368', '{\"modSeats\":-1,\"modEngineBlock\":-1,\"modCustomTiresF\":false,\"modWindows\":-1,\"modAPlate\":-1,\"driftTyres\":false,\"modPlateHolder\":-1,\"modSpoilers\":-1,\"bodyHealth\":998,\"modHydraulics\":false,\"neonColor\":[255,0,255],\"modBackWheels\":3,\"wheelColor\":156,\"modRightFender\":-1,\"bulletProofTyres\":true,\"dashboardColor\":0,\"windowTint\":-1,\"modLightbar\":-1,\"modSideSkirt\":-1,\"livery\":-1,\"model\":-1047672102,\"modEngine\":-1,\"oilLevel\":5,\"dirtLevel\":12,\"modAerials\":-1,\"fuelLevel\":66,\"wheels\":3,\"modSmokeEnabled\":false,\"modOrnaments\":-1,\"plate\":\"VDH 368 \",\"modSteeringWheel\":-1,\"modNitrous\":-1,\"modLivery\":-1,\"plateIndex\":0,\"engineHealth\":999,\"modFrontBumper\":-1,\"modTank\":-1,\"tyres\":[],\"windows\":[4,5],\"wheelSize\":1.0,\"modXenon\":false,\"modRoof\":-1,\"modDial\":-1,\"modSpeakers\":-1,\"doors\":[],\"modRearBumper\":-1,\"modStruts\":-1,\"modShifterLeavers\":-1,\"tankHealth\":999,\"modAirFilter\":-1,\"modTrunk\":-1,\"extras\":[],\"modArchCover\":-1,\"wheelWidth\":1.0,\"modSuspension\":-1,\"modTrimB\":-1,\"modHood\":-1,\"modTransmission\":-1,\"modHydrolic\":-1,\"paintType1\":7,\"modTurbo\":false,\"modArmor\":-1,\"xenonColor\":255,\"paintType2\":7,\"modSubwoofer\":-1,\"modFender\":-1,\"modDoorR\":-1,\"modRoofLivery\":-1,\"modDoorSpeaker\":-1,\"color2\":70,\"modVanityPlate\":-1,\"modDashboard\":-1,\"modGrille\":-1,\"modExhaust\":-1,\"tyreSmokeColor\":[255,255,255],\"modBrakes\":-1,\"modFrontWheels\":-1,\"pearlescentColor\":2,\"modCustomTiresR\":false,\"color1\":2,\"modFrame\":-1,\"interiorColor\":0,\"modTrimA\":-1,\"neonEnabled\":[false,false,false,false],\"modHorns\":-1}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'VFS 943', '{\"modBackWheels\":-1,\"modAPlate\":-1,\"modTransmission\":2,\"modSubwoofer\":-1,\"fuelLevel\":68,\"paintType1\":7,\"neonEnabled\":[false,false,false,false],\"pearlescentColor\":0,\"windowTint\":1,\"modBrakes\":2,\"color1\":[0,0,0],\"color2\":[0,0,0],\"modEngineBlock\":-1,\"modSuspension\":2,\"modNitrous\":-1,\"modDoorSpeaker\":-1,\"modDial\":-1,\"modCustomTiresR\":false,\"modArchCover\":-1,\"modHydrolic\":-1,\"modXenon\":true,\"modPlateHolder\":-1,\"engineHealth\":971,\"oilLevel\":5,\"modDashboard\":-1,\"plateIndex\":1,\"modEngine\":3,\"modHydraulics\":false,\"plate\":\"VFS 943 \",\"modTrimA\":-1,\"modGrille\":-1,\"interiorColor\":0,\"modSeats\":-1,\"modTrunk\":-1,\"modWindows\":-1,\"modTank\":-1,\"modFender\":-1,\"modSteeringWheel\":-1,\"modTrimB\":-1,\"modRightFender\":-1,\"modShifterLeavers\":-1,\"wheelColor\":156,\"modLivery\":-1,\"modSpeakers\":-1,\"dashboardColor\":0,\"modOrnaments\":-1,\"modCustomTiresF\":false,\"paintType2\":1,\"modFrontBumper\":-1,\"modRoofLivery\":-1,\"modStruts\":-1,\"tyreSmokeColor\":[255,255,255],\"bodyHealth\":979,\"modFrontWheels\":31,\"livery\":4,\"tyres\":[],\"extras\":[],\"driftTyres\":false,\"modSpoilers\":-1,\"xenonColor\":8,\"model\":-1513691047,\"modLightbar\":-1,\"windows\":[],\"doors\":[],\"modHood\":-1,\"wheels\":3,\"dirtLevel\":8,\"modRearBumper\":-1,\"modDoorR\":-1,\"modAerials\":-1,\"modFrame\":-1,\"modSmokeEnabled\":false,\"neonColor\":[255,0,255],\"modAirFilter\":-1,\"modArmor\":4,\"modTurbo\":true,\"modRoof\":-1,\"modSideSkirt\":-1,\"modExhaust\":-1,\"wheelSize\":0.7427207827568,\"modHorns\":-1,\"wheelWidth\":0.74672472476959,\"tankHealth\":998,\"modVanityPlate\":-1,\"bulletProofTyres\":true}', 'car', NULL, 1, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:2bf7bb148f0f54b434ac370cab06e592866df450', 0, 0, 'VGN 208', '{\"modTrunk\":-1,\"modSuspension\":-1,\"modDoorR\":-1,\"paintType2\":7,\"interiorColor\":0,\"modStruts\":-1,\"oilLevel\":5,\"tankHealth\":1000,\"driftTyres\":false,\"modSmokeEnabled\":true,\"modDashboard\":-1,\"tyreSmokeColor\":[0,0,0],\"engineHealth\":996,\"modHorns\":-1,\"modExhaust\":-1,\"color1\":[22,22,41],\"modFrontWheels\":13,\"pearlescentColor\":65,\"wheelSize\":0.6778358221054,\"bodyHealth\":997,\"wheelWidth\":0.61351031064987,\"modSpeakers\":-1,\"modHydraulics\":false,\"modFender\":-1,\"modRoofLivery\":-1,\"modCustomTiresR\":false,\"windowTint\":-1,\"color2\":[22,22,41],\"modAPlate\":-1,\"modPlateHolder\":-1,\"modXenon\":false,\"modShifterLeavers\":-1,\"modLivery\":-1,\"plateIndex\":1,\"windows\":[4,5],\"bulletProofTyres\":true,\"modTransmission\":2,\"modFrontBumper\":-1,\"modDial\":-1,\"modSubwoofer\":-1,\"tyres\":[],\"wheels\":0,\"dashboardColor\":0,\"modAirFilter\":-1,\"modLightbar\":-1,\"modTrimA\":-1,\"modVanityPlate\":-1,\"modHydrolic\":-1,\"modEngineBlock\":-1,\"paintType1\":7,\"modHood\":-1,\"modDoorSpeaker\":-1,\"modRearBumper\":-1,\"model\":-448744104,\"modFrame\":-1,\"modCustomTiresF\":false,\"plate\":\"VGN 208 \",\"modAerials\":-1,\"modArmor\":4,\"modRightFender\":-1,\"doors\":[],\"modSteeringWheel\":-1,\"extras\":[0],\"modTrimB\":-1,\"modBrakes\":2,\"modSpoilers\":-1,\"dirtLevel\":6,\"modOrnaments\":-1,\"modGrille\":-1,\"modTank\":-1,\"modWindows\":-1,\"neonColor\":[255,0,255],\"modSeats\":-1,\"neonEnabled\":[false,false,false,false],\"livery\":0,\"wheelColor\":0,\"modEngine\":3,\"modArchCover\":-1,\"modBackWheels\":-1,\"fuelLevel\":57,\"modNitrous\":-1,\"modTurbo\":true,\"modSideSkirt\":-1,\"xenonColor\":255,\"modRoof\":-1}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 0, 0, 'VIH 022', '{\"modHorns\":-1,\"modAirFilter\":-1,\"modDoorSpeaker\":-1,\"dashboardColor\":0,\"modEngine\":3,\"livery\":-1,\"modFrontWheels\":-1,\"modSeats\":-1,\"modArmor\":4,\"modAPlate\":-1,\"modLightbar\":-1,\"modWindows\":-1,\"xenonColor\":255,\"bulletProofTyres\":true,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"oilLevel\":5,\"modSuspension\":3,\"modTrimA\":-1,\"modTransmission\":2,\"modHood\":-1,\"modBrakes\":2,\"modRoof\":-1,\"modBackWheels\":-1,\"modRightFender\":-1,\"modArchCover\":-1,\"modTrimB\":-1,\"wheelSize\":0.0,\"tankHealth\":991,\"modFender\":-1,\"extras\":[],\"modDoorR\":-1,\"modHydraulics\":false,\"modShifterLeavers\":-1,\"modRearBumper\":-1,\"plate\":\"VIH 022 \",\"modDashboard\":-1,\"modGrille\":-1,\"modExhaust\":-1,\"neonColor\":[255,0,255],\"modPlateHolder\":-1,\"driftTyres\":false,\"model\":-313185164,\"neonEnabled\":[false,false,false,false],\"windowTint\":-1,\"wheels\":7,\"modTrunk\":-1,\"modEngineBlock\":-1,\"dirtLevel\":5,\"modSmokeEnabled\":false,\"modXenon\":false,\"wheelWidth\":0.0,\"modLivery\":-1,\"modSubwoofer\":-1,\"wheelColor\":12,\"modHydrolic\":-1,\"pearlescentColor\":88,\"paintType2\":7,\"windows\":[2,3,4,5,6,7],\"modFrame\":-1,\"tyreSmokeColor\":[255,255,255],\"engineHealth\":997,\"modDial\":-1,\"modSpeakers\":-1,\"modTank\":-1,\"interiorColor\":0,\"modStruts\":-1,\"fuelLevel\":36,\"doors\":[],\"modOrnaments\":-1,\"color1\":36,\"modSteeringWheel\":-1,\"tyres\":[],\"modAerials\":-1,\"paintType1\":7,\"modRoofLivery\":-1,\"bodyHealth\":931,\"modNitrous\":-1,\"modCustomTiresR\":false,\"plateIndex\":0,\"modSideSkirt\":-1,\"color2\":36,\"modFrontBumper\":-1,\"modTurbo\":true,\"modCustomTiresF\":false}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'VJO 544', '{\"modStruts\":-1,\"modRearBumper\":-1,\"modArmor\":-1,\"modHydraulics\":false,\"modHorns\":-1,\"modDial\":-1,\"wheelWidth\":1.0,\"livery\":0,\"tyres\":[],\"plateIndex\":1,\"dirtLevel\":9,\"modDoorSpeaker\":-1,\"modTrimB\":-1,\"oilLevel\":5,\"engineHealth\":996,\"color2\":0,\"modSteeringWheel\":-1,\"modArchCover\":-1,\"neonEnabled\":[false,false,false,false],\"modTransmission\":2,\"modOrnaments\":-1,\"modLightbar\":-1,\"modSuspension\":1,\"modDoorR\":-1,\"driftTyres\":false,\"modFender\":-1,\"modSpoilers\":-1,\"modCustomTiresR\":false,\"modAPlate\":-1,\"modAirFilter\":-1,\"modExhaust\":-1,\"xenonColor\":255,\"modFrontWheels\":-1,\"paintType2\":7,\"bulletProofTyres\":true,\"modSideSkirt\":-1,\"modNitrous\":-1,\"extras\":[1,1],\"bodyHealth\":996,\"paintType1\":7,\"windowTint\":4,\"windows\":[2,3],\"dashboardColor\":0,\"modFrame\":-1,\"modTank\":-1,\"color1\":64,\"modLivery\":-1,\"plate\":\"VJO 544 \",\"modWindows\":-1,\"modTrunk\":-1,\"modTrimA\":-1,\"modPlateHolder\":-1,\"modBrakes\":2,\"modGrille\":-1,\"modSmokeEnabled\":false,\"neonColor\":[255,0,255],\"modEngineBlock\":-1,\"wheelColor\":156,\"tyreSmokeColor\":[255,255,255],\"wheelSize\":1.0,\"model\":626972477,\"modEngine\":3,\"modCustomTiresF\":false,\"modSpeakers\":-1,\"modSeats\":-1,\"doors\":[],\"tankHealth\":1000,\"modSubwoofer\":-1,\"modAerials\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modTurbo\":true,\"pearlescentColor\":68,\"modRoof\":-1,\"modHydrolic\":-1,\"fuelLevel\":34,\"modVanityPlate\":-1,\"modShifterLeavers\":-1,\"modRoofLivery\":-1,\"modRightFender\":-1,\"wheels\":0,\"interiorColor\":0,\"modFrontBumper\":-1,\"modBackWheels\":-1,\"modXenon\":false}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'VKS 070', '{\"oilLevel\":5,\"modTrunk\":-1,\"modGrille\":-1,\"modWindows\":-1,\"bodyHealth\":998,\"modCustomTiresR\":false,\"modEngine\":3,\"modPlateHolder\":-1,\"modOrnaments\":-1,\"modRoof\":-1,\"modHydrolic\":-1,\"modSpeakers\":-1,\"paintType1\":7,\"modBrakes\":2,\"modFender\":-1,\"modSubwoofer\":-1,\"windowTint\":1,\"tankHealth\":1000,\"neonEnabled\":[false,false,false,false],\"color1\":[255,0,0],\"pearlescentColor\":28,\"modXenon\":true,\"modHood\":2,\"color2\":[0,0,0],\"extras\":[],\"modShifterLeavers\":-1,\"tyres\":[],\"modFrontWheels\":24,\"fuelLevel\":99,\"modTransmission\":2,\"modStruts\":-1,\"modAirFilter\":-1,\"modCustomTiresF\":false,\"model\":2009317678,\"wheelSize\":0.6958023905754,\"paintType2\":7,\"windows\":[4,5],\"engineHealth\":997,\"plateIndex\":1,\"modLivery\":-1,\"modHydraulics\":false,\"modAPlate\":-1,\"modNitrous\":-1,\"modAerials\":-1,\"dashboardColor\":117,\"modLightbar\":-1,\"modExhaust\":2,\"modVanityPlate\":-1,\"modDoorR\":-1,\"modFrame\":-1,\"xenonColor\":8,\"bulletProofTyres\":true,\"wheelColor\":134,\"dirtLevel\":5,\"wheelWidth\":0.51200306415557,\"modEngineBlock\":-1,\"modBackWheels\":-1,\"modHorns\":-1,\"modTurbo\":true,\"modRearBumper\":3,\"modSmokeEnabled\":true,\"modDoorSpeaker\":-1,\"modDashboard\":-1,\"wheels\":7,\"modSeats\":-1,\"modArchCover\":-1,\"modArmor\":-1,\"modSideSkirt\":1,\"modSteeringWheel\":-1,\"tyreSmokeColor\":[255,255,255],\"modTank\":-1,\"modRoofLivery\":-1,\"livery\":-1,\"modSuspension\":2,\"modFrontBumper\":5,\"driftTyres\":false,\"plate\":\"VKS 070 \",\"modRightFender\":-1,\"modTrimB\":-1,\"modDial\":-1,\"interiorColor\":27,\"modSpoilers\":1,\"modTrimA\":-1,\"doors\":[],\"neonColor\":[255,0,255]}', 'car', NULL, 1, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'VWB 213', '{\"modExhaust\":-1,\"driftTyres\":false,\"plate\":\"VWB 213 \",\"modEngine\":3,\"tankHealth\":1000,\"modSubwoofer\":-1,\"modDashboard\":-1,\"paintType2\":0,\"modTrimB\":-1,\"tyreSmokeColor\":[255,255,255],\"modTrunk\":-1,\"modPlateHolder\":-1,\"modFender\":-1,\"color2\":[255,0,0],\"modBackWheels\":-1,\"modHood\":-1,\"livery\":-1,\"modHydrolic\":-1,\"modSpoilers\":-1,\"modArmor\":2,\"oilLevel\":5,\"modSteeringWheel\":-1,\"modTrimA\":-1,\"color1\":[0,0,0],\"modDoorSpeaker\":-1,\"pearlescentColor\":0,\"modBrakes\":2,\"modRightFender\":-1,\"neonEnabled\":[false,false,false,false],\"modEngineBlock\":-1,\"extras\":{\"11\":1,\"12\":0},\"modSmokeEnabled\":false,\"modNitrous\":-1,\"paintType1\":1,\"dirtLevel\":4,\"modDoorR\":-1,\"modTank\":-1,\"engineHealth\":1000,\"modVanityPlate\":-1,\"modRearBumper\":-1,\"wheelSize\":0.69790261983871,\"modCustomTiresR\":false,\"xenonColor\":8,\"wheelWidth\":0.65394532680511,\"plateIndex\":1,\"modAerials\":-1,\"modWindows\":-1,\"modSideSkirt\":-1,\"doors\":[],\"modRoofLivery\":-1,\"modTransmission\":2,\"modDial\":-1,\"modLivery\":-1,\"modStruts\":-1,\"modGrille\":-1,\"modAirFilter\":-1,\"modLightbar\":-1,\"modHorns\":-1,\"modFrontWheels\":4,\"interiorColor\":156,\"modArchCover\":-1,\"neonColor\":[255,0,255],\"model\":480281051,\"modCustomTiresF\":false,\"modTurbo\":true,\"modFrame\":-1,\"modShifterLeavers\":-1,\"bulletProofTyres\":true,\"bodyHealth\":1000,\"modHydraulics\":false,\"modFrontBumper\":-1,\"modXenon\":true,\"tyres\":[],\"wheels\":7,\"modOrnaments\":-1,\"modRoof\":-1,\"modSuspension\":2,\"modSpeakers\":-1,\"dashboardColor\":37,\"modSeats\":-1,\"fuelLevel\":22,\"wheelColor\":134,\"windows\":[4,5],\"modAPlate\":-1,\"windowTint\":2}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 0, 0, 'VXG 265', '{\"plate\":\"VXG 265\",\"model\":884483972}', 'car', NULL, 1, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `owned_vehicles` (`amigos`, `owner`, `state`, `garageperso`, `plate`, `vehicle`, `type`, `job`, `stored`, `parking`, `pound`, `calle`, `mileage`, `glovebox`, `trunk`, `lastparking`, `lastposition`, `carseller`) VALUES
(NULL, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 0, 0, 'WDT 950', '{\"modExhaust\":-1,\"modDial\":-1,\"modHydrolic\":-1,\"bulletProofTyres\":true,\"modSpeakers\":-1,\"model\":-1684776591,\"modAirFilter\":-1,\"modSuspension\":2,\"modDashboard\":-1,\"neonColor\":[255,0,255],\"tankHealth\":995,\"modTrimA\":-1,\"modRightFender\":-1,\"modSubwoofer\":-1,\"modRoof\":-1,\"modBrakes\":2,\"modGrille\":-1,\"modVanityPlate\":-1,\"tyreSmokeColor\":[255,255,255],\"modPlateHolder\":-1,\"modRearBumper\":-1,\"modTurbo\":true,\"color1\":[46,46,46],\"modNitrous\":-1,\"modRoofLivery\":-1,\"modSeats\":-1,\"livery\":0,\"modLightbar\":-1,\"paintType1\":7,\"modAPlate\":-1,\"modFender\":-1,\"xenonColor\":0,\"wheels\":7,\"modSmokeEnabled\":true,\"modFrontWheels\":6,\"plateIndex\":1,\"fuelLevel\":72,\"modTrimB\":-1,\"windowTint\":5,\"modEngineBlock\":-1,\"modTransmission\":2,\"modArchCover\":-1,\"modHorns\":-1,\"wheelWidth\":0.59639757871627,\"modCustomTiresR\":false,\"tyres\":[],\"modXenon\":true,\"paintType2\":7,\"modDoorR\":-1,\"modFrame\":-1,\"modTrunk\":-1,\"engineHealth\":998,\"plate\":\"WDT 950 \",\"modShifterLeavers\":-1,\"dirtLevel\":5,\"oilLevel\":5,\"color2\":[255,255,255],\"modDoorSpeaker\":-1,\"modOrnaments\":-1,\"modSideSkirt\":-1,\"modSpoilers\":-1,\"modArmor\":4,\"modLivery\":-1,\"dashboardColor\":0,\"driftTyres\":false,\"neonEnabled\":[false,false,false,false],\"wheelSize\":0.69500505924224,\"wheelColor\":121,\"modTank\":-1,\"modFrontBumper\":-1,\"windows\":[0,1,2,3,4,5,6,7],\"bodyHealth\":955,\"modBackWheels\":-1,\"modWindows\":-1,\"interiorColor\":0,\"modEngine\":3,\"modSteeringWheel\":-1,\"pearlescentColor\":0,\"modHood\":-1,\"modCustomTiresF\":false,\"modHydraulics\":false,\"doors\":[],\"modStruts\":-1,\"modAerials\":-1,\"extras\":[]}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:d621787821b7be9712dd11873dc3decca533bf6a', 0, 0, 'WEJ 086', '{\"modXenon\":true,\"modTrunk\":-1,\"modExhaust\":3,\"tankHealth\":992,\"modVanityPlate\":-1,\"plate\":\"WEJ 086 \",\"bodyHealth\":930,\"modSideSkirt\":-1,\"bulletProofTyres\":true,\"wheels\":7,\"modFrame\":-1,\"wheelColor\":0,\"modTank\":-1,\"oilLevel\":5,\"modStruts\":-1,\"modAirFilter\":-1,\"modSpoilers\":1,\"modTrimA\":-1,\"tyres\":[],\"modDoorR\":-1,\"modWindows\":-1,\"modEngineBlock\":-1,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"fuelLevel\":60,\"modAPlate\":-1,\"paintType2\":0,\"modHorns\":-1,\"modBrakes\":2,\"modDial\":-1,\"modRoof\":-1,\"modArmor\":1,\"windows\":[4,5],\"modEngine\":3,\"plateIndex\":1,\"dashboardColor\":111,\"color2\":[0,0,0],\"modSteeringWheel\":-1,\"modSuspension\":2,\"modSpeakers\":-1,\"modLightbar\":-1,\"modLivery\":-1,\"driftTyres\":false,\"xenonColor\":2,\"engineHealth\":913,\"paintType1\":0,\"interiorColor\":5,\"modFrontBumper\":4,\"modCustomTiresR\":false,\"modPlateHolder\":-1,\"modHydrolic\":-1,\"modAerials\":-1,\"wheelWidth\":0.48762202262878,\"modShifterLeavers\":-1,\"doors\":[],\"livery\":-1,\"modGrille\":-1,\"modHydraulics\":false,\"modHood\":3,\"modRightFender\":-1,\"modCustomTiresF\":false,\"color1\":[0,0,0],\"modFrontWheels\":4,\"neonEnabled\":[false,false,false,false],\"modDashboard\":-1,\"modTrimB\":-1,\"modFender\":-1,\"modSmokeEnabled\":false,\"wheelSize\":0.66266900300979,\"modOrnaments\":-1,\"modArchCover\":-1,\"modBackWheels\":-1,\"modSeats\":-1,\"modRoofLivery\":-1,\"modNitrous\":-1,\"modTransmission\":2,\"modTurbo\":true,\"pearlescentColor\":10,\"modSubwoofer\":-1,\"extras\":[0,1],\"model\":-1244461404,\"dirtLevel\":1,\"windowTint\":1,\"modDoorSpeaker\":-1,\"tyreSmokeColor\":[255,255,255]}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 0, 0, 'WFY 312', '{\"model\":1168174649,\"bodyHealth\":1000.0,\"dirtLevel\":6.0,\"neonColor\":[255,0,255],\"tyreSmokeColor\":[255,255,255],\"modArchCover\":-1,\"wheelColor\":156,\"modWindows\":-1,\"plate\":\"WFY 312\",\"fuelLevel\":20.9,\"dashboardColor\":0,\"modDial\":-1,\"modSmokeEnabled\":false,\"modPlateHolder\":-1,\"engineHealth\":1000.0,\"modEngine\":-1,\"modShifterLeavers\":-1,\"modLivery\":0,\"windowsBroken\":{\"4\":true,\"3\":false,\"2\":false,\"1\":false,\"0\":false,\"7\":true,\"6\":false,\"5\":true},\"modVanityPlate\":-1,\"modFrontWheels\":-1,\"modGrille\":-1,\"modExhaust\":-1,\"windowTint\":-1,\"modRightFender\":-1,\"modTransmission\":-1,\"modSuspension\":-1,\"modRoof\":-1,\"doorsBroken\":{\"4\":false,\"3\":false,\"2\":false,\"1\":false,\"0\":false,\"5\":false},\"modCustomBackWheels\":false,\"tankHealth\":1000.0,\"modRearBumper\":-1,\"modArmor\":-1,\"modSteeringWheel\":-1,\"modDoorSpeaker\":-1,\"modXenon\":false,\"wheels\":0,\"neonEnabled\":[false,false,false,false],\"modHood\":-1,\"xenonColor\":255,\"modSpeakers\":-1,\"modBrakes\":-1,\"modSideSkirt\":-1,\"pearlescentColor\":0,\"modBackWheels\":-1,\"color2\":27,\"modTrimA\":-1,\"interiorColor\":0,\"modAirFilter\":-1,\"modTrunk\":-1,\"modLightbar\":-1,\"extras\":{\"1\":false,\"11\":false},\"modHydrolic\":-1,\"modStruts\":-1,\"plateIndex\":4,\"modAPlate\":-1,\"modTank\":-1,\"modTrimB\":-1,\"modFrame\":-1,\"color1\":27,\"modAerials\":-1,\"modEngineBlock\":-1,\"modCustomFrontWheels\":false,\"tyresCanBurst\":1,\"modSeats\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"modFender\":-1,\"tyreBurst\":{\"0\":false,\"4\":false,\"5\":false,\"1\":false},\"modSpoilers\":-1,\"modHorns\":-1,\"modTurbo\":false,\"modOrnaments\":-1,\"modRoofLivery\":-1}', 'car', 'ambulance', 1, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'WUI 232', '{\"modExhaust\":-1,\"driftTyres\":false,\"plate\":\"WUI 232 \",\"windows\":[0,1,2,3,4,5,6,7],\"tankHealth\":923,\"modSubwoofer\":-1,\"modDashboard\":-1,\"fuelLevel\":77,\"modTrimB\":-1,\"tyreSmokeColor\":[255,255,255],\"modTrunk\":-1,\"modPlateHolder\":-1,\"modFender\":-1,\"color2\":[51,255,0],\"modBackWheels\":-1,\"modHood\":-1,\"livery\":-1,\"modHydrolic\":-1,\"modSpoilers\":-1,\"modArmor\":2,\"oilLevel\":5,\"modSteeringWheel\":-1,\"modTrimA\":-1,\"color1\":[0,0,0],\"modDoorSpeaker\":-1,\"pearlescentColor\":0,\"modBrakes\":2,\"modRightFender\":-1,\"neonEnabled\":[false,false,false,false],\"modEngineBlock\":-1,\"extras\":[],\"modSmokeEnabled\":false,\"modFrontBumper\":-1,\"paintType1\":1,\"dirtLevel\":12,\"modSeats\":-1,\"modTank\":-1,\"engineHealth\":791,\"modVanityPlate\":-1,\"modRearBumper\":-1,\"wheelSize\":0.0,\"modCustomTiresR\":false,\"bulletProofTyres\":true,\"modTransmission\":2,\"modRoof\":-1,\"modShifterLeavers\":-1,\"interiorColor\":240,\"modSideSkirt\":-1,\"doors\":[],\"modRoofLivery\":-1,\"model\":718169509,\"modDial\":-1,\"modLivery\":-1,\"wheelWidth\":0.0,\"modGrille\":-1,\"modAirFilter\":-1,\"modOrnaments\":-1,\"modHorns\":-1,\"modXenon\":true,\"modNitrous\":-1,\"modArchCover\":-1,\"neonColor\":[255,0,255],\"plateIndex\":0,\"modCustomTiresF\":false,\"modAerials\":-1,\"wheels\":6,\"modFrontWheels\":-1,\"modStruts\":-1,\"bodyHealth\":844,\"modHydraulics\":false,\"modFrame\":-1,\"modSpeakers\":-1,\"tyres\":[],\"xenonColor\":4,\"modWindows\":-1,\"modLightbar\":-1,\"modSuspension\":4,\"modDoorR\":-1,\"dashboardColor\":200,\"modTurbo\":true,\"paintType2\":0,\"wheelColor\":252,\"modEngine\":3,\"modAPlate\":-1,\"windowTint\":1}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'WUZ 966', '{\"modDoorR\":-1,\"wheels\":7,\"modTrunk\":-1,\"modArmor\":2,\"modGrille\":-1,\"paintType1\":7,\"modLivery\":-1,\"tankHealth\":1000,\"wheelSize\":0.6958023905754,\"livery\":-1,\"interiorColor\":27,\"modAirFilter\":-1,\"modRoof\":-1,\"modOrnaments\":-1,\"tyreSmokeColor\":[255,255,255],\"modFrontWheels\":4,\"model\":2009317678,\"extras\":[],\"modTrimA\":-1,\"bodyHealth\":995,\"modDial\":-1,\"wheelColor\":134,\"modDashboard\":-1,\"modSeats\":-1,\"color2\":[255,255,255],\"dashboardColor\":117,\"modSuspension\":2,\"modXenon\":true,\"modCustomTiresF\":false,\"modNitrous\":-1,\"windowTint\":1,\"modHorns\":-1,\"windows\":[4,5],\"modExhaust\":2,\"modWindows\":-1,\"plateIndex\":1,\"modFender\":-1,\"modStruts\":-1,\"modTransmission\":2,\"oilLevel\":5,\"modRoofLivery\":-1,\"modSteeringWheel\":-1,\"neonEnabled\":[false,false,false,false],\"bulletProofTyres\":true,\"dirtLevel\":4,\"modHood\":2,\"modSubwoofer\":-1,\"paintType2\":7,\"modTrimB\":-1,\"tyres\":[],\"modShifterLeavers\":-1,\"modHydraulics\":false,\"doors\":[],\"modAPlate\":-1,\"xenonColor\":0,\"modEngine\":3,\"neonColor\":[255,0,255],\"modRearBumper\":3,\"wheelWidth\":0.51200306415557,\"modBrakes\":2,\"modPlateHolder\":-1,\"modHydrolic\":-1,\"modRightFender\":-1,\"modArchCover\":-1,\"modLightbar\":-1,\"driftTyres\":false,\"modFrontBumper\":5,\"modBackWheels\":-1,\"modSpeakers\":-1,\"modTurbo\":true,\"color1\":[255,0,0],\"modVanityPlate\":-1,\"modSpoilers\":1,\"modDoorSpeaker\":-1,\"modEngineBlock\":-1,\"engineHealth\":994,\"fuelLevel\":94,\"plate\":\"WUZ 966 \",\"modAerials\":-1,\"modCustomTiresR\":false,\"modSideSkirt\":2,\"pearlescentColor\":0,\"modSmokeEnabled\":false,\"modTank\":-1,\"modFrame\":-1}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 0, 0, 'YLK 602', '{\"neonEnabled\":[false,false,false,false],\"windows\":[4,5],\"windowTint\":-1,\"modSpoilers\":-1,\"modEngineBlock\":-1,\"modDashboard\":-1,\"modExhaust\":-1,\"modSideSkirt\":-1,\"modAPlate\":-1,\"modRoofLivery\":-1,\"engineHealth\":1000,\"modSuspension\":-1,\"modBackWheels\":-1,\"modLivery\":-1,\"modNitrous\":-1,\"modDoorR\":-1,\"modTrimA\":-1,\"livery\":-1,\"paintType2\":7,\"xenonColor\":255,\"modHood\":-1,\"color1\":4,\"modHydrolic\":-1,\"modSteeringWheel\":-1,\"modStruts\":-1,\"tyres\":[],\"modFrontWheels\":-1,\"modLightbar\":-1,\"modBrakes\":-1,\"modSeats\":-1,\"modTransmission\":-1,\"driftTyres\":false,\"wheelColor\":156,\"modRightFender\":-1,\"modXenon\":false,\"modArmor\":-1,\"modOrnaments\":-1,\"doors\":[],\"modHydraulics\":false,\"dirtLevel\":0,\"modRearBumper\":-1,\"modFrame\":-1,\"modVanityPlate\":-1,\"modPlateHolder\":-1,\"tankHealth\":1000,\"wheelSize\":0.0,\"modDoorSpeaker\":-1,\"modWindows\":-1,\"tyreSmokeColor\":[255,255,255],\"modCustomTiresF\":false,\"modFrontBumper\":-1,\"model\":577497474,\"modHorns\":-1,\"modShifterLeavers\":-1,\"oilLevel\":12,\"interiorColor\":0,\"modSubwoofer\":-1,\"wheels\":0,\"dashboardColor\":0,\"neonColor\":[255,0,255],\"fuelLevel\":100,\"modAirFilter\":-1,\"plate\":\"YLK 602 \",\"modCustomTiresR\":false,\"modTrunk\":-1,\"modDial\":-1,\"extras\":[],\"modFender\":-1,\"wheelWidth\":0.0,\"modRoof\":-1,\"modSpeakers\":-1,\"modGrille\":-1,\"modTank\":-1,\"bulletProofTyres\":true,\"modAerials\":-1,\"modSmokeEnabled\":false,\"modTurbo\":false,\"pearlescentColor\":111,\"modTrimB\":-1,\"modArchCover\":-1,\"modEngine\":-1,\"bodyHealth\":1000,\"color2\":4,\"paintType1\":7,\"plateIndex\":3}', 'car', NULL, 1, 'Pillbox Hill', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'YLP 499', '{\"modTank\":-1,\"modDoorSpeaker\":-1,\"dashboardColor\":0,\"modLivery\":-1,\"modTrimA\":-1,\"tankHealth\":998,\"modTurbo\":true,\"modSubwoofer\":-1,\"plate\":\"YLP 499 \",\"driftTyres\":false,\"modNitrous\":-1,\"modFrontWheels\":-1,\"modDial\":-1,\"modEngineBlock\":-1,\"modAPlate\":-1,\"modBackWheels\":-1,\"modSteeringWheel\":-1,\"modTrunk\":-1,\"wheels\":4,\"modSmokeEnabled\":false,\"doors\":[],\"dirtLevel\":9,\"modWindows\":-1,\"fuelLevel\":51,\"paintType1\":7,\"modShifterLeavers\":-1,\"modArmor\":4,\"modRoof\":-1,\"livery\":0,\"modCustomTiresF\":false,\"model\":-33136529,\"modTransmission\":2,\"bulletProofTyres\":true,\"wheelColor\":1,\"interiorColor\":0,\"modSeats\":-1,\"bodyHealth\":977,\"modFrontBumper\":-1,\"modRoofLivery\":-1,\"modAerials\":-1,\"modSuspension\":4,\"pearlescentColor\":0,\"modXenon\":true,\"modExhaust\":-1,\"color1\":[0,0,0],\"modDoorR\":-1,\"modPlateHolder\":-1,\"oilLevel\":5,\"xenonColor\":8,\"modEngine\":3,\"neonColor\":[255,0,255],\"neonEnabled\":[false,false,false,false],\"modArchCover\":-1,\"windowTint\":1,\"extras\":[],\"modHood\":-1,\"modRightFender\":-1,\"modFrame\":-1,\"paintType2\":7,\"modVanityPlate\":-1,\"wheelWidth\":1.0,\"modSpoilers\":-1,\"modLightbar\":-1,\"modAirFilter\":-1,\"tyres\":[],\"modGrille\":-1,\"modSpeakers\":-1,\"modBrakes\":2,\"tyreSmokeColor\":[255,255,255],\"modCustomTiresR\":false,\"wheelSize\":1.0,\"modTrimB\":-1,\"modHydraulics\":false,\"modOrnaments\":-1,\"windows\":[4,5,7],\"modDashboard\":-1,\"modFender\":-1,\"modHydrolic\":-1,\"modStruts\":-1,\"plateIndex\":1,\"color2\":[0,0,0],\"modSideSkirt\":-1,\"modHorns\":-1,\"engineHealth\":985,\"modRearBumper\":-1}', 'car', NULL, 1, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'YYM 788', '{\"modExhaust\":-1,\"driftTyres\":false,\"plate\":\"YYM 788 \",\"windows\":[4,5],\"tankHealth\":1000,\"modSubwoofer\":-1,\"modDashboard\":-1,\"fuelLevel\":73,\"modTrimB\":-1,\"tyreSmokeColor\":[255,255,255],\"modTrunk\":-1,\"modPlateHolder\":-1,\"modFender\":-1,\"color2\":[255,0,0],\"modBackWheels\":-1,\"modHood\":-1,\"livery\":-1,\"modHydrolic\":-1,\"modSpoilers\":-1,\"modArmor\":4,\"oilLevel\":12,\"modSteeringWheel\":-1,\"modTrimA\":-1,\"color1\":[0,0,0],\"modDoorSpeaker\":-1,\"pearlescentColor\":0,\"modBrakes\":2,\"modRightFender\":-1,\"neonEnabled\":[false,false,false,false],\"modEngineBlock\":-1,\"extras\":[],\"modSmokeEnabled\":false,\"modFrontBumper\":-1,\"paintType1\":1,\"dirtLevel\":5,\"modSeats\":-1,\"modTank\":-1,\"engineHealth\":1000,\"modVanityPlate\":-1,\"modRearBumper\":-1,\"wheelSize\":0.70891845226287,\"modCustomTiresR\":false,\"bulletProofTyres\":true,\"modTransmission\":2,\"modRoof\":-1,\"modShifterLeavers\":-1,\"interiorColor\":0,\"modSideSkirt\":-1,\"doors\":[],\"modRoofLivery\":-1,\"model\":577497474,\"modDial\":-1,\"modLivery\":-1,\"wheelWidth\":0.68161070346832,\"modGrille\":-1,\"modAirFilter\":-1,\"modOrnaments\":-1,\"modHorns\":-1,\"modXenon\":true,\"modNitrous\":-1,\"modArchCover\":-1,\"neonColor\":[255,0,255],\"plateIndex\":1,\"modCustomTiresF\":false,\"modAerials\":-1,\"wheels\":7,\"modFrontWheels\":4,\"modStruts\":-1,\"bodyHealth\":1000,\"modHydraulics\":false,\"modFrame\":-1,\"modSpeakers\":-1,\"tyres\":[],\"xenonColor\":8,\"modWindows\":-1,\"modLightbar\":-1,\"modSuspension\":-1,\"modDoorR\":-1,\"dashboardColor\":0,\"modTurbo\":true,\"paintType2\":0,\"wheelColor\":134,\"modEngine\":3,\"modAPlate\":-1,\"windowTint\":1}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 0, 0, 'ZHN 434', '{\"wheels\":0,\"modSmokeEnabled\":false,\"windows\":[0,1,2,4,6,7],\"modHood\":-1,\"modTrimA\":-1,\"modDial\":-1,\"xenonColor\":8,\"plate\":\"ZHN 434 \",\"modBackWheels\":-1,\"livery\":-1,\"modTransmission\":2,\"tyres\":[],\"modRearBumper\":-1,\"modWindows\":-1,\"paintType2\":0,\"modArchCover\":-1,\"neonColor\":[255,0,255],\"wheelColor\":156,\"modAPlate\":-1,\"modHydraulics\":false,\"paintType1\":0,\"modShifterLeavers\":-1,\"interiorColor\":0,\"modLightbar\":-1,\"oilLevel\":12,\"modEngine\":3,\"modFender\":-1,\"modFrame\":-1,\"doors\":[],\"modRightFender\":-1,\"extras\":[],\"modStruts\":-1,\"modSpeakers\":-1,\"modAirFilter\":-1,\"pearlescentColor\":10,\"neonEnabled\":[false,false,false,false],\"modSuspension\":3,\"driftTyres\":false,\"modSeats\":-1,\"modHydrolic\":-1,\"modSpoilers\":-1,\"bulletProofTyres\":true,\"modGrille\":-1,\"modExhaust\":-1,\"bodyHealth\":947,\"modSideSkirt\":-1,\"modHorns\":-1,\"modLivery\":-1,\"modBrakes\":2,\"modSubwoofer\":-1,\"modEngineBlock\":-1,\"color1\":[0,0,0],\"fuelLevel\":29,\"modFrontBumper\":-1,\"modPlateHolder\":-1,\"modXenon\":true,\"dashboardColor\":0,\"model\":497572160,\"plateIndex\":1,\"wheelSize\":1.12606739997863,\"modCustomTiresR\":false,\"modRoofLivery\":-1,\"tankHealth\":985,\"modNitrous\":-1,\"modCustomTiresF\":false,\"modTank\":-1,\"modTrunk\":-1,\"modTurbo\":true,\"tyreSmokeColor\":[255,255,255],\"modVanityPlate\":-1,\"modDoorR\":-1,\"modSteeringWheel\":-1,\"color2\":[0,0,0],\"modDoorSpeaker\":-1,\"modAerials\":-1,\"modFrontWheels\":53,\"engineHealth\":990,\"windowTint\":1,\"modDashboard\":-1,\"modTrimB\":-1,\"modRoof\":-1,\"wheelWidth\":1.16006112098693,\"modOrnaments\":-1,\"modArmor\":4,\"dirtLevel\":14}', 'car', NULL, 1, 'Auto Impound', '1', NULL, 0, NULL, NULL, 'Pillbox Hill', NULL, 0),
(NULL, 'char1:4634506b65176f2c2aa6a1af9831d3efbd168ee0', 0, 0, 'ZHZ 633', '{\"model\":-1229221301,\"plate\":\"ZHZ 633\"}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0),
(NULL, 'char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 0, 0, 'ZIO 009', '{\"model\":1326776111,\"plate\":\"ZIO 009\"}', 'car', NULL, 0, 'Auto Impound', '1', NULL, 0, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `ox_inventory`
--

CREATE TABLE `ox_inventory` (
  `owner` varchar(259) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ox_inventory`
--

INSERT INTO `ox_inventory` (`owner`, `name`, `data`, `lastupdated`) VALUES
('char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'emslocker', NULL, '2025-06-01 21:34:12'),
('d621787821b7be9712dd11873dc3decchar1:ca533bf6a', 'property-95', '[{\"name\":\"water\",\"count\":18,\"slot\":1},{\"name\":\"burger\",\"count\":44,\"slot\":2},{\"name\":\"stimulant_combat\",\"count\":1,\"slot\":3},{\"name\":\"phone\",\"count\":1,\"slot\":4},{\"name\":\"ammo-sniper\",\"count\":135,\"slot\":5},{\"name\":\"radio\",\"count\":1,\"slot\":6},{\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"metadata\":{\"serial\":\"683242POL574450\",\"durability\":100,\"registered\":\"Martin Bubois\",\"components\":[]},\"slot\":7},{\"name\":\"ammo-rifle\",\"count\":800,\"slot\":8},{\"name\":\"ammo-shotgun\",\"count\":200,\"slot\":9},{\"name\":\"ammo-9\",\"count\":470,\"slot\":10},{\"name\":\"carkey\",\"count\":1,\"metadata\":{\"description\":\"\\n   · Plaque d\'immatriculation:  IUV 689   \\n   · Models: DLRS3\",\"plate\":\"IUV 689\"},\"slot\":11},{\"name\":\"WEAPON_PUMPSHOTGUN\",\"count\":1,\"metadata\":{\"ammo\":0,\"registered\":\"Juan Rodriguez\",\"serial\":\"419671WWV986375\",\"components\":[],\"durability\":100},\"slot\":12},{\"name\":\"WEAPON_SNIPERRIFLE\",\"count\":1,\"metadata\":{\"ammo\":10,\"durability\":85.5,\"serial\":\"709184VEV480413\",\"components\":[],\"registered\":\"Juan Rodriguez\"},\"slot\":15}]', '2025-06-01 21:31:59');

-- --------------------------------------------------------

--
-- Structure de la table `paintball_matches_20250521`
--

CREATE TABLE `paintball_matches_20250521` (
  `id` int(11) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `damage` int(11) DEFAULT NULL,
  `kills` int(11) DEFAULT NULL,
  `time_in_zone` int(11) DEFAULT NULL,
  `match_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paintball_players`
--

CREATE TABLE `paintball_players` (
  `identifier` varchar(259) NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT 0,
  `total_damage` int(11) DEFAULT 0,
  `total_kills` int(11) DEFAULT 0,
  `total_time_in_zone` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `paintball_players`
--

INSERT INTO `paintball_players` (`identifier`, `team_id`, `score`, `total_damage`, `total_kills`, `total_time_in_zone`) VALUES
('2bf7bb148f0f54b434ac370cab06e592866df450', 23, 2, 0, 1, 0),
('2e598f707aea8f476eac986e4b4004ea10e8bc5e', 22, 64, 0, 32, 0),
('cf872e2dbff1cf3152fff72b147ca07238315148', 23, 49612, 0, 0, 0),
('d621787821b7be9712dd11873dc3decca533bf6a', 21, 34, 0, 17, 0);

-- --------------------------------------------------------

--
-- Structure de la table `paintball_skills`
--

CREATE TABLE `paintball_skills` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `effect` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`effect`)),
  `cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `paintball_skills`
--

INSERT INTO `paintball_skills` (`id`, `name`, `description`, `identifier`, `type`, `effect`, `cost`) VALUES
(8, 'Zone Dominée', 'Gagnez +5 points si votre équipe ne subit aucune mort pendant 3 minutes', 'zone_dominance', 'bonus', '{\"bonus\":5,\"duration\":180}', 200000),
(9, 'Tueur en Série', '+2 points tous les 3 kills consécutifs', 'kill_streak', 'passive', '{\"bonus\":2,\"streak\":3}', 300000),
(10, 'Maître Tireur', 'Chaque kill vaut 3 points au lieu de 2', 'extra_kill_point', 'permanent', '{\"killPoint\":3}', 500000),
(11, 'Renforts Instantanés', 'Le temps de respawn est réduit de 5 secondes', 'fast_respawn', 'passive', '{\"respawnDelayReduction\":5}', 250000),
(12, 'Vision Tactique', 'Affiche temporairement tous les ennemis sur le radar toutes les 60s', 'radar_bonus', 'bonus', '{\"revealCooldown\":60}', 350000),
(13, 'Recrue Brute', 'Démarrez avec 10 points bonus', 'start_boost', 'permanent', '{\"startBonus\":10}', 100000),
(14, 'Motivation', 'Chaque kill de votre équipe ajoute 1 point à tous les membres', 'team_kill_bonus', 'passive', '{\"teamBonusOnKill\":1}', 450000);

-- --------------------------------------------------------

--
-- Structure de la table `paintball_teams`
--

CREATE TABLE `paintball_teams` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `score` int(11) DEFAULT 0,
  `password` varchar(255) DEFAULT NULL,
  `public` tinyint(1) DEFAULT 1,
  `owner_identifier` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `paintball_teams`
--

INSERT INTO `paintball_teams` (`id`, `name`, `score`, `password`, `public`, `owner_identifier`) VALUES
(21, 'VTS', 34, '1234', 0, 'd621787821b7be9712dd11873dc3decca533bf6a'),
(22, 'Dushitgang', 64, '123456789', 1, '2e598f707aea8f476eac986e4b4004ea10e8bc5e'),
(23, 'GuerreRP', 653, '6666', 1, 'cf872e2dbff1cf3152fff72b147ca07238315148');

-- --------------------------------------------------------

--
-- Structure de la table `paintball_team_skills`
--

CREATE TABLE `paintball_team_skills` (
  `team_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `acquired_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `playersTattoos`
--

CREATE TABLE `playersTattoos` (
  `id` int(11) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `tattoos` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `playersTattoos`
--

INSERT INTO `playersTattoos` (`id`, `identifier`, `tattoos`) VALUES
(1, 'license:d621787821b7be9712dd11873dc3decca533bf6a', '[{\"texture\":26,\"collection\":\"mpbeach_overlays\"},{\"texture\":46,\"collection\":\"mphipster_overlays\"}]'),
(2, 'steam:11000011799716e', '[{\"texture\":2,\"collection\":\"mpbusiness_overlays\"},{\"texture\":49,\"collection\":\"mphipster_overlays\"}]'),
(3, 'license:2e598f707aea8f476eac986e4b4004ea10e8bc5e', '[]'),
(4, 'steam:11000016f1641df', '[]'),
(5, 'steam:11000010c185938', '[]'),
(6, 'license:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', '[]'),
(7, 'license:2bf7bb148f0f54b434ac370cab06e592866df450', '[]'),
(8, 'license:4634506b65176f2c2aa6a1af9831d3efbd168ee0', '[]'),
(9, 'license:b42b206cb9676c013317ee3b92d5e19e2314bb26', '[{\"collection\":\"mpbeach_overlays\",\"texture\":2},{\"collection\":\"mpbusiness_overlays\",\"texture\":8},{\"collection\":\"mpbusiness_overlays\",\"texture\":4},{\"collection\":\"mpbusiness_overlays\",\"texture\":1},{\"collection\":\"mphipster_overlays\",\"texture\":40}]'),
(10, 'steam:110000154e5f8fd', '[]'),
(11, 'license:6dfb75f417bec5276010b020f222640f80c91043', '[]'),
(12, 'steam:1100001371fa608', '[]');

-- --------------------------------------------------------

--
-- Structure de la table `player_contacts`
--

CREATE TABLE `player_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `player_priv_garages`
--

CREATE TABLE `player_priv_garages` (
  `id` int(11) UNSIGNED NOT NULL,
  `owner` varchar(259) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `z` float DEFAULT NULL,
  `h` float DEFAULT NULL,
  `distance` int(11) DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `garage` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `properties`
--

INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`, `garage`) VALUES
(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{\"y\":564.89,\"z\":182.959,\"x\":119.384}', '{\"x\":117.347,\"y\":559.506,\"z\":183.304}', '{\"y\":557.032,\"z\":183.301,\"x\":118.037}', '{\"y\":567.798,\"z\":182.131,\"x\":119.249}', '[]', NULL, 1, 1, 0, '{\"x\":118.748,\"y\":566.573,\"z\":175.697}', 1500000, NULL),
(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{\"x\":372.796,\"y\":428.327,\"z\":144.685}', '{\"x\":373.548,\"y\":422.982,\"z\":144.907},', '{\"y\":420.075,\"z\":145.904,\"x\":372.161}', '{\"x\":372.454,\"y\":432.886,\"z\":143.443}', '[]', NULL, 1, 1, 0, '{\"x\":377.349,\"y\":429.422,\"z\":137.3}', 1500000, NULL),
(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{\"y\":-379.165,\"z\":37.961,\"x\":-936.363}', '{\"y\":-365.476,\"z\":113.274,\"x\":-913.097}', '{\"y\":-367.637,\"z\":113.274,\"x\":-918.022}', '{\"y\":-382.023,\"z\":37.961,\"x\":-943.626}', '[]', NULL, 1, 1, 0, '{\"x\":-927.554,\"y\":-377.744,\"z\":112.674}', 1700000, NULL),
(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{\"y\":440.8,\"z\":146.702,\"x\":346.964}', '{\"y\":437.456,\"z\":148.394,\"x\":341.683}', '{\"y\":435.626,\"z\":148.394,\"x\":339.595}', '{\"x\":350.535,\"y\":443.329,\"z\":145.764}', '[]', NULL, 1, 1, 0, '{\"x\":337.726,\"y\":436.985,\"z\":140.77}', 1500000, NULL),
(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{\"y\":502.696,\"z\":136.421,\"x\":-176.003}', '{\"y\":497.817,\"z\":136.653,\"x\":-174.349}', '{\"y\":495.069,\"z\":136.666,\"x\":-173.331}', '{\"y\":506.412,\"z\":135.0664,\"x\":-177.927}', '[]', NULL, 1, 1, 0, '{\"x\":-174.725,\"y\":493.095,\"z\":129.043}', 1500000, NULL),
(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{\"y\":596.58,\"z\":142.641,\"x\":-686.554}', '{\"y\":591.988,\"z\":144.392,\"x\":-681.728}', '{\"y\":590.608,\"z\":144.392,\"x\":-680.124}', '{\"y\":599.019,\"z\":142.059,\"x\":-689.492}', '[]', NULL, 1, 1, 0, '{\"x\":-680.46,\"y\":588.6,\"z\":136.769}', 1500000, NULL),
(7, 'LowEndApartment', 'Appartement de base', '{\"y\":-1078.735,\"z\":28.4031,\"x\":292.528}', '{\"y\":-1007.152,\"z\":-102.002,\"x\":265.845}', '{\"y\":-1002.802,\"z\":-100.008,\"x\":265.307}', '{\"y\":-1078.669,\"z\":28.401,\"x\":296.738}', '[]', NULL, 1, 1, 0, '{\"x\":265.916,\"y\":-999.38,\"z\":-100.008}', 562500, NULL),
(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{\"y\":454.955,\"z\":96.462,\"x\":-1294.433}', '{\"x\":-1289.917,\"y\":449.541,\"z\":96.902}', '{\"y\":446.322,\"z\":96.899,\"x\":-1289.642}', '{\"y\":455.453,\"z\":96.517,\"x\":-1298.851}', '[]', NULL, 1, 1, 0, '{\"x\":-1287.306,\"y\":455.901,\"z\":89.294}', 1500000, NULL),
(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{\"x\":-853.346,\"y\":696.678,\"z\":147.782}', '{\"y\":690.875,\"z\":151.86,\"x\":-859.961}', '{\"y\":688.361,\"z\":151.857,\"x\":-859.395}', '{\"y\":701.628,\"z\":147.773,\"x\":-855.007}', '[]', NULL, 1, 1, 0, '{\"x\":-858.543,\"y\":697.514,\"z\":144.253}', 1500000, NULL),
(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{\"y\":620.494,\"z\":141.588,\"x\":-752.82}', '{\"y\":618.62,\"z\":143.153,\"x\":-759.317}', '{\"y\":617.629,\"z\":143.153,\"x\":-760.789}', '{\"y\":621.281,\"z\":141.254,\"x\":-750.919}', '[]', NULL, 1, 1, 0, '{\"x\":-762.504,\"y\":618.992,\"z\":135.53}', 1500000, NULL),
(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{\"y\":37.025,\"z\":42.58,\"x\":-618.299}', '{\"y\":58.898,\"z\":97.2,\"x\":-603.301}', '{\"y\":58.941,\"z\":97.2,\"x\":-608.741}', '{\"y\":30.603,\"z\":42.524,\"x\":-620.017}', '[]', NULL, 1, 1, 0, '{\"x\":-622.173,\"y\":54.585,\"z\":96.599}', 1700000, NULL),
(12, 'MiltonDrive', 'Milton Drive', '{\"x\":-775.17,\"y\":312.01,\"z\":84.658}', NULL, NULL, '{\"x\":-775.346,\"y\":306.776,\"z\":84.7}', '[]', NULL, 0, 0, 1, NULL, 0, NULL),
(13, 'Modern1Apartment', 'Appartement Moderne 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_01_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.661,\"y\":327.672,\"z\":210.396}', 1300000, NULL),
(14, 'Modern2Apartment', 'Appartement Moderne 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_01_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.735,\"y\":326.757,\"z\":186.313}', 1300000, NULL),
(15, 'Modern3Apartment', 'Appartement Moderne 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_01_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.386,\"y\":330.782,\"z\":195.08}', 1300000, NULL),
(16, 'Mody1Apartment', 'Appartement Mode 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_02_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.615,\"y\":327.878,\"z\":210.396}', 1300000, NULL),
(17, 'Mody2Apartment', 'Appartement Mode 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_02_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.297,\"y\":327.092,\"z\":186.313}', 1300000, NULL),
(18, 'Mody3Apartment', 'Appartement Mode 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_02_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.303,\"y\":330.932,\"z\":195.085}', 1300000, NULL),
(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_03_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.885,\"y\":327.641,\"z\":210.396}', 1300000, NULL),
(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_03_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.607,\"y\":327.344,\"z\":186.313}', 1300000, NULL),
(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_03_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.525,\"y\":330.851,\"z\":195.085}', 1300000, NULL),
(22, 'Sharp1Apartment', 'Appartement Persan 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_04_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.527,\"y\":327.89,\"z\":210.396}', 1300000, NULL),
(23, 'Sharp2Apartment', 'Appartement Persan 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_04_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.642,\"y\":326.497,\"z\":186.313}', 1300000, NULL),
(24, 'Sharp3Apartment', 'Appartement Persan 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_04_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.503,\"y\":331.318,\"z\":195.085}', 1300000, NULL),
(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_05_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.289,\"y\":328.086,\"z\":210.396}', 1300000, NULL),
(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_05_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.692,\"y\":326.762,\"z\":186.313}', 1300000, NULL),
(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_05_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.094,\"y\":330.976,\"z\":195.085}', 1300000, NULL),
(28, 'Seductive1Apartment', 'Appartement Séduisant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_06_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.263,\"y\":328.104,\"z\":210.396}', 1300000, NULL),
(29, 'Seductive2Apartment', 'Appartement Séduisant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_06_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.655,\"y\":326.611,\"z\":186.313}', 1300000, NULL),
(30, 'Seductive3Apartment', 'Appartement Séduisant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_06_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.3,\"y\":331.414,\"z\":195.085}', 1300000, NULL),
(31, 'Regal1Apartment', 'Appartement Régal 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_07_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.956,\"y\":328.257,\"z\":210.396}', 1300000, NULL),
(32, 'Regal2Apartment', 'Appartement Régal 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_07_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.545,\"y\":326.659,\"z\":186.313}', 1300000, NULL),
(33, 'Regal3Apartment', 'Appartement Régal 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_07_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.087,\"y\":331.429,\"z\":195.123}', 1300000, NULL),
(34, 'Aqua1Apartment', 'Appartement Aqua 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_08_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.187,\"y\":328.47,\"z\":210.396}', 1300000, NULL),
(35, 'Aqua2Apartment', 'Appartement Aqua 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_08_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.658,\"y\":326.563,\"z\":186.313}', 1300000, NULL),
(36, 'Aqua3Apartment', 'Appartement Aqua 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_08_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.287,\"y\":331.084,\"z\":195.086}', 1300000, NULL),
(37, 'IntegrityWay', '4 Integrity Way', '{\"x\":-47.804,\"y\":-585.867,\"z\":36.956}', NULL, NULL, '{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}', '[]', NULL, 0, 0, 1, NULL, 0, NULL),
(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}', '{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}', 1700000, NULL),
(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}', '{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}', 1700000, NULL),
(40, 'DellPerroHeights', 'Dell Perro Heights', '{\"x\":-1447.06,\"y\":-538.28,\"z\":33.74}', NULL, NULL, '{\"x\":-1440.022,\"y\":-548.696,\"z\":33.74}', '[]', NULL, 0, 0, 1, NULL, 0, NULL),
(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{\"x\":-1452.125,\"y\":-540.591,\"z\":73.044}', '{\"x\":-1455.435,\"y\":-535.79,\"z\":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1467.058,\"y\":-527.571,\"z\":72.443}', 1700000, NULL),
(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{\"x\":-1451.562,\"y\":-523.535,\"z\":55.928}', '{\"x\":-1456.02,\"y\":-519.209,\"z\":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}', 1700000, NULL),
(43, 'kevin', 'Kevin', '{\"y\":343.4445,\"x\":-371.7833,\"z\":108.9427}', '{\"x\":-1451.6394,\"y\":-523.5562,\"z\":55.9290}', '{\"x\":-1459.17,\"y\":-520.58,\"z\":54.929}', '{\"y\":343.4445,\"x\":-371.7833,\"z\":111.9427}', '[]', NULL, 1, 1, 0, '{\"y\":-529.4382,\"x\":-1456.7041,\"z\":55.9377}', 250000000, '{\"y\":345.4895,\"x\":-380.5996,\"z\":108.2462}');

-- --------------------------------------------------------

--
-- Structure de la table `radiocar`
--

CREATE TABLE `radiocar` (
  `id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `spz` varchar(50) NOT NULL,
  `index_music` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `radiocar`
--

INSERT INTO `radiocar` (`id`, `label`, `url`, `spz`, `index_music`) VALUES
(1, 'mood', 'https://www.youtube.com/watch?v=Ow07uqhyYwo', '4FP75609', 2),
(2, 'tiakola ', 'https://www.youtube.com/watch?v=VIs9zdNq_IU&list=RDVIs9zdNq_IU&start_radio=1', '  RZK   ', 0),
(3, 'yeah', 'https://www.youtube.com/watch?v=3eNCSxMYSrs&list=RD3eNCSxMYSrs&start_radio=1', '9301P6RK', 3),
(4, 'mix', 'https://www.youtube.com/watch?v=7tKB719Wls8&list=WL', 'RW1A349R', 4),
(5, 'mix', 'https://www.youtube.com/watch?v=7tKB719Wls8&list=WL', 'RW1A349R', 4),
(6, '', '', 'F355O573', 4),
(7, '', '', 'F355O573', 4),
(8, 'au champ elise', 'https://www.youtube.com/watch?v=-jm-OujiGYk', 'LB3Q57PF', 3),
(9, 'au champ elise', 'https://www.youtube.com/watch?v=-jm-OujiGYk', 'LB3Q57PF', 3),
(10, 'au champ elise', 'https://www.youtube.com/watch?v=-jm-OujiGYk', 'LB3Q57PF', 3),
(11, 'au champ elise', 'https://www.youtube.com/watch?v=-jm-OujiGYk', 'LB3Q57PF', 3),
(12, 'celibataire polygame', 'https://www.youtube.com/watch?v=fmBRUePQ9-Y', 'GW22UM16', 0),
(13, 'shatta toute la night', 'https://www.youtube.com/watch?v=38VvEA3jVIc', 'GW22UM16', 1),
(14, 'Legende ducratif', 'https://www.youtube.com/watch?v=EH-oqta3LP0', 'WOPX1566', 2),
(15, 'Legende ducratif', 'https://www.youtube.com/watch?v=EH-oqta3LP0', 'WOPX1566', 2),
(16, 'Legende ducratif', 'https://www.youtube.com/watch?v=EH-oqta3LP0', 'WOPX1566', 2),
(17, 'Legende ducratif', 'https://www.youtube.com/watch?v=f3prKwzl_hU', '90MD6092', 3),
(18, 'Legende ducratif', 'https://www.youtube.com/watch?v=f3prKwzl_hU', '90MD6092', 3),
(19, 'Legende ducratif', 'https://www.youtube.com/watch?v=f3prKwzl_hU', '90MD6092', 3),
(20, 'Legende ducratif', 'https://www.youtube.com/watch?v=7QnTdb4Oh8E', '90MD6092', 4),
(21, 'Legende ducratif', 'https://www.youtube.com/watch?v=7QnTdb4Oh8E', '90MD6092', 4),
(22, 'Legende ducratif', 'https://www.youtube.com/watch?v=7QnTdb4Oh8E', '90MD6092', 4),
(23, 'Legende ducratif', 'https://www.youtube.com/watch?v=7QnTdb4Oh8E', 'BHL 403 ', 4),
(24, 'Legende ducratif', 'https://www.youtube.com/watch?v=7QnTdb4Oh8E', 'BHL 403 ', 4),
(25, 'Legende ducratif', 'https://www.youtube.com/watch?v=7QnTdb4Oh8E', 'BHL 403 ', 4);

-- --------------------------------------------------------

--
-- Structure de la table `radiocar_owned`
--

CREATE TABLE `radiocar_owned` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(259) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ricky_admin`
--

CREATE TABLE `ricky_admin` (
  `identifier` varchar(259) NOT NULL,
  `warn` longtext DEFAULT NULL,
  `kick` longtext DEFAULT NULL,
  `ban` longtext DEFAULT NULL,
  `jail` longtext DEFAULT NULL,
  `inJail` int(11) DEFAULT 0,
  `jailCoords` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ricky_admin`
--

INSERT INTO `ricky_admin` (`identifier`, `warn`, `kick`, `ban`, `jail`, `inJail`, `jailCoords`) VALUES
('cf872e2dbff1cf3152fff72b147ca07238315148', NULL, NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `sd_reviews`
--

CREATE TABLE `sd_reviews` (
  `ReviewID` int(11) NOT NULL,
  `BusinessName` varchar(100) NOT NULL,
  `AuthorIdentifier` varchar(100) DEFAULT NULL,
  `AuthorName` varchar(100) DEFAULT 'Anonymous',
  `Rating` tinyint(4) NOT NULL,
  `ReviewText` text DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sd_reviews`
--

INSERT INTO `sd_reviews` (`ReviewID`, `BusinessName`, `AuthorIdentifier`, `AuthorName`, `Rating`, `ReviewText`, `CreatedAt`) VALUES
(1, 'Donnez votre avis', 'f872e2dbff1cf3152fff72b147ca07238315148', 'Anonymous', 5, 'Super serveur ! Bonne ambiance, belle équipe !', '2025-04-16 21:47:01'),
(2, 'Donnez votre avis', '2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ivan Dushit', 5, 'bon serveur, owner au top, je valide a 100%\n', '2025-04-18 21:18:29'),
(3, 'Donnez votre avis', 'd621787821b7be9712dd11873dc3decca533bf6a', 'Juan Rodriguez', 5, 'rien a dire sur le serveur un serv magique et chaleureux ', '2025-04-23 18:35:27'),
(4, 'Donnez votre avis', 'b42b206cb9676c013317ee3b92d5e19e2314bb26', 'Anonymous', 5, 'le jeux est magnifique les graphismes sont super avec zero lag', '2025-04-23 18:53:25'),
(5, 'Donnez votre avis', 'bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 'Anonymous', 5, 'tres bon serveur agreable a jouer ', '2025-04-26 19:40:01'),
(6, 'Donnez votre avis', '2bf7bb148f0f54b434ac370cab06e592866df450', 'Anonymous', 5, 'Chui bieng', '2025-04-27 17:02:38'),
(15, 'Donnez votre avis', 'crypté', 'GuerreRP', 10, 'Je suis bien construit non ?', '2035-07-01 09:56:42'),
(18, 'Donnez votre avis', 'cf872e2dbff1cf3152fff72b147ca07238315148', 'Martin Bubois', 5, 'Super serveur !', '2025-07-18 15:28:03');

-- --------------------------------------------------------

--
-- Structure de la table `shop_web`
--

CREATE TABLE `shop_web` (
  `id` int(11) NOT NULL,
  `key` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `multicharact` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `shop_web`
--

INSERT INTO `shop_web` (`id`, `key`, `name`, `description`, `price`, `multicharact`) VALUES
(1, 'addperso', 'Ajouter un personnage', 'Crée un nouveau personnage pour repartir sur une nouvelle aventure, à vos claviers !', 1000, 0),
(2, 'money_1million', '1 Million de $ en banque', 'Vous avez besoin d\'argent ?\r\nOui c\'est la galère, dans ce cas, le produit actuel vous propose d\'avoir 1 million de dollars dans votre banque.', 1000, 1),
(3, 'money_2.5million', '2 Million +500k GRATUIT de $ en banque', 'Vous avez besoin d\'argent ?\r\nLa tu va être bien avec ce pactole d\'argent, 2 millions 500 milles DOLLARS !\r\nSi c\'est pas le feu !!!', 2000, 1),
(4, 'personnel_point_100', '100 score personnel PaintBall', 'Grimpe en haut du tableau des scores en prenant 100 points de score personnel au Paintball', 200, 0),
(5, 'personnel_point_300', '250 + 50 GRATUIT score personnel PaintBall', 'Grimpe en haut du tableau des scores en prenant 250 points de score personnel au Paintball\r\nEt en cadeau on t\'offre 50 points en plus !', 500, 0),
(6, 'money_500k', '500 milles $ en banque', 'Pour bien commencer c\'est super !', 500, 1);

-- --------------------------------------------------------

--
-- Structure de la table `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `staff_permissions`
--

CREATE TABLE `staff_permissions` (
  `id` int(11) NOT NULL,
  `discord_id` varchar(64) NOT NULL,
  `permission` varchar(64) NOT NULL,
  `allowed` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `staff_permissions`
--

INSERT INTO `staff_permissions` (`id`, `discord_id`, `permission`, `allowed`) VALUES
(2, '1245393309778841702', 'gestion_caisses', 0);

-- --------------------------------------------------------

--
-- Structure de la table `staff_ranks`
--

CREATE TABLE `staff_ranks` (
  `id` int(11) NOT NULL,
  `rank_name` varchar(64) NOT NULL,
  `permissions` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `staff_ranks`
--

INSERT INTO `staff_ranks` (`id`, `rank_name`, `permissions`) VALUES
(1, 'fondateur', '[\"dashboard\",\"utilisateurs\",\"logs\",\"sql\",\"infos_cfx\",\"create_lestconnect\",\"infos_bank\",\"infos_coins\",\"infos_job\",\"identite\",\"personnage\",\"last_pos\",\"inventaire\",\"time_game\",\"info_skin\",\"status_alimentaire\",\"pin_bancaire\",\"createat\",\"updatedAt\"]');

-- --------------------------------------------------------

--
-- Structure de la table `tebex_histo`
--

CREATE TABLE `tebex_histo` (
  `id` int(11) NOT NULL,
  `player` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `package_id` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `month` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tebex_histo`
--

INSERT INTO `tebex_histo` (`id`, `player`, `price`, `package_id`, `ip`, `date`, `month`) VALUES
(18, 'Martin Bubois', '0.00', '91819441', '127.0.0.1', '26/03/2025', '03/2025');

-- --------------------------------------------------------

--
-- Structure de la table `territories`
--

CREATE TABLE `territories` (
  `id` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `radius` int(11) NOT NULL DEFAULT 50,
  `color` int(11) NOT NULL DEFAULT 1,
  `job` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `territories`
--

INSERT INTO `territories` (`id`, `x`, `y`, `z`, `radius`, `color`, `job`) VALUES
(3, -2169.3, 3169.4, 32.8, 500, 1, 'US-Army'),
(5, 626.6, 275.9, 103.1, 50, 0, 'Libre'),
(6, 170.3, 3278.6, 40.3, 50, 0, 'Libre'),
(7, 482.3, 5563.5, 790.1, 50, 0, 'Libre'),
(8, 1658.8, 0.8, 173.2, 50, 0, 'Libre'),
(9, 1456.3, 2927.3, 46.4, 50, 0, 'Libre'),
(10, -1232.5, -2266.7, 13.5, 130, 1, 'Russia'),
(11, 2492.4, 5580.9, 44.4, 100, 0, 'Checkpoint'),
(13, 2595.66, 1883.01, 26.9889, 50, 63, 'CNU'),
(15, -1035.12, -2733.81, 20.16, 200, 5, 'FSA'),
(16, -459.3, 6016.67, 31.49, 200, 3, 'ARP'),
(17, 1729.94, 3256.86, 41.2536, 200, 22, 'CIT'),
(18, 1333.5, 3128.26, 40.943, 100, 22, 'CIT'),
(19, 1110.89, 3066.22, 40.908, 100, 22, 'CIT'),
(20, 1990.93, 3049.42, 54.5368, 50, 73, 'RPBC'),
(21, 171.157, 2785.19, 46.1806, 50, 59, 'MS'),
(22, 445.7, -1106.77, 43.0685, 70, 38, 'Police-Formation'),
(23, 458.658, -992.368, 43.6917, 50, 38, 'Commissariat-Actif'),
(24, -294.419, -1061.41, 76.5773, 50, 0, 'Libre'),
(25, -627.2, 239.04, 82.07, 1, 46, 'Donne-Ton-Avis');

-- --------------------------------------------------------

--
-- Structure de la table `twitter_accounts`
--

CREATE TABLE `twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) DEFAULT NULL,
  `identifier` varchar(259) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `twitter_accounts`
--

INSERT INTO `twitter_accounts` (`id`, `username`, `password`, `avatar_url`, `identifier`) VALUES
(1624, 'Martin Bubois', '0', NULL, 'cf872e2dbff1cf3152fff72b147ca07238315148');

-- --------------------------------------------------------

--
-- Structure de la table `twitter_likes`
--

CREATE TABLE `twitter_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `twitter_tweets`
--

CREATE TABLE `twitter_tweets` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) DEFAULT NULL,
  `message` varchar(256) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `uniq_garage`
--

CREATE TABLE `uniq_garage` (
  `owner` varchar(259) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `uniq_garage`
--

INSERT INTO `uniq_garage` (`owner`, `name`, `data`) VALUES
('cf872e2dbff1cf3152fff72b147ca07238315148', 'Arcadius Business Centre Garage', '{\"name\":\"Arcadius Business Centre Garage\",\"slot\":[[\"LSV 741\",\"XKT 799\",\"2M3A3583\",\"BGJ 210\",\"IAH 111\"]],\"style\":[[{\"type\":\"interior\",\"name\":\"garage_decor_04\"},{\"type\":\"light\",\"name\":\"lighting_option09\"},{\"type\":\"signage\",\"name\":\"numbering_style09_n1\"}]]}'),
('cf872e2dbff1cf3152fff72b147ca07238315148', 'Eclipse Boulevard Garage', '{\"name\":\"Eclipse Boulevard Garage\",\"slot\":[],\"style\":[[{\"type\":\"interior\",\"name\":\"entity_set_shell_03\"},{\"name\":\"entity_set_numbers_01\"},{\"type\":\"tint\",\"name\":\"entity_set_tint_01\",\"color\":10}],[{\"type\":\"interior\",\"name\":\"entity_set_shell_03\"},{\"name\":\"entity_set_numbers_02\"},{\"type\":\"tint\",\"name\":\"entity_set_tint_01\",\"color\":4}],[{\"type\":\"interior\",\"name\":\"entity_set_shell_03\"},{\"name\":\"entity_set_numbers_03\"},{\"type\":\"tint\",\"name\":\"entity_set_tint_01\",\"color\":11}],[{\"type\":\"interior\",\"name\":\"entity_set_shell_01\"},{\"name\":\"entity_set_numbers_04\"},{\"type\":\"tint\",\"name\":\"entity_set_tint_01\",\"color\":1}],[{\"type\":\"interior\",\"name\":\"entity_set_shell_01\"},{\"name\":\"entity_set_numbers_05\"},{\"type\":\"tint\",\"name\":\"entity_set_tint_01\",\"color\":1}]]}'),
('2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Arcadius Business Centre Garage', '{\"name\":\"Arcadius Business Centre Garage\",\"slot\":[[\"DGT 838\",\"11Q6I0T5\"]],\"style\":[[{\"type\":\"interior\",\"name\":\"garage_decor_01\"},{\"type\":\"light\",\"name\":\"lighting_option01\"},{\"type\":\"signage\",\"name\":\"numbering_style09_n1\"}]]}'),
('2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Eclipse Boulevard Garage', '{\"name\":\"Eclipse Boulevard Garage\",\"slot\":[[\"3B5GM914\",\"98G4XDZ0\",\"1AJD930D\"]],\"style\":[[{\"type\":\"interior\",\"name\":\"entity_set_shell_03\"},{\"name\":\"entity_set_numbers_01\"},{\"type\":\"tint\",\"name\":\"entity_set_tint_01\",\"color\":8}],[{\"type\":\"interior\",\"name\":\"entity_set_shell_03\"},{\"name\":\"entity_set_numbers_02\"},{\"type\":\"tint\",\"name\":\"entity_set_tint_01\",\"color\":7}],[{\"type\":\"interior\",\"name\":\"entity_set_shell_03\"},{\"name\":\"entity_set_numbers_03\"},{\"type\":\"tint\",\"name\":\"entity_set_tint_01\",\"color\":9}],[{\"type\":\"interior\",\"name\":\"entity_set_shell_01\"},{\"name\":\"entity_set_numbers_04\"},{\"type\":\"tint\",\"name\":\"entity_set_tint_01\",\"color\":1}],[{\"type\":\"interior\",\"name\":\"entity_set_shell_01\"},{\"name\":\"entity_set_numbers_05\"},{\"type\":\"tint\",\"name\":\"entity_set_tint_01\",\"color\":1}]]}'),
('char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Arcadius Business Centre Garage', '{\"style\":[[{\"type\":\"interior\",\"name\":\"garage_decor_01\"},{\"type\":\"light\",\"name\":\"lighting_option01\"},{\"type\":\"signage\",\"name\":\"numbering_style01_n1\"}]],\"name\":\"Arcadius Business Centre Garage\",\"slot\":[]}');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `identifier` varchar(259) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `position` longtext DEFAULT NULL,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `pincode` int(11) DEFAULT NULL,
  `prime` varchar(50) NOT NULL DEFAULT '0',
  `newvip` varchar(50) NOT NULL DEFAULT '0',
  `prisma` varchar(50) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT 0,
  `primebought_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `coins` int(11) NOT NULL DEFAULT 0,
  `avis` int(11) NOT NULL DEFAULT 0,
  `crypto` varchar(255) NOT NULL DEFAULT '{"bitcoin": 0, "ethereum": 0, "bitcoin-cash": 0, "bitcoin-sv": 0, "litecoin": 0, "binance-coin": 0, "monero": 0, "dash": 0, "zcash": 0, "maker": 0}',
  `phone_number` varchar(20) DEFAULT NULL,
  `phone` longtext DEFAULT NULL,
  `profilepicture` longtext DEFAULT NULL,
  `background` longtext DEFAULT NULL,
  `iban` longtext DEFAULT NULL,
  `dnzpremium` int(11) NOT NULL DEFAULT 0,
  `twitteraccount` varchar(50) DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `calls` longtext DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `photos` longtext DEFAULT NULL,
  `darkchatuser` mediumtext DEFAULT NULL,
  `mailaccount` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `metadata`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `status`, `is_dead`, `id`, `disabled`, `last_property`, `created_at`, `last_seen`, `pincode`, `prime`, `newvip`, `prisma`, `level`, `primebought_date`, `coins`, `avis`, `crypto`, `phone_number`, `phone`, `profilepicture`, `background`, `iban`, `dnzpremium`, `twitteraccount`, `settings`, `calls`, `notes`, `photos`, `darkchatuser`, `mailaccount`) VALUES
('char1:2bf7bb148f0f54b434ac370cab06e592866df450', '{\"bank\":3098349,\"money\":0,\"black_money\":0}', 'cm', '[{\"metadata\":{\"ammo\":25,\"components\":[],\"registered\":\"David Lafarge\",\"durability\":97.2399999999999,\"serial\":\"976652BVP342020\"},\"count\":1,\"name\":\"WEAPON_CARBINERIFLE\",\"slot\":1},{\"metadata\":{\"ammo\":8,\"components\":[],\"registered\":\"Juan Rodriguez\",\"durability\":95.60000000000028,\"serial\":\"165720OTZ204823\"},\"count\":1,\"name\":\"WEAPON_PUMPSHOTGUN\",\"slot\":2},{\"metadata\":{\"ammo\":15,\"components\":[],\"registered\":\"Juan Rodriguez\",\"durability\":72.80000000000156,\"serial\":\"193779EYE860949\"},\"count\":1,\"name\":\"WEAPON_APPISTOL\",\"slot\":3},{\"metadata\":{\"durability\":100,\"components\":[]},\"count\":1,\"name\":\"WEAPON_RAYPISTOL\",\"slot\":4},{\"count\":1,\"name\":\"map\",\"slot\":5},{\"count\":6,\"name\":\"burger\",\"slot\":6},{\"count\":2,\"name\":\"water\",\"slot\":7},{\"count\":197,\"name\":\"ammo-shotgun\",\"slot\":8},{\"count\":153,\"name\":\"ammo-rifle\",\"slot\":9},{\"count\":313,\"name\":\"ammo-9\",\"slot\":10},{\"count\":1,\"name\":\"ammo-sniper\",\"slot\":11},{\"count\":1,\"name\":\"anti_zombie\",\"slot\":13},{\"count\":1,\"name\":\"cure_zombie\",\"slot\":14},{\"count\":1,\"name\":\"gps\",\"slot\":15},{\"count\":1,\"name\":\"map\",\"slot\":16}]', 'unemployed', 0, '[]', '{\"health\":185,\"armor\":0,\"lastPlaytime\":104938,\"jobDuty\":false}', '{\"x\":102.47472381591797,\"heading\":357.16534423828127,\"z\":45.7420654296875,\"y\":-759.8241577148438}', 'David', 'Lafarge', '01/01/1990', 'm', 189, '{\"grandparents\":0,\"shoes_2\":0,\"beard_2\":0,\"bodyb_4\":0,\"decals_2\":0,\"lipstick_2\":0,\"watches_2\":0,\"glasses_2\":0,\"cheeks_1\":0,\"eyebrows_3\":0,\"chin_1\":0,\"hair_1\":19,\"chain_1\":0,\"makeup_3\":0,\"helmet_2\":0,\"bodyb_1\":-1,\"chest_2\":0,\"helmet_1\":-1,\"chin_2\":0,\"ears_1\":-1,\"cheeks_2\":0,\"glasses_1\":0,\"eyebrows_2\":0,\"neck_thickness\":0,\"hair_2\":2,\"mask_1\":0,\"pants_1\":0,\"mom\":0,\"sun_1\":0,\"face_md_weight\":53,\"eye_squint\":0,\"nose_3\":4,\"beard_4\":0,\"face_g_weight\":3,\"chest_3\":0,\"complexion_2\":0,\"chest_1\":0,\"hair_color_2\":0,\"moles_1\":0,\"tshirt_2\":0,\"bags_2\":0,\"ears_2\":0,\"chin_3\":0,\"lipstick_1\":0,\"lip_thickness\":0,\"eyebrows_1\":0,\"moles_2\":0,\"beard_3\":0,\"sex\":0,\"eye_color\":0,\"blemishes_1\":0,\"jaw_2\":0,\"nose_5\":8,\"nose_4\":4,\"hair_color_1\":19,\"bproof_1\":0,\"dad\":4,\"lipstick_4\":0,\"lipstick_3\":0,\"torso_2\":0,\"blemishes_2\":0,\"arms\":0,\"chain_2\":0,\"tshirt_1\":2,\"blush_2\":0,\"nose_6\":4,\"sun_2\":0,\"pants_2\":0,\"beard_1\":0,\"makeup_2\":0,\"arms_2\":0,\"age_2\":0,\"cheeks_3\":0,\"bags_1\":0,\"bodyb_3\":-1,\"blush_1\":0,\"makeup_4\":0,\"watches_1\":-1,\"complexion_1\":0,\"bracelets_2\":0,\"jaw_1\":0,\"makeup_1\":0,\"nose_1\":4,\"age_1\":0,\"bproof_2\":0,\"eyebrows_5\":0,\"eyebrows_4\":0,\"shoes_1\":0,\"nose_2\":6,\"mask_2\":0,\"bracelets_1\":-1,\"chin_4\":0,\"bodyb_2\":0,\"eyebrows_6\":0,\"skin_md_weight\":54,\"blush_3\":0,\"decals_1\":0,\"torso_1\":6}', '[{\"val\":425700,\"name\":\"hunger\",\"percent\":42.57},{\"val\":444275,\"name\":\"thirst\",\"percent\":44.42749999999999}]', 0, 10, 0, NULL, '2025-04-27 16:40:59', '2025-07-18 23:26:42', 6666, '0', '0', '0', 0, '2025-04-27 16:40:59', 0, 0, '{\"bitcoin\": 0, \"ethereum\": 0, \"bitcoin-cash\": 0, \"bitcoin-sv\": 0, \"litecoin\": 0, \"binance-coin\": 0, \"monero\": 0, \"dash\": 0, \"zcash\": 0, \"maker\": 0}', '38300', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('char1:2e598f707aea8f476eac986e4b4004ea10e8bc5e', '{\"bank\":9.999999999990789e23,\"black_money\":0,\"money\":2111026}', 'admin', '[{\"name\":\"map\",\"count\":1,\"slot\":1},{\"metadata\":{\"registered\":\"Ivan Dushit\",\"serial\":\"778445POL129671\",\"ammo\":30,\"durability\":75.8199999999991,\"components\":[]},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":2},{\"metadata\":{\"registered\":\"Ivan Dushit\",\"serial\":\"185189CMW313441\",\"ammo\":3,\"durability\":69.70000000000172,\"components\":[]},\"name\":\"WEAPON_PISTOL50\",\"count\":1,\"slot\":3},{\"name\":\"gps\",\"count\":1,\"slot\":4},{\"metadata\":{\"registered\":\"Ivan Dushit\",\"serial\":\"534233DLO706156\",\"ammo\":127,\"durability\":73.80000000000149,\"components\":[],\"type\":1},\"name\":\"WEAPON_RAYMINIGUN\",\"count\":1,\"slot\":5},{\"name\":\"ammo-9\",\"count\":322,\"slot\":6},{\"metadata\":{\"type\":1},\"name\":\"radio\",\"count\":1,\"slot\":7},{\"name\":\"water\",\"count\":7,\"slot\":8},{\"name\":\"money\",\"count\":2111026,\"slot\":9},{\"name\":\"ammo-rifle\",\"count\":244,\"slot\":10},{\"name\":\"ammo-laser\",\"count\":1611,\"slot\":11},{\"metadata\":{\"registered\":\"Ivan Dushit\",\"serial\":\"677431BLA838440\",\"ammo\":8,\"durability\":99.30000000000004,\"components\":[]},\"name\":\"WEAPON_PUMPSHOTGUN\",\"count\":1,\"slot\":12},{\"metadata\":{\"registered\":\"Ivan Dushit\",\"serial\":\"230585GRZ217704\",\"ammo\":0,\"durability\":100,\"components\":[]},\"name\":\"WEAPON_HEAVYSNIPER\",\"count\":1,\"slot\":13},{\"name\":\"ammo-shotgun\",\"count\":26,\"slot\":14},{\"name\":\"burger\",\"count\":15,\"slot\":15},{\"metadata\":{\"plate\":\"N6T3LEDM\",\"description\":\"\\n   · Plaque d\'immatriculation:  N6T3LEDM   \\n   · Models: LUXOR2\"},\"name\":\"carkey\",\"count\":1,\"slot\":29},{\"metadata\":{\"type\":1},\"name\":\"ammo-50\",\"count\":194,\"slot\":30},{\"name\":\"map\",\"count\":1,\"slot\":31},{\"name\":\"cure_zombie\",\"count\":1,\"slot\":35},{\"name\":\"ammo-rifle2\",\"count\":49916,\"slot\":38},{\"metadata\":{\"name\":\"Ivan Dushit\",\"dateofbirth\":\"09/12/1999\"},\"name\":\"carteidentite\",\"count\":1,\"slot\":42},{\"name\":\"anti_zombie\",\"count\":1,\"slot\":33},{\"name\":\"anti_zombie\",\"count\":1,\"slot\":34},{\"name\":\"bread\",\"count\":5,\"slot\":40}]', 'police', 4, '[]', '{\"health\":0,\"armor\":0,\"jobDuty\":true,\"lastPlaytime\":39467}', '{\"y\":-758.6769409179688,\"z\":7.5772705078125,\"heading\":68.031494140625,\"x\":-1832.953857421875}', 'Ivan', 'Dushit', '09/12/1999', 'm', 180, '{\"arms\":0,\"eyebrows_6\":0,\"arms_2\":0,\"bags_1\":0,\"bodyb_4\":0,\"makeup_3\":0,\"shoes_2\":2,\"decals_2\":0,\"blush_2\":0,\"glasses_2\":0,\"helmet_1\":-1,\"torso_1\":178,\"complexion_2\":0,\"sex\":0,\"eyebrows_2\":0,\"cheeks_2\":0,\"bodyb_2\":0,\"neck_thickness\":0,\"eyebrows_4\":0,\"jaw_1\":0,\"nose_2\":0,\"dad\":0,\"hair_1\":24,\"tshirt_2\":0,\"bproof_2\":0,\"bproof_1\":0,\"shoes_1\":55,\"bracelets_2\":0,\"ears_1\":-1,\"age_1\":0,\"eye_squint\":0,\"mom\":3,\"hair_color_2\":0,\"makeup_1\":0,\"chest_1\":0,\"torso_2\":2,\"chin_4\":0,\"beard_1\":0,\"beard_2\":0,\"beard_3\":0,\"eyebrows_5\":0,\"bodyb_3\":-1,\"nose_6\":0,\"watches_2\":0,\"mask_2\":0,\"sun_2\":0,\"age_2\":0,\"lipstick_3\":0,\"bracelets_1\":-1,\"makeup_2\":0,\"watches_1\":-1,\"blush_1\":0,\"helmet_2\":0,\"pants_2\":2,\"face_g_weight\":0,\"decals_1\":0,\"pants_1\":77,\"blemishes_2\":0,\"chest_2\":0,\"lipstick_2\":0,\"nose_4\":0,\"chain_1\":0,\"sun_1\":0,\"ears_2\":0,\"lip_thickness\":0,\"nose_3\":0,\"bodyb_1\":-1,\"skin_md_weight\":50,\"chain_2\":0,\"moles_1\":0,\"chin_3\":0,\"hair_2\":0,\"tshirt_1\":130,\"eyebrows_3\":0,\"nose_1\":0,\"grandparents\":0,\"eye_color\":0,\"blemishes_1\":0,\"complexion_1\":0,\"lipstick_4\":0,\"face_md_weight\":50,\"bags_2\":0,\"eyebrows_1\":0,\"jaw_2\":0,\"beard_4\":0,\"makeup_4\":0,\"cheeks_3\":0,\"cheeks_1\":0,\"chin_1\":0,\"blush_3\":0,\"lipstick_1\":0,\"chin_2\":0,\"hair_color_1\":0,\"moles_2\":0,\"glasses_1\":0,\"chest_3\":0,\"nose_5\":0,\"mask_1\":0}', '[{\"percent\":46.7,\"name\":\"hunger\",\"val\":467000},{\"percent\":47.525,\"name\":\"thirst\",\"val\":475250}]', 1, 6, 0, NULL, '2025-04-18 20:55:21', '2025-07-17 23:59:45', 304, '0', '0', '0', 0, '2025-04-18 20:55:21', 0, 0, '{\"bitcoin\": 0, \"ethereum\": 0, \"bitcoin-cash\": 0, \"bitcoin-sv\": 0, \"litecoin\": 0, \"binance-coin\": 0, \"monero\": 0, \"dash\": 0, \"zcash\": 0, \"maker\": 0}', '13844', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('char1:4634506b65176f2c2aa6a1af9831d3efbd168ee0', '{\"bank\":51600,\"money\":1381950,\"black_money\":0}', 'user', '[{\"name\":\"money\",\"slot\":1,\"count\":1381950},{\"name\":\"WEAPON_PISTOL\",\"slot\":2,\"metadata\":{\"ammo\":0,\"registered\":\"Miguel\",\"durability\":95.60000000000025,\"serial\":\"390385GKN614725\",\"components\":[]},\"count\":1},{\"name\":\"ammo-9\",\"slot\":3,\"count\":6},{\"name\":\"phone\",\"slot\":4,\"count\":1}]', 'unemployed', 0, '[]', '{\"lastPlaytime\":3349,\"health\":0,\"jobDuty\":false,\"armor\":0}', '{\"z\":30.2572021484375,\"y\":-798.052734375,\"x\":203.14285278320313,\"heading\":286.2991943359375}', 'Javier', 'Gaviria', '12/12/1999', 'm', 180, '{\"grandparents\":0,\"glasses_2\":0,\"nose_1\":0,\"eye_color\":5,\"lipstick_4\":0,\"chin_3\":0,\"decals_2\":0,\"cheeks_1\":0,\"beard_4\":0,\"nose_2\":0,\"decals_1\":0,\"nose_4\":0,\"jaw_2\":0,\"nose_3\":0,\"arms\":1,\"bracelets_2\":0,\"bproof_1\":0,\"arms_2\":0,\"hair_color_2\":0,\"age_1\":0,\"glasses_1\":0,\"blemishes_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"sex\":0,\"makeup_4\":0,\"dad\":0,\"pants_2\":0,\"chest_1\":0,\"sun_1\":0,\"mom\":8,\"bodyb_2\":0,\"helmet_1\":-1,\"eyebrows_2\":0,\"tshirt_2\":0,\"bodyb_4\":0,\"beard_2\":10,\"complexion_1\":0,\"makeup_1\":0,\"eye_squint\":0,\"hair_2\":0,\"bags_2\":0,\"torso_1\":31,\"jaw_1\":0,\"chin_2\":0,\"eyebrows_5\":0,\"chest_3\":0,\"mask_1\":0,\"makeup_3\":0,\"eyebrows_3\":0,\"ears_1\":-1,\"chest_2\":0,\"sun_2\":0,\"shoes_2\":0,\"makeup_2\":0,\"neck_thickness\":0,\"blush_3\":0,\"lipstick_2\":0,\"skin_md_weight\":50,\"bodyb_3\":-1,\"eyebrows_1\":0,\"chin_1\":0,\"mask_2\":0,\"cheeks_2\":0,\"tshirt_1\":21,\"helmet_2\":0,\"nose_6\":0,\"bracelets_1\":-1,\"beard_3\":0,\"eyebrows_4\":0,\"lipstick_1\":0,\"eyebrows_6\":0,\"watches_1\":-1,\"moles_1\":0,\"hair_color_1\":0,\"chain_1\":0,\"cheeks_3\":0,\"ears_2\":0,\"chin_4\":0,\"torso_2\":0,\"lip_thickness\":0,\"blush_2\":0,\"pants_1\":24,\"hair_1\":79,\"shoes_1\":7,\"moles_2\":0,\"complexion_2\":0,\"bags_1\":0,\"watches_2\":0,\"face_md_weight\":50,\"blush_1\":0,\"chain_2\":0,\"bodyb_1\":-1,\"blemishes_1\":0,\"age_2\":0,\"beard_1\":10,\"face_g_weight\":0,\"nose_5\":0}', '[{\"val\":493800,\"name\":\"hunger\",\"percent\":49.38},{\"val\":495350,\"name\":\"thirst\",\"percent\":49.535}]', 1, 11, 0, NULL, '2025-04-28 21:06:02', '2025-05-30 21:42:32', NULL, '0', '0', '0', 0, '2025-04-28 21:06:02', 0, 0, '{\"bitcoin\": 0, \"ethereum\": 0, \"bitcoin-cash\": 0, \"bitcoin-sv\": 0, \"litecoin\": 0, \"binance-coin\": 0, \"monero\": 0, \"dash\": 0, \"zcash\": 0, \"maker\": 0}', '62562', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('char1:621787821b7be9712dd11873dc3decca533bf6a', '{\"bank\":554751,\"money\":1620921,\"black_money\":0}', 'admin', '[{\"metadata\":{\"serial\":\"518590ISI627648\",\"ammo\":25,\"registered\":\"Juan Rodriguez\",\"components\":[],\"durability\":74.40999999999902},\"slot\":1,\"count\":1,\"name\":\"WEAPON_TACTICALRIFLE\"},{\"metadata\":{\"serial\":\"651082MBP278287\",\"ammo\":8,\"registered\":\"Juan Rodriguez\",\"components\":[],\"durability\":97.90000000000014},\"slot\":3,\"count\":1,\"name\":\"WEAPON_PUMPSHOTGUN\"},{\"slot\":4,\"count\":1,\"name\":\"map\"},{\"slot\":42,\"count\":1164,\"name\":\"ammo-shotgun\"},{\"metadata\":{\"dateofbirth\":\"12/01/2004\",\"name\":\"Juan Rodriguez\"},\"slot\":36,\"count\":1,\"name\":\"carteidentite\"},{\"slot\":37,\"count\":2,\"name\":\"repairkit\"},{\"slot\":38,\"count\":1,\"name\":\"gps\"},{\"slot\":39,\"count\":1,\"name\":\"diag\"},{\"metadata\":{\"plate\":\"IUV 689\",\"description\":\"\\n   · Plaque d\'immatriculation:  IUV 689   \\n   · Models: DLRS3\"},\"slot\":16,\"count\":1,\"name\":\"carkey\"},{\"slot\":41,\"count\":1120,\"name\":\"ammo-rifle\"},{\"slot\":46,\"count\":1620921,\"name\":\"money\"}]', 'police', 4, '[]', '{\"armor\":0,\"health\":200,\"jobDuty\":true,\"lastPlaytime\":581071}', '{\"z\":30.5098876953125,\"y\":-2239.89892578125,\"x\":915.8505249023438,\"heading\":155.905517578125}', 'Juan', 'Rodriguez', '12/01/2004', 'm', 170, '{\"nose_2\":0,\"nose_5\":0,\"chest_2\":0,\"neck_thickness\":0,\"beard_3\":0,\"hair_2\":0,\"chest_3\":0,\"bproof_1\":0,\"helmet_2\":0,\"shoes_1\":12,\"makeup_3\":0,\"arms_2\":0,\"pants_1\":4,\"blush_3\":0,\"bodyb_3\":-1,\"makeup_1\":0,\"mask_1\":0,\"ears_1\":-1,\"eyebrows_3\":0,\"nose_6\":0,\"nose_3\":0,\"face_g_weight\":10,\"moles_1\":0,\"blush_1\":0,\"bodyb_4\":0,\"cheeks_2\":0,\"eyebrows_6\":0,\"decals_2\":0,\"mask_2\":0,\"sun_1\":0,\"age_2\":0,\"glasses_1\":0,\"bodyb_2\":0,\"shoes_2\":6,\"bracelets_1\":1,\"hair_color_2\":0,\"complexion_1\":0,\"beard_1\":0,\"eyebrows_5\":0,\"lipstick_2\":0,\"jaw_1\":0,\"lipstick_1\":0,\"cheeks_1\":0,\"chin_3\":0,\"bodyb_1\":-1,\"watches_1\":2,\"arms\":0,\"torso_2\":0,\"bracelets_2\":0,\"hair_1\":75,\"chain_1\":2,\"pants_2\":1,\"makeup_4\":0,\"eyebrows_4\":0,\"complexion_2\":0,\"face_md_weight\":50,\"chest_1\":0,\"blush_2\":0,\"chin_4\":0,\"makeup_2\":0,\"jaw_2\":0,\"mom\":18,\"eye_color\":0,\"nose_1\":0,\"tshirt_2\":0,\"tshirt_1\":131,\"lipstick_4\":0,\"grandparents\":0,\"eye_squint\":0,\"decals_1\":0,\"nose_4\":0,\"eyebrows_2\":0,\"glasses_2\":0,\"hair_color_1\":0,\"chin_1\":0,\"bproof_2\":0,\"eyebrows_1\":0,\"beard_2\":0,\"beard_4\":0,\"torso_1\":26,\"sun_2\":0,\"dad\":21,\"chain_2\":0,\"skin_md_weight\":45,\"bags_1\":81,\"bags_2\":0,\"age_1\":0,\"blemishes_2\":0,\"sex\":0,\"blemishes_1\":0,\"moles_2\":0,\"watches_2\":0,\"lip_thickness\":0,\"cheeks_3\":0,\"helmet_1\":-1,\"ears_2\":0,\"lipstick_3\":0,\"chin_2\":0}', '[{\"val\":890500,\"name\":\"hunger\",\"percent\":89.05},{\"val\":917875,\"name\":\"thirst\",\"percent\":91.7875}]', 0, 7, 0, NULL, '2025-04-23 14:55:35', '2025-06-01 21:37:44', 805, '0', '0', '0', 0, '2025-04-23 14:55:35', 0, 0, '{\"bitcoin\": 0, \"ethereum\": 0, \"bitcoin-cash\": 0, \"bitcoin-sv\": 0, \"litecoin\": 0, \"binance-coin\": 0, \"monero\": 0, \"dash\": 0, \"zcash\": 0, \"maker\": 0}', '48831', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('char1:6dfb75f417bec5276010b020f222640f80c91043', '{\"bank\":50200,\"black_money\":0,\"money\":0}', 'user', '[]', 'unemployed', 0, '[]', '{\"lastPlaytime\":945,\"jobDuty\":false,\"health\":200,\"armor\":0}', '{\"x\":-13.23955917358398,\"y\":-1124.3868408203126,\"z\":27.3421630859375,\"heading\":59.52755737304687}', 'Rudox', 'Sevran', '02/12/2003', 'm', 180, '{\"complexion_1\":0,\"bags_1\":0,\"neck_thickness\":0,\"watches_2\":0,\"blush_1\":0,\"pants_2\":1,\"hair_color_2\":0,\"bodyb_4\":0,\"cheeks_2\":0,\"hair_2\":0,\"moles_2\":0,\"age_1\":0,\"beard_4\":0,\"makeup_1\":0,\"shoes_2\":0,\"nose_2\":0,\"nose_1\":0,\"complexion_2\":0,\"bodyb_1\":-1,\"beard_3\":0,\"decals_2\":0,\"bodyb_3\":-1,\"grandparents\":0,\"arms_2\":0,\"chest_1\":0,\"lipstick_2\":0,\"nose_3\":0,\"pants_1\":1,\"chain_1\":0,\"chain_2\":0,\"face_g_weight\":0,\"blemishes_1\":0,\"lipstick_3\":0,\"torso_2\":1,\"makeup_3\":0,\"bracelets_2\":0,\"eye_color\":0,\"hair_1\":38,\"eyebrows_4\":0,\"blush_2\":0,\"helmet_2\":0,\"ears_1\":-1,\"mask_1\":20,\"mom\":6,\"eye_squint\":0,\"lip_thickness\":0,\"nose_5\":0,\"lipstick_1\":0,\"decals_1\":0,\"tshirt_2\":0,\"chest_2\":0,\"makeup_2\":0,\"mask_2\":1,\"moles_1\":0,\"blemishes_2\":0,\"face_md_weight\":50,\"eyebrows_6\":0,\"eyebrows_2\":0,\"jaw_1\":0,\"tshirt_1\":0,\"glasses_1\":0,\"beard_2\":0,\"age_2\":0,\"nose_6\":0,\"eyebrows_5\":0,\"bags_2\":0,\"eyebrows_3\":0,\"bproof_1\":1,\"chin_1\":0,\"beard_1\":0,\"glasses_2\":0,\"jaw_2\":0,\"chest_3\":0,\"ears_2\":0,\"chin_2\":0,\"bracelets_1\":-1,\"bproof_2\":1,\"chin_4\":0,\"hair_color_1\":0,\"sex\":0,\"lipstick_4\":0,\"helmet_1\":-1,\"sun_1\":0,\"cheeks_3\":0,\"torso_1\":74,\"arms\":0,\"chin_3\":0,\"dad\":0,\"blush_3\":0,\"skin_md_weight\":50,\"eyebrows_1\":0,\"sun_2\":0,\"bodyb_2\":0,\"shoes_1\":134,\"makeup_4\":0,\"nose_4\":0,\"cheeks_1\":0,\"watches_1\":0}', '[{\"percent\":92.93,\"name\":\"hunger\",\"val\":929300},{\"percent\":94.6975,\"name\":\"thirst\",\"val\":946975}]', 0, 12, 0, NULL, '2025-05-12 19:22:52', '2025-05-30 21:42:35', NULL, '0', '0', '0', 0, '2025-05-12 19:22:52', 0, 0, '{\"bitcoin\": 0, \"ethereum\": 0, \"bitcoin-cash\": 0, \"bitcoin-sv\": 0, \"litecoin\": 0, \"binance-coin\": 0, \"monero\": 0, \"dash\": 0, \"zcash\": 0, \"maker\": 0}', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('char1:b42b206cb9676c013317ee3b92d5e19e2314bb26', '{\"black_money\":0,\"money\":48323,\"bank\":2996450681}', 'user', '[{\"name\":\"map\",\"count\":1,\"slot\":1},{\"name\":\"WEAPON_APPISTOL\",\"slot\":2,\"count\":1,\"metadata\":{\"serial\":\"336358ZWM489529\",\"durability\":96.6000000000002,\"components\":[],\"registered\":\"Juan Rodriguez\",\"ammo\":0}},{\"name\":\"WEAPON_PISTOL\",\"slot\":3,\"count\":1,\"metadata\":{\"serial\":\"487132IDS748305\",\"durability\":91.80000000000048,\"components\":[],\"registered\":\"Juan Rodriguez\",\"ammo\":12}},{\"name\":\"WEAPON_KNIFE\",\"slot\":4,\"count\":1,\"metadata\":{\"durability\":100,\"components\":[]}},{\"name\":\"WEAPON_BAT\",\"slot\":5,\"count\":1,\"metadata\":{\"durability\":100,\"components\":[]}},{\"name\":\"ammo-9\",\"count\":195,\"slot\":6},{\"name\":\"money\",\"count\":48323,\"slot\":7},{\"name\":\"burger\",\"count\":4,\"slot\":8},{\"name\":\"water\",\"count\":4,\"slot\":9},{\"name\":\"carkey\",\"slot\":10,\"count\":1,\"metadata\":{\"description\":\"\\n   · Plaque d\'immatriculation:  UIU 947   \\n   · Models: DLRS3\",\"plate\":\"UIU 947\"}}]', 'unemployed', 0, '[]', '{\"health\":190,\"jobDuty\":false,\"armor\":0,\"lastPlaytime\":32517}', '{\"heading\":87.87401580810547,\"x\":215.8153839111328,\"y\":-807.96923828125,\"z\":30.7626953125}', 'Dona', 'Kovar', '09/12/1999', 'm', 183, '{\"beard_3\":0,\"tshirt_2\":0,\"neck_thickness\":0,\"sun_1\":0,\"chain_1\":80,\"chin_3\":0,\"grandparents\":0,\"sex\":0,\"jaw_2\":0,\"eyebrows_1\":0,\"sun_2\":0,\"bodyb_4\":0,\"chest_3\":0,\"eyebrows_5\":0,\"lipstick_3\":0,\"chest_1\":0,\"lip_thickness\":0,\"chain_2\":1,\"tshirt_1\":57,\"makeup_2\":0,\"glasses_2\":6,\"arms\":15,\"mom\":0,\"nose_3\":1,\"nose_6\":1,\"nose_1\":-10,\"jaw_1\":0,\"bags_2\":0,\"beard_4\":0,\"nose_5\":5,\"lipstick_1\":0,\"arms_2\":0,\"bodyb_2\":0,\"makeup_4\":0,\"decals_2\":0,\"watches_1\":9,\"eyebrows_3\":0,\"bracelets_1\":1,\"eye_color\":2,\"chin_2\":0,\"beard_1\":0,\"ears_1\":-1,\"pants_2\":0,\"complexion_1\":0,\"eyebrows_2\":0,\"bproof_2\":0,\"torso_1\":95,\"cheeks_2\":0,\"shoes_2\":0,\"lipstick_2\":0,\"mask_1\":0,\"age_1\":0,\"age_2\":0,\"blush_1\":0,\"bags_1\":45,\"bproof_1\":0,\"mask_2\":0,\"eye_squint\":2,\"hair_color_2\":29,\"chin_1\":0,\"lipstick_4\":0,\"face_md_weight\":70,\"complexion_2\":0,\"makeup_1\":0,\"bracelets_2\":0,\"cheeks_1\":-1,\"hair_color_1\":33,\"nose_4\":7,\"eyebrows_4\":0,\"blush_2\":0,\"beard_2\":0,\"skin_md_weight\":49,\"blush_3\":0,\"bodyb_3\":-1,\"ears_2\":0,\"glasses_1\":30,\"face_g_weight\":9,\"pants_1\":55,\"moles_1\":0,\"hair_1\":42,\"nose_2\":0,\"bodyb_1\":-1,\"helmet_2\":0,\"blemishes_2\":0,\"torso_2\":20,\"decals_1\":0,\"chin_4\":0,\"hair_2\":0,\"dad\":0,\"cheeks_3\":0,\"shoes_1\":25,\"watches_2\":0,\"makeup_3\":0,\"helmet_1\":-1,\"eyebrows_6\":0,\"moles_2\":0,\"chest_2\":0,\"blemishes_1\":0}', '[{\"percent\":47.06,\"val\":470600,\"name\":\"hunger\"},{\"percent\":47.795,\"val\":477950,\"name\":\"thirst\"}]', 0, 8, 0, NULL, '2025-04-23 15:00:17', '2025-05-30 21:42:38', 805, '0', '0', '0', 0, '2025-04-23 15:00:17', 0, 0, '{\"bitcoin\": 0, \"ethereum\": 0, \"bitcoin-cash\": 0, \"bitcoin-sv\": 0, \"litecoin\": 0, \"binance-coin\": 0, \"monero\": 0, \"dash\": 0, \"zcash\": 0, \"maker\": 0}', '17310', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('char1:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', '{\"bank\":993649894323,\"black_money\":0,\"money\":47867}', 'user', '[{\"metadata\":{\"serial\":\"861374JLU787026\",\"registered\":\"Enzo Martinez\",\"durability\":99.67,\"ammo\":19,\"components\":[]},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":1},{\"metadata\":{\"serial\":\"656784EHL724918\",\"registered\":\"Juan Rodriguez\",\"durability\":90.40000000000056,\"ammo\":6,\"components\":[]},\"name\":\"WEAPON_COMBATSHOTGUN\",\"count\":1,\"slot\":2},{\"name\":\"burger\",\"count\":6,\"slot\":3},{\"name\":\"water\",\"count\":7,\"slot\":4},{\"name\":\"map\",\"count\":1,\"slot\":5},{\"metadata\":{\"durability\":82.60000000000099,\"components\":[]},\"name\":\"WEAPON_BAT\",\"count\":1,\"slot\":6},{\"metadata\":{\"serial\":\"601532LHB717325\",\"registered\":\"Juan Rodriguez\",\"durability\":89.50000000000058,\"ammo\":11,\"components\":[]},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":7},{\"name\":\"money\",\"count\":47867,\"slot\":8},{\"name\":\"velo\",\"count\":1,\"slot\":9},{\"name\":\"repairkit\",\"count\":1,\"slot\":10},{\"name\":\"diag\",\"count\":1,\"slot\":11},{\"metadata\":{\"description\":\"\\n   · Plaque d\'immatriculation:  WUZ 966   \\n   · Models: DLRS3\",\"plate\":\"WUZ 966\"},\"name\":\"carkey\",\"count\":1,\"slot\":12},{\"metadata\":{\"description\":\"\\n   · Plaque d\'immatriculation:  MEZ 008   \\n   · Models: BMW M5\",\"plate\":\"MEZ 008\"},\"name\":\"carkey\",\"count\":1,\"slot\":13},{\"metadata\":{\"description\":\"\\n   · Plaque d\'immatriculation:  VWB 213   \\n   · Models: CLS19\",\"plate\":\"VWB 213\"},\"name\":\"carkey\",\"count\":1,\"slot\":14},{\"metadata\":{\"description\":\"\\n   · Plaque d\'immatriculation:  YYM 788   \\n   · Models: SUBARU\",\"plate\":\"YYM 788\"},\"name\":\"carkey\",\"count\":1,\"slot\":15},{\"metadata\":{\"description\":\"\\n   · Plaque d\'immatriculation:  FST 714   \\n   · Models: brz13varis\",\"plate\":\"FST 714\"},\"name\":\"carkey\",\"count\":1,\"slot\":16},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_KNIFE\",\"count\":1,\"slot\":49},{\"metadata\":{\"description\":\"\\n   · Plaque d\'immatriculation:  VBL 161    \\n   · Models: 20xb7\",\"plate\":\"VBL 161 \"},\"name\":\"carkey\",\"count\":1,\"slot\":50},{\"metadata\":{\"description\":\"\\n   · Plaque d\'immatriculation:  OMT 717   \\n   · Models: giulia 2021\",\"plate\":\"OMT 717\"},\"name\":\"carkey\",\"count\":1,\"slot\":44},{\"metadata\":{\"description\":\"\\n   · Plaque d\'immatriculation:  WUI 232   \\n   · Models: GODzNINJAH2\",\"plate\":\"WUI 232\"},\"name\":\"carkey\",\"count\":1,\"slot\":45},{\"name\":\"ammo-9\",\"count\":247,\"slot\":46},{\"name\":\"ammo-rifle\",\"count\":120,\"slot\":47},{\"name\":\"ammo-shotgun\",\"count\":289,\"slot\":48}]', 'mechanic', 4, '[]', '{\"jobDuty\":true,\"lastPlaytime\":201256,\"armor\":0,\"health\":200}', '{\"y\":-806.953857421875,\"x\":216.5274658203125,\"heading\":76.53543853759766,\"z\":30.7626953125}', 'Enzo', 'Martinez', '11/11/1994', 'm', 174, '{\"nose_6\":0,\"ears_1\":-1,\"nose_4\":0,\"eyebrows_4\":0,\"mask_2\":0,\"beard_4\":0,\"bproof_1\":14,\"bproof_2\":2,\"jaw_1\":0,\"nose_1\":0,\"helmet_2\":0,\"blush_2\":0,\"bodyb_3\":-1,\"arms\":122,\"decals_1\":16,\"grandparents\":0,\"hair_color_2\":0,\"lipstick_4\":0,\"cheeks_1\":0,\"nose_3\":0,\"dad\":0,\"sun_2\":0,\"complexion_2\":0,\"bracelets_2\":0,\"chain_1\":0,\"lip_thickness\":0,\"bodyb_1\":-1,\"shoes_1\":7,\"sex\":0,\"bags_1\":0,\"face_md_weight\":50,\"eyebrows_5\":0,\"age_2\":0,\"tshirt_1\":136,\"cheeks_3\":0,\"makeup_4\":0,\"hair_2\":1,\"torso_1\":205,\"watches_1\":-1,\"face_g_weight\":0,\"watches_2\":0,\"chain_2\":0,\"bags_2\":0,\"hair_1\":3,\"makeup_3\":0,\"makeup_2\":0,\"beard_2\":10,\"chin_2\":0,\"bracelets_1\":-1,\"chin_4\":0,\"bodyb_2\":0,\"arms_2\":0,\"beard_1\":6,\"lipstick_3\":0,\"moles_1\":0,\"blush_3\":0,\"skin_md_weight\":50,\"sun_1\":0,\"jaw_2\":0,\"chest_3\":0,\"glasses_2\":0,\"eyebrows_1\":12,\"eye_squint\":0,\"mask_1\":0,\"hair_color_1\":2,\"helmet_1\":-1,\"chin_3\":0,\"chest_2\":0,\"tshirt_2\":0,\"shoes_2\":0,\"torso_2\":0,\"ears_2\":0,\"nose_2\":0,\"mom\":0,\"eyebrows_2\":10,\"chest_1\":0,\"neck_thickness\":0,\"eyebrows_3\":0,\"eyebrows_6\":0,\"bodyb_4\":0,\"complexion_1\":0,\"beard_3\":1,\"lipstick_2\":0,\"pants_1\":33,\"blush_1\":0,\"nose_5\":0,\"pants_2\":0,\"glasses_1\":0,\"blemishes_1\":0,\"makeup_1\":0,\"decals_2\":0,\"age_1\":0,\"eye_color\":0,\"blemishes_2\":0,\"moles_2\":0,\"lipstick_1\":0,\"cheeks_2\":0,\"chin_1\":0}', '[{\"percent\":94.91000000000001,\"val\":949100,\"name\":\"hunger\"},{\"percent\":96.1825,\"val\":961825,\"name\":\"thirst\"}]', 0, 9, 0, NULL, '2025-04-26 13:27:02', '2025-06-22 16:54:08', 1192, '0', '0', '0', 0, '2025-04-26 13:27:02', 0, 0, '{\"bitcoin\": 0, \"ethereum\": 0, \"bitcoin-cash\": 0, \"bitcoin-sv\": 0, \"litecoin\": 0, \"binance-coin\": 0, \"monero\": 0, \"dash\": 0, \"zcash\": 0, \"maker\": 0}', '77585', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('char1:cf872e2dbff1cf3152fff72b147ca07238315148', '{\"bank\":36431034,\"black_money\":0,\"money\":725470}', 'admin', '[{\"slot\":1,\"name\":\"map\",\"count\":1},{\"metadata\":{\"registered\":\"Martin Bubois\",\"ammo\":8,\"durability\":98.2500000000001,\"serial\":\"176003HIX697384\",\"components\":[]},\"slot\":2,\"name\":\"WEAPON_ASSAULTSHOTGUN\",\"count\":1},{\"slot\":3,\"name\":\"water\",\"count\":6},{\"slot\":4,\"name\":\"burger\",\"count\":7},{\"metadata\":{\"plate\":\"RUC 114\",\"description\":\"\\n   · Plaque d\'immatriculation:  RUC 114   \\n   · Models: 18PERFORMAN\"},\"slot\":5,\"name\":\"carkey\",\"count\":1},{\"slot\":6,\"name\":\"velo\",\"count\":1},{\"slot\":7,\"name\":\"money\",\"count\":725470},{\"slot\":8,\"name\":\"anti_zombie\",\"count\":1},{\"slot\":9,\"name\":\"cure_zombie\",\"count\":1},{\"slot\":10,\"name\":\"gps\",\"count\":1},{\"slot\":11,\"name\":\"cash_bundle\",\"count\":1},{\"slot\":12,\"name\":\"gold_bar\",\"count\":1},{\"slot\":13,\"name\":\"argent_bar\",\"count\":1},{\"slot\":14,\"name\":\"bank_card_prepay\",\"count\":1},{\"metadata\":{\"plate\":\"RUC 114\",\"description\":\"\\n   · Plaque d\'immatriculation:  RUC 114   \\n   · Models: 18PERFORMAN\"},\"slot\":15,\"name\":\"carkey\",\"count\":1},{\"slot\":16,\"name\":\"ammo-shotgun\",\"count\":457},{\"slot\":17,\"name\":\"ammo-rifle\",\"count\":1},{\"slot\":18,\"name\":\"rod\",\"count\":1}]', 'chauffeurpl', 0, '[]', '{\"jobDuty\":true,\"health\":200,\"lastPlaytime\":1227877,\"armor\":0}', '{\"y\":-1525.002197265625,\"x\":-319.74066162109377,\"heading\":235.2755889892578,\"z\":27.2579345703125}', 'Martin', 'Bubois', '01/01/2000', 'm', 180, '{\"eyebrows_5\":0,\"chain_2\":0,\"skin_md_weight\":50,\"chest_1\":0,\"sun_1\":0,\"hair_1\":2,\"lipstick_2\":0,\"eye_color\":0,\"chest_3\":0,\"age_2\":0,\"blush_2\":0,\"ears_1\":-1,\"bags_1\":0,\"dad\":0,\"eyebrows_1\":0,\"grandparents\":0,\"face_md_weight\":50,\"nose_3\":0,\"chin_3\":0,\"helmet_2\":-1,\"glasses_2\":0,\"bodyb_2\":0,\"bags_2\":0,\"torso_2\":0,\"bodyb_1\":-1,\"blush_1\":0,\"decals_2\":0,\"glasses_1\":35,\"pants_1\":70,\"bracelets_1\":-1,\"age_1\":0,\"sex\":0,\"neck_thickness\":0,\"beard_1\":0,\"chain_1\":0,\"chin_4\":0,\"nose_5\":0,\"bracelets_2\":0,\"complexion_2\":0,\"shoes_1\":4,\"chin_1\":0,\"torso_1\":4,\"jaw_1\":0,\"helmet_1\":-1,\"blush_3\":0,\"lipstick_4\":0,\"lip_thickness\":0,\"sun_2\":0,\"watches_2\":0,\"nose_2\":0,\"beard_2\":0,\"moles_1\":0,\"beard_3\":0,\"blemishes_1\":0,\"eye_squint\":0,\"shoes_2\":0,\"lipstick_1\":0,\"nose_4\":0,\"cheeks_1\":0,\"eyebrows_4\":0,\"ears_2\":0,\"tshirt_2\":0,\"mask_2\":0,\"lipstick_3\":0,\"makeup_4\":0,\"makeup_3\":0,\"makeup_1\":0,\"chest_2\":0,\"bodyb_4\":0,\"cheeks_3\":0,\"bodyb_3\":-1,\"bproof_2\":0,\"hair_color_1\":33,\"mask_1\":0,\"tshirt_1\":53,\"blemishes_2\":0,\"face_g_weight\":0,\"cheeks_2\":0,\"eyebrows_6\":0,\"watches_1\":2,\"complexion_1\":0,\"chin_2\":0,\"arms\":0,\"hair_color_2\":0,\"makeup_2\":0,\"mom\":0,\"nose_6\":0,\"beard_4\":0,\"bproof_1\":36,\"pants_2\":0,\"jaw_2\":0,\"hair_2\":5,\"eyebrows_3\":0,\"arms_2\":0,\"eyebrows_2\":0,\"nose_1\":0,\"moles_2\":0,\"decals_1\":0}', '[{\"name\":\"hunger\",\"val\":650100,\"percent\":65.01},{\"name\":\"thirst\",\"val\":737575,\"percent\":73.7575}]', 0, 3, 0, NULL, '2025-03-23 22:35:20', '2025-07-19 11:21:24', 6666, '11', '12', '13', 14, '2025-03-26 01:26:43', 950837750, 50, '{\"bitcoin\": 0, \"ethereum\": 0, \"bitcoin-cash\": 0, \"bitcoin-sv\": 0, \"litecoin\": 0, \"binance-coin\": 0, \"monero\": 0, \"dash\": 0, \"zcash\": 0, \"maker\": 0}', '41356', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('char1:d621787821b7be9712dd11873dc3decca533bf6a', '{\"bank\":48909389,\"money\":2,\"black_money\":0}', 'admin', '[{\"metadata\":{\"ammo\":0,\"components\":[],\"registered\":\"Juan Rodriguez\",\"durability\":86.55999999999949,\"serial\":\"977905PES815652\"},\"count\":1,\"name\":\"WEAPON_CARBINERIFLE\",\"slot\":1},{\"metadata\":{\"plate\":\"WEJ 086\",\"description\":\"\\n   · Plaque d\'immatriculation:  WEJ 086   \\n   · Models: TAILGATER2\"},\"count\":1,\"name\":\"carkey\",\"slot\":2},{\"metadata\":{\"ammo\":5,\"components\":[],\"registered\":\"Juan Rodriguez\",\"durability\":89.40000000000062,\"serial\":\"855005ZYD742978\"},\"count\":1,\"name\":\"WEAPON_PUMPSHOTGUN\",\"slot\":3},{\"count\":1,\"name\":\"map\",\"slot\":4},{\"count\":2,\"name\":\"money\",\"slot\":5},{\"metadata\":{\"plate\":\"WEJ 086\",\"description\":\"\\n   · Plaque d\'immatriculation:  WEJ 086   \\n   · Models: TAILGATER2\"},\"count\":1,\"name\":\"carkey\",\"slot\":15},{\"count\":206,\"name\":\"ammo-shotgun\",\"slot\":46},{\"count\":246,\"name\":\"ammo-rifle2\",\"slot\":47},{\"count\":352,\"name\":\"ammo-rifle\",\"slot\":48},{\"metadata\":{\"ammo\":30,\"components\":[],\"registered\":\"Juan Rodriguez\",\"durability\":91.08999999999966,\"serial\":\"638587HWP508055\"},\"count\":1,\"name\":\"WEAPON_ASSAULTRIFLE\",\"slot\":49},{\"count\":1,\"name\":\"anti_zombie\",\"slot\":36},{\"count\":1,\"name\":\"key_zombie\",\"slot\":37},{\"count\":1,\"name\":\"cure_zombie\",\"slot\":38},{\"count\":1,\"name\":\"velo\",\"slot\":32},{\"count\":1,\"name\":\"gps\",\"slot\":31}]', 'police', 4, '[]', '{\"health\":200,\"armor\":0,\"lastPlaytime\":191606,\"jobDuty\":true}', '{\"x\":218.05714416503907,\"heading\":337.3228454589844,\"z\":30.6783447265625,\"y\":-809.93408203125}', 'Juan', 'Rodriguez', '01/01/2005', 'm', 170, '{\"nose_1\":0,\"mask_2\":0,\"chin_13\":0,\"hair_1\":75,\"pants_1\":3,\"cheeks_2\":0,\"pants_2\":2,\"watches_1\":-1,\"bodyb_4\":0,\"nose_3\":0,\"nose_2\":0,\"tshirt_1\":140,\"jaw_2\":0,\"bproof_2\":0,\"chest_1\":0,\"complexion_1\":0,\"cheeks_3\":0,\"mask_1\":0,\"chin_2\":0,\"blemishes_2\":0,\"chain_1\":0,\"eyebrows_3\":0,\"lip_thickness\":0,\"torso_2\":0,\"tshirt_2\":0,\"sun_2\":0,\"nose_4\":0,\"mom\":6,\"lipstick_2\":0,\"chin_3\":0,\"dad\":2,\"bodyb_1\":-1,\"makeup_1\":0,\"eyebrows_5\":0,\"helmet_2\":0,\"hair_2\":0,\"torso_1\":226,\"blush_3\":0,\"sun_1\":0,\"shoes_1\":7,\"bracelets_1\":-1,\"beard_3\":0,\"age_2\":0,\"skin_md_weight\":50,\"shoes_2\":0,\"beard_4\":0,\"beard_1\":0,\"lipstick_4\":0,\"grandparents\":0,\"eyebrows_2\":0,\"beard_2\":0,\"age_1\":0,\"chest_3\":0,\"chin_1\":0,\"moles_2\":0,\"bodyb_3\":-1,\"lipstick_1\":0,\"watches_2\":0,\"lipstick_3\":0,\"hair_color_2\":0,\"blush_2\":0,\"eyebrows_6\":0,\"bproof_1\":0,\"eye_color\":0,\"nose_5\":0,\"complexion_2\":0,\"face_md_weight\":50,\"chin_4\":0,\"bodyb_2\":0,\"chest_2\":0,\"arms_2\":0,\"nose_6\":0,\"chain_2\":0,\"jaw_1\":0,\"moles_1\":0,\"blush_1\":0,\"glasses_1\":0,\"bags_2\":0,\"ears_1\":-1,\"makeup_4\":0,\"helmet_1\":-1,\"ears_2\":0,\"decals_2\":0,\"eyebrows_1\":2,\"bracelets_2\":0,\"glasses_2\":0,\"face_g_weight\":0,\"makeup_2\":0,\"cheeks_1\":0,\"neck_thickness\":0,\"blemishes_1\":0,\"eye_squint\":0,\"eyebrows_4\":0,\"arms\":0,\"bags_1\":0,\"decals_1\":0,\"sex\":0,\"makeup_3\":0,\"hair_color_1\":0}', '[{\"val\":814400,\"name\":\"hunger\",\"percent\":81.44},{\"val\":860800,\"name\":\"thirst\",\"percent\":86.08}]', 0, 16, 0, NULL, '2025-06-01 21:43:49', '2025-07-18 23:16:11', 805, '0', '0', '0', 0, '2025-06-01 21:43:49', 0, 0, '{\"bitcoin\": 0, \"ethereum\": 0, \"bitcoin-cash\": 0, \"bitcoin-sv\": 0, \"litecoin\": 0, \"binance-coin\": 0, \"monero\": 0, \"dash\": 0, \"zcash\": 0, \"maker\": 0}', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('char1:e598f707aea8f476eac986e4b4004ea10e8bc5e', '{\"money\":499989892440,\"bank\":1000700,\"black_money\":0}', 'admin', '[{\"name\":\"WEAPON_PISTOL\",\"metadata\":{\"registered\":\"Ivan Dushit\",\"durability\":98.3000000000001,\"components\":[],\"ammo\":12,\"serial\":\"171734MAR165549\"},\"count\":1,\"slot\":1},{\"name\":\"WEAPON_CARBINERIFLE\",\"metadata\":{\"registered\":\"Ivan Dushit\",\"durability\":99.54999999999999,\"components\":[],\"ammo\":25,\"serial\":\"492866YFU218658\"},\"count\":1,\"slot\":2},{\"name\":\"WEAPON_NIGHTSTICK\",\"metadata\":{\"durability\":100,\"components\":[]},\"count\":1,\"slot\":3},{\"name\":\"ammo-rifle\",\"count\":37,\"slot\":4},{\"name\":\"money\",\"metadata\":{\"type\":1},\"count\":499989892440,\"slot\":5},{\"name\":\"WEAPON_CARBINERIFLE\",\"metadata\":{\"registered\":\"Ivan Dushit\",\"durability\":98.40999999999993,\"components\":[],\"ammo\":30,\"serial\":\"716887POL163241\"},\"count\":1,\"slot\":6},{\"name\":\"ammo-9\",\"count\":103,\"slot\":8},{\"name\":\"carkey\",\"metadata\":{\"description\":\"\\n   · Plaque d\'immatriculation:  MCX 920    \\n   · Models: PROTOTIPO\",\"plate\":\"MCX 920 \"},\"count\":1,\"slot\":10}]', 'police', 4, '[]', '{\"health\":190,\"jobDuty\":true,\"lastPlaytime\":5763,\"armor\":0}', '{\"z\":36.7442626953125,\"y\":5434.1669921875,\"x\":-924.2637329101563,\"heading\":110.55118560791016}', 'Ivan', 'Dushit', '09/09/1999', 'm', 180, '{\"eyebrows_4\":0,\"beard_4\":0,\"eyebrows_2\":0,\"blemishes_1\":0,\"chest_3\":0,\"ears_2\":0,\"makeup_1\":0,\"eyebrows_1\":0,\"lip_thickness\":0,\"watches_2\":0,\"nose_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"decals_1\":0,\"makeup_3\":0,\"bracelets_1\":-1,\"blush_3\":0,\"lipstick_1\":0,\"beard_3\":0,\"blush_2\":0,\"pants_2\":0,\"dad\":0,\"bracelets_2\":0,\"jaw_1\":0,\"neck_thickness\":0,\"blemishes_2\":0,\"beard_2\":0,\"eyebrows_6\":0,\"bags_1\":0,\"eye_squint\":0,\"chin_1\":0,\"age_1\":0,\"chain_1\":0,\"hair_2\":0,\"nose_6\":0,\"chin_3\":0,\"makeup_2\":0,\"bodyb_4\":0,\"arms_2\":0,\"tshirt_1\":0,\"nose_2\":0,\"shoes_2\":0,\"bproof_1\":0,\"arms\":0,\"hair_color_2\":0,\"pants_1\":0,\"chain_2\":0,\"nose_3\":0,\"chin_4\":0,\"helmet_1\":-1,\"watches_1\":-1,\"sun_2\":0,\"chin_2\":0,\"cheeks_2\":0,\"ears_1\":-1,\"tshirt_2\":0,\"chest_2\":0,\"glasses_1\":0,\"moles_1\":0,\"shoes_1\":0,\"bodyb_3\":-1,\"jaw_2\":0,\"skin_md_weight\":50,\"torso_1\":0,\"blush_1\":0,\"nose_4\":0,\"glasses_2\":0,\"eye_color\":0,\"hair_1\":0,\"complexion_1\":0,\"grandparents\":0,\"bodyb_1\":-1,\"decals_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"sex\":0,\"bodyb_2\":0,\"nose_5\":0,\"mom\":0,\"face_g_weight\":0,\"chest_1\":0,\"cheeks_3\":0,\"eyebrows_5\":0,\"complexion_2\":0,\"lipstick_2\":0,\"lipstick_3\":0,\"beard_1\":0,\"torso_2\":0,\"mask_2\":0,\"age_2\":0,\"cheeks_1\":0,\"makeup_4\":0,\"moles_2\":0,\"bags_2\":0,\"mask_1\":0,\"face_md_weight\":50,\"eyebrows_3\":0,\"sun_1\":0}', '[{\"val\":488000,\"name\":\"hunger\",\"percent\":48.8},{\"val\":491000,\"name\":\"thirst\",\"percent\":49.1}]', 0, 4, 0, NULL, '2025-04-13 21:13:58', '2025-05-30 21:42:48', 304, '0', '0', '0', 0, '2025-04-13 21:13:58', 0, 0, '{\"bitcoin\": 0, \"ethereum\": 0, \"bitcoin-cash\": 0, \"bitcoin-sv\": 0, \"litecoin\": 0, \"binance-coin\": 0, \"monero\": 0, \"dash\": 0, \"zcash\": 0, \"maker\": 0}', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('char2:cf872e2dbff1cf3152fff72b147ca07238315148', '{\"bank\":500000,\"black_money\":0,\"money\":0}', 'admin', '[]', 'unemployed', 0, '[]', '{\"jobDuty\":false,\"health\":200,\"armor\":0,\"lastPlaytime\":1246}', '{\"y\":-885.89013671875,\"x\":-101.1032943725586,\"heading\":320.3149719238281,\"z\":44.208740234375}', 'Timote', 'Labite', '01/01/2000', 'm', 158, '{\"beard_2\":0,\"blemishes_1\":0,\"age_2\":0,\"mom\":21,\"shoes_2\":0,\"eyebrows_4\":0,\"sex\":0,\"ears_1\":-1,\"age_1\":0,\"jaw_1\":0,\"beard_1\":0,\"blush_1\":0,\"lipstick_1\":0,\"chest_3\":0,\"beard_3\":0,\"bodyb_2\":0,\"sun_1\":0,\"blemishes_2\":0,\"cheeks_1\":0,\"nose_4\":0,\"arms_2\":0,\"dad\":0,\"eyebrows_6\":0,\"decals_2\":0,\"moles_2\":0,\"hair_color_2\":0,\"eyebrows_5\":0,\"lipstick_3\":0,\"bracelets_2\":0,\"grandparents\":0,\"chin_13\":0,\"jaw_2\":0,\"arms\":0,\"bproof_2\":0,\"ears_2\":0,\"face_md_weight\":50,\"pants_1\":0,\"chain_2\":0,\"sun_2\":0,\"mask_2\":0,\"bags_1\":0,\"chin_3\":0,\"skin_md_weight\":50,\"chin_2\":0,\"nose_2\":0,\"tshirt_1\":0,\"cheeks_3\":0,\"chest_1\":0,\"helmet_1\":-1,\"watches_1\":-1,\"neck_thickness\":0,\"mask_1\":0,\"bodyb_4\":0,\"face_g_weight\":0,\"beard_4\":0,\"blush_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"bracelets_1\":-1,\"blush_3\":0,\"complexion_1\":0,\"makeup_3\":0,\"lipstick_4\":0,\"cheeks_2\":0,\"hair_2\":0,\"bags_2\":0,\"eye_color\":0,\"tshirt_2\":0,\"watches_2\":0,\"moles_1\":0,\"chin_4\":0,\"bproof_1\":0,\"pants_2\":0,\"decals_1\":0,\"eye_squint\":0,\"eyebrows_2\":0,\"complexion_2\":0,\"bodyb_1\":-1,\"helmet_2\":0,\"bodyb_3\":-1,\"hair_color_1\":0,\"makeup_4\":0,\"glasses_1\":0,\"glasses_2\":0,\"makeup_1\":0,\"hair_1\":0,\"nose_3\":0,\"eyebrows_1\":0,\"nose_6\":0,\"torso_2\":0,\"nose_1\":0,\"torso_1\":0,\"lip_thickness\":0,\"shoes_1\":0,\"chin_1\":0,\"chest_2\":0,\"nose_5\":0,\"makeup_2\":0,\"eyebrows_3\":0}', '[{\"percent\":94.51,\"val\":945100,\"name\":\"hunger\"},{\"percent\":95.88250000000001,\"val\":958825,\"name\":\"thirst\"}]', 0, 15, 0, NULL, '2025-05-30 22:21:21', '2025-07-18 16:03:39', NULL, '0', '0', '0', 0, '2025-05-30 22:21:21', 950837750, 0, '{\"bitcoin\": 0, \"ethereum\": 0, \"bitcoin-cash\": 0, \"bitcoin-sv\": 0, \"litecoin\": 0, \"binance-coin\": 0, \"monero\": 0, \"dash\": 0, \"zcash\": 0, \"maker\": 0}', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_clothes`
--

CREATE TABLE `user_clothes` (
  `identifier` varchar(259) NOT NULL,
  `skin` varchar(255) NOT NULL DEFAULT 'mp_m_freemode_01',
  `face` varchar(255) NOT NULL DEFAULT '0',
  `face_texture` varchar(255) NOT NULL DEFAULT '0',
  `hair` varchar(255) NOT NULL DEFAULT '11',
  `hair_texture` varchar(255) NOT NULL DEFAULT '4',
  `shirt` varchar(255) NOT NULL DEFAULT '0',
  `shirt_texture` varchar(255) NOT NULL DEFAULT '0',
  `pants` varchar(255) NOT NULL DEFAULT '8',
  `pants_texture` varchar(255) NOT NULL DEFAULT '0',
  `shoes` varchar(255) NOT NULL DEFAULT '1',
  `shoes_texture` varchar(255) NOT NULL DEFAULT '0',
  `vest` varchar(255) NOT NULL DEFAULT '0',
  `vest_texture` varchar(255) NOT NULL DEFAULT '0',
  `bag` varchar(255) NOT NULL DEFAULT '40',
  `bag_texture` varchar(255) NOT NULL DEFAULT '0',
  `hat` varchar(255) NOT NULL DEFAULT '1',
  `hat_texture` varchar(255) NOT NULL DEFAULT '1',
  `mask` varchar(255) NOT NULL DEFAULT '0',
  `mask_texture` varchar(255) NOT NULL DEFAULT '0',
  `glasses` varchar(255) NOT NULL DEFAULT '6',
  `glasses_texture` varchar(255) NOT NULL DEFAULT '0',
  `gloves` varchar(255) NOT NULL DEFAULT '2',
  `gloves_texture` varchar(255) NOT NULL DEFAULT '0',
  `jacket` varchar(255) NOT NULL DEFAULT '7',
  `jacket_texture` varchar(255) NOT NULL DEFAULT '2',
  `ears` varchar(255) NOT NULL DEFAULT '1',
  `ears_texture` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `user_contacts`
--

CREATE TABLE `user_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_contacts`
--

INSERT INTO `user_contacts` (`id`, `identifier`, `name`, `number`) VALUES
(2, '2e598f707aea8f476eac986e4b4004ea10e8bc5e', 'Ducratif', 41356),
(1, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'rzk', 13844);

-- --------------------------------------------------------

--
-- Structure de la table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `owner` varchar(259) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user_licenses`
--

INSERT INTO `user_licenses` (`id`, `type`, `owner`) VALUES
(1, 'weapon', 'cf872e2dbff1cf3152fff72b147ca07238315148'),
(3, 'weapon', '2e598f707aea8f476eac986e4b4004ea10e8bc5e'),
(4, 'weapon', 'd621787821b7be9712dd11873dc3decca533bf6a'),
(5, 'weapon', '4634506b65176f2c2aa6a1af9831d3efbd168ee0');

-- --------------------------------------------------------

--
-- Structure de la table `user_parkings`
--

CREATE TABLE `user_parkings` (
  `id` int(11) NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `plate` varchar(60) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `zone` longtext DEFAULT NULL,
  `vehicle` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('Lamborghini RW Devo', '1016rwdevo', 1900000, 'super'),
('Lamborghini Urus 1016', '1016urus', 2500000, 'super'),
('Dodge Charger 2016', '16charger', 350000, 'sports'),
('4x4 v16', '16topcargle', 200000, 'sportsclassics'),
('BMW M760i 2017', '17m760i', 500000, 'sports'),
('Porsche Panamera Mansory 2017', '17mansorypnmr', 750000, 'sports'),
('Lamborghini Performante 2018', '18performante', 1500000, 'super'),
('Audi RS7 2018', '18rs7', 450000, 'sedans'),
('GV80', '19gv80', 460000, 'suvs'),
('Mercedes Limousine S650 2018', '2018s650p', 1500000, 'sedans'),
('Bugatti Chiron 2019', '2019chiron', 1200000, 'super'),
('BMW M5 2019', '2019m5', 700000, 'super'),
('Tundra 2019', '2019tundrac', 1500000, 'suvs'),
('Mercedes CLA45S 2020', '2020CLA45s', 1000000, 'sports'),
('Jeep22', '2022jeep', 950000, 'suvs'),
('BMW XB7 2020', '20xb7', 250000, 'sportsclassics'),
('Audi RSQ8 2021', '21rsq8', 500000, 'sportsclassics'),
('Sierra', '21sierra', 1300000, 'suvs'),
('McLaren Artura 2022', '22arturac', 1200000, 'super'),
('G63', '22g63', 310000, 'suvs'),
('BMW M5 2022', '22m5', 785000, 'sedans'),
('Acura NSX 2NC', '2ncsx7', 1700000, 'super'),
('2d Dragg', '2nddragg', 150000, 'suvs'),
('Nissan 350Z', '350z', 150000, 'sedans'),
('Porsche 356A', '356a', 120000, 'atypique'),
('McLaren 600LT WB', '600ltwb', 2000000, 'super'),
('6x6', '6x6', 768000, 'suvs'),
('Monte 77', '77monte', 250000, 'atypique'),
('Ferrari 812 Mansory', '812mnsry', 1800000, 'super'),
('Mercedes A45', 'a45', 245000, 'sedans'),
('Toyota Supra A80', 'a80', 400000, 'sports'),
('Audi A4', 'aaq4', 450000, 'sedans'),
('Jeep Hawk', 'abhawk', 750000, 'sportsclassics'),
('Yamaha Aerox 155', 'aerox155', 75000, 'motorcycles'),
('Koenigsegg Agera RS', 'agerars', 1000000, 'super'),
('BMW Alpina B7', 'alpinab7', 350000, 'sedans'),
('Amarok 4x', 'amarok', 120000, 'suvs'),
('Mercedes AMG GT 2016', 'amggt16', 650000, 'sports'),
('Mercedes AMG GT Black Series', 'amggtbs', 950000, 'sports'),
('AMG GTR Light', 'AmgGtrLight', 2000000, 'sports'),
('AMG One', 'amgone', 1300000, 'super'),
('AMG Revuelto 2023', 'amrevu23mg', 1450000, 'super'),
('Honda Civic Type R FK8', 'animfk8hr', 240000, 'sports'),
('Audi RS8', 'audirs8', 800000, 'sedans'),
('Range Rover Autobiography', 'autobio', 450000, 'sportsclassics'),
('Mercedes B63S', 'b63s', 350000, 'sportsclassics'),
('Bentley Bentayga 2017', 'ben17', 238000, 'sports'),
('Bentley Bentayga', 'bentaygam', 300000, 'sedans'),
('Mercedes Benz C32', 'benzc32', 60000, 'sedans'),
('BMW 8MM', 'bmw8mm', 1700000, 'sedans'),
('BMW E39', 'bmwe39', 75000, 'sedans'),
('BMW G07', 'bmwg07', 478000, 'sportsclassics'),
('BMW Vision', 'bmwvision', 1750000, 'super'),
('Dodge Boss 429', 'boss429', 225000, 'sedans'),
('Subaru BRZ Varis', 'brz13varis', 200000, 'sports'),
('Mercedes C63 HR', 'c63hr', 1600000, 'super'),
('Chevrolet Corvette C8', 'c8', 1500000, 'super'),
('Porsche Carrera 2019', 'carrera19', 650000, 'sports'),
('Porsche Cayenne 2019', 'cayen19', 1000000, 'sports'),
('Porsche Cayenne', 'cayennemecqq', 1000000, 'sportsclassics'),
('Honda CB650R', 'cb650r', 150000, 'motorcycles'),
('Dodge Charger F8', 'chargerf8', 750000, 'sedans'),
('Bugatti Chiron Super Sport', 'chironsuper', 2000000, 'super'),
('Honda Civic 2020', 'civic2020', 350000, 'sports'),
('BMW M4 Off White', 'ckbmwm4offwhite', 450000, 'sedans'),
('Claw Bike', 'claw', 250000, 'motorcycles'),
('Mercedes CLS 2019', 'cls19', 380000, 'sports'),
('Mercedes CLS500 W219', 'cls500w219', 75000, 'sedans'),
('Bentley Continental GT 2011', 'contgt2011', 238000, 'sedans'),
('Toyota Crown', 'crownbp', 650000, 'sports'),
('CX30wZ 4x', 'cx30wz', 1600000, 'suvs'),
('Rolls Royce Dawn Onyx', 'dawnonyx', 750000, 'sportsclassics'),
('RS6 Breack', 'DBmansrs6', 2850000, 'super'),
('Jeep Demonhawk', 'demonhawkk', 3500000, 'sedans'),
('Porsche 993', 'DL993', 200000, 'sports'),
('Cyber', 'DLCyber', 850000, 'electrique'),
('BMW E39 Drift', 'dle39m5', 200000, 'atypique'),
('Mercedes DLGT', 'DLGT', 1300000, 'super'),
('BMW I8', 'DLI8', 1500000, 'super'),
('Ferrari Laferrari', 'DLLAF', 1100000, 'super'),
('BMW M2 Drift', 'DLM2', 350000, 'atypique'),
('Audi RS3', 'DLRS3', 650000, 'sportsclassics'),
('BMW Z4', 'DLZ4', 435000, 'sports'),
('G900 4x', 'DL_G900', 1300000, 'suvs'),
('Drag 1', 'Drag1', 50000, 'atypique'),
('Drag 2', 'Drag2', 70000, 'atypique'),
('Drag 3', 'Drag3', 120000, 'atypique'),
('Drag 4', 'Drag4', 160000, 'atypique'),
('Drag 6', 'Drag6', 200000, 'atypique'),
('Drag 7', 'Drag7', 180000, 'atypique'),
('Mercedes C63 Darwin Drift', 'dvc63darwin', 1000000, 'atypique'),
('Mercedes E55', 'e55', 75000, 'sedans'),
('Mercedes E63S 2025', 'e63s', 600000, 'sedans'),
('BMW E92 Drift', 'e92bb', 700000, 'atypique'),
('Ford Mustang Eleanor', 'eleanor', 350000, 'sedans'),
('Eli', 'eli', 200000, 'electrique'),
('Cadillac Escalade Prime', 'escaladeprime', 550000, 'sportsclassics'),
('EVE Hypercar', 'eve', 4000000, 'super'),
('Mitsubishi Evo 9', 'evo9', 100000, 'sports'),
('Mitsubishi Evo 9 Drift', 'evo9drift', 500000, 'atypique'),
('Mitsubishi Evo X', 'evox', 200000, 'sports'),
('Ferrari 812 Superfast', 'f812', 350000, 'sports'),
('Ford Fangle 450', 'fangle450', 280000, 'sportsclassics'),
('Ferrari 812 Superfast', 'ferrari812super', 800000, 'super'),
('Ford GT', 'fgt', 250000, 'sports'),
('Honda Civic FK8', 'fk8', 150000, 'sports'),
('Smart Fortwo 2017', 'fortwo17', 35000, 'sedans'),
('Mazda Furai', 'furai', 2000000, 'super'),
('Ferrari FXXK Evo', 'fxxkevo', 1800000, 'super'),
('Mercedes G63', 'g63', 650000, 'sportsclassics'),
('Sam G63', 'G63Sam', 800000, 'sportsclassics'),
('Mercedes G65', 'G65', 450000, 'sportsclassics'),
('BMW G81', 'g81hr', 750000, 'sports'),
('G900 6x6', 'g900przemo6x6', 1300000, 'suvs'),
('GMC A4 Sedan 2021', 'gcma4sedan2021', 120000, 'sedans'),
('Lamborghini Ultimae', 'gcmlamboultimae', 2000000, 'super'),
('Gcram', 'gcram1500', 750000, 'suvs'),
('Koenigsegg Gemera', 'gemera', 600000, 'sports'),
('Alfa Romeo Giulia 2021', 'giulia_2021', 458000, 'sports'),
('GMC EV2', 'gmcev2', 1000000, 'electrique'),
('BMW S1000RR Godz', 'GODzBMWS1000RR', 300000, 'motorcycles'),
('Driftcat V12', 'GODzDRIFTCAT', 1500000, 'atypique'),
('FerCustome V4', 'GODzKSTERZOTACHA', 3500000, 'super'),
('Kawasaki Ninja H2 Godz', 'GODzNINJAH2', 500000, 'motorcycles'),
('RamTRX 6x6', 'GODzRAMTRX6x6', 1700000, 'suvs'),
('RB26 Subi', 'GODzRB26SUBI', 225000, 'sedans'),
('S63 AMG', 'GODzVIPS63AMG', 1350000, 'sedans'),
('Yamaha R1 Godz', 'GODzYAMR1', 400000, 'motorcycles'),
('RS6.8', 'tailgater2', 750000, 'sports');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('atypique', 'Atypique'),
('compacts', 'Compacts'),
('coupes', 'Coupés'),
('motorcycles', 'Motos'),
('muscle', 'Ancienne'),
('offroad', 'Dessert'),
('sedans', 'Berlines'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classique'),
('super', 'SuperSport'),
('suvs', 'SUVs'),
('vans', 'Vans');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `id` int(11) NOT NULL,
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `whitelist`
--

CREATE TABLE `whitelist` (
  `identifier` varchar(259) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `yellowpages_posts`
--

CREATE TABLE `yellowpages_posts` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) DEFAULT NULL,
  `message` varchar(256) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `phone` varchar(50) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `yellow_tweets`
--

CREATE TABLE `yellow_tweets` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(256) DEFAULT NULL,
  `firstname` varchar(256) DEFAULT NULL,
  `lastname` varchar(256) DEFAULT NULL,
  `message` varchar(256) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `yvelt_bans`
--

CREATE TABLE `yvelt_bans` (
  `id` int(11) NOT NULL,
  `identifier` longtext DEFAULT NULL,
  `date` longtext NOT NULL,
  `raison` longtext DEFAULT NULL,
  `auteur` blob DEFAULT NULL,
  `duree` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `yvelt_jail`
--

CREATE TABLE `yvelt_jail` (
  `id` int(11) NOT NULL,
  `identifier` longtext DEFAULT NULL,
  `staffName` blob DEFAULT NULL,
  `time` longtext DEFAULT NULL,
  `date` longtext DEFAULT NULL,
  `raison` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `yvelt_players`
--

CREATE TABLE `yvelt_players` (
  `id` int(11) NOT NULL,
  `identifier` longtext DEFAULT NULL,
  `name` blob DEFAULT NULL,
  `rank` longtext DEFAULT NULL,
  `report_count` int(11) DEFAULT 0,
  `report_notes` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `yvelt_players`
--

INSERT INTO `yvelt_players` (`id`, `identifier`, `name`, `rank`, `report_count`, `report_notes`) VALUES
(1, 'license:cf872e2dbff1cf3152fff72b147ca07238315148', 0x4f6c644d6f647a3935, 'owner', 5, 25),
(2, 'license:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 0x525a4b20, 'com', 0, 0),
(3, 'license:d621787821b7be9712dd11873dc3decca533bf6a', 0x4d696775656c, 'com', 0, 0),
(4, 'license:2bf7bb148f0f54b434ac370cab06e592866df450', 0x504f4c594e455349415f393732, 'com', 1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `yvelt_ranks`
--

CREATE TABLE `yvelt_ranks` (
  `id` int(11) NOT NULL,
  `label` longtext DEFAULT NULL,
  `rank` longtext DEFAULT NULL,
  `perms` longtext DEFAULT NULL,
  `power` int(11) DEFAULT 0,
  `color` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `yvelt_ranks`
--

INSERT INTO `yvelt_ranks` (`id`, `label`, `rank`, `perms`, `power`, `color`) VALUES
(1, 'Owner', 'owner', 'true', 100, 'red'),
(2, 'Helper', 'helper', '{\"blips\":false,\"kick\":false,\"subPersonnel\":false,\"retournerVeh\":false,\"annonce\":false,\"invincible\":false,\"spawnVeh\":false,\"colorVeh\":false,\"sendMsg\":false,\"delete\":false,\"noclip\":true,\"fuelVeh\":false,\"plateVeh\":false,\"coords\":false,\"repairVeh\":true,\"give\":false,\"jail\":false,\"subPlayers\":true,\"prendre\":false,\"delVeh\":false,\"delgun\":false,\"revive\":true,\"invisible\":true,\"ban\":false,\"teleportation\":true,\"subReports\":true,\"setrank\":false,\"pseudos\":true,\"heal\":true,\"warn\":true,\"menu\":true,\"superpower\":false,\"subVehicle\":false,\"spectate\":true}', 1, 'green'),
(3, 'Modérateur', 'modo', '{\"subReports\":true,\"noclip\":true,\"delVeh\":true,\"invincible\":true,\"delgun\":false,\"sendMsg\":false,\"blips\":false,\"annonce\":false,\"give\":false,\"coords\":false,\"spawnVeh\":false,\"subVehicle\":false,\"menu\":true,\"ban\":false,\"prendre\":false,\"warn\":true,\"kick\":true,\"fuelVeh\":false,\"setrank\":false,\"superpower\":false,\"pseudos\":true,\"plateVeh\":false,\"colorVeh\":false,\"invisible\":true,\"repairVeh\":true,\"spectate\":true,\"heal\":true,\"subPlayers\":true,\"jail\":true,\"revive\":true,\"subPersonnel\":true,\"retournerVeh\":true,\"delete\":false,\"teleportation\":true}', 2, 'yellow'),
(4, 'Administrateur', 'admin', '{\"subReports\":true,\"noclip\":true,\"delVeh\":true,\"invincible\":true,\"delgun\":true,\"sendMsg\":true,\"blips\":false,\"annonce\":false,\"give\":false,\"coords\":true,\"spawnVeh\":false,\"subVehicle\":false,\"menu\":true,\"ban\":true,\"prendre\":false,\"warn\":true,\"kick\":true,\"fuelVeh\":true,\"setrank\":false,\"superpower\":false,\"pseudos\":true,\"plateVeh\":false,\"colorVeh\":false,\"invisible\":true,\"repairVeh\":true,\"spectate\":true,\"heal\":true,\"subPlayers\":true,\"jail\":true,\"revive\":true,\"subPersonnel\":true,\"retournerVeh\":true,\"delete\":false,\"teleportation\":true}', 3, 'orange'),
(5, 'Gérant Staff', 'gerantstaff', '[{\"name\":\"menu\",\"default\":false,\"label\":\"Accéder au menu administratif\"},{\"name\":\"noclip\",\"default\":false,\"label\":\"Accéder au noclip\"},{\"name\":\"subReports\",\"default\":false,\"label\":\"Accéder au menu des reports\"},{\"name\":\"subPlayers\",\"default\":false,\"label\":\"Accéder au menu des joueurs\"},{\"name\":\"subPersonnel\",\"default\":false,\"label\":\"Accéder au menu personnel\"},{\"name\":\"subVehicle\",\"default\":false,\"label\":\"Accéder au menu véhicule\"},{\"name\":\"pseudos\",\"default\":false,\"label\":\"Afficher les pseudos\"},{\"name\":\"blips\",\"default\":false,\"label\":\"Voir les blips des joueurs\"},{\"name\":\"revive\",\"default\":false,\"label\":\"Pouvoir revive les joueurs\"},{\"name\":\"heal\",\"default\":false,\"label\":\"Pouvoir heal les joueurs\"},{\"name\":\"invisible\",\"default\":false,\"label\":\"Se rendre invisible\"},{\"name\":\"invincible\",\"default\":false,\"label\":\"Pouvoir se rendre invincible\"},{\"name\":\"superpower\",\"default\":false,\"label\":\"Activer super saut et super sprint\"},{\"name\":\"delgun\",\"default\":false,\"label\":\"Pouvoir activer le delgun\"},{\"name\":\"coords\",\"default\":false,\"label\":\"Afficher les coordonnées\"},{\"name\":\"teleportation\",\"default\":false,\"label\":\"Pouvoir se téléporter\"},{\"name\":\"annonce\",\"default\":false,\"label\":\"Pouvoir faire des annonces\"},{\"name\":\"spawnVeh\",\"default\":false,\"label\":\"Pouvoir faire spawn des véhicules\"},{\"name\":\"delVeh\",\"default\":false,\"label\":\"Pouvoir supprimer les véhicules\"},{\"name\":\"repairVeh\",\"default\":false,\"label\":\"Pouvoir réparer les véhicules\"},{\"name\":\"plateVeh\",\"default\":false,\"label\":\"Pouvoir modifier la plaque des véhicules\"},{\"name\":\"fuelVeh\",\"default\":false,\"label\":\"Pouvoir faire le plein des véhicules\"},{\"name\":\"colorVeh\",\"default\":false,\"label\":\"Changer les couleurs des véhicules\"},{\"name\":\"retournerVeh\",\"default\":false,\"label\":\"Pouvoir retourner les véhicules\"},{\"name\":\"spectate\",\"default\":false,\"label\":\"Pouvoir spectate les joueurs\"},{\"name\":\"sendMsg\",\"default\":false,\"label\":\"Envoyer des messages au joueurs\"},{\"name\":\"warn\",\"default\":false,\"label\":\"Pouvoir warn les joueurs\"},{\"name\":\"kick\",\"default\":false,\"label\":\"Pouvoir kick les joueurs\"},{\"name\":\"jail\",\"default\":false,\"label\":\"Pouvoir jail les joueurs\"},{\"name\":\"ban\",\"default\":false,\"label\":\"Pouvoir ban les joueurs\"},{\"name\":\"give\",\"default\":false,\"label\":\"Pouvoir give des items\"},{\"name\":\"prendre\",\"default\":false,\"label\":\"Pouvoir prendre des items aux joueurs\"},{\"name\":\"delete\",\"default\":false,\"label\":\"Pouvoir supprimer des items aux joueurs\"},{\"name\":\"setrank\",\"default\":false,\"label\":\"Pouvoir /setrank un joueur\"}]', 4, 'purple'),
(6, 'Co-Fondateur', 'coowner', '{\"jail\":true,\"plateVeh\":true,\"fuelVeh\":true,\"spawnVeh\":true,\"give\":true,\"subPlayers\":true,\"delVeh\":true,\"sendMsg\":true,\"invincible\":true,\"setrank\":false,\"menu\":true,\"revive\":true,\"superpower\":true,\"repairVeh\":true,\"prendre\":true,\"ban\":true,\"blips\":true,\"teleportation\":true,\"delete\":true,\"subVehicle\":true,\"colorVeh\":true,\"invisible\":true,\"kick\":true,\"retournerVeh\":true,\"subPersonnel\":true,\"annonce\":true,\"pseudos\":true,\"heal\":true,\"spectate\":true,\"delgun\":true,\"coords\":true,\"warn\":true,\"noclip\":true,\"subReports\":true}', 98, 'black'),
(7, 'CM', 'cm', '{\"jail\":true,\"subVehicle\":true,\"fuelVeh\":true,\"setrank\":true,\"retournerVeh\":true,\"blips\":true,\"coords\":true,\"heal\":true,\"teleportation\":true,\"kick\":true,\"subPlayers\":true,\"colorVeh\":true,\"revive\":true,\"sendMsg\":true,\"give\":true,\"spawnVeh\":true,\"delete\":true,\"subPersonnel\":true,\"menu\":true,\"repairVeh\":true,\"invincible\":true,\"superpower\":true,\"noclip\":true,\"ban\":true,\"pseudos\":true,\"subReports\":true,\"annonce\":true,\"plateVeh\":true,\"delVeh\":true,\"warn\":true,\"spectate\":true,\"prendre\":true,\"invisible\":true,\"delgun\":true}', 97, 'gray'),
(8, 'com', 'com', '{\"jail\":true,\"subVehicle\":true,\"fuelVeh\":true,\"setrank\":true,\"retournerVeh\":true,\"blips\":true,\"coords\":true,\"prendre\":true,\"teleportation\":true,\"kick\":true,\"ban\":true,\"colorVeh\":true,\"revive\":true,\"sendMsg\":true,\"annonce\":true,\"spawnVeh\":true,\"delete\":true,\"subPersonnel\":true,\"menu\":true,\"invisible\":true,\"invincible\":true,\"superpower\":true,\"noclip\":true,\"give\":true,\"pseudos\":true,\"warn\":true,\"subPlayers\":true,\"repairVeh\":true,\"plateVeh\":true,\"subReports\":true,\"delVeh\":true,\"spectate\":true,\"heal\":true,\"delgun\":true}', 98, 'white');

-- --------------------------------------------------------

--
-- Structure de la table `yvelt_sanctions`
--

CREATE TABLE `yvelt_sanctions` (
  `id` int(11) NOT NULL,
  `uid` longtext DEFAULT NULL,
  `staff` blob DEFAULT NULL,
  `name` blob DEFAULT NULL,
  `sanctionType` longtext DEFAULT NULL,
  `sanctionDesc` longtext DEFAULT NULL,
  `date` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `yvelt_sanctions`
--

INSERT INTO `yvelt_sanctions` (`id`, `uid`, `staff`, `name`, `sanctionType`, `sanctionDesc`, `date`) VALUES
(1, '1002', 0x525a4b20, 0x4d696775656c, 'Warn', 'arrete de cheat connard', '27/04/2025 à 22h32 et 01 secondes'),
(2, '1002', 0x525a4b20, 0x4d696775656c, 'Warn', '0.30', '27/04/2025 à 23h55 et 22 secondes'),
(3, '1001', 0x525a4b20, 0x525a4b20, 'Warn', 'fonda salope', '30/06/2025 à 20h36 et 44 secondes'),
(4, '1000', 0x525a4b20, 0x4f6c644d6f647a3935, 'Warn', 'freekill', '30/06/2025 à 22h04 et 24 secondes'),
(5, '1001', 0x4f6c644d6f647a3935, 0x525a4b20, 'Warn', 'FDP', '30/06/2025 à 22h05 et 14 secondes'),
(6, '1005', 0x525a4b20, 0x504f4c594e455349415f393732, 'Warn', 'test', '17/07/2025 à 21h20 et 56 secondes');

-- --------------------------------------------------------

--
-- Structure de la table `yvelt_teleports`
--

CREATE TABLE `yvelt_teleports` (
  `id` int(11) NOT NULL,
  `identifier` longtext DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `coords` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `yvelt_teleports`
--

INSERT INTO `yvelt_teleports` (`id`, `identifier`, `label`, `coords`) VALUES
(1, 'license:cf872e2dbff1cf3152fff72b147ca07238315148', 'Maze bank', '{\"x\":-75.83760070800781,\"y\":-819.9177856445313,\"z\":326.1751708984375}'),
(2, 'license:2bf7bb148f0f54b434ac370cab06e592866df450', 'Concessionnaire', '{\"x\":-55.13006591796875,\"y\":-1105.12451171875,\"z\":26.43786239624023}'),
(3, 'license:2bf7bb148f0f54b434ac370cab06e592866df450', 'Fourrière', '{\"x\":420.86871337890627,\"y\":-1619.639892578125,\"z\":29.23674392700195}'),
(4, 'license:2bf7bb148f0f54b434ac370cab06e592866df450', 'Parking Central', '{\"x\":218.90689086914063,\"y\":-814.5640869140625,\"z\":30.59274864196777}'),
(5, 'license:2bf7bb148f0f54b434ac370cab06e592866df450', 'LS Customs', '{\"x\":-361.37664794921877,\"y\":-136.50460815429688,\"z\":38.68339920043945}'),
(6, 'license:d621787821b7be9712dd11873dc3decca533bf6a', 'maison', '{\"x\":360.911865234375,\"y\":-1242.2725830078126,\"z\":32.509033203125}'),
(7, 'license:cf872e2dbff1cf3152fff72b147ca07238315148', 'poste', '{\"x\":452.2838134765625,\"y\":-984.1614379882813,\"z\":30.68965148925781}'),
(8, 'license:cf872e2dbff1cf3152fff72b147ca07238315148', 'cellule', '{\"x\":483.5763854980469,\"y\":-1012.312255859375,\"z\":24.74737167358398}'),
(10, 'license:d621787821b7be9712dd11873dc3decca533bf6a', 'paintball', '{\"x\":-1726.1439208984376,\"y\":-723.3406372070313,\"z\":10.15767955780029}'),
(11, 'license:2bf7bb148f0f54b434ac370cab06e592866df450', 'PaintBall', '{\"x\":-1729.3184814453126,\"y\":-724.4864501953125,\"z\":10.31643962860107}');

-- --------------------------------------------------------

--
-- Structure de la table `yvelt_uniqueid`
--

CREATE TABLE `yvelt_uniqueid` (
  `name` blob NOT NULL,
  `identifier` varchar(259) DEFAULT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `yvelt_uniqueid`
--

INSERT INTO `yvelt_uniqueid` (`name`, `identifier`, `uid`) VALUES
(0x4f6c644d6f647a3935, 'license:cf872e2dbff1cf3152fff72b147ca07238315148', 1000),
(0x525a4b20, 'license:2e598f707aea8f476eac986e4b4004ea10e8bc5e', 1001),
(0x3432305f4b6172746f6f6e, 'license:d621787821b7be9712dd11873dc3decca533bf6a', 1002),
(0x64656c6168, 'license:b42b206cb9676c013317ee3b92d5e19e2314bb26', 1003),
(0x6b6576696e736f75747931, 'license:bedf2b4e6b0bc3a5be58bb96bbaf28c595b67177', 1004),
(0x504f4c594e455349415f393732, 'license:2bf7bb148f0f54b434ac370cab06e592866df450', 1005),
(0x4d696775656c, 'license:4634506b65176f2c2aa6a1af9831d3efbd168ee0', 1006),
(0x5255444f58, 'license:6dfb75f417bec5276010b020f222640f80c91043', 1007);

-- --------------------------------------------------------

--
-- Structure de la table `zp_ads`
--

CREATE TABLE `zp_ads` (
  `id` int(11) NOT NULL,
  `media` text DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `citizenid` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `zp_ads`
--

INSERT INTO `zp_ads` (`id`, `media`, `content`, `created_at`, `citizenid`) VALUES
(1, '', 'Le téléphone est maintenant disponible !', '2025-06-01 13:25:16', 'cf872e2dbff1cf3152fff72b147ca07238315148');

-- --------------------------------------------------------

--
-- Structure de la table `zp_calls_histories`
--

CREATE TABLE `zp_calls_histories` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(100) NOT NULL,
  `to_citizenid` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `flag` varchar(10) NOT NULL DEFAULT 'IN',
  `is_anonim` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `zp_contacts`
--

CREATE TABLE `zp_contacts` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(100) NOT NULL,
  `contact_citizenid` varchar(100) NOT NULL,
  `contact_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `zp_contacts`
--

INSERT INTO `zp_contacts` (`id`, `citizenid`, `contact_citizenid`, `contact_name`, `created_at`) VALUES
(1, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'cf872e2dbff1cf3152fff72b147ca07238315148', 'Moi', '2025-06-01 14:34:40'),
(2, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'd621787821b7be9712dd11873dc3decca533bf6a', 'Juan', '2025-06-01 22:09:24'),
(3, 'd621787821b7be9712dd11873dc3decca533bf6a', 'cf872e2dbff1cf3152fff72b147ca07238315148', 'frero ', '2025-06-01 22:10:12');

-- --------------------------------------------------------

--
-- Structure de la table `zp_contacts_requests`
--

CREATE TABLE `zp_contacts_requests` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(100) NOT NULL,
  `from_citizenid` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `zp_conversations`
--

CREATE TABLE `zp_conversations` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `is_group` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin_citizenid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `zp_conversations`
--

INSERT INTO `zp_conversations` (`id`, `name`, `is_group`, `created_at`, `updated_at`, `admin_citizenid`) VALUES
(1, NULL, 0, '2025-06-01 22:22:57', '2025-06-01 22:22:57', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `zp_conversation_messages`
--

CREATE TABLE `zp_conversation_messages` (
  `id` int(11) NOT NULL,
  `conversationid` int(11) NOT NULL,
  `sender_citizenid` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `media` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `zp_conversation_messages`
--

INSERT INTO `zp_conversation_messages` (`id`, `conversationid`, `sender_citizenid`, `content`, `media`, `created_at`, `is_deleted`) VALUES
(1, 1, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'oe', '', '2025-06-01 22:28:26', 0),
(2, 1, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'ezfezf', '', '2025-06-01 22:28:44', 0),
(3, 1, 'd621787821b7be9712dd11873dc3decca533bf6a', 'oue j\'ai tout compris tkt', '', '2025-06-01 22:36:43', 0),
(4, 1, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'Ouaissssssssssssssssssssssssssssssssssssssssss', '', '2025-06-01 22:37:00', 0),
(5, 1, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'ah bah on peux pas écrire de long message', '', '2025-06-01 22:37:10', 0),
(6, 1, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'a la suite', '', '2025-06-01 22:37:15', 0),
(7, 1, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'Sinon on vois rien c\'est pas drole hahahahahahahahahahaha', '', '2025-06-01 22:37:24', 0),
(8, 1, 'd621787821b7be9712dd11873dc3decca533bf6a', 'bahahaha oueeeee c\'est pas drooooole hyyyynnn ', '', '2025-06-01 23:37:06', 0),
(9, 1, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'Rigodrole hein fdp', '', '2025-06-01 23:45:47', 0);

-- --------------------------------------------------------

--
-- Structure de la table `zp_conversation_participants`
--

CREATE TABLE `zp_conversation_participants` (
  `conversationid` int(11) NOT NULL,
  `citizenid` varchar(100) NOT NULL,
  `join_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `zp_conversation_participants`
--

INSERT INTO `zp_conversation_participants` (`conversationid`, `citizenid`, `join_at`) VALUES
(1, 'cf872e2dbff1cf3152fff72b147ca07238315148', '2025-06-01 22:22:57'),
(1, 'd621787821b7be9712dd11873dc3decca533bf6a', '2025-06-01 22:22:57');

-- --------------------------------------------------------

--
-- Structure de la table `zp_emails`
--

CREATE TABLE `zp_emails` (
  `id` int(11) NOT NULL,
  `institution` varchar(255) NOT NULL,
  `citizenid` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `zp_emails`
--

INSERT INTO `zp_emails` (`id`, `institution`, `citizenid`, `subject`, `content`, `is_read`, `created_at`) VALUES
(1, 'loops', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Your account Bubois Has Been Created', 'Welcome aboard! \\\n\\\nUsername: @Bubois \\\nFullname : Martin \\\nPassword : martin@ \\\nPhone Number : 00 \\\n\\\nWe\'re thrilled to have you join our community. Your Loops account signup was successful created, and you’re now all set to explore everything. \\\nTo get started, log in to your account and check out all tweets. \\\n\\\nWe\'re excited to see you dive in and start exploring. Welcome to the Loopsverse!\n    ', 0, '2025-06-01 10:43:59'),
(2, 'loops', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Your account test Has Been Created', 'Welcome aboard! \\\n\\\nUsername: @test \\\nFullname : test \\\nPassword : test \\\nPhone Number : 00 \\\n\\\nWe\'re thrilled to have you join our community. Your Loops account signup was successful created, and you’re now all set to explore everything. \\\nTo get started, log in to your account and check out all tweets. \\\n\\\nWe\'re excited to see you dive in and start exploring. Welcome to the Loopsverse!\n    ', 0, '2025-06-01 10:44:20'),
(3, 'inetmax', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Your Internet Data Package Purchase Confirmation', 'Thank you for choosing our services! We are pleased to confirm that your purchase of the internet data package has been successful.\n\\\nTotal: 2500 \\\nRate : $100 / 1000000KB \\\nStatus : Success \\\n\\\nYour data package will be activated shortly, and you’ll receive an email with all the necessary details. If you have any questions or need further assistance, please don\'t hesitate to reach out.\n\\\nThank you for being a valued customer!\n    ', 0, '2025-06-01 11:00:24'),
(4, 'inetmax', 'cf872e2dbff1cf3152fff72b147ca07238315148', 'Your Internet Data Package Purchase Confirmation', 'Thank you for choosing our services! We are pleased to confirm that your purchase of the internet data package has been successful.\n\\\nTotal: 500 \\\nRate : $100 / 1000000KB \\\nStatus : Success \\\n\\\nYour data package will be activated shortly, and you’ll receive an email with all the necessary details. If you have any questions or need further assistance, please don\'t hesitate to reach out.\n\\\nThank you for being a valued customer!\n    ', 0, '2025-06-01 11:06:21'),
(5, 'inetmax', 'cf872e2dbff1cf3152fff72b147ca07238315148', 'Your Internet Data Package Purchase Confirmation', 'Thank you for choosing our services! We are pleased to confirm that your purchase of the internet data package has been successful.\n\\\nTotal: 100000 \\\nRate : $100 / 1000000KB \\\nStatus : Success \\\n\\\nYour data package will be activated shortly, and you’ll receive an email with all the necessary details. If you have any questions or need further assistance, please don\'t hesitate to reach out.\n\\\nThank you for being a valued customer!\n    ', 0, '2025-06-01 11:18:32'),
(6, 'inetmax', 'cf872e2dbff1cf3152fff72b147ca07238315148', 'Your Internet Data Package Purchase Confirmation', 'Thank you for choosing our services! We are pleased to confirm that your purchase of the internet data package has been successful.\n\\\nTotal: 2800 \\\nRate : $100 / 1000000KB \\\nStatus : Success \\\n\\\nYour data package will be activated shortly, and you’ll receive an email with all the necessary details. If you have any questions or need further assistance, please don\'t hesitate to reach out.\n\\\nThank you for being a valued customer!\n    ', 0, '2025-06-01 13:14:07'),
(7, 'inetmax', 'cf872e2dbff1cf3152fff72b147ca07238315148', 'Your Internet Data Package Purchase Confirmation', 'Merci d\'avoir choisi nos services ! Nous sommes heureux de vous confirmer que votre achat de forfait de données internet a été effectué avec succès.\n\\\nTotal: 500 \\\nTaux : $100 / 1000000KB \\\nStatus : Success \\\n\\\nVotre forfait de données sera bientôt activé et vous recevrez un e-mail contenant toutes les informations nécessaires. Pour toute question ou besoin d\'aide, n\'hésitez pas à nous contacter.\n\\\nMerci de votre confiance !\n    ', 0, '2025-06-01 13:18:41'),
(8, 'inetmax', 'cf872e2dbff1cf3152fff72b147ca07238315148', 'Confirmation d\'achat de votre forfait de données Internet', 'Merci d\'avoir choisi nos services ! Nous sommes heureux de vous confirmer que votre achat de forfait de données internet a été effectué avec succès.\n\\\nTotal: 2500 \\\nTaux : $100 / 1000000KB \\\nStatus : Success \\\n\\\nVotre forfait de données sera bientôt activé et vous recevrez un e-mail contenant toutes les informations nécessaires. Pour toute question ou besoin d\'aide, n\'hésitez pas à nous contacter.\n\\\nMerci de votre confiance !\n    ', 0, '2025-06-01 14:26:46'),
(9, 'inetmax', 'cf872e2dbff1cf3152fff72b147ca07238315148', 'Confirmation d\'achat de votre forfait de données Internet', 'Merci d\'avoir choisi nos services ! Nous sommes heureux de vous confirmer que votre achat de forfait de données internet a été effectué avec succès.\n\\\nTotal: 500 \\\nTaux : $100 / 1000000KB \\\nStatus : Success \\\n\\\nVotre forfait de données sera bientôt activé et vous recevrez un e-mail contenant toutes les informations nécessaires. Pour toute question ou besoin d\'aide, n\'hésitez pas à nous contacter.\n\\\nMerci de votre confiance !\n    ', 0, '2025-06-01 14:29:35'),
(10, 'loops', 'd621787821b7be9712dd11873dc3decca533bf6a', 'Votre compte Juan a bien été crée', 'Bienvenue à bord ! \\\n\\\nUsername: @Juan \\\nFullname : Juan \\\nPassword : 1234 \\\nPhone Number : 000 \\\n\\\nNous sommes ravis de vous compter parmi notre communauté. Votre compte Loops a été créé avec succès et vous êtes désormais prêt à explorer tout le site. \\\nPour commencer, connectez-vous à votre compte et consultez tous les tweets. \\\n\\\nATTENTION: si vous ne respecter pas les conditions de la ville sur vos tweet, vous prendez un visa.\n\\\nNous avons hâte de vous voir plonger et commencer à explorer. Bienvenue dans le Loopsverse !\n    ', 0, '2025-06-01 22:17:07'),
(11, 'inetmax', 'd621787821b7be9712dd11873dc3decca533bf6a', 'Confirmation d\'achat de votre forfait de données Internet', 'Merci d\'avoir choisi nos services ! Nous sommes heureux de vous confirmer que votre achat de forfait de données internet a été effectué avec succès.\n\\\nTotal: 10000 \\\nTaux : $100 / 1000000KB \\\nStatus : Success \\\n\\\nVotre forfait de données sera bientôt activé et vous recevrez un e-mail contenant toutes les informations nécessaires. Pour toute question ou besoin d\'aide, n\'hésitez pas à nous contacter.\n\\\nMerci de votre confiance !\n    ', 0, '2025-06-01 22:19:51'),
(12, 'inetmax', 'd621787821b7be9712dd11873dc3decca533bf6a', 'Confirmation d\'achat de votre forfait de données Internet', 'Merci d\'avoir choisi nos services ! Nous sommes heureux de vous confirmer que votre achat de forfait de données internet a été effectué avec succès.\n\\\nTotal: 10000 \\\nTaux : $100 / 1000000KB \\\nStatus : Success \\\n\\\nVotre forfait de données sera bientôt activé et vous recevrez un e-mail contenant toutes les informations nécessaires. Pour toute question ou besoin d\'aide, n\'hésitez pas à nous contacter.\n\\\nMerci de votre confiance !\n    ', 0, '2025-06-01 22:20:10'),
(13, 'inetmax', 'd621787821b7be9712dd11873dc3decca533bf6a', 'Confirmation d\'achat de votre forfait de données Internet', 'Merci d\'avoir choisi nos services ! Nous sommes heureux de vous confirmer que votre achat de forfait de données internet a été effectué avec succès.\n\\\nTotal: 10000 \\\nTaux : $100 / 1000000KB \\\nStatus : Success \\\n\\\nVotre forfait de données sera bientôt activé et vous recevrez un e-mail contenant toutes les informations nécessaires. Pour toute question ou besoin d\'aide, n\'hésitez pas à nous contacter.\n\\\nMerci de votre confiance !\n    ', 0, '2025-06-01 22:20:53'),
(14, 'inetmax', 'd621787821b7be9712dd11873dc3decca533bf6a', 'Confirmation d\'achat de votre forfait de données Internet', 'Merci d\'avoir choisi nos services ! Nous sommes heureux de vous confirmer que votre achat de forfait de données internet a été effectué avec succès.\n\\\nTotal: 10000 \\\nTaux : $100 / 1000000KB \\\nStatus : Success \\\n\\\nVotre forfait de données sera bientôt activé et vous recevrez un e-mail contenant toutes les informations nécessaires. Pour toute question ou besoin d\'aide, n\'hésitez pas à nous contacter.\n\\\nMerci de votre confiance !\n    ', 0, '2025-06-01 22:21:07'),
(15, 'inetmax', 'cf872e2dbff1cf3152fff72b147ca07238315148', 'Confirmation d\'achat de votre forfait de données Internet', 'Merci d\'avoir choisi nos services ! Nous sommes heureux de vous confirmer que votre achat de forfait de données internet a été effectué avec succès.\n\\\nTotal: 500 \\\nTaux : $100 / 1000000KB \\\nStatus : Success \\\n\\\nVotre forfait de données sera bientôt activé et vous recevrez un e-mail contenant toutes les informations nécessaires. Pour toute question ou besoin d\'aide, n\'hésitez pas à nous contacter.\n\\\nMerci de votre confiance !\n    ', 0, '2025-06-01 23:42:11'),
(16, 'inetmax', 'cf872e2dbff1cf3152fff72b147ca07238315148', 'Confirmation d\'achat de votre forfait de données Internet', 'Merci d\'avoir choisi nos services ! Nous sommes heureux de vous confirmer que votre achat de forfait de données internet a été effectué avec succès.\n\\\nTotal: 500 \\\nTaux : $100 / 1000000KB \\\nStatus : Success \\\n\\\nVotre forfait de données sera bientôt activé et vous recevrez un e-mail contenant toutes les informations nécessaires. Pour toute question ou besoin d\'aide, n\'hésitez pas à nous contacter.\n\\\nMerci de votre confiance !\n    ', 0, '2025-06-01 23:43:57'),
(17, 'inetmax', 'cf872e2dbff1cf3152fff72b147ca07238315148', 'Confirmation d\'achat de votre forfait de données Internet', 'Merci d\'avoir choisi nos services ! Nous sommes heureux de vous confirmer que votre achat de forfait de données internet a été effectué avec succès.\n\\\nTotal: 500 \\\nTaux : $100 / 1000000KB \\\nStatus : Success \\\n\\\nVotre forfait de données sera bientôt activé et vous recevrez un e-mail contenant toutes les informations nécessaires. Pour toute question ou besoin d\'aide, n\'hésitez pas à nous contacter.\n\\\nMerci de votre confiance !\n    ', 0, '2025-06-03 00:38:19'),
(18, 'inetmax', 'cf872e2dbff1cf3152fff72b147ca07238315148', 'Confirmation d\'achat de votre forfait de données Internet', 'Merci d\'avoir choisi nos services ! Nous sommes heureux de vous confirmer que votre achat de forfait de données internet a été effectué avec succès.\n\\\nTotal: 2500 \\\nTaux : $100 / 1000000KB \\\nStatus : Success \\\n\\\nVotre forfait de données sera bientôt activé et vous recevrez un e-mail contenant toutes les informations nécessaires. Pour toute question ou besoin d\'aide, n\'hésitez pas à nous contacter.\n\\\nMerci de votre confiance !\n    ', 0, '2025-06-03 00:38:27');

-- --------------------------------------------------------

--
-- Structure de la table `zp_inetmax_histories`
--

CREATE TABLE `zp_inetmax_histories` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(100) NOT NULL,
  `flag` varchar(10) NOT NULL,
  `label` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `zp_inetmax_histories`
--

INSERT INTO `zp_inetmax_histories` (`id`, `citizenid`, `flag`, `label`, `total`, `created_at`) VALUES
(1, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'CREDIT', 'Online purchase', 25000000, '2025-06-01 11:00:24'),
(2, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'CREDIT', 'Online purchase', 5000000, '2025-06-01 11:06:21'),
(3, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Loops', 95193, '2025-06-01 11:08:21'),
(4, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Services', 5010, '2025-06-01 11:10:10'),
(5, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Services', 6429, '2025-06-01 11:15:41'),
(6, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Services', 6429, '2025-06-01 11:17:44'),
(7, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'CREDIT', 'Online purchase', 1000000000, '2025-06-01 11:18:32'),
(8, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'CREDIT', 'Online purchase', 28000000, '2025-06-01 13:14:07'),
(9, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'CREDIT', 'Online purchase', 5000000, '2025-06-01 13:18:41'),
(10, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Ads', 103895, '2025-06-01 13:23:41'),
(11, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Ads', 103895, '2025-06-01 13:25:16'),
(12, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Services', 7608, '2025-06-01 13:50:52'),
(13, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Wallet', 145788, '2025-06-01 14:11:08'),
(14, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Wallet', 145788, '2025-06-01 14:11:12'),
(15, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Wallet', 8169, '2025-06-01 14:11:29'),
(16, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Wallet', 8169, '2025-06-01 14:11:30'),
(17, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Wallet', 8169, '2025-06-01 14:11:33'),
(18, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Wallet', 5871, '2025-06-01 14:17:35'),
(19, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'CREDIT', 'Online purchase', 25000000, '2025-06-01 14:26:46'),
(20, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'CREDIT', 'Online purchase', 5000000, '2025-06-01 14:29:35'),
(21, 'd621787821b7be9712dd11873dc3decca533bf6a', 'USAGE', 'Wallet', 11513, '2025-06-01 22:14:07'),
(22, 'd621787821b7be9712dd11873dc3decca533bf6a', 'USAGE', 'Wallet', 120488, '2025-06-01 22:14:56'),
(23, 'd621787821b7be9712dd11873dc3decca533bf6a', 'USAGE', 'Loops', 19527, '2025-06-01 22:17:23'),
(24, 'd621787821b7be9712dd11873dc3decca533bf6a', 'CREDIT', 'Online purchase', 100000000, '2025-06-01 22:19:51'),
(25, 'd621787821b7be9712dd11873dc3decca533bf6a', 'CREDIT', 'Online purchase', 100000000, '2025-06-01 22:20:10'),
(26, 'd621787821b7be9712dd11873dc3decca533bf6a', 'CREDIT', 'Online purchase', 100000000, '2025-06-01 22:20:53'),
(27, 'd621787821b7be9712dd11873dc3decca533bf6a', 'CREDIT', 'Online purchase', 100000000, '2025-06-01 22:21:07'),
(28, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Message', 10847, '2025-06-01 22:28:26'),
(29, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Message', 10847, '2025-06-01 22:28:44'),
(30, 'd621787821b7be9712dd11873dc3decca533bf6a', 'USAGE', 'Message', 10907, '2025-06-01 22:36:44'),
(31, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Message', 10847, '2025-06-01 22:37:00'),
(32, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Message', 10847, '2025-06-01 22:37:10'),
(33, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Message', 10847, '2025-06-01 22:37:15'),
(34, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Message', 10847, '2025-06-01 22:37:25'),
(35, 'd621787821b7be9712dd11873dc3decca533bf6a', 'USAGE', 'Message', 11300, '2025-06-01 23:37:06'),
(36, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'CREDIT', 'Online purchase', 5000000, '2025-06-01 23:42:11'),
(37, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'CREDIT', 'Online purchase', 5000000, '2025-06-01 23:43:57'),
(38, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'USAGE', 'Message', 14147, '2025-06-01 23:45:47'),
(39, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'CREDIT', 'Online purchase', 5000000, '2025-06-03 00:38:19'),
(40, 'cf872e2dbff1cf3152fff72b147ca07238315148', 'CREDIT', 'Online purchase', 25000000, '2025-06-03 00:38:27');

-- --------------------------------------------------------

--
-- Structure de la table `zp_loops_users`
--

CREATE TABLE `zp_loops_users` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'https://i.ibb.co.com/F3w0F5L/default-avatar-1.png',
  `password` varchar(255) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `cover` varchar(255) NOT NULL DEFAULT 'https://d25yuvogekh0nj.cloudfront.net/2019/08/Twitter-Banner-Size-Guide-blog-banner-1250x500.png',
  `bio` varchar(255) NOT NULL DEFAULT 'Welcome to loopsverse!',
  `is_verified` tinyint(4) NOT NULL DEFAULT 0,
  `is_allow_message` tinyint(4) NOT NULL DEFAULT 0,
  `join_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `zp_loops_users`
--

INSERT INTO `zp_loops_users` (`id`, `citizenid`, `username`, `avatar`, `password`, `fullname`, `phone_number`, `cover`, `bio`, `is_verified`, `is_allow_message`, `join_at`) VALUES
(1, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'Bubois', 'https://i.ibb.co.com/F3w0F5L/default-avatar-1.png', 'martin@', 'Martin', '00', 'https://d25yuvogekh0nj.cloudfront.net/2019/08/Twitter-Banner-Size-Guide-blog-banner-1250x500.png', 'Welcome to loopsverse!', 0, 0, '2025-06-01 10:43:59'),
(2, 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', 'guerrerp', 'https://i.ibb.co/HpH7rnDJ/DALL-E-2025-03-23-14-39-43-A-high-quality-logo-for-a-Five-M-RP-server-called-Guerre-RP-The-design-sh.webp', 'test', 'GuerreRP', '00', 'https://i.ibb.co/HpH7rnDJ/DALL-E-2025-03-23-14-39-43-A-high-quality-logo-for-a-Five-M-RP-server-called-Guerre-RP-The-design-sh.webp', 'Salut a vous !', 0, 0, '2025-06-01 10:44:20'),
(3, 'd621787821b7be9712dd11873dc3decca533bf6a', 'Juan', 'https://i.ibb.co.com/F3w0F5L/default-avatar-1.png', '1234', 'Juan', '000', 'https://d25yuvogekh0nj.cloudfront.net/2019/08/Twitter-Banner-Size-Guide-blog-banner-1250x500.png', 'Welcome to loopsverse!', 0, 0, '2025-06-01 22:17:07');

-- --------------------------------------------------------

--
-- Structure de la table `zp_news`
--

CREATE TABLE `zp_news` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(100) NOT NULL,
  `reporter` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `stream` varchar(255) DEFAULT NULL,
  `is_stream` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `zp_photos`
--

CREATE TABLE `zp_photos` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(100) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `media` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `zp_service_messages`
--

CREATE TABLE `zp_service_messages` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(100) NOT NULL,
  `solved_by_citizenid` varchar(50) DEFAULT NULL,
  `service` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `solved_reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `zp_service_messages`
--

INSERT INTO `zp_service_messages` (`id`, `citizenid`, `solved_by_citizenid`, `service`, `message`, `created_at`, `solved_reason`) VALUES
(1, 'cf872e2dbff1cf3152fff72b147ca07238315148', NULL, 'police', 'test d\'alerte', '2025-06-01 11:15:41', NULL),
(2, 'cf872e2dbff1cf3152fff72b147ca07238315148', NULL, 'taxi', 'besoin d\'un taxi au concess', '2025-06-01 11:17:43', NULL),
(3, 'cf872e2dbff1cf3152fff72b147ca07238315148', NULL, 'police', 'besoin d\'aide', '2025-06-01 13:50:51', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `zp_tweets`
--

CREATE TABLE `zp_tweets` (
  `id` int(11) NOT NULL,
  `loops_userid` int(11) NOT NULL,
  `tweet` text NOT NULL,
  `media` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `zp_tweets`
--

INSERT INTO `zp_tweets` (`id`, `loops_userid`, `tweet`, `media`, `created_at`) VALUES
(1, 2, 'test', '', '2025-06-01 11:08:21');

-- --------------------------------------------------------

--
-- Structure de la table `zp_tweet_comments`
--

CREATE TABLE `zp_tweet_comments` (
  `id` int(11) NOT NULL,
  `tweetid` int(11) NOT NULL,
  `comment` text NOT NULL,
  `loops_userid` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `zp_tweet_comments`
--

INSERT INTO `zp_tweet_comments` (`id`, `tweetid`, `comment`, `loops_userid`, `created_at`) VALUES
(1, 1, 'test 2', 3, '2025-06-01 22:17:23');

-- --------------------------------------------------------

--
-- Structure de la table `zp_users`
--

CREATE TABLE `zp_users` (
  `name` varchar(100) NOT NULL,
  `citizenid` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NOT NULL DEFAULT current_timestamp(),
  `avatar` varchar(255) NOT NULL DEFAULT 'https://i.ibb.co.com/F3w0F5L/default-avatar-1.png',
  `unread_message_service` int(11) NOT NULL DEFAULT 0,
  `unread_message` int(11) NOT NULL DEFAULT 0,
  `wallpaper` varchar(255) NOT NULL DEFAULT 'https://i.ibb.co.com/pftZvpY/peakpx-1.jpg',
  `is_anonim` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_donot_disturb` tinyint(1) NOT NULL DEFAULT 0,
  `frame` varchar(50) NOT NULL DEFAULT '1.svg',
  `iban` varchar(20) NOT NULL,
  `active_loops_userid` int(11) NOT NULL DEFAULT 0,
  `inetmax_balance` int(11) NOT NULL DEFAULT 5000000,
  `phone_height` float NOT NULL DEFAULT 610
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `zp_users`
--

INSERT INTO `zp_users` (`name`, `citizenid`, `phone_number`, `created_at`, `last_seen`, `avatar`, `unread_message_service`, `unread_message`, `wallpaper`, `is_anonim`, `is_donot_disturb`, `frame`, `iban`, `active_loops_userid`, `inetmax_balance`, `phone_height`) VALUES
('Ivan Dushit', '2e598f707aea8f476eac986e4b4004ea10e8bc5e', '82653269', '2025-06-30 18:07:03', '2025-06-30 18:07:03', 'https://i.ibb.co.com/F3w0F5L/default-avatar-1.png', 0, 0, 'https://i.ibb.co.com/pftZvpY/peakpx-1.jpg', 0, 0, '1.svg', '92816767788', 0, 5000000, 610),
('Martin Bubois', 'cf872e2dbff1cf3152fff72b147ca07238315148', '88744575', '2025-06-01 11:06:04', '2025-06-03 00:37:21', 'https://i.ibb.co/HpH7rnDJ/DALL-E-2025-03-23-14-39-43-A-high-quality-logo-for-a-Five-M-RP-server-called-Guerre-RP-The-design-sh.webp', 0, 0, 'https://i.ibb.co/HpH7rnDJ/DALL-E-2025-03-23-14-39-43-A-high-quality-logo-for-a-Five-M-RP-server-called-Guerre-RP-The-design-sh.webp', 0, 1, '4.svg', '97208194903', 2, 1112270358, 603.74),
('Martin Bubois', 'char1:cf872e2dbff1cf3152fff72b147ca07238315148', '86468982', '2025-06-01 10:38:29', '2025-06-01 10:38:54', 'https://i.ibb.co.com/F3w0F5L/default-avatar-1.png', 0, 0, 'https://i.ibb.co.com/pftZvpY/peakpx-1.jpg', 0, 0, '1.svg', '87934771667', 2, 30000000, 610),
('Juan Rodriguez', 'd621787821b7be9712dd11873dc3decca533bf6a', '89573371', '2025-06-01 22:08:01', '2025-06-25 21:08:07', 'https://i.ibb.co.com/F3w0F5L/default-avatar-1.png', 0, 0, 'https://i.ibb.co.com/pftZvpY/peakpx-1.jpg', 1, 0, '1.svg', '72095605364', 3, 404826265, 615.73);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  ADD KEY `index_addon_account_data_account_name` (`account_name`);

--
-- Index pour la table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`);

--
-- Index pour la table `admin_grades`
--
ALTER TABLE `admin_grades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `admin_reports`
--
ALTER TABLE `admin_reports`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `admin_staff`
--
ALTER TABLE `admin_staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identifier` (`identifier`);

--
-- Index pour la table `admin_staff_settings`
--
ALTER TABLE `admin_staff_settings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `annonce_web`
--
ALTER TABLE `annonce_web`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `banking`
--
ALTER TABLE `banking`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `codem_adminmenu`
--
ALTER TABLE `codem_adminmenu`
  ADD UNIQUE KEY `identifier` (`identifier`);

--
-- Index pour la table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  ADD KEY `index_datastore_data_name` (`name`);

--
-- Index pour la table `deliveriesdealer`
--
ALTER TABLE `deliveriesdealer`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `discord_users`
--
ALTER TABLE `discord_users`
  ADD PRIMARY KEY (`discord_id`);

--
-- Index pour la table `dnz_donator_codes`
--
ALTER TABLE `dnz_donator_codes`
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `drugrep`
--
ALTER TABLE `drugrep`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ducrachat_messages`
--
ALTER TABLE `ducrachat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender` (`sender`),
  ADD KEY `receiver` (`receiver`);

--
-- Index pour la table `ducrachat_users`
--
ALTER TABLE `ducrachat_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identifier` (`identifier`),
  ADD UNIQUE KEY `id_telegram` (`id_telegram`);

--
-- Index pour la table `esx_clotheshop`
--
ALTER TABLE `esx_clotheshop`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gacha_playlists`
--
ALTER TABLE `gacha_playlists`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gacha_playlists_users`
--
ALTER TABLE `gacha_playlists_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `license` (`license`),
  ADD KEY `FK__gacha_playlists_users` (`playlist`);

--
-- Index pour la table `gacha_playlist_songs`
--
ALTER TABLE `gacha_playlist_songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__gacha_playlists` (`playlist`),
  ADD KEY `FK__gacha_songs` (`song`);

--
-- Index pour la table `gacha_songs`
--
ALTER TABLE `gacha_songs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Index pour la table `gps_favorites`
--
ALTER TABLE `gps_favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_fav` (`identifier`,`frequency`);

--
-- Index pour la table `gps_frequencies`
--
ALTER TABLE `gps_frequencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `frequency` (`frequency`);

--
-- Index pour la table `historique_achat_web`
--
ALTER TABLE `historique_achat_web`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `commands` (`commands`);

--
-- Index pour la table `insto_accounts`
--
ALTER TABLE `insto_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `insto_instas`
--
ALTER TABLE `insto_instas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_insto_instas_insto_accounts` (`authorId`);

--
-- Index pour la table `insto_likes`
--
ALTER TABLE `insto_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_insto_likes_insto_accounts` (`authorId`),
  ADD KEY `FK_insto_likes_insto_instas` (`inapId`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `jobs_armories`
--
ALTER TABLE `jobs_armories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id` (`id`,`marker_id`,`identifier`) USING BTREE;

--
-- Index pour la table `jobs_data`
--
ALTER TABLE `jobs_data`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE;

--
-- Index pour la table `jobs_garages`
--
ALTER TABLE `jobs_garages`
  ADD PRIMARY KEY (`vehicle_id`) USING BTREE,
  ADD KEY `identifier` (`identifier`,`marker_id`) USING BTREE;

--
-- Index pour la table `jobs_shops`
--
ALTER TABLE `jobs_shops`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `marker_id` (`marker_id`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE;

--
-- Index pour la table `jobs_wardrobes`
--
ALTER TABLE `jobs_wardrobes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `identifier` (`identifier`) USING BTREE;

--
-- Index pour la table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbc_annonces`
--
ALTER TABLE `lbc_annonces`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbc_badges`
--
ALTER TABLE `lbc_badges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Index pour la table `lbc_historique`
--
ALTER TABLE `lbc_historique`
  ADD PRIMARY KEY (`id`),
  ADD KEY `annonce_id` (`annonce_id`);

--
-- Index pour la table `lbc_user_badges`
--
ALTER TABLE `lbc_user_badges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identifier` (`identifier`,`badge_code`);

--
-- Index pour la table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);

--
-- Index pour la table `lootboxes`
--
ALTER TABLE `lootboxes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lootbox_contents`
--
ALTER TABLE `lootbox_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lootbox_id` (`lootbox_id`);

--
-- Index pour la table `lootbox_history`
--
ALTER TABLE `lootbox_history`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lootbox_payments`
--
ALTER TABLE `lootbox_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lootbox_id` (`lootbox_id`);

--
-- Index pour la table `lootbox_rewards`
--
ALTER TABLE `lootbox_rewards`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lootbox_saisonpasse`
--
ALTER TABLE `lootbox_saisonpasse`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lootbox_saisonpass_challenges`
--
ALTER TABLE `lootbox_saisonpass_challenges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Index pour la table `lootbox_saisonpass_claims`
--
ALTER TABLE `lootbox_saisonpass_claims`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_claim` (`identifier`,`saison_id`,`level`);

--
-- Index pour la table `lootbox_saisonpass_logs`
--
ALTER TABLE `lootbox_saisonpass_logs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lootbox_saisonpass_rewards`
--
ALTER TABLE `lootbox_saisonpass_rewards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saison_id` (`saison_id`);

--
-- Index pour la table `lootbox_saisonpass_user`
--
ALTER TABLE `lootbox_saisonpass_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saison_id` (`saison_id`);

--
-- Index pour la table `lootbox_saisonpass_zones`
--
ALTER TABLE `lootbox_saisonpass_zones`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `multicharacter_slots`
--
ALTER TABLE `multicharacter_slots`
  ADD PRIMARY KEY (`identifier`) USING BTREE,
  ADD KEY `slots` (`slots`) USING BTREE;

--
-- Index pour la table `m_hud_playlists`
--
ALTER TABLE `m_hud_playlists`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `m_hud_playlist_songs`
--
ALTER TABLE `m_hud_playlist_songs`
  ADD KEY `id` (`id`);

--
-- Index pour la table `m_hud_stress`
--
ALTER TABLE `m_hud_stress`
  ADD UNIQUE KEY `identifier` (`identifier`);

--
-- Index pour la table `npwd_darkchat_channels`
--
ALTER TABLE `npwd_darkchat_channels`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `darkchat_channels_channel_identifier_uindex` (`channel_identifier`) USING BTREE;

--
-- Index pour la table `npwd_match_profiles`
--
ALTER TABLE `npwd_match_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identifier_UNIQUE` (`identifier`);

--
-- Index pour la table `npwd_messages_conversations`
--
ALTER TABLE `npwd_messages_conversations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `owned_properties`
--
ALTER TABLE `owned_properties`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `amigos` (`amigos`(1024)),
  ADD KEY `amigos_2` (`amigos`(1024));

--
-- Index pour la table `ox_inventory`
--
ALTER TABLE `ox_inventory`
  ADD UNIQUE KEY `owner` (`owner`,`name`);

--
-- Index pour la table `paintball_matches_20250521`
--
ALTER TABLE `paintball_matches_20250521`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `paintball_players`
--
ALTER TABLE `paintball_players`
  ADD PRIMARY KEY (`identifier`),
  ADD KEY `team_id` (`team_id`);

--
-- Index pour la table `paintball_skills`
--
ALTER TABLE `paintball_skills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identifier` (`identifier`);

--
-- Index pour la table `paintball_teams`
--
ALTER TABLE `paintball_teams`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `paintball_team_skills`
--
ALTER TABLE `paintball_team_skills`
  ADD PRIMARY KEY (`team_id`,`skill_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Index pour la table `playersTattoos`
--
ALTER TABLE `playersTattoos`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `player_contacts`
--
ALTER TABLE `player_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Index pour la table `player_priv_garages`
--
ALTER TABLE `player_priv_garages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `radiocar`
--
ALTER TABLE `radiocar`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `radiocar_owned`
--
ALTER TABLE `radiocar_owned`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Index pour la table `ricky_admin`
--
ALTER TABLE `ricky_admin`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `sd_reviews`
--
ALTER TABLE `sd_reviews`
  ADD PRIMARY KEY (`ReviewID`);

--
-- Index pour la table `shop_web`
--
ALTER TABLE `shop_web`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `staff_permissions`
--
ALTER TABLE `staff_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `staff_ranks`
--
ALTER TABLE `staff_ranks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rank_name` (`rank_name`);

--
-- Index pour la table `tebex_histo`
--
ALTER TABLE `tebex_histo`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `territories`
--
ALTER TABLE `territories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  ADD KEY `FK_twitter_likes_twitter_tweets` (`tweetId`);

--
-- Index pour la table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_tweets_twitter_accounts` (`authorId`);

--
-- Index pour la table `uniq_garage`
--
ALTER TABLE `uniq_garage`
  ADD UNIQUE KEY `owner` (`owner`,`name`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `index_users_phone_number` (`phone_number`);

--
-- Index pour la table `user_clothes`
--
ALTER TABLE `user_clothes`
  ADD PRIMARY KEY (`identifier`) USING BTREE;

--
-- Index pour la table `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_user_contacts_identifier_name_number` (`identifier`,`name`,`number`);

--
-- Index pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_parkings`
--
ALTER TABLE `user_parkings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`);

--
-- Index pour la table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `whitelist`
--
ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `yellowpages_posts`
--
ALTER TABLE `yellowpages_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_yellowpages_posts_twitter_accounts` (`authorId`);

--
-- Index pour la table `yellow_tweets`
--
ALTER TABLE `yellow_tweets`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `yvelt_bans`
--
ALTER TABLE `yvelt_bans`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `yvelt_jail`
--
ALTER TABLE `yvelt_jail`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `yvelt_players`
--
ALTER TABLE `yvelt_players`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `yvelt_ranks`
--
ALTER TABLE `yvelt_ranks`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `yvelt_sanctions`
--
ALTER TABLE `yvelt_sanctions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `yvelt_teleports`
--
ALTER TABLE `yvelt_teleports`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `yvelt_uniqueid`
--
ALTER TABLE `yvelt_uniqueid`
  ADD PRIMARY KEY (`uid`);

--
-- Index pour la table `zp_ads`
--
ALTER TABLE `zp_ads`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `zp_calls_histories`
--
ALTER TABLE `zp_calls_histories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `citizenid` (`citizenid`) USING BTREE;

--
-- Index pour la table `zp_contacts`
--
ALTER TABLE `zp_contacts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `unique_contact` (`citizenid`,`contact_citizenid`) USING BTREE,
  ADD KEY `contact_citizenid` (`contact_citizenid`) USING BTREE,
  ADD KEY `citizenid_contact_citizenid` (`citizenid`,`contact_citizenid`) USING BTREE;

--
-- Index pour la table `zp_contacts_requests`
--
ALTER TABLE `zp_contacts_requests`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `citizenid` (`citizenid`) USING BTREE;

--
-- Index pour la table `zp_conversations`
--
ALTER TABLE `zp_conversations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `zp_conversation_messages`
--
ALTER TABLE `zp_conversation_messages`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_conversationid` (`conversationid`) USING BTREE,
  ADD KEY `idx_sender_citizenid` (`sender_citizenid`) USING BTREE;

--
-- Index pour la table `zp_conversation_participants`
--
ALTER TABLE `zp_conversation_participants`
  ADD PRIMARY KEY (`conversationid`,`citizenid`) USING BTREE,
  ADD KEY `citizenid` (`citizenid`) USING BTREE,
  ADD KEY `idx_conversationid_citizenid` (`conversationid`,`citizenid`) USING BTREE;

--
-- Index pour la table `zp_emails`
--
ALTER TABLE `zp_emails`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `citizenid` (`citizenid`) USING BTREE;

--
-- Index pour la table `zp_inetmax_histories`
--
ALTER TABLE `zp_inetmax_histories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `citizenid` (`citizenid`) USING BTREE,
  ADD KEY `citizenid_flag` (`citizenid`,`flag`) USING BTREE;

--
-- Index pour la table `zp_loops_users`
--
ALTER TABLE `zp_loops_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `unique_username` (`username`) USING BTREE,
  ADD KEY `citizenid` (`citizenid`) USING BTREE;

--
-- Index pour la table `zp_news`
--
ALTER TABLE `zp_news`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `is_stream` (`is_stream`) USING BTREE;

--
-- Index pour la table `zp_photos`
--
ALTER TABLE `zp_photos`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `citizenid` (`citizenid`) USING BTREE;

--
-- Index pour la table `zp_service_messages`
--
ALTER TABLE `zp_service_messages`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `service` (`service`) USING BTREE,
  ADD KEY `service_solved_by_citizenid` (`solved_by_citizenid`,`service`) USING BTREE;

--
-- Index pour la table `zp_tweets`
--
ALTER TABLE `zp_tweets`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `zp_tweet_comments`
--
ALTER TABLE `zp_tweet_comments`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `zp_users`
--
ALTER TABLE `zp_users`
  ADD PRIMARY KEY (`citizenid`) USING BTREE,
  ADD KEY `citizenid` (`citizenid`) USING BTREE,
  ADD KEY `phone_number` (`phone_number`) USING BTREE,
  ADD KEY `active_loops_userid` (`active_loops_userid`) USING BTREE,
  ADD KEY `iban` (`iban`) USING BTREE;

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `admin_grades`
--
ALTER TABLE `admin_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `admin_logs`
--
ALTER TABLE `admin_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `admin_reports`
--
ALTER TABLE `admin_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `admin_staff`
--
ALTER TABLE `admin_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `admin_staff_settings`
--
ALTER TABLE `admin_staff_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `annonce_web`
--
ALTER TABLE `annonce_web`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `banking`
--
ALTER TABLE `banking`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT pour la table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=613;

--
-- AUTO_INCREMENT pour la table `deliveriesdealer`
--
ALTER TABLE `deliveriesdealer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `dnz_donator_codes`
--
ALTER TABLE `dnz_donator_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=620;

--
-- AUTO_INCREMENT pour la table `drugrep`
--
ALTER TABLE `drugrep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ducrachat_messages`
--
ALTER TABLE `ducrachat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `ducrachat_users`
--
ALTER TABLE `ducrachat_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `esx_clotheshop`
--
ALTER TABLE `esx_clotheshop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fine_types`
--
ALTER TABLE `fine_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT pour la table `gacha_playlists`
--
ALTER TABLE `gacha_playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `gacha_playlists_users`
--
ALTER TABLE `gacha_playlists_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `gacha_playlist_songs`
--
ALTER TABLE `gacha_playlist_songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `gacha_songs`
--
ALTER TABLE `gacha_songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `gps_favorites`
--
ALTER TABLE `gps_favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `gps_frequencies`
--
ALTER TABLE `gps_frequencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `historique_achat_web`
--
ALTER TABLE `historique_achat_web`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `insto_accounts`
--
ALTER TABLE `insto_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT pour la table `insto_instas`
--
ALTER TABLE `insto_instas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT pour la table `insto_likes`
--
ALTER TABLE `insto_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT pour la table `jobs_armories`
--
ALTER TABLE `jobs_armories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jobs_data`
--
ALTER TABLE `jobs_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT pour la table `jobs_garages`
--
ALTER TABLE `jobs_garages`
  MODIFY `vehicle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `jobs_shops`
--
ALTER TABLE `jobs_shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jobs_wardrobes`
--
ALTER TABLE `jobs_wardrobes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT pour la table `lbc_annonces`
--
ALTER TABLE `lbc_annonces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT pour la table `lbc_badges`
--
ALTER TABLE `lbc_badges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `lbc_historique`
--
ALTER TABLE `lbc_historique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `lbc_user_badges`
--
ALTER TABLE `lbc_user_badges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `lootboxes`
--
ALTER TABLE `lootboxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `lootbox_contents`
--
ALTER TABLE `lootbox_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT pour la table `lootbox_history`
--
ALTER TABLE `lootbox_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT pour la table `lootbox_payments`
--
ALTER TABLE `lootbox_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT pour la table `lootbox_rewards`
--
ALTER TABLE `lootbox_rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `lootbox_saisonpasse`
--
ALTER TABLE `lootbox_saisonpasse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `lootbox_saisonpass_challenges`
--
ALTER TABLE `lootbox_saisonpass_challenges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `lootbox_saisonpass_claims`
--
ALTER TABLE `lootbox_saisonpass_claims`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT pour la table `lootbox_saisonpass_logs`
--
ALTER TABLE `lootbox_saisonpass_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT pour la table `lootbox_saisonpass_rewards`
--
ALTER TABLE `lootbox_saisonpass_rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT pour la table `lootbox_saisonpass_user`
--
ALTER TABLE `lootbox_saisonpass_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `lootbox_saisonpass_zones`
--
ALTER TABLE `lootbox_saisonpass_zones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `m_hud_playlists`
--
ALTER TABLE `m_hud_playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `m_hud_playlist_songs`
--
ALTER TABLE `m_hud_playlist_songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `npwd_darkchat_channels`
--
ALTER TABLE `npwd_darkchat_channels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `npwd_match_profiles`
--
ALTER TABLE `npwd_match_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `npwd_messages_conversations`
--
ALTER TABLE `npwd_messages_conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `owned_properties`
--
ALTER TABLE `owned_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `paintball_matches_20250521`
--
ALTER TABLE `paintball_matches_20250521`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `paintball_skills`
--
ALTER TABLE `paintball_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `paintball_teams`
--
ALTER TABLE `paintball_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `playersTattoos`
--
ALTER TABLE `playersTattoos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `player_contacts`
--
ALTER TABLE `player_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12433;

--
-- AUTO_INCREMENT pour la table `player_priv_garages`
--
ALTER TABLE `player_priv_garages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT pour la table `radiocar`
--
ALTER TABLE `radiocar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `radiocar_owned`
--
ALTER TABLE `radiocar_owned`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sd_reviews`
--
ALTER TABLE `sd_reviews`
  MODIFY `ReviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `shop_web`
--
ALTER TABLE `shop_web`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `staff_permissions`
--
ALTER TABLE `staff_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `staff_ranks`
--
ALTER TABLE `staff_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `tebex_histo`
--
ALTER TABLE `tebex_histo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `territories`
--
ALTER TABLE `territories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1625;

--
-- AUTO_INCREMENT pour la table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT pour la table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `user_contacts`
--
ALTER TABLE `user_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `user_parkings`
--
ALTER TABLE `user_parkings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `yellowpages_posts`
--
ALTER TABLE `yellowpages_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT pour la table `yellow_tweets`
--
ALTER TABLE `yellow_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=830;

--
-- AUTO_INCREMENT pour la table `yvelt_bans`
--
ALTER TABLE `yvelt_bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `yvelt_jail`
--
ALTER TABLE `yvelt_jail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `yvelt_players`
--
ALTER TABLE `yvelt_players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `yvelt_ranks`
--
ALTER TABLE `yvelt_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `yvelt_sanctions`
--
ALTER TABLE `yvelt_sanctions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `yvelt_teleports`
--
ALTER TABLE `yvelt_teleports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `yvelt_uniqueid`
--
ALTER TABLE `yvelt_uniqueid`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;

--
-- AUTO_INCREMENT pour la table `zp_ads`
--
ALTER TABLE `zp_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `zp_calls_histories`
--
ALTER TABLE `zp_calls_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `zp_contacts`
--
ALTER TABLE `zp_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `zp_contacts_requests`
--
ALTER TABLE `zp_contacts_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `zp_conversations`
--
ALTER TABLE `zp_conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `zp_conversation_messages`
--
ALTER TABLE `zp_conversation_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `zp_emails`
--
ALTER TABLE `zp_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `zp_inetmax_histories`
--
ALTER TABLE `zp_inetmax_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `zp_loops_users`
--
ALTER TABLE `zp_loops_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `zp_news`
--
ALTER TABLE `zp_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `zp_photos`
--
ALTER TABLE `zp_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `zp_service_messages`
--
ALTER TABLE `zp_service_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `zp_tweets`
--
ALTER TABLE `zp_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `zp_tweet_comments`
--
ALTER TABLE `zp_tweet_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `gacha_playlists_users`
--
ALTER TABLE `gacha_playlists_users`
  ADD CONSTRAINT `FK__gacha_playlists_users` FOREIGN KEY (`playlist`) REFERENCES `gacha_playlists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `gacha_playlist_songs`
--
ALTER TABLE `gacha_playlist_songs`
  ADD CONSTRAINT `FK__gacha_playlists` FOREIGN KEY (`playlist`) REFERENCES `gacha_playlists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__gacha_songs` FOREIGN KEY (`song`) REFERENCES `gacha_songs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `insto_instas`
--
ALTER TABLE `insto_instas`
  ADD CONSTRAINT `FK_insto_instas_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `insto_accounts` (`id`);

--
-- Contraintes pour la table `insto_likes`
--
ALTER TABLE `insto_likes`
  ADD CONSTRAINT `FK_insto_likes_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `insto_accounts` (`id`),
  ADD CONSTRAINT `FK_insto_likes_insto_instas` FOREIGN KEY (`inapId`) REFERENCES `insto_instas` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `lbc_historique`
--
ALTER TABLE `lbc_historique`
  ADD CONSTRAINT `lbc_historique_ibfk_1` FOREIGN KEY (`annonce_id`) REFERENCES `lbc_annonces` (`id`);

--
-- Contraintes pour la table `lootbox_contents`
--
ALTER TABLE `lootbox_contents`
  ADD CONSTRAINT `lootbox_contents_ibfk_1` FOREIGN KEY (`lootbox_id`) REFERENCES `lootboxes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `lootbox_payments`
--
ALTER TABLE `lootbox_payments`
  ADD CONSTRAINT `lootbox_payments_ibfk_1` FOREIGN KEY (`lootbox_id`) REFERENCES `lootboxes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `lootbox_saisonpass_rewards`
--
ALTER TABLE `lootbox_saisonpass_rewards`
  ADD CONSTRAINT `lootbox_saisonpass_rewards_ibfk_1` FOREIGN KEY (`saison_id`) REFERENCES `lootbox_saisonpasse` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `lootbox_saisonpass_user`
--
ALTER TABLE `lootbox_saisonpass_user`
  ADD CONSTRAINT `lootbox_saisonpass_user_ibfk_1` FOREIGN KEY (`saison_id`) REFERENCES `lootbox_saisonpasse` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `paintball_players`
--
ALTER TABLE `paintball_players`
  ADD CONSTRAINT `paintball_players_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `paintball_teams` (`id`);

--
-- Contraintes pour la table `paintball_team_skills`
--
ALTER TABLE `paintball_team_skills`
  ADD CONSTRAINT `paintball_team_skills_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `paintball_teams` (`id`),
  ADD CONSTRAINT `paintball_team_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `paintball_skills` (`id`);

--
-- Contraintes pour la table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  ADD CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`);

--
-- Contraintes pour la table `yellowpages_posts`
--
ALTER TABLE `yellowpages_posts`
  ADD CONSTRAINT `FK_yellowpages_posts_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`);
COMMIT;

-- ==========================================================
--   GuerreRP - Base publique ESX Legacy
--   Développé et maintenu par : Ducratif
--
--   Discord support : https://discord.gg/kpD8pQBBWm
--   Documentation :  https://github.com/Ducratif/guerrerp
--
--   Merci de conserver ces crédits si vous utilisez,
--   modifiez ou redistribuez cette configuration.
-- ==========================================================