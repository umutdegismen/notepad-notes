--------------------------------
-- Querying data
-- SELECT statement
--------------------------------

-- Let's use the employees table in the classicmodels database to demonstrate how to use the SELECT statement
SELECT * FROM classicmodels.employees;

use classicmodels;

-- Using the MySQL SELECT statement to retrieve data from a single column example
Select lastName from employees;

-- Using the MySQL SELECT statement to query data from multiple columns example
SELECT lastName, firstName, jobTitle FROM employees;

-- Using the MySQL SELECT statement to retrieve data from all columns example
SELECT * FROM employees;

-- The SELECT * is often called "select star" or "select all" since you select all data from a table.

################################
-- Notes about SELECT *
-- The SELECT * returns data from the columns that you may not use.
-- It produces unnecessary I/O disk and network traffic between the MySQL database server and application.
-- Using the SELECT * may expose sensitive information to unauthorized users.
################################



