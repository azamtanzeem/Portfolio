Problem: Customer Details
Platform: StrataScratch #9891
Difficulty: Easy
JOIN Type: LEFT JOIN
Date: 2026-06-10

SELECT c.first_name, c.last_name, c.city, o.order_details
FROM customers c 
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.first_name, o.order_details
