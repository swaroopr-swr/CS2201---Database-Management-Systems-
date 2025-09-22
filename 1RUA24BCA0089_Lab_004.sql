-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: SWAROOP R
-- USN: 1RUA24BCA0089
-- SECTION: BCA 
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
/*	 USER()	Host_Name	MySQL_Version	Current_Date_Time
	root@localhost	RVU-PC-051	8.4.6	2025-09-08 11:28:56
*/

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 
create database lab_exp3;
use lab_exp3;
create table Employee (
EmpID int Primary Key,
FirstName varchar(30),
Lastname varchar(30),
Salary int,
BirthDate date,
HireDate date
);
-- 2. Insert 10 records to employee;
insert into Employee values 
(1, 'Riyan', 'Shrestha', 80000, '2005-11-09', '2024-04-08'),
(2, 'Girish', 'Kaialsh', 70000, '2005-01-04', '2025-01-08'),
(3, 'Sumukh', 'Ravi', 20000, '2007-01-24', '2024-04-08'),
(4, 'Swaroop', 'R', 30000, '2008-04-09', '2025-04-04'),
(5, 'Deep', 'Paul', 70000, '2006-08-20', '2024-06-23'),
(6, 'Aryan', 'Yadav', 40000, '2007-01-09', '2024-07-08'),
(7, 'Ambrish', 'Dhanvee', 60000, '2006-10-09', '2023-07-08'),
(8, 'Indranil', 'Sah', 90000, '2008-06-09', '2024-04-08'),
(9, 'Kaushal', 'Mandal', 35000, '2007-07-09', '2024-10-08'),
(10, 'Neel', 'Gonthali', 60000, '2006-02-09', '2024-07-08');

-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  
create table Orders (
OrderId int Primary Key,
Order_date date,
TotalAmount numeric,
EmpID INT,
Foreign Key (EmpID) references Employee(EmpID)
);

-- 4. Insert 10 records to Orders
insert into Orders value 
(101, '2024-04-10', 2500, 1),
(102, '2024-05-12', 1800, 2),
(103, '2024-06-15', 3200, 3),
(104, '2024-07-01', 999, 4),
(105, '2024-07-18', 7500, 5),
(106, '2024-08-05', 4500, 6),
(107, '2024-08-12', 1200, 7),
(108, '2024-09-01', 6500, 8),
(109, '2024-09-12', 3000, 9),
(110, '2024-09-20', 2200, 10);

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.
Select * from Employee;
Select * from Orders;


-- Output: 
/*  
1	Riyan	Shrestha	80000	2005-11-09	2024-04-08
2	Girish	Kaialsh	70000	2005-01-04	2025-01-08
3	Sumukh	Ravi	20000	2007-01-24	2024-04-08
4	Swaroop	R	30000	2008-04-09	2025-04-04
5	Deep	Paul	70000	2006-08-20	2024-06-23
6	Aryan	Yadav	40000	2007-01-09	2024-07-08
7	Ambrish	Dhanvee	60000	2006-10-09	2023-07-08
8	Indranil	Sah	90000	2008-06-09	2024-04-08
9	Kaushal	Mandal	35000	2007-07-09	2024-10-08
10	Neel	Gonthali	60000	2006-02-09	2024-07-08
					
                    
101	2024-04-10	2500.00	1
102	2024-05-12	1800.00	2
103	2024-06-15	3200.00	3
104	2024-07-01	999.00	4
105	2024-07-18	7500.00	5
106	2024-08-05	4500.00	6
107	2024-08-12	1200.00	7
108	2024-09-01	6500.00	8
109	2024-09-12	3000.00	9
110	2024-09-20	2200.00	10
			                    
                    */



-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
Select round (Salary) as "Round Salary" from Employee;

-- Output: 
 /* 
80000
70000
20000
30000
70000
40000
60000
90000
35000
60000
*/
 
