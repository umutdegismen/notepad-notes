USE Northwind

WHERE Anahtar kelimesi ile birden fazla kritere göre sorgu gerçekleştirebilmek için kullanabileceğiniz kalıplar..
--1) OR anahtar kelimesi
--Yazılan koşullardan herhangi bir tanesinin gerçekleşmesi durumunda size değerleri teslim eder.
--KategoriID değeri 1 veya 3 olan ürünlerin adlarını, fiyatlarını ve KategoriID değerlerini listeleyelim.

SELECT p.ProductName, p.UnitPrice, p.CategoryID FROM Products p
WHERE p.CategoryID=1 OR p.CategoryID=3

--2) AND  Anahtar kelimesi
--Sorguda belirtilen koşulların tamamını  doğrulayan satırları teslim eder.
--KategoriID değeri 2 ve Fiyatı 18$ dan pahalı olan ürünlerin adlarını Fiyatlarını ve stok miktarlarını listeleyelim.
SELECT p.ProductName, p.UnitPrice, p.UnitsInStock, p.CategoryID FROM Products p
WHERE p.CategoryID=2 AND p.UnitPrice>18

--AND Anahtar kelimesi ile OR anahtar kelimesini bir arada kullanırken Or ifadesi içeren  koşulların parantez içerisinde kullanılması gerekir. Bu şekilde AND  ifadesindeki koşulu OR a dahil olan bütün kolonlara dağıtmış olursunuz.

--ALFKI veya DUMON id li Musteriler tarafından verilmiş, Kargo Ödemesi $50 dan pahalı olan siparişlerin listesini çıkartalım.

SELECT OrderID, CustomerID,Freight FROM Orders
WHERE CustomerID='ALFKI' OR CustomerID='DUMON' AND Freight>50
--Sorgu bu şekilde yazıldığına 50$ üzeri koşulu ALFKI yi etkilemeyecektir.
SELECT OrderID, CustomerID,Freight FROM Orders
WHERE (CustomerID='ALFKI' OR CustomerID='DUMON') AND Freight>50
--OR içeren ifade parantez içerisine alındığında oradan çıkan sonuca göre AND ifadesi sorgunuza dahil olacaktır.(AND ifadesini OR ifadelerinin tamamına dağıtmış olursunuz)

--Tablonuz içerisinde belirli bir aralığa göre kontrol yapmak için kullanabileceğiniz bir kalıp bulunmaktadır. bu kalıp BETWEEN AND kalıbı olarak karşımıza çıkar.

--Stok miktarı 20 ile 50 arasında olan (sınırlar dahil) ürünlerin adlarını ve stok miktarlarını listeleyelim.

SELECT ProductName, UnitsInStock FROM Products
WHERE UnitsInStock>=20 AND UnitsInStock<=50
--BETWEEN AND ile yazım
SELECT ProductName,UnitsInStock FROM Products
WHERE UnitsInStock BETWEEN 20 AND 50

--Sorgularınızda aynı kolon değeri çin birden fazla OR ifadesi yazmanız gerekiyorsa sorgunuzu IN (...) kalıbını kullanarak kısaltabilirsiniz. Bu Kalıp aynı zamanda AND ve OR anahtar kelimelerinin birleştiği sorgularda size kolaylık sağlyacaktır.

--1,3,4 ya da 6  ID 'li Personel'in oanylamış olduğu 20$ üzerinde kargo ödemesi içeren Siparişlerin  raporunun çıkartalım.
SELECT OrderID, EmployeeID,Freight FROM Orders
WHERE (EmployeeID=1 OR EmployeeID=3 OR EmployeeID=4 OR EmployeeID=6) AND
Freight>20

SELECT OrderID,EmployeeID,Freight FROM Orders
WHERE EmployeeID IN(1,3,4,6) AND Freight>20

--NULL Ýfadelerin kontrolü
--Tablo içerisinde NULL geçilebilir kolonların değerlerini kontrol ederken NULL ifadeler için eşitlik kullanamazsınız. Bunun yerine is NULL ya da IS NOT NULL diyerek NULL ifadeleri kontrol etmeniz gereklidir.

--Müşterilere ulaşmamış olan siparişleri listeleylim (Shipped Date kolon değeri NULL olan siparişler)
SELECT OrderID, OrderDate,ShippedDate FROM Orders
WHERE ShippedDate IS NULL
--KategoriID değeri 5 olan, Fiyatı 20 ile 300 arasında olan ve Stok bilgisi NULL OLMAYAN ürünlerin raporunu hazırlayınız.
SELECT ProductName, UnitPrice,UnitsInStock,CategoryID FROM Products
WHERE CategoryID=5 AND UnitPrice BETWEEN 20 AND 300 AND UnitsInStock IS NOT NULL

--SIRALAMA işlemleri (Order BY)
--SQL server üzerinde gerçekleştirdiğiniz bir sorgunun sonnucunu istediğiniz kolonlara göre sıralamak için ORDER BY anahtar kelimesini kullanabilirsiniz.
--Bu anahtar kelime ile birlikte küçükten büyüğe mi yoksa büyüktne küçüğe mi sıralama yapacağınızı belirlemeniz gerekir.
--Küçükten büyüğe sıralama yapmak için ASC (ascending) yazmanız yeterlidir. Varsayılan sıralama çeşidi de ASC olduğunda çoğu zaman yazılmaz.
--Büyükten küçüğe bir sıralama için DESC(descending) yazmanız gereklidir.

