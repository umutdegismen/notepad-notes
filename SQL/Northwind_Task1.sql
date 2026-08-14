




--250'den fazla siparis tasimis olan kargo firmalarinin (Shippers) adlarini (CompanyName), telefon numaralarini(Phone) ve siparis miktarlarini raporlayiniz.

select S.CompanyName,S.Phone,COUNT(O.ShipVia) [Siparis Miktari] from Orders O
join Shippers S
ON S.ShipperID=O.ShipVia
GROUP BY S.CompanyName,S.Phone
having count(O.ShipVia)>250



--Northwind database icerisindeki butun tablolari birbirine baglayin ve hepsinden birer tane kolon yazdirin.

SELECT OD.Discount,P.ReorderLevel,C.Picture,SUP.Country,O.Freight,S.Phone,CUS.Region, CCD.CustomerTypeID,CD.CustomerDesc, EMP.FirstName,TER.TerritoryDescription,R.RegionDescription,ET.EmployeeID 
FROM Orders O
JOIN Shippers S
ON O.ShipVia = S.ShipperID
JOIN Employees EMP
ON O.EmployeeID = EMP.EmployeeID
JOIN Customers CUS
ON O.CustomerID = CUS.CustomerID
JOIN [Order Details] OD
ON O.OrderID=OD.OrderID
JOIN CustomerCustomerDemo CCD
ON CUS.CustomerID= CCD.CustomerID
JOIN CustomerDemographics CD
ON CCD.CustomerTypeID=CD.CustomerTypeID
JOIN Products P
ON P.ProductID = OD.ProductID
JOIN Suppliers SUP
ON P.SupplierID=SUP.SupplierID
JOIN Categories C
ON P.CategoryID = C.CategoryID
JOIN EmployeeTerritories ET
ON EMP.EmployeeID= ET.EmployeeID
JOIN Territories TER
ON ET.TerritoryID=TER.TerritoryID
JOIN Region R
ON TER.RegionID=R.RegionID






