create database HospitalManagement;
use HospitalManagement;

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(20)
);

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(20),
    DoctorID INT,
    BillAmount DECIMAL(10, 2),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

INSERT INTO Doctors VALUES
(10, 'Dr. Patel'),
(20, 'Dr. Sharma'),
(30, 'Dr. Khan'),
(40, 'Dr. Adams'); 

INSERT INTO Patients VALUES
(1001, 'Anil Varma', 10, 500.00), 
(1002, 'Bhavana Roy', 20, 1250.50), 
(1003, 'Chetan Desai', 10, 800.00), 
(1004, 'Disha Malik', 30, 300.75), 
(1005, 'Eshaan Kaur', 20, 750.00); 

-- 1. Patient names with doctor names.
SELECT p.PatientName, d.DoctorName
FROM Patients p
INNER JOIN Doctors d ON p.DoctorID = d.DoctorID;
/* OUTPUT:
# PatientName	DoctorName
Anil Varma	Dr. Patel
Chetan Desai	Dr. Patel
Bhavana Roy	Dr. Sharma
Eshaan Kaur	Dr. Sharma
Disha Malik	Dr. Khan
*/

-- 2. All doctors and their patients.
SELECT d.DoctorName, p.PatientName
FROM Patients p
RIGHT JOIN Doctors d ON p.DoctorID = d.DoctorID;
/* OUTPUT:
# DoctorName	PatientName
Dr. Patel	Anil Varma
Dr. Patel	Chetan Desai
Dr. Sharma	Bhavana Roy
Dr. Sharma	Eshaan Kaur
Dr. Khan	Disha Malik
Dr. Adams	
*/

-- 3. Total number of patients per doctor.
SELECT d.DoctorName, COUNT(p.PatientID) AS TotalPatients
FROM Doctors d
LEFT JOIN Patients p ON d.DoctorID = p.DoctorID
GROUP BY d.DoctorName;
/* OUTPUT:
# DoctorName	TotalPatients
Dr. Patel	2
Dr. Sharma	2
Dr. Khan	1
Dr. Adams	0
*/

-- 4. Total bill collected.
SELECT SUM(BillAmount) AS Total FROM Patients;
-- OUTPUT: 3601.25

-- 5. Average bill per patient.
SELECT AVG(BillAmount) AS AvgBill FROM Patients;
-- OUTPUT: 720.250000
