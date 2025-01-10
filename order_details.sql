-- 1. view the order_details table
SELECT * FROM order_details; 
-- 2. what is the date range of the table?
SELECT * FROM order_details
ORDER BY order_date;
-- or another way 
SELECT MIN(order_date), MAX(order_date)
FROM order_details; 
-- 3. how many orders were made within this date range? have to find the # of unique ids there are 
SELECT COUNT(DISTINCT order_id) 
FROM order_details;
-- 4. how many items were ordered within this date range? diff from # of ordes made --> multiple items can be purchased 
SELECT COUNT(*) 
FROM order_details;
-- 5. which orders had the most # of items? look ar orders and items --> for every order, how many items were in there?
SELECT order_id, COUNT(item_id) AS num_items 
FROM order_details 
GROUP BY order_id
ORDER BY num_items DESC;
-- 6. how many orders had more than 12 items?
SELECT order_id, COUNT(item_id) AS num_items 
FROM order_details 
GROUP BY order_id
HAVING num_items > 12; 
-- but how many rows or records are in this query's result set?
SELECT COUNT(*) FROM 
(SELECT order_id, COUNT(item_id) AS num_items 
FROM order_details 
GROUP BY order_id
HAVING num_items > 12) AS num_orders; 
