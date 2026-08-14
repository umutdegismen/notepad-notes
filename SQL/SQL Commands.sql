

																										
	How to get Connection String ?												
		
			
	select
		'data source=' + @@servername +
		';initial catalog=' + db_name() +
		case type_desc
			when 'WINDOWS_LOGIN' 
				then ';trusted_connection=true'
			else
				';user id=' + suser_name() + ';password=<<YourPassword>>'
		end
		as ConnectionString
	from sys.server_principals
	where name = suser_name()
		

	CONNECTION STRING = data source=MSI\SQLEXPRESS;initial catalog=master;trusted_connection=true
															
/////////////////////////////////////////////////////////////////////////////////////////////////


	Some of The Most Important SQL Commands

		SELECT - extracts data from a database
		UPDATE - updates data in a database
		DELETE - deletes data from a database
		INSERT INTO - inserts new data into a database
		CREATE DATABASE - creates a new database
		ALTER DATABASE - modifies a database
		CREATE TABLE - creates a new table
		ALTER TABLE - modifies a table
		DROP TABLE - deletes a table
		CREATE INDEX - creates an index (search key)
		DROP INDEX - deletes an index
		

	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
				
				
	SELECT

		Select specific columns from a table: 

			SELECT CustomerName, City FROM Customers;
			
			SELECT column1, column2, ...
			FROM table_name;
	

		Select ALL columns
		
			SELECT * FROM Customers;
		
		
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
		
	
	SELECT DISTINCT
	
		Eleminates the duplicates and gets only one variable from the table like HashSet
	
			SELECT DISTINCT Country FROM Customers;


	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		

	
	COUNT DISTINCT
		
		SELECT COUNT(DISTINCT Country) FROM Customers;
		
		// Returns the count of items by filtering the duplicates
		
		// Bir tablodaki degerlerin her birinin toplam sayisini dondurur.
		
			*Note: The COUNT(DISTINCT column_name) is not supported in Microsoft Access databases.
	
	
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	
	COUNT
		
		SELECT COUNT (*) FROM Orders;
		
		// returns the count of the rows
		

	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	
	WHERE
	
		The WHERE clause is used to filter records. 
		
		It is used to extract only those records that fulfill a specified condition.
			
		// Customers tablosundan ulkesi Mexico olan TUM kisileri ekrana getir	
			SELECT * FROM Customers WHERE Country='Mexico';
		
		// Customers tablosundan ulkesi USA olan kisilerin ISIM ve SOYISIMLERINI ekrana getir
			SELECT first_name, last_name  FROM Customers WHERE Country='USA';
		
			SELECT column1, column2, ...
			FROM table_name
			WHERE condition;
			
		OPERATORS - WHERE

		=	    --> Equal	
		>	    --> Greater than	
		<	    --> Less than	
		>=	    --> Greater than or equal	
		<=	    --> Less than or equal	
		<>	    --> Not equal. Note: In some versions of SQL this operator may be written as !=	
		BETWEEN	--> Between a certain range	
		LIKE	--> Search for a pattern	
		IN	    --> To specify multiple possible values for a column 
					(Birden fazla filtreleme yaparken kullaniliyor)
						SELECT * FROM Customers WHERE Cities NOT IN ('Paris', 'London'); 
		
		
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	
	BETWEEN - AND
		
		// get the orders where the amount is between 250 and 400 (returns the values included)
		SELECT item FROM Orders WHERE amount BETWEEN 250 AND 400;
			
	LIKE
		// returns the values which starts with 'd'
		SELECT * FROM Customers WHERE last_name LIKE 'd%';
			
		<>  -> != ILE AYNI -> NOT equal


	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
		
	ORDER BY
			
		ORDER BY ASC and DESC
			
			SELECT * FROM Customers ORDER BY Country ASC, CustomerName DESC;
				
			Ulkelere gore dizdikten sonra ulkeler arasinda CustomerName'e gore bir siralama yapiyor
			*ilk yazilan oncelik sahibi (Once Country siraliyor, sonra CustomerName)
				
			
			
		ORDER BY Several Columns (ACS ya da DESC belirtilmedigi surece Alphabetic  siralar)
				
			SELECT * FROM Customers ORDER BY Country, CustomerName;
				
				
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
			
	AND
			
		All conditions must be true
				
			SELECT column1, column2, ...
			FROM table_name
			WHERE condition1 AND condition2 AND condition3 ...;  --> Bir nevi filtreleme yapiliyor. 
					
	
				
			Ulkesi UK olan VE R ile baslayan derken --> 'R%'
					
				SELECT * FROM Customers WHERE Country='UK' 	AND last_name LIKE 'R%'
				SELECT * FROM Customers WHERE Country = 'Germany' AND City = 'Berlin' AND PostalCode > 12000;
					
	AND + OR 
	
		!!! OR -->> PARANTEZ ICINDE OLACAK !!!
			
			Soyadi 'G' ile ya da 'R' ile baslayan ve Ispanya'da yasayan musterileri getir
					
			SELECT * FROM Customers WHERE Country='Spain' AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%');
					
			For Example
								
				-Select all customers that either:
					are from usa and starts with either "j", or starts with the letter "R":
						
					SELECT * FROM Customers 
					WHERE country = 'USA' AND (first_name LIKE 'J%' OR first_name LIKE 'R%')
	
	
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
			
	NOT
			
		return all customers that are NOT from Spain:
				
			SELECT * FROM Customers WHERE NOT Country='Spain';
					
					
	NOT BETWEEN
				
		Select customers with a customerID not between 10 and 60:
					
			SELECT * FROM Customers
			WHERE CustomerID NOT BETWEEN 10 AND 60;
					
	NOT IN
			
		Select customers that are not from Paris or London:
				
			SELECT * FROM Customers
			WHERE Cities NOT IN ('Paris', 'London');
					
					
	NOT GREATER THAN
			
		Select customers with a CustomerId not greater than 50:
					
			SELECT * FROM Customers
			WHERE NOT CustomerID > 50;
					
					
	NOT Less Than
			
		Select customers with a CustomerID not less than 50:
				
			SELECT * FROM Customers 
			WHERE NOT CustomerID < 50;


	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~					
		
		
	INSERT INTO
			
		// Specific bir column icin specific bir deger girmek icin, o column sirasina denk gelen bir Value girilir.
			INSERT INTO table_name (column1, column2, column3, ...)
			VALUES (value1, value2, value3, ...);
			
			OR
			
		// Eger Tablo adi belirtmeden Value girilirse, her column'a denk gelecek sekilde bir deger girmelisin
			INSERT INTO table_name
			VALUES (value1, value2, value3, ...);
			

	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
				
	IS NULL
		
		TC Kimlik Numarasi kayitli olmayan (NULL olan) misafirlerin Adini, Soyadini, Telefon numarasini ekrana getir
				
			SELECT FirstName, LastName, PhoneNumber
			FROM Employees
			WHERE TCKimlik IS NULL;
				
	IS NOT NULL 
			
		TC Kimlik Numarasi kayitli olmayan (NULL olan) misafirlerin DISINDA KALANLARIN Adini, Soyadini, Telefon numarasini ekrana getir
			SELECT FirstName, LastName, PhoneNumber
			FROM Employees
			WHERE TCKimlik IS NOT NULL;			


	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	


	UPDATE
		
		UPDATE table_name
		SET column1 = value1, column2 = value2, ...
		WHERE condition;
			
		UPDATE Employees 
		SET title = 'Scrum Master' 
		Where FirstName='Sinem'  
			
			
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
				
				
	DELETE
		
		DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste'; 
			
	
	
	- Delete All Records
		**** DELETE FROM Customers ****  
			--> DELETES EVERYTHING in the table !!! Don't forget to put WHERE condition
			

	- Delete a Table
		**** DROP TABLE Customers **** 
			--> Deletes the table complitely!!
			
			
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~			
	
	SELECT TOP Clause
	
		SELECT TOP 3 * FROM Customers;
		----------
		
		SQL Server / MS Access Syntax:
			
			SELECT TOP number|percent column_name(s)
			FROM table_name
			WHERE condition;
			
		MySQL Syntax:	
					
			SELECT column_name(s)
			FROM table_name
			WHERE condition
			LIMIT number;
				
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	

	TOP PERCENT	
				
			SELECT TOP 50 PERCENT * FROM Customers;
			SELECT TOP 50 PERCENT * FROM Employees WHERE TitleOfCourtesy='Ms.'
		
		ADD a WHERE CLAUSE
		
			SELECT TOP 3 * FROM Customers WHERE Country='Germany';


	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
	
	SQL Aggregate Functions	(mATEMATIK ISLEMI YAPTIRAN FONKSIYONLAR)		
	
		MIN() - returns the smallest value within the selected column	--> returns String and int
		MAX() - returns the largest value within the selected column	--> returns String and int
		COUNT() - returns the number of rows in a set					--> returns returns int (gives the row number)
		SUM() - returns the total sum of a numerical column				--> returns int (do NOT give a String value)
		AVG() - returns the average value of a numerical column			--> returns int (do NOT give a String value)
				
		Syntax: 
			SELECT MAX(Freight) FROM Orders		
			SELECT AVG(Freight) FROM Orders
			SELECT MAX(Price) FROM Products;
			
			SELECT Freight
			FROM Orders
			ORDER BY Freight ASC  -- or any other column you want to order by
			OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;
		
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	
			
		
		
		
		
		
		
		
	