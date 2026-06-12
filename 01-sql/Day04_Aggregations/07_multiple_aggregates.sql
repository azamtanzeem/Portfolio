
DataLemur | Difficulty: Easy
Topic: SUM, CASE WHEN, multiple aggregates in one SELECT
Platform: New York Times
Question: Calculate total viewership for laptops and mobile
devices (tablet + phone = mobile).
Output as laptop_views and mobile_views.


SELECT
    SUM(CASE WHEN device_type = 'laptop'                THEN 1 ELSE 0 END) AS laptop_views,
    SUM(CASE WHEN device_type IN ('tablet', 'phone')    THEN 1 ELSE 0 END) AS mobile_views
FROM viewership;


KEY CONCEPTS USED:
SUM + CASE WHEN    → counts rows matching a condition
(same as COUNT but works with conditions)
IN ('tablet','phone') → matches either value in one expression
No GROUP BY needed → entire table is one group here since
we want a single summary row
This pattern (SUM of CASE WHEN) is how you pivot row values
into columns — extremely common in analyst work.

EQUIVALENT using COUNT + FILTER (PostgreSQL specific):
SELECT
COUNT(*) FILTER (WHERE device_type = 'laptop')              AS laptop_views,
COUNT(*) FILTER (WHERE device_type IN ('tablet','phone'))   AS mobile_views
FROM viewership;

