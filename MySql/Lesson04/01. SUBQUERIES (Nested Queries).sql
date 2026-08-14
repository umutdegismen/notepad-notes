################################
-- SUBQUERIES (Nested Queries)
################################

-- Find the customer who has the maximum payment.

-- We can find the customerNumber of the customer who made the biggest purchase
Select max(amount) from payments;

Select customerNumber from payments Where amount = (
	Select max(amount) from payments
);


-- We can find the customer using the customerNumber we found
Select * from customers where customerNumber = 103;


-- outer query
Select * from customers where customerNumber = (
	-- inner query
	Select customerNumber from payments Where amount = (
		-- inner query
		Select max(amount) from payments
	)
);


-- Find employees who work in the offices located in the USA.
Select * from employees Where officeCode IN (1,2,3);

-- Find offices that are located in USA
Select * from offices Where country = 'USA';

-- Find the office codes of the offices that are located in USA
Select officeCode from offices Where country = 'USA';

-- Find employees who work in the offices located in the USA.
-- outer query
Select * from employees Where officeCode IN (
	Select officeCode from offices Where country = 'USA'
);


-- List all products whose buy prices are greater than the average buy price of all products

-- Lets find the avg buy price
Select avg(buyPrice) from products;

-- Now use this info to get what we need:
Select * from products where buyPrice > 54.395182;

-- Lets use sub-query to make it dynamic
Select * from products where buyPrice > (
	Select avg(buyPrice) from products
);

-- Find the maximum, minimum and average number of items in sale orders.

-- Lets find the number of each order using group by
Select orderNumber,count(*) from orderdetails group by orderNumber;

-- Now use the results of the temporary table to find the min, max and avg values
Select max(itemCount), min(itemCount), avg(itemCount) 
	From (Select orderNumber,count(*) as itemCount from orderdetails group by orderNumber) AS items;


-- Find the customer's name who made the max payment
select customerName from customers where customerNumber =
(
	select customerNumber from payments where amount =
	(
		Select max(amount) from payments
	)
);

-- Find the orders of the customer who made the max payment
Select * from orders where customerNumber =
(
	select customerNumber from payments where amount =
	(
		Select max(amount) from payments
	)
);




