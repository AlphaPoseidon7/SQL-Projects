-- AMAZON SALES ANALYSIS

-- Objective 1: Understand the Dataset:

-- 1.1	View all columns and data:
SELECT *
FROM amazon_sales;

-- 1.2	Count total number of records:
SELECT COUNT(*) AS total_records
FROM amazon_sales;



-- Objective 2: Product & Pricing Analysis:

-- 2.1 Find the highest and lowest discounted prices:
SELECT
    MAX(discounted_price) AS highest_discounted_price,
    MIN(discounted_price) AS lowest_discounted_price
FROM amazon_sales;

-- 2.2 Find the highest and lowest actual prices:
SELECT
    MAX(actual_price) AS highest_actual_price,
    MIN(actual_price) AS lowest_actual_price
FROM amazon_sales;

-- 2.3 List top 10 most expensive products (by actual price):
SELECT product_name, actual_price
FROM amazon_sales
ORDER BY actual_price DESC
LIMIT 10;



-- Objective 3: Discount Analysis:

-- 3.1 Find average discount percentage across all products:
SELECT AVG(discount_percentage) AS avg_discount_percentage
FROM amazon_sales;

-- 3.2 Find products with discount greater than 50%:
SELECT product_name, discount_percentage
FROM amazon_sales
WHERE discount_percentage > 50
ORDER BY discount_percentage DESC;

-- 3.3 Count number of products by discount range:
SELECT
    CASE
        WHEN discount_percentage < 20 THEN 'Low Discount'
        WHEN discount_percentage BETWEEN 20 AND 50 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_category,
    COUNT(*) AS product_count
FROM amazon_sales
GROUP BY discount_category;



-- Objective 4: Category Analysis:

-- 4.1 Find number of products in each category:
SELECT category, COUNT(*) AS total_products
FROM amazon_sales
GROUP BY category
ORDER BY total_products DESC;

-- 4.2 Find average rating per category:
SELECT category, AVG(rating) AS avg_rating
FROM amazon_sales
GROUP BY category
ORDER BY avg_rating DESC;



-- Objective 5: Ratings & Reviews Analysis:

-- 5.1 Find top 10 highest rated products:
SELECT product_name, rating
FROM amazon_sales
ORDER BY rating DESC
LIMIT 10;

-- 5.2 Find products with rating less than 3:
SELECT product_name, rating
FROM amazon_sales
WHERE rating < 3
ORDER BY rating ASC;

-- 5.3 Find products with highest number of reviews:
SELECT product_name, rating_count
FROM amazon_sales
ORDER BY rating_count DESC
LIMIT 10;



-- Objective 6: Customer Review Insights:

-- 6.1 Count total number of reviews:
SELECT COUNT(review_id) AS total_reviews
FROM amazon_sales;

-- 6.2 Find number of reviews per product:
SELECT product_name, COUNT(review_id) AS review_count
FROM amazon_sales
GROUP BY product_name
ORDER BY review_count DESC;



-- Objective 7: Business Insights:

-- 7.1 Identify products with high rating but low discount:
SELECT product_name, rating, discount_percentage
FROM amazon_sales
WHERE rating >= 4.5 AND discount_percentage < 20
ORDER BY rating DESC;

-- 7.2 Identify products with high discount but low rating:
SELECT product_name, rating, discount_percentage
FROM amazon_sales
WHERE discount_percentage > 50 AND rating < 3.5
ORDER BY discount_percentage DESC;



-- Objective 8: Data Quality Checks:

-- 8.1 Check for missing ratings:
SELECT COUNT(*) AS missing_ratings
FROM amazon_sales
WHERE rating IS NULL;

-- 8.2 Check for missing review content:
SELECT COUNT(*) AS missing_reviews
FROM amazon_sales
WHERE review_content IS NULL OR review_content = '';



-- Objective 9: Price vs Rating Analysis:

-- 9.1 Analyze whether higher-priced products tend to have better ratings:
SELECT
    CASE
        WHEN actual_price < 1000 THEN 'Low Price'
        WHEN actual_price BETWEEN 1000 AND 5000 THEN 'Medium Price'
        ELSE 'High Price'
    END AS price_range,
    ROUND(AVG(rating), 2) AS avg_rating,
    COUNT(*) AS product_count
FROM amazon_sales
GROUP BY price_range
ORDER BY avg_rating DESC;



-- Objective 10: Identify High-Value Products:

-- 10.1 Find products that offer high ratings with high discounts:
SELECT
    product_name,
    category,
    rating,
    discount_percentage,
    rating_count
FROM amazon_sales
WHERE rating >= 4.3
  AND discount_percentage >= 40
  AND rating_count >= 100
ORDER BY rating DESC, discount_percentage DESC;

-- END







