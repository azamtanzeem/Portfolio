-- ============================================================
-- DataLemur | Difficulty: Easy
-- Topic: GROUP BY, HAVING, COUNT
-- Platform: LinkedIn
-- Question: Find candidates who have more than 2 technical skills.
--           Output their candidate_id.
-- ============================================================

SELECT candidate_id
FROM candidates
GROUP BY candidate_id
HAVING COUNT(skill) > 2;          -- keep only candidates with 3+ skills

-- ============================================================
-- BONUS — DataLemur HAVING MIN Practice
-- Topic: HAVING with MIN aggregate
-- Question: Find all FAANG stocks whose open price was
--           always greater than $100.
-- ============================================================

SELECT
    ticker,
    MIN(open)                      -- lowest open price for this stock
FROM stock_prices
GROUP BY ticker
HAVING MIN(open) > 100;           -- only stocks where even the minimum > 100

-- ============================================================
-- KEY CONCEPTS USED:
--   HAVING COUNT(skill) > 2  → filters groups by count, not rows
--   HAVING MIN(open) > 100   → filters groups where the minimum
--                              value across all rows meets the threshold
--
-- WHERE vs HAVING reminder:
--   WHERE  skill = 'Python'   → row-level filter, runs before grouping
--   HAVING COUNT(skill) > 2   → group-level filter, runs after grouping
-- ============================================================
