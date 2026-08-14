-- TASK 1 --
USE classicmodels;

-- 1. How to display information about customers who do not have postal code?
SELECT * FROM customers WHERE postalCode IS NULL;

-- 2. How to find employees first name, last name whose job title is “Sales Rep” and display first names in alphabetical order.
SELECT firstName,lastName,jobTitle FROM employees WHERE jobTitle='Sales Rep' ORDER BY firstName ASC;

-- 3. How to display about all offices that have address line 2. We want to see offices sorted by city from Z-A?
SELECT * FROM offices WHERE addressLine2 IS NOT NULL ORDER BY city DESC;

-- TASK 2 --

-- 1. Display products that have a buy price greater than or equal to 50.0 that are classic cars
SELECT * FROM products WHERE buyPrice>=50 AND productLine='Classic Cars';

-- 2. List product names and product lines that are planes or ships and display by product name in asc
SELECT productName, productlines FROM products WHERE productLine IN ('planes','ships') ORDER BY productName ASC;

-- 3. Display all information of customers that live in CA,NY,CT. We want to see customers sorted by city from Z-A
SELECT * FROM customers WHERE state IN('CA','NY','CT') ORDER BY city DESC;
