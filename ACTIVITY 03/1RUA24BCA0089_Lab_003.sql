-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 02: Program 02 - Implementation of DML Commands in SQL ( INSERT , SELECT, UPDATE and DELETE )
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: SWAROOPP R
-- USN: 1RUA24BCA0089
-- SECTION: BCA
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
/*	USER()	Host_Name	MySQL_Version	Current_Date_Time
	root@localhost	RVU-PC-051	8.4.6	2025-09-01 11:25:54
*/

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Scenario: You are managing a database for a library with two tables: Books and Members.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Task 01: Create Tables [ Check the below mentioned Instructions:
-- Create the Books and Members tables with the specified structure.
-- Books Table and Member Table : 
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task with the Instructed Column in the session 
create database Library_Management;
use Library_Management;

create table Books (
Book_id int Primary key,
Title varchar(15),
Author varchar(15)
);
alter table Books modify column Title varchar(30);
alter table Books modify column Author varchar(30);
create table Members (
Member_id int Primary key,
Member_name varchar(15),
Phone_no int 
);
alter table Members modify column Member_name varchar(30);
alter table Members rename column Phone_no to Date_joined;
alter table Members modify column Date_joined varchar(30);

desc Books;
desc Members;

-- Paste the Output below for the given command ( DESC TableName;) 
-- Output:
/* Book_id	int	NO	PRI		
Title	varchar(30)	YES			
Author	varchar(30)	YES						

Member_id	int	NO	PRI		
Member_name	varchar(30)	YES			
Date_joined	int	YES					
*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 02: Insert a New Book
-- Instructions: Insert a book titled "1984_The Black Swan" by George Orwell (published in 1949) with 04 available copies and 10 Total copies. 
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
insert into Books values 
(001, '1984_The Black Swan', 'George Orwell');
insert into Books values 
(002, 'The Alchemist', 'Someone'),
(003, 'Harry Potter', 'J.K Rowling'),
(004, 'Laws_of_Power', 'Someone'),
(005, 'Spider_Man', 'Stan_Lee');

SELECT * FROM Books;

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
-- Output:
/* 
1	1984_The Black Swan	George Orwell
2	The Alchemist	Someone
3	Harry Potter	J.K Rowling
4	Laws_of_Power	Someone
5	Spider_Man	Stan_Lee
		*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 03: Add New Members
-- Instructions: Insert two members: David Lee (Platinum, joined 2024-04-15) and Emma Wilson (Silver, joined 2024-05-22).
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
insert into Members values 
(001, 'David Lee', 2024-04-15),
(002, 'Emma Wilson', 2024-05-22),
(003, 'Riyan Shrestha', 2024-09-12),
(004, 'Aryan Yadav', 2024-03-15),
(005, 'Girish Kailash', 2024-06-07);
SELECT * FROM Members;

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
-- Output:
/*  
1	David Lee	2005
2	Emma Wilson	1997
3	Riyan Shrestha	2003
4	Aryan Yadav	2006
5	Girish Kailash	2011
		*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 04: Update Book Details 
-- Instructions: The library acquired 2 additional copies of "1984_The Black Swan". Update the Books table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
alter table Books add publoc varchar(25);
update Books set publoc = 'Bangalore';
SELECT * FROM Books; 

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
-- Output:
/*  
1	1984_The Black Swan	George Orwell	Bangalore
2	The Alchemist	Someone	Bangalore
3	Harry Potter	J.K Rowling	Bangalore
4	Laws_of_Power	Someone	Bangalore
5	Spider_Man	Stan_Lee	Bangalore
			*/
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 05: Modify a Member's Information
-- Instructions: Update a member's membership type. Emma Wilson has upgraded her membership from 'Silver' to 'Gold'.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
alter table Members add membership_type varchar(25);
alter table Members drop column mebership_type;
update Members set membership_type = 'Gold';
SELECT * FROM Members;

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
-- Output:
/* 
 1	David Lee	2005	Gold
2	Emma Wilson	1997	Gold
3	Riyan Shrestha	2003	Gold
4	Aryan Yadav	2006	Gold
5	Girish Kailash	2011	Gold
			*/
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 06: Remove a Member
-- Instructions: Delete David Lee’s record from the Members table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.




-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 09: Borrowing Table 
-- Instructions: Create a Borrowing table with foreign keys referencing Books and Members.
-- Subtask 1: Borrow a Book
-- Scenario:Emma Wilson (member_id = 2) borrows the book "The Catcher in the Rye" (book_id = 102) on 2024-06-01. Insert this record into the Borrowing table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 10: Find the name of Borrower who book = 102 [ Advance and Optional ]
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Final Task 00: ER Diagram - Instructions:
-- Draw an ER diagram for the library database. Additional Upload the scanned copy of the created ER Daigram in the Google Classroom.



-- END of the Task -- 
