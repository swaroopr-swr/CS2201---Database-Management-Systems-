create database BankingSystem;
use BankingSystem;

CREATE TABLE Customers (
    CustID INT PRIMARY KEY,
    CustName VARCHAR(50)
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustID INT,
    Balance DECIMAL(10, 2),
    FOREIGN KEY (CustID) REFERENCES Customers(CustID)
);

CREATE TABLE Transactions (
    TransID INT PRIMARY KEY,
    AccountID INT,
    Amount DECIMAL(10, 2), 
    TransDate DATE,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

INSERT INTO Customers VALUES
(1, 'Rita Das'),
(2, 'Suresh Kumar'),
(3, 'Tina Iyer'),
(4, 'Vikram Sen');

INSERT INTO Accounts VALUES
(101, 1, 5500.00),
(102, 2, 12000.00),
(103, 1, 150.00),
(104, 3, 800.00);

INSERT INTO Transactions VALUES
(10001, 101, 500.00, '2024-11-01'),
(10002, 102, -2000.00, '2024-11-02'),
(10003, 101, -50.00, '2024-11-03'),
(10004, 104, 100.00, '2024-11-04'),
(10005, 102, 1000.00, '2024-11-05');

-- 1. Customer names and their account balances.
SELECT c.CustName, a.Balance
FROM Customers c
INNER JOIN Accounts a ON c.CustID = a.CustID;
/* OUTPUT:
# CustName	Balance
Rita Das	5500.00
Rita Das	150.00
Suresh Kumar	12000.00
Tina Iyer	800.00
*/

-- 2. All accounts and their transactions.
SELECT a.AccountID, t.Amount
FROM Accounts a
LEFT JOIN Transactions t ON a.AccountID = t.AccountID;
/* OUTPUT:
# AccountID	Amount
101	500.00
101	-50.00
103	
102	-2000.00
102	1000.00
104	100.00
*/

-- 3. Total transaction amount per account.
SELECT a.AccountID, SUM(t.Amount) AS TotalTransaction
FROM Accounts a
LEFT JOIN Transactions t ON a.AccountID = t.AccountID
GROUP BY a.AccountID;
/* OUTPUT:
# AccountID	TotalTransaction
101	450.00
102	-1000.00
103	
104	100.00
*/

-- 4. Highest balance.
SELECT MAX(Balance) AS HighestBalance FROM Accounts;
-- OUTPUT: 12000.00

-- 5. Total deposit amount of all customers.
SELECT SUM(Balance) AS TotalDeposits FROM Accounts;
-- OUTPUT: 18450.00