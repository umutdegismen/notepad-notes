------------------------------------
-- Single Row Functions
------------------------------------
SELECT * FROM products;
SELECT productLine, LOWER(productLine), UPPER(productLine) FROM products;
SELECT * FROM customers;
SELECT *, UPPER(contactLastName), LOWER(contactFirstName) FROM customers;
SELECT * FROM employees;
-- if the db is case-sensitive this would only show the records have have lastName exactly bow
SELECT * FROM employees WHERE lastName = 'bow';
-- we can use lower an upper to filter records, particularly in case-sensitive db
SELECT * FROM employees WHERE LOWER(lastName) = 'bow';
-- upper() returns a new value  ('KING') and we compare that to our search keyword
SELECT * FROM employees WHERE UPPER(lastName) = 'KING';
---------------------------------
-- TASK 1 
--------------------------------
-- I. Display employees last name in uppercase, and first name in lowercase.
SELECT UPPER(lastName), LOWER(firstName) FROM employees;
-- II. Display the product lines in uppercase from "productlines" table.
SELECT UPPER(productLine) FROM productlines;
 
-------------------------------------
-- Multiple Row (Aggregate) Functions
--------------------------------------
SELECT * FROM products;
-- Get the maximum buyPrice
SELECT MAX(buyPrice) FROM products;
-- Get the minimum buyPrice
SELECT MIN(buyPrice) FROM products;
-- Get the average buyPrice
SELECT AVG(buyPrice) FROM products;
-- Get the sum of the buyPrice
SELECT SUM(buyPrice) FROM products;
-- Get the number of rows in buyPrice
SELECT COUNT(buyPrice) FROM products; -- COUNT(*)
-- We can put as many functions as we want in a query
SELECT MAX(buyPrice), MIN(buyPrice), SUM(buyPrice), AVG(buyPrice), COUNT(buyPrice) FROM products;
-- We an filter before calcuation
SELECT MAX(buyPrice) FROM products;
SELECT MAX(buyPrice) FROM products WHERE productLine ='Motorcycles';
-- We can use functions in DATE, VARCHAR etc
SELECT * FROM orders;
SELECT MAX(shippedDate) FROM orders;
SELECT MIN(shippedDate) FROM orders;
-- Be careful when combining results from aggregate functions with other fields
SELECT productLine, MAX(buyPrice) FROM products;
-- the query above is a combination of two results: 
SELECT * FROM products;
SELECT MAX(buyPrice) FROM products; -- limites the result set to one row
-- we can see this issue clearly with this query
SELECT *, MAX(buyPrice) FROM products;
-- This does not give us the MAX buyPRice with its respective information
-- It actually gives the MAX buyPrice on the table combined with the first row of the result set from the SELECT * statement
----------------------------------------
-- GROUP BY 
----------------------------------------
-- Using COUNT(*) ---> Aggregate 110 records into 1 record
SELECT COUNT(*) FROM products;
-- If we use GROUP BY, it will show the count of the records for each category
-- In this case, I still have 110 records in total but I am not return just that. I am counting how many records are there for each category of productLine (7 categories)
SELECT productLine, COUNT(*) FROM products GROUP BY productLine;
----------------------------------------------------------------------------------
-- GROUP BY: it applies an aggregate function to a specific category
-- Getting the MAX without grouping by, it would mean the max value of a column for all records on the table. 
--      If I use GROUP BY, it would mean the max for each category of the column that I want to group by.alter
----------------------------------------------------------------------------------
-- We can filter using WHERE and then use the aggregate function on that set
SELECT productLine, COUNT(*) FROM products WHERE productLine = 'Motorcycles';
SELECT productLine, MAX(buyPrice), MIN(buyPrice) FROM products WHERE productLine = 'Planes';
-- Or we can use GROUP BY
SELECT productLine, MAX(buyPrice), MIN(buyPrice), AVG(buyPrice) FROM products GROUP BY productLine ORDER BY productLine DESC;
-- If I were to put a condition WHERE buyPrice > 30, where should I put this and what would change???
-- WHERE would go before the GROUP BY and what it does is: Instead of considering all records of the table, it will only consider the ones satisfying the condition!!!
SELECT productLine, MAX(buyPrice), MIN(buyPrice), AVG(buyPrice) FROM products WHERE buyPrice > 30 GROUP BY productLine ORDER BY productLine DESC;
-- Step by Step Description: 
-- SELECT productLine, MAX(buyPrice), MIN(buyPrice), AVG(buyPrice)	 -- I want to see these columns
-- FROM products                                                     -- there are on the product table 
-- WHERE buyPrice > 30                                          	 -- consider only rows with buyPrice > 30
-- GROUP BY productLine                                              -- group the results for each different category in the productLine
-- ORDER BY productLine DESC;                                        -- order this result descending alphabetically
-----------------------------------------------------------------------------------------
-- The order of the keywords: 
 -- SELECT  ---  FROM --- WHERE --- GROUP BY -- ORDER BY
 -----------------------------------------------------------------------------------------
