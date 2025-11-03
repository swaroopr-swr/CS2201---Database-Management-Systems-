create database StudentEnrollments;
use StudentEnrollments;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(25)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(15),
    CourseFee DECIMAL(10,2)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Students VALUES
(501, 'Girish'),
(502, 'Swaroop'),
(503, 'Riyan');

INSERT INTO Courses VALUES
(100, 'BCA', 500.00),
(200, 'B.Com', 750.00),
(300, 'BBA', 450.00),
(400, 'B.Tech', 900.00);

INSERT INTO Enrollment VALUES
(8001, 501, 100),
(8002, 501, 200),
(8003, 502, 200),
(8004, 503, 100),
(8005, 503, 300);

-- 1. Students and their courses.
SELECT s.StudentName, c.CourseName
FROM Students s
INNER JOIN Enrollment e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;
/* OUTPUT:
# StudentName	CourseName
Girish	BCA
Girish	B.Com
Swaroop	B.Com
Riyan	BCA
Riyan	BBA
*/

-- 2. All courses and enrolled students.
SELECT c.CourseName, s.StudentName
FROM Courses c
LEFT JOIN Enrollment e ON c.CourseID = e.CourseID
LEFT JOIN Students s ON e.StudentID = s.StudentID;
/* OUTPUT:
# CourseName	StudentName
BCA	Girish
BCA	Riyan
B.Com	Girish
B.Com	Swaroop
BBA	Riyan
B.Tech	
*/

-- 3. Number of students per course.
SELECT c.CourseName, COUNT(e.StudentID) AS TotalStudents
FROM Courses c
LEFT JOIN Enrollment e ON c.CourseID = e.CourseID
GROUP BY c.CourseName;
/* OUTPUT:
# CourseName	TotalStudents
BCA	2
B.Com	2
BBA	1
B.Tech	0
*/

-- 4. Average course fee.
SELECT AVG(CourseFee) AS AverageFees FROM Courses;
-- OUTPUT: 650.000000

-- 5. Total number of students enrolled.
SELECT COUNT(DISTINCT StudentID) AS TotalStudents FROM Enrollment;
-- OUTPUT: 3
