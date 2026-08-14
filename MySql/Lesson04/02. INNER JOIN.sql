################################
-- INNER JOIN
################################
Select * from employees;
Select * from offices;

-- Get everything from both employee and office tables by creating an Inner Join
Select * from
employees INNER JOIN offices ON employees.officeCode = offices.officeCode;

-- Specify the columns that you need from each table
Select employees.firstName, employees.lastName, offices.city, offices.country from
employees INNER JOIN offices ON employees.officeCode = offices.officeCode;

Select e.firstName,e.lastName,o.city, o.country
from employees as e inner join offices as o on e.officeCode = o.officeCode;

###############################
select * from products;
select * from productlines;

select p.productName, p.productCode,pl.textDescription
from products as p INNER JOIN productlines as pl ON p.productLine = pl.productLine;