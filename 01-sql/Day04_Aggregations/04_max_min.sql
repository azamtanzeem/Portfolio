
DataLemur | Difficulty: Easy
Topic: EXCEPT, SELECT, ORDER BY
Platform: Facebook / Meta
Question: Find Facebook page IDs that have zero likes.
Output page_id sorted ascending.


SELECT page_id
FROM pages

EXCEPT                         

SELECT page_id
FROM page_likes

ORDER BY page_id;


KEY CONCEPTS USED:
EXCEPT        → set operation: rows in query A minus rows in query B
equivalent to a LEFT JOIN ... WHERE liked IS NULL
but cleaner for this use case
ORDER BY      → applied to the final combined result, not each query

ALTERNATIVE using LEFT JOIN + NULL check:
SELECT p.page_id
FROM pages p
LEFT JOIN page_likes pl ON p.page_id = pl.page_id
HERE pl.page_id IS NULL
ORDER BY p.page_id;

