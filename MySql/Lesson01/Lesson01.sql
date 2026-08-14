# SQL is case insensitive
-- SQL is case insensitive
SELECT * From book;
-- Get the book name only
Select BookName from book;
-- Get the book name and IsActive
Select bookname,isActive from book;
-- Get the name of the student
select StudentName from student;
select studentdiscipline from student;

-- TASK 
-- 1. How can you display all the data in "BOOK" table?
SELECT * FROM book;

-- 2. How can you display Book Name and Category id from "book" table?
SELECT BookName, BookCategoryId from book;

-- 3. How can you dislplay all Students Names from "student" table ? 
SELECT StudentName from student;

-- 4. How can you display BookId, StudentId, BorrowDate from "bookborrow" ?
SELECT BookId, StudentId, BorrowDate from bookborrow;

-- 5. Please display all information from 'bookcategory" table ?
SELECT* FROM bookcategory;

---------------------------------------
-- DISTINCT KEYWORD --> Avoid Duplicates
---------------------------------------

SELECT DISTINCT StudentDiscipline FROM student;



---------------------------------------
-- WHEWRE KEYWORD --> Filtering records
---------------------------------------

SELECT * FROM book WHERE BookCategoryId > 3;
SELECT * FROM book WHERE IsActive=0;

select * from book where BookName='AWS';

SELECT * FROM student;

---------------------------------------
-- Queries on our HRM website database
---------------------------------------

SELECT emp_firstname,emp_lastname,employee_id 
FROM hs_hr_employee 
WHERE emp_lastname='White';