-- How many employees report to each person???
SELECT * FROM employees;
SELECT reportsTo, firstName, lastName, jobTitle, COUNT(*) FROM employees GROUP BY reportsTo;
-- How many employees do we have for each job title?
SELECT jobTitle, COUNT(*) FROM employees GROUP BY jobTitle;
------------------------------------------
-- TASK 2
------------------------------------------
-- I. Verify how many customers don't have any state assigned.
SELECT COUNT(*) FROM customers WHERE state IS NULL;
-- II. Verify how many employees are "Sales Rep".
SELECT COUNT(*) FROM employees WHERE jobTitle='Sales Rep';
-- 2nd way:
SELECT jobTitle, COUNT(*) FROM employees GROUP BY jobTitle;
-- III. Display the latest and earliest order date from orders.
SELECT MAX(orderDate) AS Latest, MIN(orderDate) AS Earliest FROM orders;
-- IV. How many customers last name starts with S?
SELECT COUNT(*) AS CustomersWithLastNameS FROM customers WHERE contactLastName LIKE 'S%';
-- V. What is the total amount of "quantityInStock" of planes in the products table?
SELECT productLine, SUM(quantityInStock) AS Total FROM products WHERE productLine = 'Planes';
-- with group by
SELECT productLine, SUM(quantityInStock) AS Total FROM products GROUP BY productLine;
-----------------------------------------------------
-- HAVING 
-----------------------------------------------------
-- Filters the rows with more than 5000 in stock
SELECT * FROM products WHERE quantityInStock > 5000;
-- Get the sum of only records that have more than 5000 QuantityInStock
SELECT SUM(quantityInStock) FROM products WHERE quantityInStock > 5000;
-- Let us use group by and get the sum for each productLine
SELECT productLine, SUM(quantityInStock) AS TotalQuantity FROM products GROUP BY productLine;
-- If we use WHERE before GROUP BY, we are filtering the table records
SELECT productLine, SUM(quantityInStock) AS TotalQuantity FROM products WHERE quantityInStock > 5000 GROUP BY productLine;
-- I am filtering the resulting records (groups)
SELECT productLine, SUM(quantityInStock) AS TotalQuantity FROM products GROUP BY productLine HAVING TotalQuantity > 50000;
-----------------------------------------------------------------------------------------
-- The order of the keywords: 
 -- SELECT (columns, agg functions, single row function)  FROM  a table  WHERE (filter records)  GROUP BY (create as many groups as there are categories in the column)
 -- HAVING  (filter GROUPS)      ORDER BY
 -----------------------------------------------------------------------------------------
--------------------------------
-- AS 
--------------------------------
-- 1. the column name of the result table will change to the Alias we use
-- 2. once we give an alias to an object/element then we can use it as its name
SELECT productLine, SUM(quantityInStock) AS TotalQuantity FROM products GROUP BY productLine HAVING TotalQuantity > 50000;
----------------------------
-- HRMS DB Queries
----------------------------
SELECT * FROM prod_orangehrm.hs_hr_employee;
-- Display the number of employees per job title code
SELECT emp.job_title_code, COUNT(emp.job_title_code) AS Total 
FROM prod_orangehrm.hs_hr_employee AS emp 
GROUP BY emp.job_title_code 
HAVING Total > 5 ORDER BY Total;
-- Display the count of employees according to gender
SELECT e.emp_gender, COUNT(e.emp_gender) AS Total FROM prod_orangehrm.hs_hr_employee AS e WHERE e.emp_gender IS NOT NULL GROUP BY e.emp_gender;