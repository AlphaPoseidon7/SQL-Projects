-- HOUSE PRICE ANALYSIS


-- Objective 1: Understand the structure of the dataset:
SELECT *
FROM house_prices
LIMIT 10;

SELECT COUNT(*) AS total_records
FROM house_prices;


-- Objective 2: Analyze overall house prices:
SELECT 
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    AVG(price) AS avg_price
FROM house_prices;


-- Objective 3: Compare prices by number of bedrooms:
SELECT 
    bedrooms,
    AVG(price) AS avg_price
FROM house_prices
GROUP BY bedrooms
ORDER BY bedrooms;


-- Objective 4: Analyze house prices by location (city / suburb):
SELECT 
    location,
    COUNT(*) AS total_houses,
    AVG(price) AS avg_price
FROM house_prices
GROUP BY location
ORDER BY avg_price DESC;


-- Objective 5: Identify how house size impacts price:
SELECT 
    sqft_living,
    price
FROM house_prices
ORDER BY sqft_living DESC
LIMIT 10;

SELECT 
    AVG(price / sqft_living) AS avg_price_per_sqft
FROM house_prices
WHERE sqft_living > 0;


-- Objective 6: Analyze prices by number of bathrooms:
SELECT 
    bathrooms,
    AVG(price) AS avg_price
FROM house_prices
GROUP BY bathrooms
ORDER BY bathrooms;


-- Objective 7: Find the most expensive houses:
SELECT 
    *
FROM house_prices
ORDER BY price DESC
LIMIT 5;


-- Objective 8: Filter houses based on business criteria:
SELECT 
    *
FROM house_prices
WHERE bedrooms >= 3
  AND bathrooms >= 2
  AND price < 500000;


-- Objective 9: Year-wise price trend:
SELECT 
    YEAR(sale_date) AS sale_year,
    AVG(price) AS avg_price
FROM house_prices
GROUP BY sale_year
ORDER BY sale_year;


-- Objective 10: Data quality check (missing or zero values):
SELECT 
    COUNT(*) AS missing_price_count
FROM house_prices
WHERE price IS NULL OR price = 0;


-- Objective 11: Analyze average price per square foot by location:
SELECT 
    location,
    ROUND(AVG(price / sqft_living), 2) AS avg_price_per_sqft
FROM house_prices
WHERE sqft_living > 0
GROUP BY location
ORDER BY avg_price_per_sqft DESC;


-- Objective 12: Identify locations with above-average house prices:
SELECT 
    location,
    AVG(price) AS avg_location_price
FROM house_prices
GROUP BY location
HAVING AVG(price) > (
    SELECT AVG(price)
    FROM house_prices
);


-- Objective 13: Compare prices of renovated vs non-renovated houses:
SELECT 
    CASE 
        WHEN year_renovated IS NULL OR year_renovated = 0 THEN 'Not Renovated'
        ELSE 'Renovated'
    END AS renovation_status,
    COUNT(*) AS total_houses,
    AVG(price) AS avg_price
FROM house_prices
GROUP BY renovation_status;


-- Objective 14: Find the top 3 most expensive houses per location:
SELECT *
FROM house_prices h1
WHERE (
    SELECT COUNT(*)
    FROM house_prices h2
    WHERE h2.location = h1.location
      AND h2.price > h1.price
) < 3
ORDER BY location, price DESC;


-- Objective 15: Categorize houses into price segments:
SELECT 
    CASE 
        WHEN price < 300000 THEN 'Low Price'
        WHEN price BETWEEN 300000 AND 600000 THEN 'Mid Price'
        ELSE 'High Price'
    END AS price_category,
    COUNT(*) AS total_houses,
    AVG(bedrooms) AS avg_bedrooms,
    AVG(bathrooms) AS avg_bathrooms
FROM house_prices
GROUP BY price_category;



-- END
