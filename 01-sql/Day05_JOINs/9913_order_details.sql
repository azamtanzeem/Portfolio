Problem: Order Details
Platform: StrataScratch #9913
Difficulty: Easy
JOIN Type: LEFT JOIN (multi-table)
Date: 2026-06-10

SELECT o.order_date, o.order_details, o.total_order_cost, c.first_name
FROM customers c 
LEFT JOIN orders o ON c.id = o.cust_id
WHERE c.first_name IN ('Jill', 'Eva')
ORDER BY o.cust_id
