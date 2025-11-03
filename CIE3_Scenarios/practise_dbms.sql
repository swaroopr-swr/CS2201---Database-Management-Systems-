-- Lab Experiment 08:
-- Creating,deleting and managing users
-- grant and revoke privileges to users
-- ----------------------------------------------------------------------------------
-- STUDENT NAME: Swaroop R
-- USN: 1RUA24BCA0089
-- SECTION:
-- ----------------------------------------------------------------------------------
SELECT USER(),
       @@hostname AS Host_Name,
       VERSION() AS MySQL_Version,
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command and comment the output by /* Output */.

/* # USER()	Host_Name	MySQL_Version	Current_Date_Time
root@localhost	Swaroops-MacBook-Air.local	9.4.0	2025-11-03 11:51:35
*/

-- ----------------------------------------------------------------------------------
-- Task 1 : Creating a user

-- creating 5 different users with 5 different passwords
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'Password@123';
CREATE USER 'user2'@'localhost' IDENTIFIED BY 'Pass@123';
CREATE USER 'user3'@'localhost' IDENTIFIED BY 'Password@122';
CREATE USER 'user4'@'localhost' IDENTIFIED BY 'Password@133';
CREATE USER 'user5'@'localhost' IDENTIFIED BY 'Password@144';

-- Task 2 : Alter / Changing the password
ALTER USER 'user1'@'localhost' identified BY 'NewPass@123';
ALTER USER 'user2'@'localhost' identified BY 'NewPass@456';
ALTER USER 'user3'@'localhost' identified BY 'NewPass@345';
ALTER USER 'user4'@'localhost' identified BY 'NewPass@234';
ALTER USER 'user5'@'localhost' identified BY 'NewPass@324';


-- Task 3 : Privileges
GRANT ALL PRIVILEGES ON *.* TO 'user1'@'localhost' WITH GRANT OPTION;

-- Task 4 : Switch the user from root to another (NOT DONE)
GRANT SELECT, INSERT, UPDATE ON *.* TO 'user2'@'localhost';
GRANT SELECT ON *.* TO 'user3'@'localhost';
GRANT INSERT, UPDATE ON *.* TO 'user4'@'localhost';
GRANT CREATE, DROP ON *.* TO 'user5'@'localhost';

-- Task 5 : Revoking all permissions (grant must exist for that user for revoke to work)
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user1'@'localhost';
REVOKE ALL PRIVILEGES ON *.* FROM 'user2'@'localhost';
REVOKE ALL PRIVILEGES ON *.* FROM 'user3'@'localhost';
REVOKE ALL PRIVILEGES ON *.* FROM 'user4'@'localhost';
REVOKE ALL PRIVILEGES ON *.* FROM 'user5'@'localhost';

-- Apply revokes
FLUSH PRIVILEGES;

-- Verify revokes (optional)
SHOW GRANTS FOR 'user1'@'localhost';
SHOW GRANTS FOR 'user2'@'localhost';
-- Expected: Only USAGE (no privileges)


-- Task 6 : Drop user
DROP USER 'user1'@'localhost';
DROP USER 'user2'@'localhost';
DROP USER 'user3'@'localhost';
DROP USER 'user4'@'localhost';
DROP USER 'user5'@'localhost';
