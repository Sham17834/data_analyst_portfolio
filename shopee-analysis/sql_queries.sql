-- 1.  Top 10 Best-Selling Products
SELECT 
    title, 
    SUM(CAST(total_sold AS UNSIGNED)) AS total_units_sold
FROM shopee_sales
GROUP BY title
ORDER BY total_units_sold DESC
LIMIT 10;

-- 2. Sales by Region (Top 10 Regions)
SELECT 
    delivery AS region, 
    SUM(CAST(total_sold AS UNSIGNED)) AS total_units_sold
FROM shopee_sales
GROUP BY region
ORDER BY total_units_sold DESC
LIMIT 10;

-- 3. Average Rating by Product Category
SELECT 
    item_category_detail AS category,
    ROUND(AVG(CAST(item_rating AS DECIMAL(3,2))), 2) AS avg_rating,
    COUNT(*) AS num_products
FROM shopee_sales
WHERE item_rating <> ''
GROUP BY category
ORDER BY avg_rating DESC
LIMIT 10;


-- 4. Monthly Sales Trend
SELECT 
    DATE_FORMAT(FROM_UNIXTIME(timestamp / 1000), '%Y-%m') AS month,
    SUM(CAST(total_sold AS UNSIGNED)) AS total_units_sold
FROM shopee_sales
GROUP BY month
ORDER BY month;

-- 5. Price Range Sales
SELECT 
    CASE 
        WHEN CAST(price_actual AS DECIMAL(10,2)) BETWEEN 0 AND 50 THEN '0-50'
        WHEN CAST(price_actual AS DECIMAL(10,2)) BETWEEN 51 AND 100 THEN '51-100'
        WHEN CAST(price_actual AS DECIMAL(10,2)) BETWEEN 101 AND 500 THEN '101-500'
        WHEN CAST(price_actual AS DECIMAL(10,2)) BETWEEN 501 AND 1000 THEN '501-1000'
        ELSE '1000+'
    END AS price_range,
    SUM(CAST(total_sold AS UNSIGNED)) AS total_units_sold
FROM shopee_sales
GROUP BY price_range
ORDER BY total_units_sold DESC;

-- 6. Top 10 Sellers by Total Sales
SELECT 
    seller_name, 
    SUM(CAST(total_sold AS UNSIGNED)) AS total_units_sold,
    COUNT(DISTINCT title) AS unique_products
FROM shopee_sales
GROUP BY seller_name
ORDER BY total_units_sold DESC
LIMIT 10;

