create database UniversityExam;
use UniversityExam;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

CREATE TABLE Results (
    StudentID INT,
    SubjectName VARCHAR(50),
    Marks DECIMAL(5, 2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Departments VALUES
(101, 'Computer Science'),
(102, 'Electrical Engineering'),
(103, 'Mechanical Engineering'),
(104, 'Civil Engineering'); 

INSERT INTO Students VALUES
(5001, 'Aarav Sharma', 101),
(5002, 'Bela Singh', 101),   
(5003, 'Chetan Varma', 102),
(5004, 'Divya Patel', 103),
(5005, 'Esha Khan', 102);   

INSERT INTO Results VALUES
( 5001, 'Data Structures', 85.00),
( 5001, 'Algorithms', 78.50),
( 5002, 'Data Structures', 92.00),
( 5003, 'Circuit Theory', 65.50),
( 5003, 'Power Systems', 72.00),
( 5004, 'Thermodynamics', 80.00),
( 5005, 'Circuit Theory', 88.00);

-- 1. Student names and department names.
SELECT s.StudentName, d.DeptName
FROM Students s
INNER JOIN Departments d ON s.DeptID = d.DeptID;
/* OUTPUT:
# StudentName	DeptName
Aarav Sharma	Computer Science
Bela Singh	Computer Science
Chetan Varma	Electrical Engineering
Esha Khan	Electrical Engineering
Divya Patel	Mechanical Engineering
*/

-- 2. All departments and students.
SELECT d.DeptName, s.StudentName
FROM Departments d
LEFT JOIN Students s ON d.DeptID = s.DeptID;
/* OUTPUT:
# DeptName	            StudentName
Computer Science	    Aarav Sharma
Computer Science	    Bela Singh
Electrical Engineering	Chetan Varma
Electrical Engineering	Esha Khan
Mechanical Engineering	Divya Patel
Civil Engineering	
*/

-- 3. Average marks per subject.
SELECT SubjectName, AVG(Marks) AS AverageMarks
FROM Results
GROUP BY SubjectName;
/* OUTPUT:
# SubjectName	AverageMarks
Data Structures	88.500000
Algorithms	78.500000
Circuit Theory	76.750000
Power Systems	72.000000
Thermodynamics	80.000000
*/


-- 4. Highest marks.
SELECT MAX(Marks) AS HighestMarks FROM Results;
-- OUTPUT: 92.00

-- 5. Total marks by all students.
SELECT SUM(Marks) AS TotalMarks FROM Results;
-- OUTPUT: 561.00