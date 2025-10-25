create database School_Management;
use School_Management;

-- STUDENT NAME: Riyan Shrestha
-- USN: 1RUA24BCA0075
-- SECTION: BCA 

create table Student (
    StudentID INT PRIMARY KEY,
    FName VARCHAR(25),
    LName VARCHAR(25),
    DOB DATE,
    Class INT,
    Marks INT,
    City VARCHAR(20));

create table Teacher (
    TeacherID INT PRIMARY KEY,
    FName VARCHAR(15),
    LName VARCHAR(15),
    Subject VARCHAR(20),
    HireDate DATE,
    Salary DECIMAL(7,2));

create table Course ( 
	CourseID VARCHAR(15) PRIMARY KEY,
    CourseName VARCHAR(25),
    Credits INT);
    
create table Enrollment (
    EnrollID INT PRIMARY KEY,
    StudentID INT,
    CourseID VARCHAR(15),
    Grade VARCHAR(5),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID));
    
desc Student;
-- Output : 
/* 
# Field	Type	Null	Key	Default	Extra
StudentID	int	NO	PRI		
FName	varchar(25)	YES			
LName	varchar(25)	YES			
DOB	date	YES			
Class	int	YES			
Marks	int	YES			
City	varchar(20)	YES			
*/
desc Teacher;
-- Output : 
/*  
# Field	Type	Null	Key	Default	Extra
TeacherID	int	NO	PRI		
FName	varchar(15)	YES			
LName	varchar(15)	YES			
Subject	varchar(20)	YES			
HireDate	date	YES			
Salary	decimal(7,2)	YES			
*/
desc Course;
-- Output : 
/*  
# Field	Type	Null	Key	Default	Extra
CourseID	varchar(15)	NO	PRI		
CourseName	varchar(25)	YES			
Credits	int	YES			
*/
desc Enrollment;
-- Output : 
/*  
# Field	Type	Null	Key	Default	Extra
EnrollID	int	NO	PRI		
StudentID	int	YES	MUL		
CourseID	varchar(15)	YES	MUL		
Grade	varchar(5)	YES			
*/

INSERT INTO Student VALUES
(111,'Girish','Seervi','2006-09-06',104,88,'Blr'),
(112,'Riyan','Shrestha','2005-09-11',101,86,'Nepal'),
(113,'Aryan','Yadav','2007-10-11',104,64,'UP'),
(114,'Sumuk','Ravi','2006-05-21',104,38,'TN'),
(115,'Swaroop','Gowda','2006-11-03',108,22,'Blr'),
(116,'Deep','Paul','2005-05-22',111,80,'WB'),
(117,'Pranav','Kaur','2007-12-07',112,79,'Assam');

select * from Student;
-- Output: 
/* 
# StudentID	FName	LName	DOB	Class	Marks	City
111	Girish	Seervi	2006-09-06	104	88	Blr
112	Riyan	Shrestha	2005-09-11	101	86	Nepal
113	Aryan	Yadav	2007-10-11	104	64	UP
114	Sumuk	Ravi	2006-05-21	104	38	TN
115	Swaroop	Gowda	2006-11-03	108	22	Blr
116	Deep	Paul	2005-05-22	111	80	WB
117	Pranav	Kaur	2007-12-07	112	79	Assam
 */
 
INSERT INTO Teacher VALUES
(201,'Manish','Kumar','Maths','2020-08-12',80000),
(202,'Sharath','Shetty','Science','2022-09-01',55000),
(203,'Sasikala','J','English','2021-04-28',60000),
(204,'Manesh','Ranjan','History','2023-03-24',70000),
(205,'Parth','Gauda','Physics','2024-10-25',30000);

select * from Teacher;
-- Output :
 /*  
 # TeacherID	FName	LName	Subject	HireDate	Salary
201	Manish	Kumar	Maths	2020-08-12	80000.00
202	Sharath	Shetty	Science	2022-09-01	55000.00
203	Sasikala	J	English	2021-04-28	60000.00
204	Manesh	Ranjan	History	2023-03-24	70000.00
205	Parth	Gauda	Physics	2024-10-25	30000.00
*/

INSERT INTO Course VALUES
('C101','Maths',4),
('C102','Science',3),
('C103','English',2),
('C104','History',3),
('C105','Physics',4);

