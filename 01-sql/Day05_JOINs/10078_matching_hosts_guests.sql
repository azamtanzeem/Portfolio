Problem: Find Matching Hosts and Guests
Platform: StrataScratch #10078
Difficulty: Medium
JOIN Type: INNER JOIN on multiple conditions
Date: 2026-06-10

SELECT DISTINCT h.host_id, g.guest_id
FROM airbnb_hosts h 
INNER JOIN airbnb_guests g 
    ON h.nationality = g.nationality
    AND h.gender = g.gender
