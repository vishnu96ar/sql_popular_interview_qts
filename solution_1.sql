create database interview_prep;

use interview_prep;

SHOW TABLES;

SELECT *
FROM items_table;

SELECT *
FROM orders_table;


SELECT i.item_category,
	   o.order_date,
       DAYNAME(o.order_date) AS day_of_week,
       o.quantity
       
FROM items_table i
LEFT JOIN orders_table o
ON i.item_id = o.item_id;

CREATE TABLE final(
SELECT i.item_category,
	   o.order_date,
       DAYNAME(o.order_date) AS day_of_week,
       o.quantity
       
FROM items_table i
LEFT JOIN orders_table o
ON i.item_id = o.item_id

);

-- Created a new Table called final with the required inputs

SELECT *
FROM final;

SELECT item_category AS 'Category',
	   SUM(CASE WHEN day_of_week = 'Monday' THEN quantity ELSE 0 END ) AS 'MONDAY',
       SUM(CASE WHEN day_of_week = 'Tuesday' THEN quantity ELSE 0 END ) AS 'TUESDAY',
       SUM(CASE WHEN day_of_week = 'Wednesday' THEN quantity ELSE 0 END ) AS 'WEDNESDAY',
       SUM(CASE WHEN day_of_week = 'Thursday' THEN quantity ELSE 0 END ) AS 'THURSDAY',
       SUM(CASE WHEN day_of_week = 'Friday' THEN quantity ELSE 0 END ) AS 'FRIDAY',
       SUM(CASE WHEN day_of_week = 'Saturday' THEN quantity ELSE 0 END ) AS 'SATURDAY',
       SUM(CASE WHEN day_of_week = 'Sunday' THEN quantity ELSE 0 END ) AS 'SUNDAY'
FROM final
GROUP BY item_category;