-- COFFEE SHOP SALES ANALYSIS


-- Objective 1: View all the records from the dataset:
SELECT *
FROM coffee_sales;


-- Objective 2: See all unique coffee items sold:
SELECT DISTINCT product_detail
FROM coffee_sales
ORDER BY product_detail;


-- Objective 3: Find the highest priced item:
SELECT product_detail, unit_price
FROM coffee_sales
ORDER BY unit_price DESC
LIMIT 1;


-- Objective 4: Find the lowest priced item:
SELECT product_detail, unit_price
FROM coffee_sales
ORDER BY unit_price ASC
LIMIT 1;


-- Objective 5: Find the most purchased item (by quantity):
SELECT product_detail,
       SUM(transaction_qty) AS total_quantity
FROM coffee_sales
GROUP BY product_detail
ORDER BY total_quantity DESC
LIMIT 1;


-- Objective 6: Find the least purchased item (by quantity):
SELECT product_detail,
       SUM(transaction_qty) AS total_quantity
FROM coffee_sales
GROUP BY product_detail
ORDER BY total_quantity ASC
LIMIT 1;


-- Objective 7: Find the total sales revenue:
SELECT SUM(Total_Bill) AS total_revenue
FROM coffee_sales;


-- Objective 8: Find total sales made in each store location:
SELECT store_location,
       SUM(Total_Bill) AS total_sales
FROM coffee_sales
GROUP BY store_location
ORDER BY total_sales DESC;


-- Objective 9: Count how many transactions happen each day of the week:
SELECT "Day Name",
       COUNT(*) AS total_transactions
FROM coffee_sales
GROUP BY "Day Name"
ORDER BY total_transactions DESC;


-- Objective 10: Find peak hours — which hour has the highest number of orders:
SELECT Hour,
       COUNT(*) AS total_orders
FROM coffee_sales
GROUP BY Hour
ORDER BY total_orders DESC;


-- Objective 11: Find average bill amount per transaction:
SELECT AVG(Total_Bill) AS avg_transaction_value
FROM coffee_sales;


-- Objective 12: Check how many sales belong to each product category:
SELECT product_category,
       COUNT(*) AS total_orders
FROM coffee_sales
GROUP BY product_category;


-- Objective 13: Find total revenue generated for each product type:
SELECT product_type,
       SUM(Total_Bill) AS total_revenue
FROM coffee_sales
GROUP BY product_type
ORDER BY total_revenue DESC;


-- Objective 14: Find the best-selling coffee size (Small/Medium/Large):
SELECT Size,
       SUM(transaction_qty) AS total_quantity_sold
FROM coffee_sales
GROUP BY Size
ORDER BY total_quantity_sold DESC;


-- Objective 15: Find monthly total sales:
SELECT "Month Name",
       SUM(Total_Bill) AS monthly_sales
FROM coffee_sales
GROUP BY "Month Name"
ORDER BY monthly_sales DESC;


-- Objective 16: Categorize sales into time-of-day segments (Morning, Afternoon, Evening, Night):
SELECT 
    CASE 
        WHEN Hour BETWEEN 5 AND 11 THEN 'Morning'
        WHEN Hour BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN Hour BETWEEN 17 AND 20 THEN 'Evening'
        ELSE 'Night'
    END AS time_of_day,
    COUNT(*) AS total_orders,
    SUM(Total_Bill) AS total_revenue
FROM coffee_sales
GROUP BY time_of_day
ORDER BY total_orders DESC;



-- END










