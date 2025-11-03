create database EmployeePayroll;
use EmployeePayroll;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(25)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(20),
    Salary DECIMAL(10,2),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Departments VALUES
(10, 'Sales'),
(20, 'IT'),
(30, 'HR'),
(40, 'Research'); 

INSERT INTO Employees VALUES
(101, 'Sharath', 60000.00, 10), 
(102, 'Manish', 85000.00, 20), 
(103, 'Sailaja', 75000.00, 10), 
(104, 'Parth', 55000.00, 30), 
(105, 'Bharath', 90000.00, 20);

-- 1. Display employee names and department names.
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;
/* OUTPUT:
# EmployeeName	DepartmentName
Sharath	Sales
Sailaja	Sales
Manish	IT
Bharath	IT
Parth	HR
*/


-- 2. List all departments and employees (even if no employees).
SELECT d.DepartmentName, e.EmployeeName
FROM Employees e
RIGHT JOIN Departments d ON e.DepartmentID = d.DepartmentID;
/* OUTPUT:
# DepartmentName	EmployeeName
Sales	Sharath
Sales	Sailaja
IT	Manish
IT	Bharath
HR	Parth
Research	
*/

-- 3. Average salary per department.
SELECT d.DepartmentName, AVG(e.Salary) AS AvgSalary
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;
/* OUTPUT:
# DepartmentName	AvgSalary
Sales	67500.000000
IT	87500.000000
HR	55000.000000
*/


-- 4. Maximum salary.
SELECT MAX(Salary) AS MaxSalary FROM Employees;
-- OUTPUT: 90000.00

-- 5. Total salary expenditure.
SELECT SUM(Salary) AS TotalSalary FROM Employees;
-- OUTPUT: 365000.00