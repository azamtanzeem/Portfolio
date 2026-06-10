-- Problem: Average Salaries
-- Platform: StrataScratch #9917
-- Difficulty: Easy
-- JOIN Type: INNER JOIN (subquery)
-- Date: 2026-06-10

SELECT e.department, first_name, salary, avg_salary
FROM employee e 
JOIN (
    SELECT department, AVG(salary) AS avg_salary 
    FROM employee 
    GROUP BY department
) d ON e.department = d.department
