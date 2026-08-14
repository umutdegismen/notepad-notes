--------------------------------
-- Filtering data
-- WHERE clause
--------------------------------

-- Let's use the employees table from the sample database for the demonstration.
-- Using MySQL WHERE clause with equal operator example
SELECT lastName, firstName, jobTitle
FROM employees
WHERE jobTitle = 'Sales Rep';

-- Using MySQL WHERE clause with comparison operators
SELECT lastName, firstName, officeCode
FROM employees
WHERE officeCode > 5;

SELECT lastName, firstName, officeCode
FROM employees
WHERE officeCode <= 3;

SELECT lastName, firstName, jobTitle
FROM employees
WHERE jobTitle != 'Sales Rep'; -- is different from 'Sales Rep'

SELECT lastName, firstName, jobTitle
FROM employees
WHERE jobTitle <> 'Sales Rep'; -- is different from 'Sales Rep'

SELECT lastName, firstName, jobTitle
FROM employees
WHERE NOT jobTitle = 'Sales Rep'; -- is different from 'Sales Rep'

SELECT employeeNumber, lastName, firstName, reportsTo
FROM employees
WHERE reportsTo IS NULL;