# Adventurers Guild Database System - README

## Overview
This database system manages all operations for a fantasy adventurers guild, including member tracking, quest management, inventory control, and reward distribution. The system is built with MySQL and includes views, stored procedures, triggers, and subqueries to automate guild operations.

## Database Features

### Views
1. **ActiveQuests**  
   - Displays available quests  
   - `SELECT * FROM ActiveQuests;`

2. **TopAdventurers**  
   - Ranks members by completion rate  
   - `SELECT * FROM TopAdventurers LIMIT 5;`

3. **High_Value_Items**  
   - Shows items worth over 1000 gold  
   - `SELECT * FROM High_Value_Items;`

4. **Member_Stats**  
   - Displays member ranks and performance  
   - `SELECT * FROM Member_Stats WHERE quest_completion_rate > 0.8;`

### Stored Procedures
1. **AssignQuest(questID, memberID)**  
   - Assigns quest to a member's party  
   - `CALL AssignQuest(5, 3);`

2. **PromoteMember(memberId)**  
   - Promotes eligible members  
   - `CALL PromoteMember(4);`

3. **TotalVaultValue()**  
   - Calculates total vault worth  
   - `SELECT TotalVaultValue();`

### Triggers
1. **AutoRankUp**  
   - Automatically promotes high-performing members

2. **Prevent_Item_Deletion**  
   - Blocks deletion of rare items

3. **Set_Completion_Date**  
   - Timestamps quest completions

## Installation
1. Import the database:
   ```bash
   mysql -u username -p < adventurers_guild_db.sql
   ```

2. Create a user with appropriate permissions:
   ```sql
   CREATE USER 'guild_admin'@'localhost' IDENTIFIED BY 'securepassword';
   GRANT ALL PRIVILEGES ON `adventurers guild db`.* TO 'guild_admin'@'localhost';
   ```

## Usage Examples

### Member Management
```sql
-- Register new member
CALL register_new_member('New Adventurer', 'Ranger', @new_id);
SELECT @new_id;

-- View member stats
SELECT * FROM Member_Stats WHERE name LIKE '%New%';
```

### Quest Operations
```sql
-- Find available quests
SELECT * FROM ActiveQuests WHERE difficulty_rating = 'C';

-- Complete a quest
UPDATE quest SET completed = 1 WHERE quest_id = 3;
```

### Inventory Management
```sql
-- Add new item
INSERT INTO item (name, rarity, value) 
VALUES ('Dragonbone Sword', 'Epic', 2500);

-- View vault contents
SELECT * FROM High_Value_Items ORDER BY value DESC;
```

## Business Rules
1. Members must meet completion rate thresholds for promotion
2. Rare items cannot be deleted from inventory
3. Quest rewards are automatically calculated based on:
   - Difficulty level
   - Member rank multipliers
   - Party size

## Maintenance
Regularly run these optimization queries:
```sql
ANALYZE TABLE member;
OPTIMIZE TABLE quest;
```

