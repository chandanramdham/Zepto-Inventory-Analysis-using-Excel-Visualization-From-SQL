-- CREATE DATABASE ZEPTO;
-- USE ZEPTO; 
-- CREATE TABLE ZEPTO (
-- ID INT auto_increment primary key,
-- category VARCHAR(150),
-- name Varchar (150),
-- mrp  NUMERIC(8,2),
-- discountpercent NUMERIC(5,2),
-- availablilityquantity int,
-- discountedsellingprice Numeric(8,2),
-- weightInGms INT,
-- OUTOFSTOCK BOOLEAN,
-- Quantity int
-- )
-- select * from zepto;

-- DATA EXPLORATION
-- Count of rows
-- SELECT COUNT(*) FROM ZEPTO;

-- SAMPLE DATA
-- SELECT * FROM ZEPTO
-- LIMIT 10; 

-- SELECT * FROM ZEPTO
-- WHERE NAME IS NULL
-- OR 
-- ï»¿Category IS NULL
-- OR 
-- mrp IS NULL
-- OR 
-- discountPercent IS NULL
-- OR 
-- availableQuantity IS NULL
-- OR 
-- weightInGms IS NULL
-- OR 
-- outOfStock IS NULL
-- OR 
-- quantity IS NULL
-- ; 

-- DIFFERENT PRODUCT CATAGORIES
-- SELECT distinct ï»¿Category
-- FROM ZEPTO
-- ORDER BY ï»¿Category;

-- Product in stock and outof stock
-- SELECT  outOfStock, count(*)
-- FROM ZEPTO 
-- GROUP BY outOfstock;

-- product name present multiple times
-- SELECT name, COUNT(*) as " NUMBER OF id"
-- FROM ZEPTO
-- GROUP BY name
-- HAVING COUNT(*) > 1
-- ORder BY COUNT(*) desc;

-- DATA CLEANING
-- product with price = 0;
-- SELECT * FROM ZEPTO
-- WHERE mrp = 0 or discountedSellingPrice =0;

-- DELETE FROM ZEPTO
-- WHERE MRP = 0; 

-- convert paise into ruppee
-- UPDATE ZEPTO
-- SET MRP = MRP/100.0,
-- discountedSellingPrice = discountedSellingPrice/100.00;

-- Q1 find the top 10 best valued product based on the discount percentage?
-- SELECT name,mrp,discountPercent from zepto 
-- order by discountPercent desc
-- limit 10 ; 

-- Q2 What are the products with high Mrps but out of stock?
-- SELECT name, mrp , outOfstock
-- FROM zepto 
-- WHERE outOfStock = TRUE and mrp > 300 
-- ORDER BY mrp;

-- Calculated estimeted revenue for each category?
-- SELECT ï»¿Category , SUM( discountedSellingPrice * availableQuantity ) AS total_Quantity
-- FROM ZEPTO
-- GROUP BY ï»¿Category
-- ORDER BY total_Quantity;

-- Q4 find all the products WHERE is greater than $500 and discount is LESSER than 10%? 
-- SELECT name,mrp,discountPercent 
-- from zepto
-- WHERE mrp > 500 and discountPercent < 10 
-- ORDER BY MRP DESC;

-- Q5 Identify the top 5 categories offering the highest average discoumt percentage?
-- SELECT ï»¿Category,ROUND(AVG(discountPercent),2) as AVG_DISCOUNT
-- FROM ZEPTO GROUP BY ï»¿Category
-- ORDER BY AVG_DISCOUNT desc
-- limit 5 ;

-- Q6. Find the price per gram for products above 100g and sort by best value.
-- SELECT DISTINCT name, weightInGms, discountedSellingPrice,
-- ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
-- FROM zepto
-- WHERE weightInGms >= 100
-- ORDER BY price_per_gram;

-- Q7.Group the products into categories like Low, Medium, Bulk.
-- SELECT DISTINCT name, weightInGms,
-- CASE WHEN weightInGms < 1000 THEN 'Low'
-- 	WHEN weightInGms < 5000 THEN 'Medium'
-- 	ELSE 'Bulk'
-- 	END AS weight_category
-- FROM zepto;

-- Q8.What is the Total Inventory Weight Per Category 
-- SELECT ï»¿Category,
-- SUM(weightInGms * availableQuantity) AS total_weight
-- FROM zepto
-- GROUP BY ï»¿Category
-- ORDER BY total_weight;