
-- TASK 1 --

-- I. Display employees last name in uppercase, and first name in lowercase.
SELECT UPPER(lastName), LOWER(firstName) FROM employees;

-- II. Display the product lines in uppercase from "productlines" table.
SELECT UPPER(productLine) FROM productlines;


-- TASK 2 --

-- I. Verify how many customers don't have any state assigned.
SELECT COUNT(*) FROM customers WHERE state IS NULL;

-- II. Verify how many employees are "Sales Rep".
SELECT COUNT(*) FROM employees WHERE jobTitle='Sales Rep';
-- 2ND WAY
SELECT jobTitle, COUNT(*) FROM employees GROUP BY jobTitle;

-- III. Display the latest and earliest order date from orders.
SELECT MAX(orderDate), MIN(orderDate) FROM orders;

-- IV. How many customers last name starts with S?
-- ***** AS ... SEKLINDE ISTEDIGIMIZ COLUMN ADINI VEREBILIRIZ ****
SELECT COUNT(*) AS CustomersWithLasnameS FROM customers WHERE contactLastName LIKE 's%';

-- V. What is the total amount of "quantityInStock" of planes in the products table?
SELECT productLine, SUM(quantityInStock) AS Total FROM products WHERE productLine='Planes';

-- 2nd Way With GROUP BY
SELECT productLine, SUM(quantityInStock) AS Total FROM products GROUP BY productLine;













