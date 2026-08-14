#############################################
-- UNION
#############################################

-- RULES:
-- Column number and ColumnTypes must be same! 

-- UNION ALL ->>> Combines 2 different tables and brings everything on screen / ALLOWS DUPLICATES
SELECT contactFirstName, contactLastName FROM customers
UNION ALL
SELECT firstName, lastName FROM employees;


-- UNION ->>> Combines 2 different tables and filters duplicates / DOES NOT ALLOW DUPLICATES !!!
SELECT contactFirstName, contactLastName FROM customers
UNION
SELECT firstName, lastName FROM employees;

-- HOW CAN I KNOW WHERE THE DATA IS COMING FROM ?
SELECT contactFirstName, contactLastName , 'customer' as contactType FROM customers
UNION ALL 
SELECT firstName, lastName, 'employee' as contactType FROM employees;


SELECT customerName, 'abc', '123' FROM customers;













