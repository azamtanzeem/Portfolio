
DataLemur | Difficulty: Easy
Topic: AVG, GROUP BY, EXTRACT, ROUND, ORDER BY
Platform: Amazon
Question: Calculate the monthly average star rating for each
product. Round to 2 decimal places.
Order by month then product_id.


SELECT
    EXTRACT(MONTH FROM submit_date) AS mth,   -- pull month number from date
    product_id,
    ROUND(AVG(stars), 2)            AS avg_stars
FROM reviews
GROUP BY
    EXTRACT(MONTH FROM submit_date),           -- group by month expression
    product_id                                 -- and by product
ORDER BY mth, product_id;


KEY CONCEPTS USED:
EXTRACT(MONTH FROM date) → returns the month as a number (1-12)
AVG(stars)               → mean of all ratings in the group
ROUND(x, 2)              → rounds to 2 decimal places
GROUP BY expression      → you can GROUP BY a function,
not just a raw column name
ORDER BY alias           → mth alias is valid in ORDER BY
(executes after SELECT)

