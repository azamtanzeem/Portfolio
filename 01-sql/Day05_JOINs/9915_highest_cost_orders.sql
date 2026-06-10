-- Problem: Highest Cost Orders
-- Platform: StrataScratch #9915
-- Difficulty: Medium
-- JOIN Type: INNER JOIN + CTE + DENSE_RANK
-- Date: 2026-06-10

WITH DailyCustomerTotals AS (
    SELECT 
        c.first_name, 
        o.order_date, 
        SUM(o.total_order_cost) AS total_daily_cost
    FROM customers c
    JOIN orders o ON c.id = o.cust_id
    WHERE o.order_date BETWEEN '2019-02-01' AND '2019-05-01'
    GROUP BY c.first_name, o.order_date 
),
RankedDailyTotals AS (
    SELECT 
        total_daily_cost, 
        first_name, 
        order_date, 
        DENSE_RANK() OVER(PARTITION BY order_date ORDER BY total_daily_cost DESC) AS rnk 
    FROM DailyCustomerTotals
)
SELECT first_name, order_date, total_daily_cost 
FROM RankedDailyTotals 
WHERE rnk = 1