--Personellerin adlarını ve soyadlarını alfabetik olarak sıralayalım
SELECT FirstName+' '+LastName AS [Adı Soyadı] FROM Employees
ORDER BY [Adı Soyadı]

--Ürünlerimi Fiyatlarına göre pahalıdan ucuza doğru sıralı yazaım. Aynı fiyatlı ürünler stok miktarlarına göre Küçükten büyüğe sıralansın.
SELECT ProductName, UnitPrice, UnitsInStock FROM Products
ORDER BY UnitPrice DESC,UnitsInStock ASC
--Birden fazla kolona göre sıralama yaparken hangi kolona göre hangi tipte sıralama yapacağını yazmanız gerekir.

--Belirli sayıda veri çekme (TOP anahtar kelimesi)
--Sorgunuzun sonucunda  belirli bir sayıda veri almak isterseniz TOP anahtar kelimesini kullanmanız gereklidir.

--En ucuz 10 ürünü listeleyelim.
SELECT TOP 10 ProductName, UnitPrice FROM Products ORDER BY UnitPrice

--Belirli durumlarda yüzdeli belirterek te TOP anahtar kelimesini kullanabilirsiniz.

SELECT TOP 50 PERCENT CategoryID, categoryName From Categories

--SELECT CategoryID, CategoryName FROM Categories LIMIT 5,30 MySQL içerisinde kullanabileceğiniz bir anahtar kelimedir. Limit ilk parametre olarak hangi sıradaki kayıttan başlayacağını ikinci parametre olarak kaç adeet kayıt getireceğini teslim alır. tek parametre verirseniz TOP anahtar kelimesi gibi davranır.

--ARAMA işlemleri (LIKE anahtar kelimesi)
--Sorgularınız içerisinde metinsel değerleri ararken size yardımcı olan bir anahtar kelimedir.
--CompanyName Değeri A ile başlayan müşterilerin  listesi..
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE 'A%'

--CompanyName değeri A ile Biten müşterilerin listesi..
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE '%A'

--CompanyName değeri içerisinde LTD geçen müşterilerin listesi..
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE '%LTD%'

--customerID değeri içerisinde ilk iki harfi bilinmeyen  son  üç harfi mon olan müşterimiz.
SELECT customerID, CompanyName FROM Customers 
WHERE CustomerID LIKE '__mon'

--CompanyName değeri A ya da S ile başlayan müşteriler
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE '[AS]%'
--CompanyNAme değeri A ile K arasındaki herhangi bir harf ile başlayan müşteriler
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE '[A-K]%'

--CompanyName değeri A ile başlayn ancak 3. harfi C olmayan  müşterilerin listesi..
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE 'A_[^C]%'

--CompanyName değeri A ile BAŞLAMAYAN müşterilerin listesi
SELECT CompanyName FROM Customers
WHERE CompanyName  LIKE '[^A]%'
--2. alternatif
SELECT CompanyName FROM Customers
WHERE CompanyName NOT LIKE 'A%'

--Extra
--CompanyName değeri 25 harften uzun olan Müşterilerin listesi..
SELECT  Companyname,LEN(CompanyName) AS [isim uzunluğu] FROM Customers WHERE  LEN(CompanyName)>25
--LEN fonksiyonu içerisindeki string ifadein kaç karakter olduğunu size geri döndürür.(kolon adı verirseniz o kolondaki string ifadelerin sayılarını geri döndürür.)

--AGGREGATE Fonksiyonlar
--COUNT: tablo içerisinde bir kolona göre sayım yapmanızı sağlar
--Stokta bulunan kaç kalem ürünüm var.
SELECT COUNT(ProductID) AS [Ürün sayısı] FROM Products 
WHERE UnitsInStock>0

--Kaç farklı ülkeden müşterim var..
SELECT COUNT(Country) AS [Müşteri Sayısı] FROM Customers

SELECT CustomerID, Country FROM Customers
--Tablonuz içersinde bulunan mükerrer(tekrarlı) kayıtları göz ardı etmek için DISTINCT anahtar kelimesini kullanabilirsiniz.
--Doğru sorgu
SELECT COUNT(DISTINCT Country) AS [Ülke Sayısı]  FROM Customers

--SUM: Bir kolondaki sayısal değerlerin tamamını toplayığ sonucu geri döndürür.
-- Her üründen 1 adet alsam ne kadar öderim
SELECT SUM(UnitPrice) FROM Products WHERE UnitsInStock>0

--Depoda toplam kaç dolarlık ürün mevcut.
SELECT SUM(Unitprice*UnitsInStock) FROM Products

--ŞU ana kadar ödenmiş olan ortalama kargo ücreti ne kadardır.
SELECT SUM(Freight)/COUNT(OrderID) AS [Ortalama kargo ücreti] FROM Orders

--AVG: belirtilen kolonun ortalamasını alıp geri döndürür.
--Ortalama kargo ücreti
SELECT AVG(Freight) FROM Orders

--MAX-MIN: tablodaki en büüyk ya da en küçük değeri teslim almanıza yarar. Sadece sayısal değil metinsel değerleri de  dahil edebilir.
--En pahalı ürünün Fiyatı
SELECT MAX(UnitPrice) FROM Products

--en az ödenen kargo ücreti
SELECT MIN(Freight) FROM Orders