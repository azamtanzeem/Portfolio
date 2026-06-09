-- ============================================================
-- DataLemur | Difficulty: Easy
-- Topic: GROUP BY, COUNT, CTE
-- Platform: LinkedIn
-- Question: Find the number of companies that have posted
--           duplicate job listings (same title + description).
-- ============================================================

WITH job_count_cte AS (
    SELECT
        company_id,
        title,
        description,
        COUNT(job_id) AS job_count       -- count listings per unique job
    FROM job_listings
    GROUP BY company_id, title, description
)

SELECT
    COUNT(DISTINCT company_id) AS duplicate_companies  -- companies with duplicates
FROM job_count_cte
WHERE job_count > 1;                     -- only keep groups with more than 1 listing

-- ============================================================
-- KEY CONCEPTS USED:
--   CTE (WITH clause)       → breaks problem into readable steps
--   GROUP BY multiple cols  → groups by company + title + description together
--   COUNT(job_id)           → counts listings per unique combination
--   WHERE job_count > 1     → filters to only duplicate postings
--   COUNT(DISTINCT)         → counts unique companies, not rows
-- ============================================================
