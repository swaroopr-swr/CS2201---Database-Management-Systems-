create database RestaurantMgmt;
use RestaurantMgmt;

CREATE TABLE Customers (
    CustID INT PRIMARY KEY,
    CustName VARCHAR(25)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustID) REFERENCES Customers(CustID)
);

CREATE TABLE MenuItems (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(50),
    Price DECIMAL(10, 2)
);

CREATE TABLE OrderDetails (
    DetailID INT PRIMARY KEY,
    OrderID INT,
    ItemID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ItemID) REFERENCES MenuItems(ItemID)
);

INSERT INTO Customers VALUES
(1, 'Gaurav Jain'),
(2, 'Shreya Das'),
(3, 'Rohan Kapoor'),
(4, 'Tanya Verma');

INSERT INTO MenuItems VALUES
(101, 'Burger', 8.50),
(102, 'Fries', 3.00),
(103, 'Pizza', 15.00),
(104, 'Salad', 7.00);

INSERT INTO Orders VALUES
(100, 1, '2025-10-25', 20.50),
(101, 2, '2025-10-25', 15.00),
(102, 1, '2025-10-26', 16.00),
(103, 3, '2025-10-27', 30.00);

INSERT INTO OrderDetails VALUES
(5001, 100, 101, 1),
(5002, 100, 102, 4),
(5003, 101, 103, 1),
(5004, 102, 104, 1),
(5005, 102, 101, 1),
(5006, 103, 103, 2);

-- 1. Order details with customer names.
SELECT o.OrderID, c.CustName, o.TotalAmount
FROM Orders o
INNER JOIN Customers c ON o.CustID = c.CustID;
/* OUTPUT:
# OrderID	CustName	TotalAmount
100	Gaurav Jain	20.50
102	Gaurav Jain	16.00
103	Rohan Kapoor	30.00
101	Shreya Das	15.00
*/

-- 2. All menu items and their orders.
SELECT m.ItemName, od.OrderID
FROM MenuItems m
LEFT JOIN OrderDetails od ON m.ItemID = od.ItemID;
/* OUTPUT:
# ItemName	OrderID
Burger	100
Burger	102
Fries	100
Pizza	101
Pizza	103
Salad	102
*/

-- 3. Total quantity sold per item.
SELECT m.ItemName, SUM(od.Quantity) AS TotalQuantitySold
FROM MenuItems m
LEFT JOIN OrderDetails od ON m.ItemID = od.ItemID
GROUP BY m.ItemName;
/* OUTPUT:
# ItemName	TotalQuantitySold
Burger	2
Fries	4
Pizza	3
Salad	1
*/

-- 4. Highest total order amount.
SELECT MAX(TotalAmount) AS HighestOrderAmount FROM Orders;
-- OUTPUT: 30.00

-- 5. Average item price.
SELECT AVG(Price) AS AvgItemPrice FROM MenuItems;
-- OUTPUT: 8.375000