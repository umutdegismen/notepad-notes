
--1- Customers tablosundan ulkesi Mexico olan TUM kisileri ekrana getir
--2- Customers tablosundan ulkesi USA olan kisilerin CONTACTNAME ve CITY' lerini ekrana getir
--3- Orders tablosundan kargo ucreti (Freight) 25den yuksek, 145'den dusuk tum orderlari, buyukten kucuge dogru siralayarak ekrana getir
--4- Orders tablosundan kargo ucreti (Freight) 250 ile 400 arasinda olan tum orderlari, kucukten buyuge dogru siralayarak ekrana getir
--5- Customers tablosundan, tum musterileri getir. ContactName ve ContactTitle'larina gore kucukten buyuge gore sirala ??
--6- Ulkesi USA olan ve ContactName'i Y ile baslayan tum customerlari getir
--7- Ulkesi USA olan ve ContactName'i S ile baslayan VE zip code'u 94117 olan tum customerlari getir
--8- productName'i 'G' ile ya da 'L' ile baslayan ve UnitsInStock'u 50 ile 113 arasindaki musterileri getir
--9- Region kayitli olmayan (NULL olan) misafirlerin CompanyName, ContactName, City VE Telefon numarasini ekrana getir
--10-Region kayitli olmayan (NULL olan), CompanyName'i 'B' ile baslayan misafirleri getir

-- BONUS	--> INSERT A ROW IN CUSTOMERS 
-- BONUS 2	--> UPDATE THAT ROW 


--1. Delete all records from the Orders table where the ShipCountry is USA and the Freight is less than 50.

--2. Retrieve the first 10 records from the Customers table where the Country is Germany. Order the results by CompanyName.
--3. Write a query to find the minimum Freight for orders shipped to Brazil.
--4. Calculate the average Freight for orders shipped to Germany.
--5. Write a query to find the average Freight for orders placed by the customer with CustomerID FOLKO.
--6. Write a query to calculate the total Freight for orders shipped to the SP region in the ShipRegion column.
--7. Calculate the total Freight for all orders placed in July 1996.
--8. Write a query to count the number of orders
--9. Write a query to count the number of customers in each country