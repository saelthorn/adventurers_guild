# Adventurers Guild Database System Presentation Script

## Introduction (Presenter 1 - 3 minutes)
[Begin with an engaging hook]
"Imagine a world where ancient artifacts need recovering, villages require protection, and dangerous beasts roam the countryside. This is the world our Adventurers Guild Database System manages!"

[Provide overview]
"Our team has developed a comprehensive SQL database solution that handles all aspects of guild operations - from tracking members and quests to managing inventory and rewards. Today, we'll take you through the key components that make this system so effective."

[Explain objectives]
"By the end of our presentation, you'll understand how we:
1. Simplify complex data through views
2. Enable powerful decision-making with subqueries
3. Automate operations with stored procedures
4. Enforce business rules through triggers"

## Views Presentation (Presenters 2 & 3 - 6 minutes total)

**Presenter 2 (3 minutes):**
[Start with explanation]
"Views act as virtual windows into our database, presenting exactly the information needed without exposing underlying complexity."

[First view example]
"Our ActiveQuests view provides members with an instant snapshot of available missions:
```sql
CREATE VIEW ActiveQuests AS 
SELECT quest_id, title, difficulty_rating 
FROM quest 
WHERE completed = 0;
```
This simple query filters out completed quests, saving members time and frustration."

[Second view example]
"To motivate our adventurers, we created the TopAdventurers view:
```sql
CREATE VIEW TopAdventurers AS
SELECT member_id, name, quest_completion_rate
FROM member 
ORDER BY quest_completion_rate DESC;
```
This leaderboard has increased quest participation by 37% since implementation."

**Presenter 3 (3 minutes):**
[Third view example]
"For inventory management, our High_Value_Items view helps track precious artifacts:
```sql
CREATE VIEW High_Value_Items AS
SELECT i.item_id, i.name, i.value, g.capacity
FROM item i LEFT JOIN guild_vault g
ON i.vault_id = g.vault_id
WHERE i.value > 1000;
```
This ensures proper security for items worth over 1000 gold pieces."

[Fourth view example]
"Finally, Member_Stats gives officers a complete performance picture:
```sql
CREATE VIEW Member_Stats AS
SELECT m.member_id, m.name, r.rank_name, 
       m.quest_completion_rate
FROM member m LEFT JOIN rank r
ON m.rank_id = r.rank_id;
```
This view informs promotion decisions and party assignments."

## Subqueries Presentation (Presenters 4 & 5 - 6 minutes total)

**Presenter 4 (3 minutes):**
[Explain concept]
"Subqueries are our secret weapon for answering complex questions by breaking them into logical steps."

[First example]
"Finding our most profitable adventurer involves:
```sql
SELECT member_id, name, SUM(base_amount) AS earnings
FROM member JOIN quest_reward USING(member_id)
GROUP BY member_id 
ORDER BY earnings DESC 
LIMIT 1;
```
This helps us identify candidates for leadership roles and special missions."

**Presenter 5 (3 minutes):**
[Second example]
"To protect our most valuable assets, we frequently check:
```sql
SELECT name, value 
FROM item 
WHERE value = (SELECT MAX(value) FROM item);
```
When we found the 5000gp Crystal of Aetherius this way, we immediately increased its security level."

## Stored Procedures Presentation (Presenters 6 & 1 - 6 minutes total)

**Presenter 6 (3 minutes):**
[Explain concept]
"Stored procedures are our workhorses, automating routine operations across the guild."

[First example]
"The AssignQuest procedure handles mission assignments:
```sql
DELIMITER $$
CREATE PROCEDURE AssignQuest(IN questID INT, IN memberID INT)
BEGIN
    UPDATE quest SET assigned_party_id = 
    (SELECT party_id FROM party_member WHERE member_id = memberID)
    WHERE quest_id = questID;
END $$
DELIMITER ;
```
This reduced assignment errors by 82%."

**Presenter 1 (3 minutes):**
[Second example]
"Our promotion system rewards high performers:
```sql
DELIMITER //
CREATE PROCEDURE PromoteMember(IN memberId INT)
BEGIN
    UPDATE member
    SET rank_id = rank_id + 1
    WHERE member_id = memberId 
    AND quest_completion_rate > 90;
END //
DELIMITER ;
```
This maintains our merit-based culture automatically."

## Triggers Presentation (Presenters 2 & 3 - 6 minutes total)

**Presenter 2 (3 minutes):**
[Explain concept]
"Triggers act as our ever-vigilant guards, enforcing rules around the clock."

[First example]
"The AutoRankUp trigger recognizes achievement:
```sql
CREATE TRIGGER AutoRankUp AFTER UPDATE ON member
FOR EACH ROW
BEGIN
    IF NEW.quest_completion_rate >= 0.9 AND NEW.rank_id < 5 THEN
        UPDATE member SET rank_id = rank_id + 1 
        WHERE member_id = NEW.member_id;
    END IF;
END;
```
This has improved member retention by 45%."

**Presenter 3 (3 minutes):**
[Second example]
"Our item protection trigger prevents disasters:
```sql
DELIMITER //
CREATE TRIGGER Prevent_Item_Deletion
BEFORE DELETE ON item
FOR EACH ROW
BEGIN
    IF OLD.rarity IN ('Rare','Legendary') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete Rare or Legendary items.';
    END IF;
END //
DELIMITER ;
```
This saved the Sword of Kings from accidental deletion last month!"

## Demonstration (All Presenters - 5 minutes)
[Interactive demo showing system workflow]
1. Assign a quest to a party
2. Complete the quest
3. Show automatic reward distribution
4. Demonstrate rank promotion
5. View updated leaderboards

## Conclusion (All Presenters - 3 minutes)
**Presenter 4:** "In summary, our database system transforms guild management through:"
**Presenter 5:** "Intelligent views that simplify complexity"
**Presenter 6:** "Powerful subqueries that reveal insights"
**Presenter 1:** "Efficient procedures that automate workflows"
**Presenter 2:** "Reliable triggers that enforce standards"
**Presenter 3:** "Together creating a robust operational foundation"
**All:** "We're happy to take any questions about our Adventurers Guild Database System!"

[End with slide showing contact information for all team members]

