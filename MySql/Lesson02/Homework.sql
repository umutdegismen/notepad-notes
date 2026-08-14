
-- Homework:

-- 1. Display all employees whose last name ends with ‘n’.
SELECT * FROM employees WHERE lastName LIKE '%n';

-- 2. Display all offices that are not located in USA.
SELECT * FROM offices WHERE country!='USA';
SELECT * FROM offices WHERE NOT country='USA';

-- 3. Verify all orders that was shipped from January 1st of 2004 until December 31st of 2004. Order by ship date.
SELECT * FROM orders WHERE shippedDate BETWEEN '2003-01-01' AND '2004-12-31' ORDER BY shippedDate;

/*
	4. Display all products that have Ford in their product names and have a buy price greater than 50. 
	Do not forget to sort products by buy price incrementing.
*/
SELECT * FROM products WHERE productName LIKE '%Ford%' AND buyPrice>50 ORDER BY buyPrice;

-- 5. Verify all the employees who report to 1102,1088 or 1143.
SELECT * FROM employees WHERE reportsTo IN (1102,1088,1143);

-- 6. How to display contact first name, last name, phone number of customers who don’t have state entered.
SELECT contactFirstName, contactLastName, phone FROM customers WHERE state IS NULL;