/* b. Absolute Values: Show absolute values of salaries */
select abs(Salary) as "Absolute Salary" from Employee;
-- Output: 
/*  
80000
70000
20000
30000
70000
40000
60000
90000
35000
60000*/
/* c. Ceiling Values: Get ceiling values of order amounts */
select ceil(TotalAmount) as "Order Amount" from Orders;
-- Output: 
/*  
2500
1800
3200
999
7500
4500
1200
6500
3000
2200
*/
-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
select count(EmpID) as "Number of employee" from Employee;
-- Output: 
-- 10
/* b. Sum of Salaries: Calculate total salary expense */
select sum(Salary) as "Total Salary" from Employee;
-- Output: 
-- 555000
/* c. Average Order Amount: Find average order value */
select avg(TotalAmount) as "Order Value" from Orders;
-- Output: 
-- 3339.900000
/* d. Max/Min Salary: Find highest and lowest salaries */
select max(Salary), min(Salary) from Employee;
-- Output: 
-- 90000	20000
-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
select upper(FirstName), lower(FirstName) , upper(LastName), lower(LastName) from Employee;
-- Output: 
/* 
# upper(FirstName)	lower(FirstName)	upper(LastName)	lower(LastName)
AMBRISH	ambrish	DHANVEE	dhanvee
ARYAN	aryan	YADAV	yadav
DEEP	deep	PAUL	paul
GIRISH	girish	KAIALSH	kaialsh
INDRANIL	indranil	SAH	sah
KAUSHAL	kaushal	MANDAL	mandal
NEEL	neel	GONTHALI	gonthali
RIYAN	riyan	SHRESTHA	shrestha
SUMUKH	sumukh	RAVI	ravi
SWAROOP	swaroop	R	r

 */
/* b. Concatenate Names: Create full names */
select concat(FirstName,LastName) as "Full Name" from Employee;
-- Output: 
/* 
# Full Name
RiyanShrestha
GirishKaialsh
SumukhRavi
SwaroopR
DeepPaul
AryanYadav
AmbrishDhanvee
IndranilSah
KaushalMandal
NeelGonthali
*/
/* c. Extract Substring: Get first 3 characters of first names */
select substr(FirstName,1,3) from Employee;
-- Output: 
/* # substr(FirstName,1,3)
Riy
Gir
Sum
Swa
Dee
Ary
Amb
Ind
Kau
Nee
 */
-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert DATE to text type */
SELECT cast(Order_date as char) AS Converted_Date from Orders;
-- Output: 
/*  
# Converted_Date
2024-04-10
2024-05-12
2024-06-15
2024-07-01
2024-07-18
2024-08-05
2024-08-12
2024-09-01
2024-09-12
2024-09-20
*/
-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
SELECT NOW() AS "Current Timestamp";
-- Output: 
-- # Current Timestamp
-- 2025-09-08 12:25:21

/* b. Extract Year: Get year from order dates */
SELECT extract(YEAR from (Order_date)) AS "Order_Year" FROM Orders;

-- Output: 
/*  # OrderID	Order_Year
101	2024
102	2024
103	2024
104	2024
105	2024
106	2024
107	2024
108	2024
109	2024
110	2024
*/
/* c. Add Months: Add 3 months to order dates */
select date_add(Order_Date, interval 3 month) as "Final Date" from Orders;
-- Output: 
/*  
# Final Date
2024-07-10
2024-08-12
2024-09-15
2024-10-01
2024-10-18
2024-11-05
2024-11-12
2024-12-01
2024-12-12
2024-12-20
*/
/* d. Days Since Order: Calculate days between order date and now */
select OrderID, datediff(now(),Order_Date) AS "Day Since Order" from Orders;
-- Output: 
/* 
# OrderID	Day Since Order
101	516
102	484
103	450
104	434
105	417
106	399
107	392
108	372
109	361
110	353

 */





