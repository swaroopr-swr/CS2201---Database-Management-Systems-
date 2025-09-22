-- Lab Experiment 05: To implement different types of joins: Inner Join, Outer Join (Left, Right, Full), and Natural Join.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: SWAROOP R
-- USN: 1RUA24BCA0089
-- SECTION: BCA
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Write your code below this line along with the output 
-- Ouptut: 
/*  
# USER()	Host_Name	MySQL_Version	Current_Date_Time
root@localhost	RVU-PC-051	8.4.6	2025-09-22 11:26:20
*/
create database Lab005;
use Lab005;
-- table 01: Customers
-- CREATE  a TABLE named Customers (customer_id INT PRIMARY KEY,customer_name VARCHAR(50),city VARCHAR(50)
create table Customers (
customer_id int Primary key,
customer_name varchar(50),
city varchar(50));
-- insert 5 records
insert into Customers values 
(501, 'Riyan Shrestha', 'KTM'),
(502, 'Girish Servi', 'Rajasthan'),
(503, 'Swaroop R', 'Bangalore'),
(504, 'Sumukh', 'Bangalore'),
(505, 'Aryan Yadav', 'UP');
-- TABLE:02 Orders Table
-- CREATE a TABLE named Orders (order_id INT PRIMARY KEY,customer_id INT foreign key,product_name VARCHAR(50),order_date DATE,
create table Orders (
order_id int Primary key,
customer_id int ,
product_name varchar(50),
order_date date,
foreign key(customer_id) references Customers(customer_id));
    -- insert 5 records
insert into Orders values 
(201, 501, 'Telephone', '2025-10-01'),
(202, 502, 'Copper wire', '2025-06-02'),
(203, 503, 'Wired headphones', '2025-03-12'),
(204, 504, 'Monitor', '2025-01-19'),
(205, 505, 'Ps controller', '2025-09-11');

-- TASK FOR STUDENTS 
select * from Customers;
-- Ouput:
/*  
# customer_id	customer_name	city
501	Riyan Shrestha	KTM
502	Girish Servi	Rajasthan
503	Swaroop R	Bangalore
504	Sumukh	Bangalore
505	Aryan Yadav	UP
*/
 select * from Orders;
 -- Output:
 /*  
 # order_id	customer_id	product_name	order_date
201	501	Telephone	2025-10-01
202	502	Copper wire	2025-06-02
203	503	Wired headphones	2025-03-12
204	504	Monitor	2025-01-19
205	505	Ps controller	2025-09-11
*/
-- Write and Execute Queries

-- 1. Inner Join – 
-- Find all orders placed by customers from the city "Bangalore."
select * 
from Orders, Customers
where Customers.customer_id = Orders.customer_id having customers.city ='Bangalore';
-- Output:
/*  
# order_id	customer_id	product_name	order_date	customer_id	customer_name	city
203	503	Wired headphones	2025-03-12	503	Swaroop R	Bangalore
204	504	Monitor	2025-01-19	504	Sumukh	Bangalore
*/
-- List all customers with the products they ordered.
select Customers.customer_id, Customers.customer_name, Orders.order_date
from Customers, Orders
where Customers.customer_id = Orders.customer_id;
-- Output:
/*  
# customer_id	customer_name	order_date
501	Riyan Shrestha	2025-10-01
502	Girish Servi	2025-06-02
503	Swaroop R	2025-03-12
504	Sumukh	2025-01-19
505	Aryan Yadav	2025-09-11
*/
-- Show customer names and their order dates.
select Customers.customer_name, Orders.order_date
from Customers, Orders
where Customers.customer_id = Orders.customer_id;
-- Output:
/*  
# customer_name	order_date
Riyan Shrestha	2025-10-01
Girish Servi	2025-06-02
Swaroop R	2025-03-12
Sumukh	2025-01-19
Aryan Yadav	2025-09-11
*/
-- Display order IDs with the corresponding customer names.
select Orders.order_id, Customers.customer_name
from Orders, Customers
where Customers.customer_id = Orders.customer_id;
-- Output:
/*  
# order_id	customer_name
201	Riyan Shrestha
202	Girish Servi
203	Swaroop R
204	Sumukh
205	Aryan Yadav
*/
-- Find the number of orders placed by each customer.
select count(Orders.order_id) as total_order, Customers.customer_name
from Orders, Customers
where Customers.customer_id = Orders.customer_id
group by Customers.customer_name; 
-- Output:
/*  
# total_order	customer_name
1	Riyan Shrestha
1	Girish Servi
1	Swaroop R
1	Sumukh
1	Aryan Yadav
*/
-- Show city names along with the products ordered by customers.
select Customers.city, Orders.product_name, Customers.customer_name
from Customers, Orders
where Customers.customer_id = Orders.customer_id;
-- Output:
/*  
# city	product_name	customer_name
KTM	Telephone	Riyan Shrestha
Rajasthan	Copper wire	Girish Servi
Bangalore	Wired headphones	Swaroop R
Bangalore	Monitor	Sumukh
UP	Ps controller	Aryan Yadav
*/



/* 
2  Left Outer Join –*/
-- Find all customers and their orders, even if a customer has no orders.
select c.customer_id, c.customer_name, o.order_id, o.product_name
from Customers c
left join Orders o on c.customer_id = o.customer_id;
-- Output:
/*  
# customer_id	customer_name	order_id	product_name
501	Riyan Shrestha	201	Telephone
502	Girish Servi	202	Copper wire
503	Swaroop R	203	Wired headphones
504	Sumukh	204	Monitor
505	Aryan Yadav	205	Ps controller
*/
-- List all customers and the products they ordered.
select c.customer_name, o.product_name
from Customers c
left join Orders o on c.customer_id = o.customer_id;
-- Output:
/*  
# customer_name	product_name
Riyan Shrestha	Telephone
Girish Servi	Copper wire
Swaroop R	Wired headphones
Sumukh	Monitor
Aryan Yadav	Ps controller
*/
-- Show customer IDs, names, and their order IDs.
select c.customer_id, c.customer_name, o.order_id
from Customers c
left join Orders o on c.customer_id = o.customer_id;
-- Output:
/*  
# customer_id	customer_name	order_id
501	Riyan Shrestha	201
502	Girish Servi	202
503	Swaroop R	203
504	Sumukh	204
505	Aryan Yadav	205
*/
-- Find the total number of orders (if any) placed by each customer.
select c.customer_name, count(o.order_id) as Total_Order
from Customers c
left join Orders o on c.customer_id = o.customer_id
group by c.customer_name;
-- Output:
/*  
# customer_name	Total_Order
Riyan Shrestha	1
Girish Servi	1
Swaroop R	1
Sumukh	1
Aryan Yadav	1
*/
-- Retrieve customers who have not placed any orders.
select c.customer_name
from Customers c
left join Orders o on c.customer_id = o.customer_id
where o.order_id is null;
-- Output:Null
/*  */
-- Display customer names with their order dates.
select c.customer_name, o.order_date
from Customers c
left join Orders o on c.customer_id = o.customer_id;
-- Output:
/*  
# customer_name	order_date
Riyan Shrestha	2025-10-01
Girish Servi	2025-06-02
Swaroop R	2025-03-12
Sumukh	2025-01-19
Aryan Yadav	2025-09-11
*/
-- Write your code below this line along with the output 
-- Output:
/*  */
 
-- 3: Right Outer Join – 
-- Find all orders and their corresponding customers, even if an order doesn't have a customer associated with it.
select * 
from Customers c
right join Orders o on c.customer_id = o.customer_id;
-- Show all orders with the customer names.
select o.order_id, o.product_name, c.customer_name
from Customers c
right join Orders o on c.customer_id = o.customer_id;
-- Output:
/*  
# order_id	product_name	customer_name
201	Telephone	Riyan Shrestha
202	Copper wire	Girish Servi
203	Wired headphones	Swaroop R
204	Monitor	Sumukh
205	Ps controller	Aryan Yadav
*/
-- Display product names with the customers who ordered them.
select c.customer_name, o.product_name
from Customers c
right join Orders o on c.customer_id = o.customer_id;
-- Output:
/*  
# customer_name	product_name
Riyan Shrestha	Telephone
Girish Servi	Copper wire
Swaroop R	Wired headphones
Sumukh	Monitor
Aryan Yadav	Ps controller
*/
-- List order IDs with customer cities.
select o.order_id, c.city
from Customers c
right join Orders o on c.customer_id = o.customer_id;
-- Output:
/*  
# order_id	city
201	KTM
202	Rajasthan
203	Bangalore
204	Bangalore
205	UP
*/
-- Find the number of orders per customer (include those without orders).
select c.customer_name, count(o.order_id) as total_orders
from Customers c
right join Orders o on c.customer_id = o.customer_id
group by c.customer_name;
-- Output:
/*  
# customer_name	total_orders
Riyan Shrestha	1
Girish Servi	1
Swaroop R	1
Sumukh	1
Aryan Yadav	1
*/
-- Retrieve customers who do not have any matching orders.
select c.customer_name
from Customers c
right join Orders o on c.customer_id = o.customer_id
where o.order_id is null;
-- Output:Null
/*  */
-- Write your code below this line along with the output 
-- Output:
/*  */


/* 4: Full Outer Join –  */
-- Find all customers and their orders, including those customers with no orders and orders without a customer.
select c.customer_id, c.customer_name, o.order_id, o.product_name
from Customers c
left join Orders o on c.customer_id = o.customer_id
union
select c.customer_id, c.customer_name, o.order_id, o.product_name
from Customers c
right join Orders o on c.customer_id = o.customer_id;
-- Output:
/*  
# customer_id	customer_name	order_id	product_name
501	Riyan Shrestha	201	Telephone
502	Girish Servi	202	Copper wire
503	Swaroop R	203	Wired headphones
504	Sumukh	204	Monitor
505	Aryan Yadav	205	Ps controller
*/
-- List all customers and products, whether they placed an order or not.
select c.customer_id, o.product_name
from Customers c
left join Orders o on c.customer_id = o.customer_id
union
select c.customer_id, o.product_name
from Customers c
right join Orders o on c.customer_id = o.customer_id;
-- Output:
/*  
# customer_id	product_name
501	Telephone
502	Copper wire
503	Wired headphones
504	Monitor
505	Ps controller
*/
-- Show customer IDs with order IDs (include unmatched ones).
select c.customer_id, o.order_id
from Customers c
left join Orders o on c.customer_id = o.customer_id
union
select c.customer_id, o.order_id
from Customers c
right join Orders o on c.customer_id = o.customer_id;
-- Output:
/*  
# customer_id	order_id
501	201
502	202
503	203
504	204
505	205
*/
-- Display customer names with order dates.
select c.customer_name, o.order_date
from Customers c
left join Orders o on c.customer_id = o.customer_id
union
select c.customer_name, o.order_date
from Customers c
right join Orders o on c.customer_id = o.customer_id;
-- Output:
/*  
# customer_name	order_date
Riyan Shrestha	2025-10-01
Girish Servi	2025-06-02
Swaroop R	2025-03-12
Sumukh	2025-01-19
Aryan Yadav	2025-09-11
*/
-- Find all unmatched records (customers without orders and orders without customers).
select c.customer_id, c.customer_name, o.order_id, o.product_name
from Customers c
left join Orders o on c.customer_id = o.customer_id
where o.order_id is null
union
select c.customer_id, c.customer_name, o.order_id, o.product_name
from Customers c
right join Orders o on c.customer_id = o.customer_id
where c.customer_id is null;
-- Output:Null
/*  */
-- Show customer cities with products.
select c.city, o.product_name
from Customers c
left join Orders o on c.customer_id = o.customer_id
union
select c.city, o.product_name
from Customers c
right join Orders o on c.customer_id = o.customer_id;
-- Output:
/*  
# city	product_name
KTM	Telephone
Rajasthan	Copper wire
Bangalore	Wired headphones
Bangalore	Monitor
UP	Ps controller
*/
-- Write your code below this line along with the output 
-- Output:
/*  */

/* 5: Natural Join –  */

-- Find all orders placed by customers.
select * 
from Customers
natural join Orders;
-- Output:
/*  
# customer_id	customer_name	city	order_id	product_name	order_date
501	Riyan Shrestha	KTM	201	Telephone	2025-10-01
502	Girish Servi	Rajasthan	202	Copper wire	2025-06-02
503	Swaroop R	Bangalore	203	Wired headphones	2025-03-12
504	Sumukh	Bangalore	204	Monitor	2025-01-19
505	Aryan Yadav	UP	205	Ps controller	2025-09-11
*/

-- List all customers with the products they ordered using NATURAL JOIN.
select customer_name, product_name
from Customers
natural join Orders;
-- Output:
/*  
# customer_name	product_name
Riyan Shrestha	Telephone
Girish Servi	Copper wire
Swaroop R	Wired headphones
Sumukh	Monitor
Aryan Yadav	Ps controller
*/

-- Show customer names along with their order dates using NATURAL JOIN.
select customer_name, order_date
from Customers
natural join Orders;
-- Output:
/*  
# customer_name	order_date
Riyan Shrestha	2025-10-01
Girish Servi	2025-06-02
Swaroop R	2025-03-12
Sumukh	2025-01-19
Aryan Yadav	2025-09-11
*/

-- Find all customer cities and the products ordered by those customers using NATURAL JOIN.
select city, product_name
from Customers
natural join Orders;
-- Output:
/*  
# city		product_name
KTM		Telephone
Rajasthan	Copper wire
Bangalore	Wired headphones
Bangalore	Monitor
UP		Ps controller
*/
  -- END OF THE EXPERIMENT