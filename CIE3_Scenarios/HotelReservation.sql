create database HotelReservation;
use HotelReservation;

CREATE TABLE Guests (
    GuestID INT PRIMARY KEY,
    GuestName VARCHAR(20)
);

CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY,
    RoomType VARCHAR(20),
    Price DECIMAL(10, 2)
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    GuestID INT,
    RoomID INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (GuestID) REFERENCES Guests(GuestID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);

INSERT INTO Guests VALUES
(1, 'Priya'),
(2, 'Rahul'),
(3, 'Sonia'),
(4, 'Vivek');

INSERT INTO Rooms VALUES
(101, 'Standard', 150.00),
(102, 'Deluxe', 250.00),
(201, 'Suite', 400.00),
(202, 'Standard', 150.00);

INSERT INTO Bookings VALUES
(8001, 1, 102, 500.00),
(8002, 2, 201, 400.00),
(8003, 1, 101, 450.00),
(8004, 3, 102, 750.00);

-- 1. Guest names and room types.
SELECT g.GuestName, r.RoomType
FROM Guests g
INNER JOIN Bookings b ON g.GuestID = b.GuestID
INNER JOIN Rooms r ON b.RoomID = r.RoomID;
/* OUTPUT:
# GuestName	RoomType
Priya	Deluxe
Priya	Standard
Rahul	Suite
Sonia	Deluxe
*/

-- 2. All rooms and their bookings.
SELECT r.RoomType, b.BookingID
FROM Rooms r
LEFT JOIN Bookings b ON r.RoomID = b.RoomID;
/* OUTPUT:
# RoomType	BookingID
Standard	8003
Deluxe	8001
Deluxe	8004
Suite	8002
Standard	
*/

-- 3. Number of bookings per room type.
SELECT r.RoomType, COUNT(b.BookingID) AS TotalBookings
FROM Rooms r
LEFT JOIN Bookings b ON r.RoomID = b.RoomID
GROUP BY r.RoomType;
/* OUTPUT:
# RoomType	TotalBookings
Standard	1
Deluxe	2
Suite	1
*/

-- 4. Maximum room price.
SELECT MAX(Price) AS MaxRoomPrice FROM Rooms;
-- OUTPUT: 400.00

-- 5. Total revenue.
SELECT SUM(Amount) AS TotalRevenue FROM Bookings;
-- OUTPUT: 2100.00