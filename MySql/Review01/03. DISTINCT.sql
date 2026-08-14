--------------------------------
-- MySQL DISTINCT examples
--------------------------------

SELECT lastName
FROM employees
ORDER BY lastName;
-- As clearly shown in the output, some employees have the same last name e.g, Bondur,Firrelli

-- This statement uses the DISTINCT clause to select unique last names from the employees table
SELECT DISTINCT lastName
FROM employees
ORDER BY lastName;

-- MySQL DISTINCT with multiple columns
SELECT DISTINCT lastName, firstName
FROM employees
ORDER BY lastName;
