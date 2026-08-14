--------------------------------
-- Step by Step Scenario
--------------------------------

SELECT * FROM orderdetails WHERE orderNumber < 10103;

-- Let's get orderNumber, quantity and price for each item
SELECT orderNumber, quantityOrdered, priceEach
FROM orderdetails
WHERE orderNumber < 10103;

-- Let's calculate the subTotal for each item 
SELECT orderNumber, quantityOrdered * priceEach AS subTotal
FROM orderdetails
WHERE orderNumber < 10103;

-- Let's get the total for each orderNumber
SELECT orderNumber, SUM(quantityOrdered * priceEach) AS total
FROM orderdetails
WHERE orderNumber < 10103
GROUP BY orderNumber;

-- Let's filter the orders that have a total of more that 10,000
SELECT orderNumber, SUM(quantityOrdered * priceEach) AS total
FROM orderdetails
WHERE orderNumber < 10103
GROUP BY orderNumber
HAVING total > 10000;