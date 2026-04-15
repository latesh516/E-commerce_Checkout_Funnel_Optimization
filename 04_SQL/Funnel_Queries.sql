CREATE DATABASE Ecommerce_Project;
GO

USE Ecommerce_Project;
GO

-- Create Table
CREATE TABLE cleaned_data (
    user_pseudo_id VARCHAR(50),
    event_name VARCHAR(50),
    event_timestamp DATETIME,
    device VARCHAR(20),
    country VARCHAR(50),
    transaction_id VARCHAR(50),
    purchase_revenue FLOAT
);

--------------------------
-- Load Data
BULK INSERT cleaned_data
FROM 'C:\1. E-commerce_Checkout_Funnel_Optimization\03_Data\cleaned_data.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

--------------------------
-- Validate
SELECT * FROM cleaned_data;
SELECT COUNT(*) FROM cleaned_data;
SELECT TOP 10 * FROM cleaned_data;

--------------------------
-- Funnel Table
SELECT
    user_pseudo_id,
    MAX(CASE WHEN event_name = 'view_item' THEN 1 ELSE 0 END) AS viewed,
    MAX(CASE WHEN event_name = 'add_to_cart' THEN 1 ELSE 0 END) AS added_to_cart,
    MAX(CASE WHEN event_name = 'begin_checkout' THEN 1 ELSE 0 END) AS checkout_started,
    MAX(CASE WHEN event_name = 'purchase' THEN 1 ELSE 0 END) AS purchased
INTO funnel_table
FROM cleaned_data
GROUP BY user_pseudo_id;

--------------------------
-- Funnel Counts
SELECT
    COUNT(DISTINCT user_pseudo_id) AS total_users,
    SUM(viewed) AS viewed_users,
    SUM(added_to_cart) AS cart_users,
    SUM(checkout_started) AS checkout_users,
    SUM(purchased) AS purchase_users
FROM funnel_table;

--------------------------
-- Conversion Rates(%)
SELECT
    ROUND(SUM(added_to_cart) * 100.0 / NULLIF(SUM(viewed), 0), 2) AS view_to_cart_rate,
    ROUND(SUM(checkout_started) * 100.0 / NULLIF(SUM(added_to_cart), 0), 2) AS cart_to_checkout_rate,
    ROUND(SUM(purchased) * 100.0 / NULLIF(SUM(checkout_started), 0), 2) AS checkout_to_purchase_rate
FROM funnel_table;

--------------------------
-- Drop-offs
SELECT
    100 - ROUND(SUM(added_to_cart) * 100.0 / NULLIF(SUM(viewed), 0), 2) AS drop_view_to_cart,
    100 - ROUND(SUM(checkout_started) * 100.0 / NULLIF(SUM(added_to_cart), 0), 2) AS drop_cart_to_checkout,
    100 - ROUND(SUM(purchased) * 100.0 / NULLIF(SUM(checkout_started), 0), 2) AS drop_checkout_to_purchase
FROM funnel_table;

--------------------------
-- Revenue
SELECT
    COUNT(DISTINCT user_pseudo_id) AS purchasing_users,
    SUM(purchase_revenue) AS total_revenue,
    ROUND(AVG(purchase_revenue), 2) AS avg_order_value
FROM cleaned_data
WHERE event_name = 'purchase';
--------------------------