select * from Course;
-- Output:
/*  
# CourseID	CourseName	Credits
C101	Maths	4
C102	Science	3
C103	English	2
C104	History	3
C105	Physics	4
*/

INSERT INTO Enrollment VALUES
(301,111,'C101','A'),
(302,112,'C102','B'),
(303,113,'C103','A'),
(304,114,'C104','C'),
(305,115,'C105','B');

select * from Enrollment;
-- Output;
/*  
# EnrollID	StudentID	CourseID	Grade
301	111	C101	A
302	112	C102	B
303	113	C103	A
304	114	C104	C
305	115	C105	B
*/

-- Show the last 3 characters of course names
select right(CourseName, 3) from Course;
-- Ouptut :
/* 
# right(CourseName, 3)
ths
nce
ish
ory
ics
*/

-- Concatenate FirstName and LastName of teachers as fullname
select concat(FName, ' ', LName) as "Full_Name" from Teacher;
-- Output:
/*  
# Full_Name
Manish Kumar
Sharath Shetty
Sasikala J
Manesh Ranjan
Parth Gauda
*/

-- Find the length of each student’s name
select length(concat(FName, ' ', LName)) as "Name_Length" From Student;
-- Output:
/*  
# Name_Length
13
14
11
10
13
9
11
*/

-- Replace "Maths" with "Mathematics" in Course table
select replace(CourseName, 'Maths', 'Mathematics') as "Updated_Course" from Course;
-- Output:
/*  
# Updated_Course
Mathematics
Science
English
History
Physics
*/

-- Absolute difference between max and min mark
select abs(max(Marks) - min(Marks)) as "Absolute_Difference" from Student;
-- Output:
/*  
# Absolute_Difference
66
*/

-- Round off teachers’ salaries to nearest thousand
select round(Salary, -3) as "Rounded Salary" from Teacher;
-- Output:
/*  
# Rounded Salary
80000
55000
60000
70000
30000
*/

-- Square root of each course credit
select sqrt(Credits) as "Credit_root" from Course;
-- Output:
/*  
# Credit_root
2
1.7320508075688772
1.4142135623730951
1.7320508075688772
2
*/

-- Students’ marks with ceiling and floor
select ceil(Marks) as "Ceil_Marks" , floor(Marks) as "Floor_Marks" from Student;
-- Output:
/*  
# Ceil_Marks	Floor_Marks
88	88
86	86
64	64
38	38
22	22
80	80
79	79
*/

-- Modulus of total marks divided by 5
select sum(Marks) % 5 as "Module_Marks" from Student;
-- Output:
/*  
# Module_Marks
2
*/

-- Current date and time
select now() as Current_DateTime;
-- Output:
/*  
# Current_DateTime
2025-09-10 12:07:59
*/

-- Year and month of hire for teachers
select Year(HireDate) as 'Hire_year', month(HireDate) as 'Hire_Month' from Teacher;
-- Output:
/*  
# Hire_year	Hire_Month
2020	8
2022	9
2021	4
2023	3
2024	10
*/

-- Students born in January
select * from Student where month(DOB) = 1;
-- Output:
/*  
# StudentID, FName, LName, DOB, Class, Marks, City
*/

-- Difference in days between today and HireDate
select datediff(curdate(), HireDate) as "Days_Worked" from Teacher;
-- Output:
/*  # Days_Worked
1855
1105
1596
901
320
*/

-- Total number of students 
select count(*) as "Total" from Student;
-- Output:
/*  
# Total
7
*/

-- Average salary of teachers
select avg(Salary) as "Avg_Salary" from Teacher;
-- Output:
/*  
# Avg_Salary
59000.000000
*/

-- Highest and lowest marks
select max(Marks) as "Highest_Marks", min(Marks) as "Lowest_Marks" from Student;
-- Output:
/*  
# Highest_Marks	Lowest_Marks
88	               22
*/

