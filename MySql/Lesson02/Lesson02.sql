-- ORDER BY
-- Ordering by ASC
USE prod_orangehrm;
SELECT * FROM hs_hr_employee order by emp_lastname asc;

-- Ordering by DESC
SELECT * FROM hs_hr_employee ORDER BY emp_lastname desc;

-- Display all employees ordered by lastname ascending and first name ascending
USE classicmodels;
SELECT * FROM employees ORDER BY lastName ASC, firstName ASC;

-- Display all employees whose office code is 4 ordered by first nama
SELECT * FROM employees WHERE officeCode=4 ORDER BY firstName ASC;

-------------------------------
-- IS NULL
-------------------------------
-- Display all offices
SELECT * FROM offices;

-- Display all offices who doesn't have a state: State is null
SELECT * FROM offices WHERE state IS NULL;

-- Display all offices who has a state
SELECT * FROM offices WHERE state IS NOT NULL;

SELECT * FROM offices WHERE state='';

--------------------------------------------------------------
-- LOGICAL OPERATORS --->>  AND / OR / NOT
--------------------------------------------------------------

-- Display all employees whose last name is Patterson and job is Sales Rep
SELECT * FROM employees WHERE lastName='Patterson' AND jobTitle='Sales Rep';

-- Display all employees whose last name is Bondur or Firrelli
SELECT * FROM employees WHERE lastName='Bondur' OR lastName='Firrelli';

-- Display all employees whose last name is Bondur or Firrelli and job title is Sales Rep
SELECT * FROM employees WHERE (lastName='Bondur' OR lastName='Firrelli') AND jobTitle='Sales Rep';

-- Display all employees whose job title is not Sales Rep or VP Sales
SELECT * FROM employees WHERE jobTitle<>'Sales Rep' AND jobTitle!='VP Sales';

-- Display all employees whose last name is Bondur or Firrelli or Patterson
SELECT * FROM employees WHERE lastName ='Bondur' OR lastName ='Firrelli' OR lastName ='Patterson';

--------------------------------------------------------------
-- IN/BETWEEN AND 
--------------------------------------------------------------

-- 2ND way without useing Or, Or, Or....
SELECT * FROM employees WHERE lastName in('Bondur','Firrelli','Patterson');

-- -> When we use BETWEEN - AND conditions, it includes Between and And. it is like <= and >=

-- Display all customer whose sales employee number is greater than 1300 and less than 1400
SELECT * FROM customers WHERE salesRepEmployeeNumber BETWEEN 1323 AND 1400;


--------------------------------------------------------------
-- LIKE  => starts-with OR eds-with
-- % isareti kelimeyi ifade ediyor
-- 'u%' ilk harfi U anlaminda
-- '%u' son harfi u anlaminda
-- 'u%t' u ile baslayan, t ile biten anlaminda 
-- '%la%' contains anlaminda
-- 'j_n%' _ tek karakter anlaminda. j ile baslayan, bilinmeyen bir karakter ile devam eden ve 3. harfi n olan kelimeler. january, jennifer gibi
--------------------------------------------------------------

-- Display all emplyees whose last name starts with B
SELECT * FROM employees WHERE lastName LIKE 'B%';

-- Display all employees whose first name starts with L and ends with E
SELECT * FROM employees WHERE firstName LIKE 'L%E';

-- Display all customers who has 'la' in their names
SELECT * FROM employees WHERE firstName LIKE '%la%';

-- Display all customers whose contact first name starts with 'jan'
SELECT * FROM customers WHERE contactFirstName LIKE 'jan%';

-- Display all customers whose contact first name starts with j, has one other letter, then has n, then anything else
-- j*n******
SELECT * FROM customers WHERE contactFirstName LIKE 'j_n%';

-- Display all customers whose phone number ends with 5555
SELECT * FROM customers WHERE phone LIKE '%5555';








