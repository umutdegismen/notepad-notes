-- Homework 1: 
-- Display customers without any orders (Hint: Join two tables and use where condition. The information in orders table should be null)

-- 1st way
SELECT c.customerNumber, c.customerName, o.orderNumber
FROM customers c 
LEFT JOIN orders o
ON c.customerNumber = o.customerNumber 
WHERE o.orderNumber IS NULL;

-- 2nd way
SELECT c.customerNumber, c.customerName, o.orderNumber
FROM  orders o
RIGHT JOIN customers c
ON c.customerNumber = o.customerNumber 
WHERE o.orderNumber IS NULL;

-- Write a query to return order number, order status and total sales 
-- from the orders and orderdetails tables and group by orderNumber

Select orderNumber, sum(od.quantityOrdered*od.priceEach) as total
from orderdetails group by orderNumber;

-- Step2: get the info about the order 
select orderNumber, status, orderDate from orders;

-- Step3: join the tables
select o.orderNumber, o.orderDate, o.status, sum(od.quantityOrdered*od.priceEach) as total
from orderdetails od inner join orders o on od.orderNumber = od.orderNumber
group by o.orderNumber;

