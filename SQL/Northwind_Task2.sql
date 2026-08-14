
USE Northwind

--KategoriID deðeri 1 veya 3 olan ürünlerin adlarýný, fiyatlarýný ve KategoriID deðerlerini listeleyelim.

SELECT CategoryID, UnitPrice, ProductName FROM Products WHERE CategoryID=1 OR CategoryID=3

SELECT P.CategoryID, P.ProductName, P.UnitPrice FROM Products p
WHERE P.CategoryID=1 OR P.CategoryID=3

--KategoriID deðeri 2 ve Fiyatý 18$ dan pahalý olan ürünlerin adlarýný Fiyatlarýný ve stok miktarlarýný listeleyelim.

SELECT P.ProductName, P.UnitPrice, P.UnitsInStock FROM Products P WHERE P.CategoryID=2 AND P.UnitPrice>18

--ALFKI veya DUMON  ID li Musteriler tarafýndan verilmiþ, Kargo Ödemesi 50$ dan pahalý olan sipariþlerin listesini çýkartalým.
SELECT CustomerID, OrderID, Freight FROM Orders 
where (CustomerID = 'ALFKI' OR CustomerID = 'DUMON') AND Freight>50

--Stok miktarý 20 ile 50 arasýnda olan (sýnýrlar dahil) ürünlerin adlarýný ve stok miktarlarýný listeleyelim.

select p.ProductName, p.UnitsInStock from Products p where P.UnitsInStock BETWEEN 20 AND 50

--1,3,4 ya da 6  ID 'li Personel'in onaylamýþ olduðu 20$ üzerinde kargo ödemesi içeren Sipariþlerin  raporunun çýkartalým.

SELECT OrderID, EmployeeID, Freight FROM Orders 
WHERE EmployeeID IN(1,3,4,6) AND Freight>700

SELECT O.EmployeeID, O.OrderID, O.Freight FROM Orders O WHERE (O.EmployeeID = 1 OR O.EmployeeID=3 OR O.EmployeeID=4) AND O.Freight>800

--Müþterilere ulaþmamýþ olan sipariþleri listeleylim (Shipped Date kolon deðeri NULL olan sipariþler)

SELECT OrderID,OrderDate, ShippedDate FROM Orders WHERE ShippedDate IS NULL
--KategoriID deðeri 5 olan, Fiyatý 20 ile 300 arasýnda olan ve Stok bilgisi NULL OLMAYAN ürünlerin raporunu hazýrlayýnýz.

SELECT CategoryID, UnitsInStock, UnitPrice FROM Products
WHERE UnitPrice BETWEEN 20 AND 300 AND CategoryID = 5 AND  UnitsInStock IS NOT NULL

--Personellerin adlarýný ve soyadlarýný alfabetik olarak sýralayalým

SELECT FirstName + ' ' +  LastName as 'ADI SOYADI' FROM Employees ORDER BY 'ADI SOYADI' 

--Ürünleri Fiyatlarýna göre pahalýdan ucuza doðru sýralý yazalým. Ayný fiyatlý ürünler stok miktarlarýna göre Küçükten büyüðe sýralansýn.

SELECT ProductName, UnitPrice, UnitsInStock FROM Products ORDER BY UnitPrice DESC, UnitsInStock ASC

--1,3,4 ya da 6  ID 'li Personel'in onaylamýþ olduðu 20$ üzerinde kargo ödemesi içeren Sipariþlerin  raporunun çýkartalým.

SELECT EmployeeID, Freight FROM Orders where EmployeeID IN (1,3,4,6) AND Freight>700

--Ürünleri Fiyatlarýna göre pahalýdan ucuza doðru sýralý yazalým. Ayný fiyatlý ürünler stok miktarlarýna göre Küçükten büyüðe sýralansýn.

SELECT UnitsInStock, UnitPrice FROM Products ORDER BY UnitPrice DESC, UnitsInStock ASC

--En ucuz 10 ürünü listeleyelim.

SELECT TOP 10 ProductName, UnitPrice FROM Products ORDER BY UnitPrice ASC

SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice BETWEEN 80 AND 98

--CompanyName Deðeri A ile baþlayan müþterilerin  listesi..

SELECT CustomerID FROM Customers where CustomerID like 'A%'


