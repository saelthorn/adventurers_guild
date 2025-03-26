-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2025 at 11:22 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adventurers guild db`
--

-- --------------------------------------------------------

--
-- Table structure for table `equipment_reward`
--

CREATE TABLE `equipment_reward` (
  `reward_type_id` int(11) NOT NULL,
  `equipment_type` varchar(255) DEFAULT NULL,
  `min_rank` varchar(255) DEFAULT NULL,
  `market_value` float DEFAULT NULL,
  `condition_rating` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment_reward`
--

INSERT INTO `equipment_reward` (`reward_type_id`, `equipment_type`, `min_rank`, `market_value`, `condition_rating`) VALUES
(2, 'Steel Sword', 'Bronze', 250, 'Good');

-- --------------------------------------------------------

--
-- Table structure for table `guild_vault`
--

CREATE TABLE `guild_vault` (
  `vault_id` int(11) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `storage_fee` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guild_vault`
--

INSERT INTO `guild_vault` (`vault_id`, `capacity`, `storage_fee`) VALUES
(1, 1000, 5),
(2, 500, 3);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rarity` enum('Common','Uncommon','Rare','Epic','Legendary') DEFAULT NULL,
  `value` float DEFAULT NULL,
  `item_condition` varchar(255) DEFAULT NULL,
  `magical` tinyint(1) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  `vault_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `name`, `rarity`, `value`, `item_condition`, `magical`, `registration_date`, `vault_id`) VALUES
(1, 'Steel Longsword', 'Common', 50, 'Good', 0, NULL, NULL),
(2, 'Enchanted Staff of Frost', 'Rare', 1200, 'Excellent', 1, '2023-06-01', NULL),
(3, 'Leather Armor Set', 'Common', 75, 'Fair', 0, NULL, NULL),
(4, 'Bow of Eagle Eye', 'Uncommon', 450, 'Good', 1, '2023-01-05', NULL),
(5, 'Holy Symbol of Dawn', 'Uncommon', 350, 'Excellent', 1, '2024-08-07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `class` varchar(100) DEFAULT NULL,
  `rank_id` int(11) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `active_status` tinyint(1) DEFAULT NULL,
  `quest_completion_rate` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `name`, `class`, `rank_id`, `join_date`, `active_status`, `quest_completion_rate`) VALUES
(1, 'Thorne Ironshield', 'Warrior', 3, '2024-01-15', 1, 0.85),
(2, 'Lyra Moonshadow', 'Mage', 4, '2023-05-22', 1, 0.92),
(3, 'Garrick Swift', 'Rogue', 2, '2024-03-10', 1, 0.78),
(4, 'Elara Windrider', 'Ranger', 5, '2022-11-30', 1, 0.95),
(5, 'Brom Stonehand', 'Cleric', 1, '2024-08-05', 1, 0.65);

-- --------------------------------------------------------

--
-- Table structure for table `member_item`
--

CREATE TABLE `member_item` (
  `member_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `acquisition_date` date DEFAULT NULL,
  `storage_location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member_item`
--

INSERT INTO `member_item` (`member_id`, `item_id`, `acquisition_date`, `storage_location`) VALUES
(1, 1, '2024-01-16', 'Personal'),
(2, 2, '2023-06-01', 'Personal'),
(3, 3, '2024-03-12', 'Personal'),
(4, 4, '2023-01-05', 'Personal'),
(5, 5, '2024-08-07', 'Personal');

-- --------------------------------------------------------

--
-- Table structure for table `member_skill`
--

CREATE TABLE `member_skill` (
  `member_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `proficiency_level` int(11) DEFAULT NULL,
  `verification_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member_skill`
--

INSERT INTO `member_skill` (`member_id`, `skill_id`, `proficiency_level`, `verification_date`) VALUES
(1, 1, 8, '2024-01-20'),
(2, 2, 9, '2023-06-05'),
(3, 3, 8, '2024-03-15'),
(4, 4, 10, '2022-12-10'),
(5, 5, 7, '2024-08-10');

-- --------------------------------------------------------

--
-- Table structure for table `monetary_reward`
--

CREATE TABLE `monetary_reward` (
  `reward_type_id` int(11) NOT NULL,
  `currency_type` varchar(255) DEFAULT NULL,
  `base_amount` float DEFAULT NULL,
  `guild_commission` float DEFAULT 0.1,
  `availability` varchar(255) DEFAULT 'All Ranks'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `monetary_reward`
--

INSERT INTO `monetary_reward` (`reward_type_id`, `currency_type`, `base_amount`, `guild_commission`, `availability`) VALUES
(1, 'Gold Coins', 500, 0.1, 'All Ranks');

-- --------------------------------------------------------

--
-- Table structure for table `party`
--

CREATE TABLE `party` (
  `party_id` int(11) NOT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `party_name` varchar(255) NOT NULL,
  `formation_date` date DEFAULT NULL,
  `active_status` tinyint(1) DEFAULT NULL,
  `success_rate` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `party`
--

INSERT INTO `party` (`party_id`, `leader_id`, `party_name`, `formation_date`, `active_status`, `success_rate`) VALUES
(1, 2, 'Phoenix Risen', '2023-06-10', 1, 0.89),
(2, 4, 'Shadow Hunters', '2023-01-15', 1, 0.93),
(3, 1, 'Iron Vanguard', '2023-11-05', 1, 0.85);

-- --------------------------------------------------------

--
-- Table structure for table `party_member`
--

CREATE TABLE `party_member` (
  `party_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `join_date` date DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `party_member`
--

INSERT INTO `party_member` (`party_id`, `member_id`, `join_date`, `role`) VALUES
(1, 1, '2023-06-12', 'Tank'),
(1, 2, '2023-06-10', 'Leader'),
(1, 5, '2023-08-15', 'Healer'),
(2, 3, '2023-01-20', 'Scout'),
(2, 4, '2023-01-15', 'Leader');

-- --------------------------------------------------------

--
-- Table structure for table `quest`
--

CREATE TABLE `quest` (
  `quest_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `difficulty_rating` enum('E','D','C','B','A','S') DEFAULT NULL,
  `post_date` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `assigned_party_id` int(11) DEFAULT NULL,
  `completed` tinyint(1) DEFAULT NULL,
  `client_satisfaction` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quest`
--

INSERT INTO `quest` (`quest_id`, `title`, `description`, `difficulty_rating`, `post_date`, `deadline`, `assigned_party_id`, `completed`, `client_satisfaction`) VALUES
(1, 'Clear Kobold Cave', 'Eliminate kobold threat near Riverdale village', 'D', '2024-01-20', '2024-02-10', 1, 1, 0.9),
(2, 'Retrieve Lost Artifact', 'Recover ancient artifact from abandoned temple', 'C', '2024-02-05', '2024-03-01', 2, 1, 0.95),
(3, 'Escort Merchant Caravan', 'Protect merchant caravan on journey to Capital', 'D', '2024-02-15', '2024-03-05', 3, 1, 0.85),
(4, 'Investigate Mysterious Tower', 'Explore and document findings in newly appeared tower', 'B', '2024-03-10', '2024-04-10', 2, 1, 0.9),
(5, 'Slay Mountain Drake', 'Eliminate drake threatening mountain village', 'A', '2024-04-01', '2024-05-15', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quest_reward`
--

CREATE TABLE `quest_reward` (
  `reward_id` int(11) NOT NULL,
  `quest_id` int(11) DEFAULT NULL,
  `reward_type` varchar(255) DEFAULT NULL,
  `reward_type_id` int(11) DEFAULT NULL,
  `adjusted_amount` float DEFAULT NULL,
  `claimed` tinyint(1) DEFAULT NULL,
  `claim_deadline` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quest_reward`
--

INSERT INTO `quest_reward` (`reward_id`, `quest_id`, `reward_type`, `reward_type_id`, `adjusted_amount`, `claimed`, `claim_deadline`) VALUES
(1, 1, 'Monetary', 1, 100, 0, '2025-03-01'),
(2, 2, 'Equipment', 2, NULL, 1, '2025-04-01'),
(3, 3, 'Resource', 3, NULL, 0, '2025-05-01'),
(4, 4, 'Reputation', 4, NULL, 1, '2025-06-01'),
(5, 5, 'Special Item', 5, NULL, 0, '2025-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `rank`
--

CREATE TABLE `rank` (
  `rank_id` int(11) NOT NULL,
  `rank_name` varchar(50) DEFAULT NULL,
  `points_range` varchar(50) DEFAULT NULL,
  `quest_access` varchar(50) DEFAULT NULL,
  `reward_multiplier` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rank`
--

INSERT INTO `rank` (`rank_id`, `rank_name`, `points_range`, `quest_access`, `reward_multiplier`) VALUES
(1, 'Bronze', '0-100', 'E,D', 1.00),
(2, 'Silver', '101-300', 'E,D,C', 1.05),
(3, 'Gold', '301-600', 'E,D,C,B', 1.10),
(4, 'Platinum', '601-1000', 'E,D,C,B,A', 1.15),
(5, 'Diamond', '1001+', 'All', 1.20);

-- --------------------------------------------------------

--
-- Table structure for table `reputation_reward`
--

CREATE TABLE `reputation_reward` (
  `reward_type_id` int(11) NOT NULL,
  `base_points` int(11) DEFAULT NULL,
  `difficulty_multiplier` float DEFAULT NULL,
  `rank_requirement` varchar(255) DEFAULT NULL,
  `affects_promotion` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reputation_reward`
--

INSERT INTO `reputation_reward` (`reward_type_id`, `base_points`, `difficulty_multiplier`, `rank_requirement`, `affects_promotion`) VALUES
(4, 500, 1.2, 'Silver and above', 1);

-- --------------------------------------------------------

--
-- Table structure for table `resource_reward`
--

CREATE TABLE `resource_reward` (
  `reward_type_id` int(11) NOT NULL,
  `resource_type` varchar(255) DEFAULT NULL,
  `rarity` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `availability` varchar(255) DEFAULT 'All Ranks'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resource_reward`
--

INSERT INTO `resource_reward` (`reward_type_id`, `resource_type`, `rarity`, `quantity`, `availability`) VALUES
(3, 'Dragon Scale', 'Rare', 5, 'Gold and above');

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `skill_id` int(11) NOT NULL,
  `skill_name` varchar(255) NOT NULL,
  `skill_desc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`skill_id`, `skill_name`, `skill_desc`) VALUES
(1, 'Swordsmanship', 'Proficiency with swords and bladed weapons'),
(2, 'Arcane Magic', 'Ability to cast and control arcane spells'),
(3, 'Stealth', 'Moving undetected and picking locks'),
(4, 'Marksmanship', 'Accuracy with ranged weapons'),
(5, 'Divine Magic', 'Healing and protection spells');

-- --------------------------------------------------------

--
-- Table structure for table `special_item_reward`
--

CREATE TABLE `special_item_reward` (
  `reward_type_id` int(11) NOT NULL,
  `item_type` varchar(255) DEFAULT NULL,
  `rarity` varchar(255) DEFAULT NULL,
  `min_rank` varchar(255) DEFAULT NULL,
  `requires_registration` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `special_item_reward`
--

INSERT INTO `special_item_reward` (`reward_type_id`, `item_type`, `rarity`, `min_rank`, `requires_registration`) VALUES
(5, 'Ancient Relic', 'Legendary', 'Platinum', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `equipment_reward`
--
ALTER TABLE `equipment_reward`
  ADD PRIMARY KEY (`reward_type_id`);

--
-- Indexes for table `guild_vault`
--
ALTER TABLE `guild_vault`
  ADD PRIMARY KEY (`vault_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `vault_id` (`vault_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `rank_id` (`rank_id`);

--
-- Indexes for table `member_item`
--
ALTER TABLE `member_item`
  ADD PRIMARY KEY (`member_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `member_skill`
--
ALTER TABLE `member_skill`
  ADD PRIMARY KEY (`member_id`,`skill_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `monetary_reward`
--
ALTER TABLE `monetary_reward`
  ADD PRIMARY KEY (`reward_type_id`);

--
-- Indexes for table `party`
--
ALTER TABLE `party`
  ADD PRIMARY KEY (`party_id`),
  ADD KEY `leader_id` (`leader_id`);

--
-- Indexes for table `party_member`
--
ALTER TABLE `party_member`
  ADD PRIMARY KEY (`party_id`,`member_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `quest`
--
ALTER TABLE `quest`
  ADD PRIMARY KEY (`quest_id`),
  ADD KEY `assigned_party_id` (`assigned_party_id`);

--
-- Indexes for table `quest_reward`
--
ALTER TABLE `quest_reward`
  ADD PRIMARY KEY (`reward_id`),
  ADD UNIQUE KEY `reward_type_id` (`reward_type_id`),
  ADD KEY `quest_id` (`quest_id`);

--
-- Indexes for table `rank`
--
ALTER TABLE `rank`
  ADD PRIMARY KEY (`rank_id`);

--
-- Indexes for table `reputation_reward`
--
ALTER TABLE `reputation_reward`
  ADD PRIMARY KEY (`reward_type_id`);

--
-- Indexes for table `resource_reward`
--
ALTER TABLE `resource_reward`
  ADD PRIMARY KEY (`reward_type_id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `special_item_reward`
--
ALTER TABLE `special_item_reward`
  ADD PRIMARY KEY (`reward_type_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `equipment_reward`
--
ALTER TABLE `equipment_reward`
  ADD CONSTRAINT `equipment_reward_ibfk_1` FOREIGN KEY (`reward_type_id`) REFERENCES `quest_reward` (`reward_type_id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`vault_id`) REFERENCES `guild_vault` (`vault_id`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`rank_id`) REFERENCES `rank` (`rank_id`);

--
-- Constraints for table `member_item`
--
ALTER TABLE `member_item`
  ADD CONSTRAINT `member_item_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  ADD CONSTRAINT `member_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`);

--
-- Constraints for table `member_skill`
--
ALTER TABLE `member_skill`
  ADD CONSTRAINT `member_skill_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  ADD CONSTRAINT `member_skill_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`);

--
-- Constraints for table `monetary_reward`
--
ALTER TABLE `monetary_reward`
  ADD CONSTRAINT `monetary_reward_ibfk_1` FOREIGN KEY (`reward_type_id`) REFERENCES `quest_reward` (`reward_type_id`);

--
-- Constraints for table `party`
--
ALTER TABLE `party`
  ADD CONSTRAINT `party_ibfk_1` FOREIGN KEY (`leader_id`) REFERENCES `member` (`member_id`);

--
-- Constraints for table `party_member`
--
ALTER TABLE `party_member`
  ADD CONSTRAINT `party_member_ibfk_1` FOREIGN KEY (`party_id`) REFERENCES `party` (`party_id`),
  ADD CONSTRAINT `party_member_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- Constraints for table `quest`
--
ALTER TABLE `quest`
  ADD CONSTRAINT `quest_ibfk_1` FOREIGN KEY (`assigned_party_id`) REFERENCES `party` (`party_id`);

--
-- Constraints for table `quest_reward`
--
ALTER TABLE `quest_reward`
  ADD CONSTRAINT `quest_reward_ibfk_1` FOREIGN KEY (`quest_id`) REFERENCES `quest` (`quest_id`);

--
-- Constraints for table `reputation_reward`
--
ALTER TABLE `reputation_reward`
  ADD CONSTRAINT `reputation_reward_ibfk_1` FOREIGN KEY (`reward_type_id`) REFERENCES `quest_reward` (`reward_type_id`);

--
-- Constraints for table `resource_reward`
--
ALTER TABLE `resource_reward`
  ADD CONSTRAINT `resource_reward_ibfk_1` FOREIGN KEY (`reward_type_id`) REFERENCES `quest_reward` (`reward_type_id`);

--
-- Constraints for table `special_item_reward`
--
ALTER TABLE `special_item_reward`
  ADD CONSTRAINT `special_item_reward_ibfk_1` FOREIGN KEY (`reward_type_id`) REFERENCES `quest_reward` (`reward_type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
