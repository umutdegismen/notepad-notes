-- Homework: 
--     i. Verify how many Motorcycles we have in the products table
SELECT productLine AS Product, COUNT(productLine) AS TOTAL FROM products WHERE productLine='Motorcycles';

--     ii. Find the largest, smallest and average amount of payments
SELECT MAX(amount), MIN(amount), AVG(amount) FROM payments;

--     iii. Find the total amount of payments for every 'customerNumber' in payments table
SELECT customerNumber, SUM(amount) AS TOTAL FROM payments GROUP BY customerNumber;

--     iV. Find the total amount of payments for every 'customerNumber' that has payed less than 50000 in total.
SELECT customerNumber, SUM(amount) AS TOTAL FROM payments GROUP BY customerNumber HAVING TOTAL < 50000;
