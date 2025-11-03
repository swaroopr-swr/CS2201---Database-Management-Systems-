create database LibraryDB;
use LibraryDB;

CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(25)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    MemberName VARCHAR(25) 
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(20),
    Author VARCHAR(25),
    Price DECIMAL(10, 2),
    PublisherID INT,
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

CREATE TABLE BookIssues (
    IssueID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    IssueDate DATE ,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

INSERT INTO Publishers VALUES
(1, 'Penguin'),
(2, 'HarperCollins'),
(3, 'Scholastic'),
(4, 'New Era '); 

INSERT INTO Members VALUES
(101, 'Alice Smith'),
(102, 'Bob Johnson'),
(103, 'Charlie Brown');

INSERT INTO Books VALUES
(1, 'The Midnight', 'Matte', 14.99, 1),
(2, 'Dune', 'Frank', 12.50, 1),
(3, 'Mockingbird', 'Harper Lee', 10.00, 2),
(4, 'The Great Gatsby', 'F.Scott', 9.75, 3),
(5, 'Educated', 'Westover', 13.50, 2);

INSERT INTO BookIssues VALUES
(1001, 1, 101, '2024-10-01'), 
(1002, 2, 101, '2024-10-05'),
(1003, 3, 102, '2024-10-10'), 
(1004, 5, 101, '2024-10-15'); 

-- 1. Display book title, author, and publisher name using INNER JOIN.
SELECT b.Title, b.Author, p.PublisherName
FROM Books b
INNER JOIN Publishers p ON b.PublisherID = p.PublisherID;
/*OUTPUT:
# Title	Author	PublisherName
The Midnight	Matte	Penguin
Dune	Frank	Penguin
Mockingbird	Harper Lee	HarperCollins
Educated	Westover	HarperCollins
The Great Gatsby	F.Scott	Scholastic
*/

-- 2. List all publishers and their books (including publishers without books).
SELECT p.PublisherName, b.Title
FROM Publishers p
LEFT JOIN Books b ON p.PublisherID = b.PublisherID;
/* OUTPUT:
# PublisherName	Title
Penguin	The Midnight
Penguin	Dune
HarperCollins	Mockingbird
HarperCollins	Educated
Scholastic	The Great Gatsby
New Era 	
*/

-- 3. Display total number of books issued per member.
SELECT m.MemberName, COUNT(i.BookID) AS TotalBooksIssued
FROM Members m
INNER JOIN BookIssues i ON m.MemberID = i.MemberID
GROUP BY m.MemberName;
/* OUTPUT:
MemberName	TotalBooksIssued
Alice Smith	3
Bob Johnson	1
*/

-- 4. Find the average price of all books.
SELECT AVG(Price) AS AverageBookPrice FROM Books;
-- OUTPUT: 12.148000

-- 5. Find total number of books issued.
SELECT COUNT(*) AS TotalBooksIssued FROM BookIssues;
-- OUTPUT: 4


