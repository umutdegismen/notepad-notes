--------------------------------
-- Grouping data
-- GROUP BY clause
--------------------------------

SELECT status FROM orders ORDER BY status;

SELECT DISTINCT status FROM orders ORDER BY status;

-- The GROUP BY clause returns unique occurrences of status values
SELECT status
FROM orders
GROUP BY status;

-- Counting all the orders, GROUP BY is not used
SELECT COUNT(*) FROM orders;

-- Counting all the orders, GROUP BY is used
SELECT COUNT(*) FROM orders GROUP BY status;

-- Using MySQL GROUP BY with aggregate functions
SELECT COUNT(*), status 
FROM orders 
GROUP BY status;

-- Using MySQL GROUP BY with HAVING clause example
SELECT COUNT(*), status 
FROM orders 
GROUP BY status
HAVING COUNT(*) = 6;

-- WHERE statement will filter before GROUP BY
-- HAVING statement will filter after GROUP BY
SELECT COUNT(*), status 
FROM orders
WHERE customerNumber > 300
GROUP BY status
HAVING COUNT(*) > 10;