create database TechNova;
use TechNova;

create table Department(
dept_id int Primary Key,
dept_name varchar(25),
location varchar(25));

create table Employee (
emp_id int Primary Key,
emp_name varchar(25),
age int,
salary decimal(10,2),
designation varchar(25),
address varchar(25),
doj date,
dept_id int,
Foreign key(dept_id) references Department(dept_id) );

insert into Department values
(101, 'IT', 'RVU'),
(102, 'Tech', 'RVU'),
(103, 'Editor', 'RVU'),
(104, 'Janitor', 'RVU');
select * from Department;
-- Output:
/*  
# dept_id	dept_name	location
101	IT	RVU
102	Tech	RVU
103	Editor	RVU
104	Janitor	RVU
*/

insert into Employee values
(401, 'Riyan', 20, 590000, 'CEO', 'Bangalore', '2024-09-15', 101),
(402, 'Girish', 19, 99000, 'Manager', 'Mysore', '2024-03-02', 102),
(403, 'Aryan', 18, 25000, 'Editor', 'Global', '2024-09-12', 103),
(404, 'Swaroop', 20, 10000, 'Employee', 'Mysore', '2024-03-19', 104),
(405, 'Sumukh', 16, 2000, 'Worker', 'Karnataka', '2024-10-01', 104);
Select * from Employee;
-- Output:
/*  
# emp_id	emp_name	age	salary	designation	address	doj	dept_id
401	Riyan	20	590000.00	CEO	Bangalore	2024-09-15	101
402	Girish	19	99000.00	Manager	Mysore	2024-03-02	102
403	Aryan	18	25000.00	Editor	Global	2024-09-12	103
404	Swaroop	20	10000.00	Employee	Mysore	2024-03-19	104
405	Sumukh	16	2000.00	Worker	Karnataka	2024-10-01	104
*/

-- The company has announced a ₹5000 salary increment for all employees working as ‘Developer’.
update Employee
set salary = salary + 5000
where designation = 'Developer' ;

select * from Employee;
-- Output:
/*  
# emp_id	emp_name	age	salary	designation	address	doj	dept_id
401	Riyan	20	590000.00	CEO	Bangalore	2024-09-15	101
402	Girish	19	99000.00	Manager	Mysore	2024-03-02	102
403	Aryan	18	25000.00	Editor	Global	2024-09-12	103
404	Swaroop	20	10000.00	Employee	Mysore	2024-03-19	104
405	Sumukh	16	2000.00	Worker	Karnataka	2024-10-01	104
*/
-- Display the total number of employees, average salary, highest salary, and lowest salary for each department.
select 
dept_id, count(*) as total_employees,
avg(salary) as avg_salary,
max(salary) as highest_sal,
min(salary) as lowest_sal
from Employee
group by dept_id;
-- Output:
/*  
# dept_id	total_employees	avg_salary	highest_sal	lowest_sal
101	1	590000.000000	590000.00	590000.00
102	1	99000.000000	99000.00	99000.00
103	1	25000.000000	25000.00	25000.00
104	2	6000.000000	10000.00	2000.00
*/
-- Display each employee’s name and designation in uppercase and also show a new column combining their name and job title in a single sentence like:
select 
upper(emp_name) as emp_name_upper,
upper(designation) as designation_upper,
concat(emp_name, ' work as ', designation) as emp_sent
from Employee;
-- Output:
/*  
# emp_name_upper	designation_upper	emp_sent
RIYAN	CEO	Riyan work as CEO
GIRISH	MANAGER	Girish work as Manager
ARYAN	EDITOR	Aryan work as Editor
SWAROOP	EMPLOYEE	Swaroop work as Employee
SUMUKH	WORKER	Sumukh work as Worker
*/

-- Write a query to display each employee’s joining year and the number of years they have worked in the company till date.
select 
doj as 'joining year',
year(doj) as 'Number of Year'
from Employee;
-- Output:
/*  
# joining year	Number of Year
2024-09-15	2024
2024-03-02	2024
2024-09-12	2024
2024-03-19	2024
2024-10-01	2024
*/
-- List the names and salaries of employees whose salary is between ₹40,000 and ₹80,000, excluding those who belong to the Sales department.
select emp_name, salary
from Employee
where salary between 40000 and 80000
and dept_id not in (
select dept_id from Department where dept_name = 'Sales'
);
-- Output: Null
/*  */
-- Write a query to display each employee’s name, designation, department name, and location using an INNER JOIN between Employee and Department tables.
SELECT 
  e.emp_name,
  e.designation,
  d.dept_name,
  d.location
