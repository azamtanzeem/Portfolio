-- Problem: Employee and Manager Salaries
-- Platform: StrataScratch #9894
-- Difficulty: Medium
-- JOIN Type: Self JOIN
-- Date: 2026-06-10

SELECT emp.first_name, emp.salary
FROM employee emp
JOIN employee mgr ON emp.manager_id = mgr.id
WHERE emp.salary > mgr.salary
