create database meesho_db;

use meesho_db;

CREATE TABLE meesho_sales_products (
    Product_ID VARCHAR(10) PRIMARY KEY,
    Product_Name VARCHAR(50),
    Category VARCHAR(15),
    Sub_Category VARCHAR(10),
    Price INT,
    Discount_Price INT,
    Ratings DECIMAL(10 , 2 ),
    Reviews INT,
    Seller_Name VARCHAR(10),
    Delivery_Time VARCHAR(10),
    Availability VARCHAR(10)
)



-- 1. View all products
SELECT 
    *
FROM
    meesho_sales_products;

-- 2. Total number of products
SELECT 
    COUNT(Product_ID) AS total_product
FROM
    meesho_sales_products;

-- 3. List unique product categories
SELECT DISTINCT
    Category
FROM
    meesho_sales_products;


-- 4. Count of products per category
SELECT 
    Category, COUNT(Product_ID) AS count_of_product
FROM
    meesho_sales_products
GROUP BY Category;

-- 5. Average price by category
SELECT 
    Category, AVG(Price) AS Average_price
FROM
    meesho_sales_products
GROUP BY Category
ORDER BY Average_price DESC;

-- 6. Top 5 most expensive products (Original Price)
SELECT 
    Product_Name, (Price - Discount_Price) AS Original_Price
FROM
    meesho_sales_products
ORDER BY Original_Price DESC
LIMIT 5;

-- 7. Products with rating above 4.0
SELECT 
    Product_Name, Ratings
FROM
    meesho_sales_products
WHERE
    Ratings > 4.0
ORDER BY Ratings DESC;

-- 8. Top 5 products with highest number of reviews
SELECT 
    Product_Name, Reviews
FROM
    meesho_sales_products
ORDER BY Reviews DESC
LIMIT 5;

-- 9. Products currently out of stock
SELECT 
    Product_Name
FROM
    meesho_sales_products
WHERE
    Availability = 'Out-of-Stock';

-- 10.Seller-wise product count
SELECT 
    Seller_Name, COUNT(Product_ID) AS product_count
FROM
    meesho_sales_products
GROUP BY Seller_Name;


