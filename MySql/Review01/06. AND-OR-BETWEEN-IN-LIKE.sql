--------------------------------
-- Filtering data
-- Multiple filters
--------------------------------

-- Using MySQL WHERE clause with AND operator
SELECT lastName, firstName, jobTitle, officeCode
FROM employees
WHERE jobTitle = 'Sales Rep' AND officeCode = 1;

-- Using MySQL WHERE clause with OR operator
SELECT lastName, firstName, jobTitle, officeCode
FROM employees
WHERE jobTitle = 'Sales Rep' OR officeCode = 1;

SELECT lastName, firstName, jobTitle, officeCode
FROM employees
WHERE officeCode >= 1 AND officeCode <= 3;

-- Using MySQL WHERE with BETWEEN operator example
SELECT lastName, firstName, jobTitle, officeCode
FROM employees
WHERE officeCode BETWEEN 1 AND 3
ORDER BY officeCode;

SELECT lastName, firstName, jobTitle, officeCode
FROM employees
WHERE officeCode = 1 OR  officeCode = 3 OR officeCode = 5 OR  officeCode = 7;

-- Using MySQL WHERE clause with the IN operator example
SELECT lastName, firstName, jobTitle, officeCode
FROM employees
WHERE officeCode IN (1, 3, 5, 7)
ORDER BY officeCode;

-- Using MySQL WHERE with the LIKE operator example
SELECT lastName, firstName
FROM employees
WHERE lastName LIKE '%son'
ORDER BY firstName;

-- Using MySQL LIKE with underscore(_) wildcard examples
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE '___ry';

-- Bring employees that have ONLY 4 letters in their name
SELECT * FROM employees WHERE firstName LIKE '____'; -- 4 underscores

SELECT * FROM employees WHERE LENGTH(firstName) = 4;