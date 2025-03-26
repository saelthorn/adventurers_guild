# Adventurers Guild Database System - README

## Overview
This database system manages all operations for an Adventurers Guild, including member tracking, quest management, item inventory, and reward distribution. The system is built with MySQL and includes views, stored procedures, triggers, and subqueries to automate guild operations.

## Database Features

### Views
1. **ActiveQuests**  
   - Shows available quests  
   - `SELECT * FROM ActiveQuests;`

2. **TopAdventurers**  
   - Ranks members by completion rate  
   - `SELECT * FROM TopAdventurers LIMIT 5;`

3. **High_Value_Items**  
   - Displays items worth >1000 gold  
   - `SELECT * FROM High_Value_Items;`

4. **Member_Stats**  
   - Shows member ranks and performance  
   - `SELECT * FROM Member_Stats WHERE rank_name = 'Gold';`

### Key Stored Procedures

| Procedure | Description | Usage Example |
|-----------|-------------|---------------|
| `AssignQuest` | Assigns quest to member's party | `CALL AssignQuest(5, 3);` |
| `PromoteMember` | Promotes eligible members | `CALL PromoteMember(4);` |
| `TotalVaultValue` | Calculates vault's total worth | `SELECT TotalVaultValue();` |

### Important Triggers

1. **AutoRankUp**  
   - Automatically promotes high-performing members  
   - Activates when completion rate ≥90%

2. **Prevent_Item_Deletion**  
   - Blocks deletion of rare/legendary items  
   - Returns error message if attempted

3. **Set_Completion_Date**  
   - Timestamps quest completions  
   - Sets deadline to current date upon completion

## Installation
1. Import the database:
   ```bash
   mysql -u username -p < adventurers_guild_db.sql
   ```

2. Create required user accounts:
   ```sql
   CREATE USER 'guild_clerk'@'localhost' IDENTIFIED BY 'securepassword';
   GRANT SELECT ON guild_db.* TO 'guild_clerk'@'localhost';
   GRANT EXECUTE ON PROCEDURE AssignQuest TO 'guild_clerk'@'localhost';
   ```

## Usage Examples

### Assigning a New Quest
```sql
-- Find available quests
SELECT * FROM ActiveQuests WHERE difficulty_rating = 'B';

-- Assign to party
CALL AssignQuest(4, 2); -- Assigns quest 4 to Lyra's party
```

### Checking Member Performance
```sql
-- View top performers
SELECT * FROM TopAdventurers WHERE quest_completion_rate > 0.85;

-- Get member statistics
SELECT * FROM Member_Stats WHERE name LIKE '%Thorne%';
```

### Managing Vault Items
```sql
-- View valuable items
SELECT * FROM High_Value_Items ORDER BY value DESC;

-- Check total vault worth
SELECT TotalVaultValue() AS total_assets;
```

## Business Rules Enforcement
The database automatically:
- Validates quest assignments by rank requirements
- Tracks and rewards high performance
- Protects valuable items from deletion
- Maintains accurate completion records

## Maintenance
1. **Backup Database**  
   ```bash
   mysqldump -u username -p adventurers_guild_db > guild_backup.sql
   ```

2. **Performance Optimization**  
   Run monthly:
   ```sql
   ANALYZE TABLE member, quest, item;
   OPTIMIZE TABLE quest_reward;
   ```