-- Output of the Action output:
/*  
		#	Time	Action	Message	Duration / Fetch
3	1	11:28:56	SELECT USER(), 
        @@hostname AS Host_Name, 
        VERSION() AS MySQL_Version, 
        NOW() AS Current_Date_Time
 LIMIT 0, 500	1 row(s) returned	0.000 sec / 0.000 sec
3	2	11:30:47	create database lab_exp3	1 row(s) affected	0.000 sec
3	3	11:30:58	use lab_exp3	0 row(s) affected	0.000 sec
3	4	11:32:37	create table Employee (
 EmpID int Primary Key,
 FirstName varchar(30),
 Lastname varchar(30),
 Salary int,
 BirthDate date,
 HireDate date
 )	0 row(s) affected	0.015 sec
0	5	11:41:44	insert into Employee values 
 (001, 'Riyan', 'Shrestha', 80000, 2005/11/09, 2024/04/08),
 (002, 'Girish', 'Kaialsh', 70000, 2005/01/04, 2025/01/08),
 (003, 'Sumukh', 'Ravi', 20000, 2007/01/24, 2024/04/08),
 (004, 'Swaroop', 'R', 30000, 2008/04/09, 2025/04/04),
 (005, 'Deep', 'Paul', 70000, 2006/08/20, 2024/06/23),
 (006, 'Aryan', 'Yadav', 40000, 2007/01/09, 2024/07/08),
 (007, 'Ambrish', 'Dhanvee', 60000, 2006/10/09, 2023/07/08),
 (008, 'Indranil', 'Sah', 90000, 2008/06/09, 2024/04/08),
 (009, 'Kaushal', 'Mandal', 35000, 2007/07/09, 2024/10/08),
 (010, 'Neel', 'Gonthali', 60000, 2006/02/09, 2024/07/08)	Error Code: 1292. Incorrect date value: '20.252525252444444444' for column 'BirthDate' at row 1	0.000 sec
0	6	11:44:05	insert into Employee values 
 (001, 'Riyan', 'Shrestha', 80000, 2005-11-09, 2024-04-8),
 (002, 'Girish', 'Kaialsh', 70000, 2005-01-04, 2025-01-08),
 (003, 'Sumukh', 'Ravi', 20000, 2007-01-24, 2024-04-08),
 (004, 'Swaroop', 'R', 30000, 2008-04-09, 2025-04-04),
 (005, 'Deep', 'Paul', 70000, 2006-08-20, 2024-06-23),
 (006, 'Aryan', 'Yadav', 40000, 2007-01-09, 2024-07-08),
 (007, 'Ambrish', 'Dhanvee', 60000, 2006-10-09, 2023-07-08),
 (008, 'Indranil', 'Sah', 90000, 2008-06-09, 2024-04-08),
 (009, 'Kaushal', 'Mandal', 35000, 2007-07-09, 2024-10-08),
 (010, 'Neel', 'Gonthali', 60000, 2006-02-09, 2024-07-08)	Error Code: 1292. Incorrect date value: '1985' for column 'BirthDate' at row 1	0.000 sec
3	7	11:45:21	insert into Employee values 
 (1, 'Riyan', 'Shrestha', 80000, '2005-11-09', '2024-04-08'),
 (2, 'Girish', 'Kaialsh', 70000, '2005-01-04', '2025-01-08'),
 (3, 'Sumukh', 'Ravi', 20000, '2007-01-24', '2024-04-08'),
 (4, 'Swaroop', 'R', 30000, '2008-04-09', '2025-04-04'),
 (5, 'Deep', 'Paul', 70000, '2006-08-20', '2024-06-23'),
 (6, 'Aryan', 'Yadav', 40000, '2007-01-09', '2024-07-08'),
 (7, 'Ambrish', 'Dhanvee', 60000, '2006-10-09', '2023-07-08'),
 (8, 'Indranil', 'Sah', 90000, '2008-06-09', '2024-04-08'),
 (9, 'Kaushal', 'Mandal', 35000, '2007-07-09', '2024-10-08'),
 (10, 'Neel', 'Gonthali', 60000, '2006-02-09', '2024-07-08')	10 row(s) affected
 Records: 10  Duplicates: 0  Warnings: 0	0.000 sec
3	8	11:48:35	create table Orders (
 OrderId int Primary Key,
 Order_date date,
 TotalAmount DECIMAL(10,2),
 EmpID INT,
 Foreign Key (EmpID) references Employee(EmpID)
 )	0 row(s) affected	0.000 sec
3	9	11:50:41	insert into Orders value 
 (101, '2024-04-10', 2500, 1),
 (102, '2024-05-12', 1800, 2),
 (103, '2024-06-15', 3200, 3),
 (104, '2024-07-01', 999, 4),
 (105, '2024-07-18', 7500, 5),
 (106, '2024-08-05', 4500, 6),
 (107, '2024-08-12', 1200, 7),
 (108, '2024-09-01', 6500, 8),
 (109, '2024-09-12', 3000, 9),
 (110, '2024-09-20', 2200, 10)	10 row(s) affected
 Records: 10  Duplicates: 0  Warnings: 0	0.000 sec
3	10	11:51:05	Select * from Employee
 LIMIT 0, 500	10 row(s) returned	0.000 sec / 0.000 sec
3	11	11:52:21	Select * from Orders
 LIMIT 0, 500	10 row(s) returned	0.000 sec / 0.000 sec
3	12	11:54:07	Select round (Salary) from Employee
 LIMIT 0, 500	10 row(s) returned	0.000 sec / 0.000 sec
3	13	11:54:48	Select round (Salary) as "comp_sal" from Employee
 LIMIT 0, 500	10 row(s) returned	0.016 sec / 0.000 sec
3	14	11:56:21	select abs(Salary) as "Absolute Salary" from Employee
 LIMIT 0, 500	10 row(s) returned	0.000 sec / 0.000 sec
3	15	11:58:17	Select round (Salary) as "comp_sal" from Employee
 LIMIT 0, 500	10 row(s) returned	0.000 sec / 0.000 sec
3	16	11:58:36	Select round (Salary) as "Round Salary" from Employee
 LIMIT 0, 500	10 row(s) returned	0.000 sec / 0.000 sec
3	17	11:59:28	select ceil(TotalAmount) as "Order Amount" from Orders
 LIMIT 0, 500	10 row(s) returned	0.015 sec / 0.000 sec
3	18	12:01:12	select count(EmpID) as "Number of employee" from Employee
 LIMIT 0, 500	1 row(s) returned	0.000 sec / 0.000 sec
3	19	12:02:26	select sum(Salary) as "Total Salary" from Employee
 LIMIT 0, 500	1 row(s) returned	0.000 sec / 0.000 sec
3	20	12:03:54	select avg(TotalAmount) as "Order Value" from Orders
 LIMIT 0, 500	1 row(s) returned	0.000 sec / 0.000 sec
3	21	12:04:38	select max(Salary), min(Salary) from Employee
 LIMIT 0, 500	1 row(s) returned	0.000 sec / 0.000 sec
3	22	12:05:56	select upper(FirstName), lower(FirstName) from Employee
 LIMIT 0, 500	10 row(s) returned	0.000 sec / 0.000 sec
3	23	12:07:12	select concat(FirstName,LastName) as "Full Name" from Employee
 LIMIT 0, 500	10 row(s) returned	0.000 sec / 0.000 sec
3	24	12:25:21	SELECT NOW() AS "Current Timestamp"
 LIMIT 0, 500	1 row(s) returned	0.000 sec / 0.000 sec
3	25	12:39:00	select upper(FirstName), lower(FirstName) , upper(LastName), lower(LastName) from Employee
 LIMIT 0, 50000	10 row(s) returned	0.000 sec / 0.000 sec
3	26	12:40:04	select substr(FirstName,1,4) from Employee
 LIMIT 0, 50000	10 row(s) returned	0.000 sec / 0.000 sec
3	27	12:40:23	select substr(FirstName,1,3) from Employee
 LIMIT 0, 50000	10 row(s) returned	0.000 sec / 0.000 sec
0	28	12:42:13	SELECT STR_TO_DATE(BirthDate, '%Y-%m-%d') AS Converted_Date
 LIMIT 0, 50000	Error Code: 1054. Unknown column 'BirthDate' in 'field list'	0.000 sec
3	29	12:42:21	SELECT STR_TO_DATE('2025-09-08', '%Y-%m-%d') AS Converted_Date
 LIMIT 0, 50000	1 row(s) returned	0.000 sec / 0.000 sec
0	30	12:43:50	SELECT cast(Order_date as char) AS Converted_Date
 LIMIT 0, 50000	Error Code: 1054. Unknown column 'Order_date' in 'field list'	0.000 sec
0	31	12:45:30	SELECT cast(Order_date as char) AS Converted_Date
 LIMIT 0, 50000	Error Code: 1054. Unknown column 'Order_date' in 'field list'	0.000 sec
0	32	12:46:05	SELECT cast(Order_date as char) AS Converted_Date from Order_date
 LIMIT 0, 50000	Error Code: 1146. Table 'lab_exp3.order_date' doesn't exist	0.016 sec
3	33	12:46:16	SELECT cast(Order_date as char) AS Converted_Date from Orders
 LIMIT 0, 50000	10 row(s) returned	0.000 sec / 0.000 sec
0	34	12:47:00	SELECT OrderID, YEAR(OrderDate) AS Order_Year FROM Orders
 LIMIT 0, 50000	Error Code: 1054. Unknown column 'OrderDate' in 'field list'	0.000 sec
3	35	12:50:28	SELECT OrderID, YEAR(Order_date) AS Order_Year FROM Orders
 LIMIT 0, 50000	10 row(s) returned	0.000 sec / 0.000 sec
3	36	12:53:19	select date_add(Order_Date, interval 3 month) as "Final Date" from Orders
 LIMIT 0, 50000	10 row(s) returned	0.016 sec / 0.000 sec
3	37	12:55:02	select OrderID, datediff(Order_Date, now()) AS "Day Since Order" from Orders
 LIMIT 0, 50000	10 row(s) returned	0.000 sec / 0.000 sec
3	38	12:55:13	select OrderID, datediff(Order_Date, -now()) AS "Day Since Order" from Orders
 LIMIT 0, 50000	10 row(s) returned	0.000 sec / 0.000 sec
3	39	12:55:26	select OrderID, datediff(Order_Date, -now()) AS "Day Since Order" from Orders
 LIMIT 0, 50000	10 row(s) returned	0.000 sec / 0.000 sec
3	40	12:55:45	select OrderID, datediff(Order_Date,now()) AS "Day Since Order" from Orders
 LIMIT 0, 50000	10 row(s) returned	0.000 sec / 0.000 sec
3	41	12:56:01	select OrderID, datediff(now(),Order_Date) AS "Day Since Order" from Orders
 LIMIT 0, 50000	10 row(s) returned	0.000 sec / 0.000 sec
 */
-- END of the Task -- select * from marks;