################################
-- SUBQUERY
################################

SELECT * FROM employees
WHERE officeCode IN (
	SELECT officeCode FROM offices WHERE country = 'USA'
);