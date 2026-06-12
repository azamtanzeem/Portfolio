Problem: Workers With The Highest Salaries
Platform: StrataScratch #10353
Difficulty: Medium
JOIN Type: INNER JOIN + correlated subquery
Date: 2026-06-10

SELECT t.worker_title AS best_paid_title
FROM worker w
INNER JOIN title t ON w.worker_id = t.worker_ref_id
WHERE w.salary = (
    SELECT MAX(w2.salary)
    FROM worker w2
    INNER JOIN title t2 ON w2.worker_id = t2.worker_ref_id
)
