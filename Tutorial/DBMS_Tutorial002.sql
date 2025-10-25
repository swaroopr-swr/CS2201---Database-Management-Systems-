create database Office;
use Office;
create table Books(
BookID int Primary key,
Title varchar(30),
Author varchar(30),
Price int,
Publisher varchar(30));

create table Customers(
CustID int Primary key,
Name varchar(30),
Email varchar(30) unique,
JoinDate date);

create table Orders (
OrderID int Primary key,
CustID int,
BookID int,
OrderDate date,
Quantity int,
Foreign key(CustID) references Customers(CustID),
Foreign key(BookID) references Books(BookID));

-- inserting the values
insert into Books values
(501, 'The Alchemist', 'Danish bhai', 500, 'RVU'),
(502, 'MEIN KAMPF', 'Adolf Hitler', 700, 'Germany'),
(503, 'Harry Potter', 'JK.Rowling', 1200, 'UK'),
(504, 'Psychology of Money', 'Suhail bhai', 400, 'India'),
(505, 'Rich dad Poor Dad', 'XIN xong xii', 500, 'China');
select * from Books;
-- Ouptut: 
/*  
# BookID	Title	Author	Price	Publisher
501	The Alchemist	Danish bhai	500	RVU
502	MEIN KAMPF	Adolf Hitler	700	Germany
503	Harry Potter	JK.Rowling	1200	UK
504	Psychology of Money	Suhail bhai	400	India
505	Rich dad Poor Dad	XIN xong xii	500	China
*/

insert into Customers values 
(901, 'Riyan Shrestha', 'riyanshresthabca24@rvu.edu.in', '2024-03-14'),
(902, 'Girish Kailash', 'girishkailashbca24@rvu.edu.in', '2024-09-23'),
(903, 'Swaroop R', 'swarroprbca24@rvu.edu.in', '2024-07-10'),
(904, 'Suhail M', 'suhailmbca24@rvu.edu.in', '2024-09-29'),
(905, 'Neel G', 'neelgbca24@rvu.edu.in', '2024-06-12');
select * from Customers;
-- Output:
/*  
# CustID	Name	Email	JoinDate
901	Riyan Shrestha	riyanshresthabca24@rvu.edu.in	2024-03-14
902	Girish Kailash	girishkailashbca24@rvu.edu.in	2024-09-23
903	Swaroop R	swarroprbca24@rvu.edu.in	2024-07-10
904	Suhail M	suhailmbca24@rvu.edu.in	2024-09-29
905	Neel G	neelgbca24@rvu.edu.in	2024-06-12
*/

insert into Orders values
(201, 901, 501, '2025-02-9', 4),
(202, 902, 502, '2025-03-4', 2),
(203, 903, 503, '2025-06-12', 1),
(204, 904, 504, '2025-04-14', 3),
(205, 905, 505, '2025-07-23', 2);
select * from Orders;
-- Output:
/*  
# OrderID	CustID	BookID	OrderDate	Quantity
201	901	501	2025-02-09	4
202	902	502	2025-03-04	2
203	903	503	2025-06-12	1
204	904	504	2025-04-14	3
205	905	505	2025-07-23	2
*/

-- 1. Display all customer names in uppercase.
select Name, upper(Name) as "Upper" from Customers;	
-- Output:
/*  
# Name	Upper
Riyan Shrestha	RIYAN SHRESTHA
Girish Kailash	GIRISH KAILASH
Swaroop R	SWAROOP R
Suhail M	SUHAIL M
Neel G	NEEL G
*/
-- 2. Show all customer names in lowercase.
select Name, lower(Name) as "Lower" from Customers;
-- Output:
/* 
# Name	Lower
Riyan Shrestha	riyan shrestha
Girish Kailash	girish kailash
Swaroop R	swaroop r
Suhail M	suhail m
Neel G	neel g
*/
-- 3. Extract the first 3 letters of each book title.
select Title, Substr(Title,1,3) as 'Book3' from Books;
-- Output:
/* 
# Title	Book3
The Alchemist	The
MEIN KAMPF	MEI
Harry Potter	Har
Psychology of Money	Psy
Rich dad Poor Dad	Ric
*/
-- 4. Display each customer’s email domain (after @).
select Email, SUBSTRING_INDEX(Email, '@', -1) as 'Domain' from Customers;
-- Output:
/*  
# Email	                          Domain
girishkailashbca24@rvu.edu.in	rvu.edu.in
neelgbca24@rvu.edu.in	        rvu.edu.in
riyanshresthabca24@rvu.edu.in	rvu.edu.in
suhailmbca24@rvu.edu.in	        rvu.edu.in
swarroprbca24@rvu.edu.in	    rvu.edu.in
*/
-- 5. Find the length of each book title.
Select Title, length(Title) as "Length" from Books;
-- Output:
/*  
# Title	           Length
The Alchemist	     13
MEIN KAMPF	         10
Harry Potter	     12
Psychology of Money	 19
Rich dad Poor Dad	 17
*/
-- 6. Replace the word "Book" with "Text" in titles (if present).
select Title, replace(Title, 'Book', 'Text') as 'UpdatedTitle' from Books;
-- Output:
/*  # Title	      UpdatedTitle
The Alchemist     The Alchemist
MEIN KAMPF     	  MEIN KAMPF
Harry Potter	  Harry Potter
Psychology of Money	Psychology of Money
Rich dad Poor Dad	Rich dad Poor Dad
*/
-- 7. Concatenate Author name and Book title as a single string.
select concat(Author, ' - ', Title) as AuthorBook from Books;
-- Output:
/*  # AuthorBook
Danish bhai - The Alchemist
Adolf Hitler - MEIN KAMPF
JK.Rowling - Harry Potter
Suhail bhai - Psychology of Money
XIN xong xii - Rich dad Poor Dad
*/
-- 8. Show book titles where the author’s name contains ‘a’.
select Title, Author from Books where Author like '%a%' ;
-- Output:
/*  
# Title         Author
The Alchemist	Danish bhai
MEIN KAMPF	    Adolf Hitler
Psychology of Money	Suhail bhai
*/
-- 9. Display the year in which each book was published.
select year(OrderDate) from Orders;
-- Output:
/*  
# year(OrderDate)
2025
2025
2025
2025
2025
*/
-- 10. Find the month name in which each customer joined.
select year(JoinDate) as 'Year', monthname(JoinDate) AS 'Month' from Customers;
-- Output:
/*  
# Year	Month
2024	March
2024	September
2024	July
2024	September
2024	June
*/
-- 11. List customers who joined in 2021.
select * from Customers where year(JoinDate) = 2021;
-- Output:Null
/*  */
-- 12. Find the day name on which each order was placed.
select year(OrderDate) as 'Year', month(OrderDate) as 'Month', dayname(OrderDate) as 'Day' from Orders;
-- Output:
/*  
# Year	Month	Day
2025	2	Sunday
2025	3	Tuesday
2025	6	Thursday
2025	4	Monday
2025	7	Wednesday
*/
-- 13. Display the age of each book (in years since published).
SELECT B.Title, 
       YEAR(CURDATE()) - YEAR(O.OrderDate) AS 'Orderdate'