-- Output of Action Output:
/*  
create database School_Management

use School_Management

create table Student (  StudentID INT PRIMARY KEY,     FName VARCHAR(25),     LName VARCHAR(25),     DOB DATE,     Class INT,     Marks INT,     City VARCHAR(20))

create table Teacher (     TeacherID INT PRIMARY KEY,     FName VARCHAR(15),     LName VARCHAR(15),     Subject VARCHAR(20),     HireDate DATE,     Salary DECIMAL(7,2))

create table Course (      EnrollID INT PRIMARY KEY,     StudentID INT,     CourseID VARCHAR(15),     Grade VARCHAR(5),     FOREIGN KEY (StudentID) REFERENCES Student(StudentID),     FOREIGN KEY (CourseID) REFERENCES Course(CourseID))

create table Course (   CourseID VARCHAR(15) PRIMARY KEY,     CourseName VARCHAR(25),     Credits INT)

create table Enrollment (     EnrollID INT PRIMARY KEY,     StudentID INT,     CourseID VARCHAR(15),     Grade VARCHAR(5),     FOREIGN KEY (StudentID) REFERENCES Student(StudentID),     FOREIGN KEY (CourseID) REFERENCES Course(CourseID))

desc Student

desc Teacher

desc Course

desc Enrollment

INSERT INTO Student VALUES (111,'Girish','Seervi','2006-09-06',104,88,'Blr'), (112,'Riyan','Shrestha','2005-09-11',101,86,'Nepal'), (113,'Aryan','Yadav','2007-10-11',104,64,'UP'), (114,'Sumuk','Ravi','2006-05-21',104,38,'TN'), (115,'Swaroop','Gowda','2006-11-03',108,22,'Blr'), (116,'Deep','Paul','2005-05-22',111,80,'WB'), (117,'Pranav','Kaur','2007-12-07',112,79,'Assam')

select * from Student LIMIT 0, 50000

select * from Student LIMIT 0, 50000

INSERT INTO Teacher VALUES (201,'Manish','Kumar','Maths','2020-08-12',80000), (202,'Sharath','Shetty','Science','2022-09-01',55000), (203,'Sasikala','J','English','2021-04-28',60000), (204,'Manesh','Ranjan','History','2023-03-24',70000), (205,'Parth','Gauda','Physics','2024-10-25',30000)

select * from Teacher LIMIT 0, 50000

INSERT INTO Course VALUES ('C101','Maths',4), ('C102','Science',3), ('C103','English',2), ('C104','History',3), ('C105','Physics',4)

select * from Course LIMIT 0, 50000

INSERT INTO Enrollment VALUES (301,111,'C101','A'), (302,112,'C102','B'), (303,113,'C103','A'), (304,114,'C104','C'), (305,115,'C105','B')

select * from Enrollment LIMIT 0, 50000

select substr(CourseName,1,3) from Course LIMIT 0, 50000

select substr(CourseName,3,0) from Course LIMIT 0, 50000

select substr(CourseName,0,-3) from Course LIMIT 0, 50000

select right(CourseName, 3) from Course LIMIT 0, 50000

select concat(FName, ' ', LName) as "Full_Name" from Teacher LIMIT 0, 50000

select length(concat(FName, ' ', LName)) as "Name_Length" From Student LIMIT 0, 50000

select replace(CouseName, 'Maths', 'Mathematics') as "Updated_Course" from Course LIMIT 0, 50000

select replace(CourseName, 'Maths', 'Mathematics') as "Updated_Course" from Course LIMIT 0, 50000

select abs(max(Marks) - min(Marks)) as "Absolute_Difference" from Student LIMIT 0, 50000

select round(Salary, -3) as "Rounded Salary" from Teacher LIMIT 0, 50000

select sqrt(Credits) as "Credit_root" from Course LIMIT 0, 50000

select ceil(Marks) as "Ceil_Marks" , floor(Marks) as "Floor_Marks" from Student LIMIT 0, 50000

select sum(Marks) % 5 as "Module_Marks" from Student LIMIT 0, 50000

select now() as Current_Date

select now() as Current_DateTime LIMIT 0, 50000

select Year(HireDate) as 'Hire_year', month(HireDate) as 'Hire_Month' from Teacher LIMIT 0, 50000

select * from Student where month(DOB) = 1 LIMIT 0, 50000

select datediff(curdate(), HireDate) as "Days_Worked" from Teacher LIMIT 0, 50000

select count(*) as "Total" from Student LIMIT 0, 50000

select avg(Salary) as "Avg_Salary" from Teacher LIMIT 0, 50000

select max(Marks) as "Highest_Marks", min(Marks) as "Lowest_Marks" from Student LIMIT 0, 50000
*/