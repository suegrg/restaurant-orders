-- 1. combine menu_items and order_details tables into a single table 
SELECT * 
FROM menu_items;

SELECT * 
FROM order_details; 

SELECT * 
FROM order_details AS od -- when you combine tables, you typically add the transactions table frist
LEFT JOIN menu_items AS mi -- could do inner join but left join would keep all the transaction info together 
	ON od.item_id = mi.menu_item_id;
-- 2. what were the least and most ordered items? what categories were they in?
SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details AS od 
LEFT JOIN menu_items AS mi 
	ON od.item_id = mi.menu_item_id
GROUP BY item_name, category 
ORDER BY num_purchases DESC;
-- 3. what were the top 5 orders that spent the most money? waht customers are spending the most on 
SELECT order_id, SUM(price) AS total_spend
FROM order_details AS od 
LEFT JOIN menu_items AS mi 
	ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5; 
-- 4. view the details of the highest spend order - what insights can you gather from the results?
SELECT category, COUNT(item_id) AS num_items 
FROM order_details AS od 
LEFT JOIN menu_items AS mi 
	ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category; 
-- 5. view the details of the top 5 highest spend orders - what insights can you gather from the results?
SELECT order_id, category, COUNT(item_id) AS num_items 
FROM order_details AS od 
LEFT JOIN menu_items AS mi 
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675) 
GROUP BY order_id, category; 

