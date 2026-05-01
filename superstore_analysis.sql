-- ============================================================
-- Retail Sales Analysis — Sample Superstore
-- Tool: SQLite
-- Author: Ahmed Mahmoud Lotfy
-- ============================================================


-- ------------------------------------------------------------
-- 1. Most Profitable Category and Sub-Category
-- ------------------------------------------------------------
SELECT 
    category, 
    sub_category, 
    SUM(profit)  AS total_profit,
    SUM(sales)   AS total_sales
FROM samplesuperstore
GROUP BY category, sub_category
ORDER BY SUM(profit) DESC, category, sub_category;


-- ------------------------------------------------------------
-- 2. Discount Effect on Profit
-- Buckets orders by discount level and measures avg profit
-- Finding: Discounts above 40% produce negative avg profit
-- ------------------------------------------------------------
WITH buckets AS (
    SELECT 
        sales,
        profit,
        CASE 
            WHEN discount = 0    THEN 'No Discount'
            WHEN discount < 0.10 THEN 'Minimal'
            WHEN discount < 0.20 THEN 'Low'
            WHEN discount < 0.40 THEN 'Medium'
            ELSE                      'High'
        END AS discount_bucket
    FROM samplesuperstore
)
SELECT 
    discount_bucket  AS discount,
    ROUND(AVG(profit), 2)  AS avg_profit,
    ROUND(SUM(sales), 2)   AS total_sales
FROM buckets
GROUP BY discount_bucket
ORDER BY avg_profit DESC;


-- ------------------------------------------------------------
-- 3. Sales and Profit by State and Region
-- ------------------------------------------------------------
SELECT 
    state, 
    region, 
    ROUND(SUM(sales), 2)  AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM samplesuperstore
GROUP BY state, region
ORDER BY SUM(sales) DESC, SUM(profit) DESC;


-- ------------------------------------------------------------
-- 4. Top 10 Products by Revenue
-- ------------------------------------------------------------
SELECT 
    product_name              AS product,
    ROUND(SUM(sales), 2)      AS total_revenue
FROM samplesuperstore
GROUP BY product_name
ORDER BY SUM(sales) DESC
LIMIT 10;


-- ------------------------------------------------------------
-- 5. Shipping Mode — Usage, Revenue, and Profit
-- ------------------------------------------------------------
SELECT 
    ship_mode,
    COUNT(ship_mode)          AS total_orders,
    ROUND(SUM(sales), 2)      AS total_revenue,
    ROUND(SUM(profit), 2)     AS total_profit
FROM samplesuperstore
GROUP BY ship_mode
ORDER BY COUNT(ship_mode) DESC;


-- ------------------------------------------------------------
-- 6. Most Profitable Customer Segment
-- ------------------------------------------------------------
SELECT 
    segment,
    ROUND(SUM(sales), 2)      AS total_revenue,
    ROUND(SUM(profit), 2)     AS total_profit
FROM samplesuperstore
GROUP BY segment
ORDER BY SUM(sales) DESC;


-- ------------------------------------------------------------
-- 7. Top 10 Customers by Lifetime Value (LTV)
-- ------------------------------------------------------------
SELECT 
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id)                        AS total_orders,
    ROUND(SUM(sales), 2)                            AS total_revenue,
    ROUND(SUM(profit), 2)                           AS total_profit,
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM samplesuperstore
GROUP BY customer_id, customer_name
ORDER BY total_profit DESC
LIMIT 10;
