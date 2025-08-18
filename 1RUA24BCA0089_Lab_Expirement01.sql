
-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME: Riyan Shrestha
-- USN: 1RUA24BCA0075
-- SECTION: BCA

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- 'root@localhost', 'RVU-PC-051', '8.4.6', '2025-08-18 11:39:08'

-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
-- Write your SQL query below Codespace:

create database BCADBLab001;
use BCADBLab001;

-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth

-- Write your SQL query below Codespace:

create table Students (
Student_id varchar(10) Primary Key,
First_Name varchar(15),
Last_Name varchar(15),
Email varchar(20) UNIQUE,
Date_Of_Birth date
);

DESC Students; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code

/*'Student_id', 'varchar(10)', 'NO', 'PRI', NULL, ''
'First_Name', 'varchar(15)', 'YES', '', NULL, ''
'Last_Name', 'varchar(15)', 'YES', '', NULL, ''
'Email', 'varchar(20)', 'YES', 'UNI', NULL, ''
'Date_Of_Birth', 'date', 'YES', '', NULL, ''
*/

-- Alter the table and 2 new columns
Alter Table Students add Age int , add Gender varchar(5);
DESC Students;
-- Modify a column data type
Alter Table Students Modify Student_id varchar(15);
DESC Students;
-- Rename a column
Alter Table Students Rename column Date_Of_Birth to DOB;
DESC Students;
-- Drop a column
Alter Table Students drop column Age;
DESC Students;
-- Rename the table
Rename Table Students to STUDENT;
DESC STUDENT;

-- OUTPUT

/* 'Student_id', 'varchar(15)', 'NO', 'PRI', NULL, ''
'First_Name', 'varchar(15)', 'YES', '', NULL, ''
'Last_Name', 'varchar(15)', 'YES', '', NULL, ''
'Email', 'varchar(20)', 'YES', 'UNI', NULL, ''
'DOB', 'date', 'YES', '', NULL, ''
'Gender', 'varchar(5)', 'YES', '', NULL, ''
 */


-- Task 2: Create the Courses Table
-- Create a table to store information about courses.
-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits

-- Write your SQL query below Codespace:

Create Table Courses (
Course_ID varchar(10) Primary Key,
Course_Name varchar(20),
Credits int
);

DESC Courses; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- OUTPUT :

/* 'Course_ID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'Course_Name', 'varchar(20)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
 */

-- Alter the table and 2 new columns
Alter table Courses add(Course_Teacher varchar(10), Department varchar(10));
DESC Courses;
-- Modify a column data type
Alter table Courses Modify Column Department varchar(15);
DESC Courses;
-- Rename a column
Alter table Courses Rename Column Credits to Credit;
DESC Courses;
-- Drop a column
Alter table Courses drop Department;
DESC Courses;
-- Rename the table
Rename table Courses to COURSE;
DESC COURSE;

-- OUTPUT :

/* 'Course_ID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'Course_Name', 'varchar(20)', 'YES', '', NULL, ''
'Credit', 'int', 'YES', '', NULL, ''
'Course_Teacher', 'varchar(10)', 'YES', '', NULL, ''
 */

-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate

-- Write your SQL query below Codespace:

Create Table Enrollments (
Enroll_Id varchar(10) Primary Key,
Student_id varchar(10),
Course_ID varchar(10),
Foreign Key (Student_id) references STUDENT(Student_id),
foreign key (Course_ID) references COURSE(Course_ID)
);

DESC Enrollments; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]
-- OUTPUT :

/* 'Enroll_Id', 'varchar(10)', 'NO', 'PRI', NULL, ''
'Student_id', 'varchar(10)', 'YES', 'MUL', NULL, ''
'Course_ID', 'varchar(10)', 'YES', 'MUL', NULL, ''
 */

-- Alter the table and 2 new columns
Alter table Enrollments add(Gender varchar(5), Address varchar(15));
DESC Enrollments;
-- Modify a column data type
Alter table Enrollments Modify column Gender varchar(10);
DESC Enrollments;
-- Rename a column
Alter table Enrollments Rename column Gender to Sex;
DESC Enrollments;
-- Drop a column
Alter table Enrollments drop Sex;
DESC Enrollments;
-- Rename the table
Rename table Enrollments to ENROLLMENT;
DESC ENROLLMENT;

-- OUTPUT 

/* 'Enroll_Id', 'varchar(10)', 'NO', 'PRI', NULL, ''
'Student_id', 'varchar(10)', 'YES', 'MUL', NULL, ''
'Course_ID', 'varchar(10)', 'YES', 'MUL', NULL, ''
'Address', 'varchar(15)', 'YES', '', NULL, ''
 */


-- Task 4: Alter the Students Table
-- Add a column 'PhoneNumber' to store student contact numbers.
Alter table STUDENT add column PhoneNumber varchar(10);
-- Write your SQL query below Codespace:

DESC STUDENT; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]

-- OUTPUT

/* 'Student_id', 'varchar(15)', 'NO', 'PRI', NULL, ''
'First_Name', 'varchar(15)', 'YES', '', NULL, ''
'Last_Name', 'varchar(15)', 'YES', '', NULL, ''
'Email', 'varchar(20)', 'YES', 'UNI', NULL, ''
'DOB', 'date', 'YES', '', NULL, ''
'Gender', 'varchar(5)', 'YES', '', NULL, ''
'PhoneNumber', 'varchar(10)', 'YES', '', NULL, ''
 */


-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:

Alter table COURSE modify CREDIT decimal;
DESC COURSE;

-- OUTPUT :

/*  'Course_ID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'Course_Name', 'varchar(20)', 'YES', '', NULL, ''
'CREDIT', 'decimal(10,0)', 'YES', '', NULL, ''
'Course_Teacher', 'varchar(10)', 'YES', '', NULL, ''
 */

-- Task 6: Drop Tables

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:

drop table ENROLLMENT;
Drop table COURSE;

SHOW TABLES; -- After dropping the table Enrollement and Course
-- output

/* 'student'
 */
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01
