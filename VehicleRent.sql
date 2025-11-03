create database VehicleRent;
use VehicleRent;

CREATE TABLE Customers (
    CustID INT PRIMARY KEY,
    CustName VARCHAR(25)
);

CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY,
    Model VARCHAR(50),
    RentPerDay DECIMAL(10, 2)
);

CREATE TABLE Rentals (
    RentalID INT PRIMARY KEY,
    CustID INT,
    VehicleID INT,
    TotalRent DECIMAL(10, 2),
    FOREIGN KEY (CustID) REFERENCES Customers(CustID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);

INSERT INTO Customers VALUES
(1, 'Amit Shah'),
(2, 'Pooja Reddy'),
(3, 'Vijay Iyer'),
(4, 'Neha Verma');

INSERT INTO Vehicles VALUES
(10, 'Sedan', 50.00),
(20, 'SUV', 80.00),
(30, 'Hatchback', 40.00),
(40, 'Truck', 100.00);

INSERT INTO Rentals VALUES
(1001, 1, 20, 240.00),
(1002, 2, 10, 100.00),
(1003, 1, 30, 80.00),
(1004, 3, 20, 400.00);

-- 1. Customer names and vehicle models.
SELECT c.CustName, v.Model
FROM Customers c
INNER JOIN Rentals r ON c.CustID = r.CustID
INNER JOIN Vehicles v ON r.VehicleID = v.VehicleID;
/* OUTPUT:
# CustName	Model
Amit Shah	SUV
Amit Shah	Hatchback
Pooja Reddy	Sedan
Vijay Iyer	SUV
*/

-- 2. All customers and rentals.
SELECT c.CustName, r.RentalID
FROM Customers c
LEFT JOIN Rentals r ON c.CustID = r.CustID;
/* OUTPUT:
# CustName	RentalID
Amit Shah	1001
Amit Shah	1003
Pooja Reddy	1002
Vijay Iyer	1004
Neha Verma	
*/

-- 3. Total rentals per vehicle.
SELECT v.Model, COUNT(r.RentalID) AS TotalRentals
FROM Vehicles v
LEFT JOIN Rentals r ON v.VehicleID = r.VehicleID
GROUP BY v.Model;
/* OUTPUT:
# Model	TotalRentals
Sedan	1
SUV	2
Hatchback	1
Truck	0
*/

-- 4. Total rent collected.
SELECT SUM(TotalRent) AS TotalRent FROM Rentals;
-- OUTPUT: 820.00

-- 5. Average rent per vehicle.
SELECT AVG(TotalRent) AS AverageRent FROM Rentals;
-- OUTPUT: 205.000000