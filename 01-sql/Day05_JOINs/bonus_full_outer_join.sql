-- Problem: FULL OUTER JOIN Bonus Exercise
-- Platform: Self-written
-- Date: 2026-06-10
-- Note: MySQL workaround — UNION of LEFT + RIGHT JOIN

-- PostgreSQL (native)
SELECT l.id, r.id, l.val, r.val
FROM left_table l 
FULL OUTER JOIN right_table r ON l.id = r.id;

-- MySQL workaround
SELECT l.id, r.id, l.val, r.val
FROM left_table l 
LEFT JOIN right_table r ON l.id = r.id
UNION
SELECT l.id, r.id, l.val, r.val
FROM left_table l 
RIGHT JOIN right_table r ON l.id = r.id;
