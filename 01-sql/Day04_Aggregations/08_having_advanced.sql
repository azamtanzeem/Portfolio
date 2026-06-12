
DataLemur | Difficulty: Easy
Topic: HAVING, COUNT, Subquery
Platform: UnitedHealth Group
Question: Find the number of policy holders who called
3 or more times. Output a single count.


SELECT
    COUNT(policy_holder_id) AS policy_holder_count
FROM (
    SELECT
        policy_holder_id,
        COUNT(case_id) AS call_count        
    FROM callers
    GROUP BY policy_holder_id
    HAVING COUNT(case_id) >= 3             
) AS call_records;                         


KEY CONCEPTS USED:
HAVING COUNT >= 3     → filters groups by their call count
Subquery in FROM      → the inner query runs first, producing
a filtered table of frequent callers
Outer COUNT           → counts rows in that filtered result

WHY a subquery here?
You cannot do COUNT(HAVING ...) in one level.
The HAVING filters down to frequent callers first,
then the outer COUNT adds them up.

ALTERNATIVE using CTE (same logic, more readable):
WITH frequent_callers AS (
SELECT policy_holder_id
FROM callers
GROUP BY policy_holder_id
HAVING COUNT(case_id) >= 3
   )
SELECT COUNT(*) AS policy_holder_count
FROM frequent_callers;                                              

