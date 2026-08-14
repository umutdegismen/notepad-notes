
#### TASK 1 ####

-- Select the unique states of customers from the customers table.
SELECT DISTINCT state FROM customers;


-- Use the LIMIT clause to find 5 customers who have the lowest credits, but not zero
SELECT contactLastName, contactFirstName, creditLimit 
FROM customers 
WHERE creditLimit!=0 
ORDER BY creditLimit 
LIMIT 5;


#### TASK 2 ####

-- Write a query that returns the customer name, country, state and credit limit of customers 
-- who locate in California, USA, and have the credit limit greater than 100K.
SELECT customerName, country, state, creditLimit FROM customers
WHERE state ='CA' AND country ='USA' AND creditLimit> 100000;

-- Get the customer name, country and creditLimit of customers who locate in the USA or France or Germany using OR
SELECT customerName, country, creditLimit FROM customers
WHERE country = 'USA' OR country = 'France' OR country = 'Germany';

-- Get the customer name, country and creditLimit of customers who locate in the USA or France or Germany using IN
SELECT customerName, country, creditLimit FROM customers
WHERE country IN ('USA','France','Germany');

-- Get the customer name, country and creditLimit of customers who DON'T locate in the USA or France or Germany
SELECT customerName, country, creditLimit FROM customers 
WHERE country NOT IN('USA','France','Germany');

-- Use the BETWEEN operator to find products whose buy prices is between 90 and 100
SELECT productName, buyPrice FROM products
WHERE buyPrice BETWEEN 90 AND 100 ORDER BY buyPrice;

-- Find all employees whose last names contain 'on'
SELECT * FROM employees WHERE lastName LIKE '%on%';

-- Find customers who do not have a sales representative
SELECT customerName, salesRepEmployeeNumber FROM customers WHERE salesRepEmployeeNumber IS NULL;


#### TASK 3 ####

-- Find Customers that have made a total of more that 100K payment.
SELECT customerNumber, SUM(amount) AS TOTAL FROM payments
GROUP BY(customerNumber) 
HAVING TOTAL > 100000
ORDER BY customerNumber;



