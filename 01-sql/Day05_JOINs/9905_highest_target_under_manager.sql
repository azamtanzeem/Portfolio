Problem: Highest Target Under Manager
Platform: StrataScratch #9905
Difficulty: Medium
JOIN Type: Self JOIN pattern (subquery on same table)
Date: 2026-06-10

SELECT first_name, target
FROM salesforce_employees
WHERE manager_id = 13
AND target = (
    SELECT MAX(target) 
    FROM salesforce_employees 
    WHERE manager_id = 13
)
