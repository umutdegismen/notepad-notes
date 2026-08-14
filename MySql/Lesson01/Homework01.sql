
USE LibraryMgmt;
-- 1. How can we display the name of the book with id 5?
SELECT BookName FROM book WHERE Bookid=5;
 
-- 2. How can you display unique book category ids from the “book” table?
SELECT DISTINCT BookCategoryId FROM book;

-- 3. How to display student name and student discipline for student with id 1006?
SELECT StudentName,StudentDiscipline FROM student WHERE StudentId=7;

-- 4. How to display all the information of the books that have a category greater or equal to 3?
SELECT * FROM book WHERE BookCategoryId>=3;
