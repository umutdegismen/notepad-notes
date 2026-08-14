--------------------------------
-- Functions
--------------------------------

-- Functions, single row Functions
SELECT firstName, lastName, LOWER(firstName), upper(lastName) FROM employees;

-- Functions, multiple row Functions
SELECT max(officeCode) FROM employees;
SELECT MIN(officeCode) FROM employees;