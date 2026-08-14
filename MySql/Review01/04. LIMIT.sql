--------------------------------
-- Using MySQL LIMIT
--------------------------------

SELECT customerNumber, customerName, creditLimit 
FROM customers
LIMIT 5;

-- This statement uses the LIMIT clause to get the top ten customers who have the highest credit
SELECT customerNumber, customerName, creditLimit 
FROM customers
ORDER BY creditLimit DESC
LIMIT 10;