--------------------------------
-- Sorting data
-- ORDER BY clause
--------------------------------

-- Using MySQL ORDER BY clause to sort values in one column example
SELECT contactLastName, contactFirstName
FROM customers
ORDER BY contactLastName; -- ASC is default

-- If you want to sort customers by the last name in the descending order, you use the DESC
SELECT contactLastName, contactFirstName
FROM customers
ORDER BY contactLastName DESC;

-- Using MySQL ORDER BY clause to sort values in multiple columns example
SELECT contactLastName, contactFirstName
FROM customers
ORDER BY contactLastName DESC, contactFirstName ASC;

-- Using MySQL ORDER BY to sort a result set by an expression example
-- SELECT * FROM orderdetails;
SELECT orderNumber, orderLineNumber, quantityOrdered * priceEach 
FROM orderdetails
ORDER BY quantityOrdered * priceEach DESC;

-- To make the query more readable, you can assign the expression in the SELECT clause a column alias and use that column alias in the ORDER BY clause
SELECT orderNumber, orderLineNumber, quantityOrdered * priceEach AS subTotal
FROM orderdetails
ORDER BY subTotal DESC;