FROM Books B
JOIN Orders O ON B.BookID = O.BookID;
-- Output:
/*  
# Title	Orderdate
The Alchemist	0
MEIN KAMPF	0
Harry Potter	0
Psychology of Money	0
Rich dad Poor Dad	0
*/
-- 14. Find the number of days between today and each customer’s join date.
select Name , datediff(curdate(), JoinDate) as Dayswork from Customers;
-- Output:
/*  
# Name	Dayswork
Riyan Shrestha	552
Girish Kailash	359
Swaroop R	434
Suhail M	353
Neel G	462
*/
-- 15. Show all orders placed in the month of December (any year).
select * from Orders where month(OrderDate) = 12;
-- Output:Null
/*  */
-- 16. Find the total number of books available in the store.
select count(*) as TotalBook from Books;
-- Output:
/* 
# TotalBook
5
 */
 -- 17. Find the average price of books.
select avg(Price) as Average from Books;
-- Output:
/*  
# Average
660.0000
*/
-- 18. Find the maximum and minimum book price.
select max(Price) as MaxPrice, min(Price) as MinPrice from Books;
-- Output:
/*  
# MaxPrice	MinPrice
1200	     400
*/
-- 19. Count how many customers joined after 2020.
select count(*) as CustomerAfter2020 
from Customers where year(JoinDate) > 2020;
-- Output:
/*  
# CustomerAfter2020
5
*/
-- 20. Find the total number of books ordered (all orders combined).
select sum(Quantity) as TotalBook from Orders;
-- Output:
/*  
# TotalBook
12
*/
-- 21. Show the total quantity of books ordered per customer.
SELECT Name, SUM(Quantity) AS TotalQuantity
FROM Customers
JOIN Orders USING (CustID)
GROUP BY Name;
-- Output:
/*  
# Name	TotalQuantity
Riyan Shrestha	4
Girish Kailash	2
Swaroop R	1
Suhail M	3
Neel G	2
*/
-- 22. Find the average order quantity per book.
SELECT Title, AVG(Quantity) AS AvgQuantity
FROM Books
JOIN Orders USING (BookID)
GROUP BY Title;
-- Output:
/*  # Title	AvgQuantity
The Alchemist	4.0000
MEIN KAMPF	2.0000
Harry Potter	1.0000
Psychology of Money	3.0000
Rich dad Poor Dad	2.0000
*/
-- 23. Book with highest total quantity ordered
SELECT BookID, SUM(Quantity) AS TotalOrdered
FROM Orders
GROUP BY BookID
ORDER BY TotalOrdered DESC;
-- Output:
/*  
# BookID	TotalOrdered
501	4
504	3
502	2
505	2
503	1
*/
-- 24. Total revenue per book (Price × Quantity)
SELECT B.BookID, B.Title, SUM(B.Price * O.Quantity) AS TotalRevenue
FROM Books B, Orders O
WHERE B.BookID = O.BookID
GROUP BY B.BookID, B.Title;
-- Output:
/*  
# BookID	Title	TotalRevenue
501	The Alchemist	2000
502	MEIN KAMPF	1400
503	Harry Potter	1200
504	Psychology of Money	1200
505	Rich dad Poor Dad	1000
*/
-- 25. Total number of orders each year
SELECT YEAR(OrderDate) AS OrderYear, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY YEAR(OrderDate);
-- Output:
/*  
# OrderYear	TotalOrders
2025	5
*/