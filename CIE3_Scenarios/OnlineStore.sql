create database OnlineStore;
use OnlineStore;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers VALUES
(1, 'Sara'),
(2, 'Tom'),
(3, 'Kelly'),
(4, 'Lee'); 

INSERT INTO Orders VALUES
(1001, 1, '2024-05-10', 45.99), 
(1002, 2, '2024-05-15', 120.50), 
(1003, 1, '2024-05-20', 88.00), 
(1004, 3, '2024-05-22', 25.75), 
(1005, 2, '2024-05-25', 50.00); 

-- 1. Customer names and order dates.
SELECT c.CustomerName, o.OrderDate
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;
/* OUTPUT:
# CustomerName	OrderDate
Sara	2024-05-10
Sara	2024-05-20
Tom	2024-05-15
Tom	2024-05-25
Kelly	2024-05-22
*/

-- 2. All customers including those without orders.
SELECT c.CustomerName, o.OrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;
/* OUTPUT:
# CustomerName	OrderDate
Sara	2024-05-10
Sara	2024-05-20
Tom	2024-05-15
Tom	2024-05-25
Kelly	2024-05-22
Lee	
*/

-- 3. Total sales per customer.
SELECT c.CustomerName, SUM(o.TotalAmount) AS TotalSales
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;
/* OUTPUT:
# CustomerName	TotalSales
Sara	133.99
Tom	170.50
Kelly	25.75
Lee	
*/

-- 4. Maximum order amount.
SELECT MAX(TotalAmount) AS MaxOrderAmount FROM Orders;
-- OUTPUT: 120.50

-- 5. Average order amount.
SELECT AVG(TotalAmount) AS AvgOrderAmount FROM Orders;
-- OUTPUT: 66.048000