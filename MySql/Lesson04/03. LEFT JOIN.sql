################################
-- LEFT JOIN
################################
Select * from customers;
Select * from orders;

-- Get everything from customers table even if there is no matching order
Select * 
from customers c LEFT JOIN orders o ON c.customerNumber = o.customerNumber;

Select * 
from customers c RIGHT JOIN orders o ON c.customerNumber = o.customerNumber;