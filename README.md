# Adventurers Guild Database System - README

## Table of Contents
1. [Overview](#overview)
2. [Database Schema](#database-schema)
3. [Key Features](#key-features)
4. [Installation](#installation)
5. [Usage Examples](#usage-examples)
6. [Business Rules](#business-rules)
7. [Maintenance](#maintenance)

## Overview

The Adventurers Guild Database System is a comprehensive management solution for fantasy adventurers guild operations. This MySQL database tracks members, quests, parties, items, rewards, and all aspects of guild administration. The system includes:

- Member management and ranking
- Quest assignment and tracking
- Party formation and management
- Inventory and vault systems
- Reward distribution
- Skill tracking

## Database Schema

### Core Tables

1. **member** - Stores guild member information
   - Fields: member_id, name, class, rank_id, join_date, active_status, quest_completion_rate
   - Sample data: 5 active members with different classes and ranks

2. **quest** - Manages all guild quests
   - Fields: quest_id, title, description, difficulty_rating, post_date, deadline, assigned_party_id, completed, client_satisfaction
   - Sample data: 5 quests with varying difficulty levels

3. **party** - Tracks adventuring parties
   - Fields: party_id, leader_id, party_name, formation_date, active_status, success_rate
   - Sample data: 3 active parties with different success rates

4. **item** - Manages equipment and magical items
   - Fields: item_id, name, rarity, value, item_condition, magical, registration_date, vault_id
   - Sample data: 5 items ranging from common to rare

5. **rank** - Defines member ranking system
   - Fields: rank_id, rank_name, points_range, quest_access, reward_multiplier
   - Sample data: 5 ranks from Bronze to Diamond

### Relationship Tables

1. **party_member** - Links members to parties
2. **member_item** - Tracks items owned by members
3. **member_skill** - Records member skill proficiencies
4. **quest_reward** - Manages rewards for completed quests

### Reward System Tables

1. **monetary_reward** - Gold coin rewards
2. **equipment_reward** - Weapon/armor rewards
3. **resource_reward** - Crafting material rewards
4. **reputation_reward** - Reputation point rewards
5. **special_item_reward** - Unique item rewards

## Key Features

### Automated Systems

1. **Rank Progression** - Members automatically qualify for promotion based on completion rates
2. **Reward Distribution** - Calculates fair shares of monetary rewards based on:
   - Quest difficulty
   - Member rank multipliers
   - Party size
3. **Quest Management** - Tracks deadlines, assignments, and completion status

### Security Features

1. **Item Protection** - Prevents deletion of rare/legendary items
2. **Rank-Based Access** - Restricts quests based on member rank
3. **Vault Tracking** - Monitors high-value items in guild storage

### Reporting Views

1. **ActiveQuests** - Shows available quests
2. **TopAdventurers** - Ranks members by performance
3. **High_Value_Items** - Identifies valuable inventory
4. **Member_Stats** - Tracks member progression

## Installation

1. **Database Setup**:
   ```bash
   mysql -u username -p < adventurers_guild_db.sql
   ```

2. **Create Admin User**:
   ```sql
   CREATE USER 'guild_admin'@'localhost' IDENTIFIED BY 'securepassword';
   GRANT ALL PRIVILEGES ON `adventurers guild db`.* TO 'guild_admin'@'localhost';
   FLUSH PRIVILEGES;
   ```

3. **Configuration**:
   - Adjust storage fees in `guild_vault` table
   - Modify rank requirements in `rank` table as needed

## Usage Examples

### Member Management
```sql
-- Register new member
CALL register_new_member('New Adventurer', 'Ranger', @new_id);
SELECT @new_id;

-- View member performance
SELECT * FROM Member_Stats WHERE quest_completion_rate > 0.8;

-- Promote eligible members
CALL PromoteMember(4);
```

### Quest Operations
```sql
-- Find available quests
SELECT * FROM ActiveQuests WHERE difficulty_rating = 'C';

-- Assign quest to party
CALL AssignQuest(5, 3);

-- Complete a quest
UPDATE quest SET completed = 1 WHERE quest_id = 3;
```

### Inventory Management
```sql
-- Add new item
INSERT INTO item (name, rarity, value, magical) 
VALUES ('Dragonbone Sword', 'Epic', 2500, 1);

-- View vault contents
SELECT * FROM High_Value_Items ORDER BY value DESC;

-- Calculate total vault worth
SELECT TotalVaultValue();
```

## Business Rules

1. **Rank Progression**:
   - Bronze: 0-100 points
   - Silver: 101-300 points (+5% rewards)
   - Gold: 301-600 points (+10% rewards)
   - Platinum: 601-1000 points (+15% rewards)
   - Diamond: 1001+ points (+20% rewards)

2. **Quest Access**:
   - Bronze: E,D rank quests
   - Silver: E,D,C
   - Gold: E,D,C,B
   - Platinum: E,D,C,B,A
   - Diamond: All quests (including S-rank)

3. **Item Protection**:
   - Rare/Legendary items cannot be deleted
   - Magical items must have value >100 gold
   - All items must have registration date

4. **Reward Distribution**:
   - Monetary rewards split evenly among party members
   - Rewards multiplied by member's rank bonus
   - Guild takes 10% commission on monetary rewards

## Maintenance

**Weekly Tasks:**
```sql
-- Update statistics
ANALYZE TABLE member, quest, party;

-- Optimize performance
OPTIMIZE TABLE item, quest_reward;
```

**Monthly Tasks:**
1. Review and archive completed quests older than 1 year
2. Validate member skill records
3. Audit vault inventory

**Annual Tasks:**
1. Review rank thresholds and reward multipliers
2. Archive inactive members
3. Perform complete database backup



---

*Last Updated: February 26, 2025*  
*Database Version: 1.1.0*  
*Maintained by: Guild Archivist*
