Create database Student_Marks;
use Student_Marks;

Create table Student (
USN varchar(15) Primary Key,
Name varchar(20),
Age int ,
Course varchar(20),
M1 int,
M2 int,
M3 int
);

Desc Student;
-- Output:
/*  
USN	varchar(15)	NO	PRI		
Name	varchar(20)	YES			
Age	int	YES			
Course	varchar(20)	YES			
M1	int	YES			
M2	int	YES			
M3	int	YES			
*/

INSERT INTO Student (USN, Name, Age, Course, M1, M2, M3) VALUES
('1RUA24BCA028', 'Girish', 18, 'BCA', 79, 85, 69),
('1RUA24BCA014', 'Aryan', 17, 'BCA', 34, 55, 100),
('1RUA24BCA075', 'Riyan', 18, 'BCA', 82, 78, 94),
('1RUA24BCA089', 'Swaroop', 18, 'BCA', 32, 35, 41),
('1RUA24BCA086', 'Sumukh', 19, 'BCA', 38, 79, 7),
('1RUA24SCS025', 'Deep', 20, 'BSc', 78, 69, 85),
('1RUA24SCS034', 'Indranil', 21, 'BSc', 98, 99, 95),
('1RUAZYBBA008', 'Avani', 19, 'BBA', 88, 92, 100),
('1RUA24BBA058', 'Ojal', 21, 'BBA', 85, 95, 19),
('1RUA24BBA041', 'Piyush', 17, 'BBA', 17, 19, 28);

SELECT * FROM Student;

-- Output:
/*  
1RUA24BBA041	Piyush	17	BBA	17	19	28
1RUA24BBA058	Ojal	21	BBA	85	95	19
1RUA24BCA014	Aryan	17	BCA	34	55	100
1RUA24BCA028	Girish	18	BCA	79	85	69
1RUA24BCA075	Riyan	18	BCA	82	78	94
1RUA24BCA086	Sumukh	19	BCA	38	79	7
1RUA24BCA089	Swaroop	18	BCA	32	35	41
1RUA24SCS025	Deep	20	BSc	78	69	85
1RUA24SCS034	Indranil	21	BSc	98	99	95
1RUAZYBBA008	Avani	19	BBA	88	92	100
						*/

ALTER TABLE Student
ADD (
    Total INT,
    Avg NUMERIC(5,2),
    Result VARCHAR(10)
);

UPDATE Student
SET Total = M1 + M2 + M3;        

UPDATE Student
SET Avg = Total / 3;

UPDATE Student
SET Result = 'Pass'
WHERE M1 >= 35 AND M2 >= 35 AND M3 >= 35;

UPDATE Student
SET Result = 'Fail'
WHERE M1 < 35 OR M2 < 35 OR M3 < 35;

SELECT * FROM Student;

-- Output
/* 
 1RUA24BBA041	Piyush	17	BBA	17	19	28	64	21.33	
1RUA24BBA058	Ojal	21	BBA	85	95	19	199	66.33	
1RUA24BCA014	Aryan	17	BCA	34	55	100	189	63.00	
1RUA24BCA028	Girish	18	BCA	79	85	69	233	77.67	Pass
1RUA24BCA075	Riyan	18	BCA	82	78	94	254	84.67	Pass
1RUA24BCA086	Sumukh	19	BCA	38	79	7	124	41.33	
1RUA24BCA089	Swaroop	18	BCA	32	35	41	108	36.00	
1RUA24SCS025	Deep	20	BSc	78	69	85	232	77.33	Pass
1RUA24SCS034	Indranil	21	BSc	98	99	95	292	97.33	Pass
1RUAZYBBA008	Avani	19	BBA	88	92	100	280	93.33	Pass
									 */