FROM Employee e
INNER JOIN Department d ON e.dept_id = d.dept_id;
-- Output:
/*  
# emp_name	designation	dept_name	location
Riyan	CEO	IT	RVU
Girish	Manager	Tech	RVU
Aryan	Editor	Editor	RVU
Swaroop	Employee	Janitor	RVU
Sumukh	Worker	Janitor	RVU
*/
-- Display all employees and their department names using a LEFT OUTER JOIN. (Include employees even if they are not assigned to any department.)
SELECT 
  e.emp_name,
  d.dept_name
FROM Employee e
LEFT JOIN Department d ON e.dept_id = d.dept_id;

-- Output:
/*  
# emp_name	dept_name
Riyan	IT
Girish	Tech
Aryan	Editor
Swaroop	Janitor
Sumukh	Janitor
*/
-- Display all departments and the employees working in them using a RIGHT OUTER JOIN.
SELECT 
  e.emp_name,
  d.dept_name
FROM Employee e
RIGHT JOIN Department d ON e.dept_id = d.dept_id;

-- Output:
/*  
# emp_name	dept_name
Riyan	IT
Girish	Tech
Aryan	Editor
Swaroop	Janitor
Sumukh	Janitor
*/
-- Create a stored procedure named InsertEmployee that accepts employee details as parameters and inserts a new record into the Employee table.
DELIMITER //
CREATE PROCEDURE InsertEmployee(
  IN eid INT,
  IN ename VARCHAR(25),
  IN eage INT,
  IN esalary DECIMAL(10,2),
  IN edesg VARCHAR(25),
  IN eaddr VARCHAR(25),
  IN edoj DATE,
  IN edept INT
)
BEGIN
  INSERT INTO Employee 
    VALUES (eid, ename, eage, esalary, edesg, eaddr, edoj, edept);
END;
//
DELIMITER ;
CALL InsertEmployee(406, 'Ananya', 24, 45000, 'Developer', 'Bangalore', '2024-11-01', 101);
select * from Employee;
-- Output:
/*  
# emp_id	emp_name	age	salary	designation	address	doj	dept_id
401	Riyan	20	590000.00	CEO	Bangalore	2024-09-15	101
402	Girish	19	99000.00	Manager	Mysore	2024-03-02	102
403	Aryan	18	25000.00	Editor	Global	2024-09-12	103
404	Swaroop	20	10000.00	Employee	Mysore	2024-03-19	104
405	Sumukh	16	2000.00	Worker	Karnataka	2024-10-01	104
406	Ananya	24	45000.00	Developer	Bangalore	2024-11-01	101
*/
-- Create a stored procedure named UpdateSalary that updates an employee’s salary based on their emp_id. Call the procedure to update a specific employee’s salary.
DELIMITER //
CREATE PROCEDURE UpdateSalary(
  IN eid INT,
  IN newsalary DECIMAL(10,2)
)
BEGIN
  UPDATE Employee SET salary = newsalary WHERE emp_id = eid;
END;
//
DELIMITER ;
CALL UpdateSalary(401, 600000);
select * from Employee;
-- Output:
/*  
# emp_id	emp_name	age	salary	designation	address	doj	dept_id
401	Riyan	20	600000.00	CEO	Bangalore	2024-09-15	101
402	Girish	19	99000.00	Manager	Mysore	2024-03-02	102
403	Aryan	18	25000.00	Editor	Global	2024-09-12	103
404	Swaroop	20	10000.00	Employee	Mysore	2024-03-19	104
405	Sumukh	16	2000.00	Worker	Karnataka	2024-10-01	104
406	Ananya	24	45000.00	Developer	Bangalore	2024-11-01	101
*/
-- Create a stored procedure named DeleteEmployee that deletes an employee record from the Employee table based on the given emp_id.
DELIMITER //
CREATE PROCEDURE DeleteEmployee(
  IN eid INT
)
BEGIN
  DELETE FROM Employee WHERE emp_id = eid;
END;
//
DELIMITER ;
CALL DeleteEmployee(405);
select * from Employee;

-- Output:
/*  
# emp_id	emp_name	age	salary	designation	address	doj	dept_id
401	Riyan	20	600000.00	CEO	Bangalore	2024-09-15	101
402	Girish	19	99000.00	Manager	Mysore	2024-03-02	102
403	Aryan	18	25000.00	Editor	Global	2024-09-12	103
404	Swaroop	20	10000.00	Employee	Mysore	2024-03-19	104
406	Ananya	24	45000.00	Developer	Bangalore	2024-11-01	101
*/
-- Comprehensive Query: Employees Over 2 Years
SELECT 
  e.emp_name AS 'Employee Name',
  d.dept_name AS 'Department Name',
  (YEAR(CURDATE()) - YEAR(e.doj)) AS 'Years Worked',
  e.salary AS 'Salary after increment'
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
WHERE (YEAR(CURDATE()) - YEAR(e.doj)) > 2;

-- Output:Null
/*  */

-- Output:
/*  */