#############################################
-- SELF JOIN
#############################################

-- Bu tabloda, employee, baska bir employee'ye raporlama yapiyor. O yuzden ayni tablo icinde baglanti yapilmis. 
-- employeeNumber ->> reportTo ile baglantili
SELECT * FROM employees;

-- Kim kime rapor veriyor, onun bilgisini ekrana getir
 Select e1.firstName, e1.lastName, CONCAT(e2.firstname, ' ', e2.lastname) as manager from employees e1
	inner join employees e2 on e1.reportsTo = e2.employeeNumber;
    
Select e1.firstName, e1.lastName, CONCAT(e2.firstName, ' ', e2.lastname) as manager from employees e1 
inner join employees e2 on e1.employeeNumber = e2.reportsTo;

Select CONCAT(e1.firstName, ' ',e1.lcustomerscustomersastName) as Empoyee, CONCAT(e2.firstname, ' ', e2.lastname) as Manager from employees e1
INNER JOIN employees e2 ON e1.reportsTo = e2.employeeNumber;