-- Lab Experiment 08:
-- Creating,deleting and managing users
-- grant and revoke privileges to users
-- ----------------------------------------------------------------------------------
-- STUDENT NAME: Swaroop R
-- USN: 1RUA24BCA0089
-- SECTION:BCA
-- ----------------------------------------------------------------------------------
SELECT USER(),
       @@hostname AS Host_Name,
       VERSION() AS MySQL_Version,
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command and comment the output by /* Output */.
/* # USER()	Host_Name	MySQL_Version	Current_Date_Time
root@localhost	RVU-PC-055	9.4.0	2025-11-03 12:18:23
*/

-- ----------------------------------------------------------------------------------
-- Task 1 : Creating a user

-- creating 5 different users with 5 different passwords
CREATE USER 'user01'@'localhost' IDENTIFIED BY 'pass123';
CREATE USER 'user02'@'localhost' IDENTIFIED BY 'pass234';
CREATE USER 'user03'@'localhost' IDENTIFIED BY 'pass345';
CREATE USER 'user04'@'localhost' IDENTIFIED BY 'pass456';
CREATE USER 'user05'@'localhost' IDENTIFIED BY 'pass567';

SELECT user, host FROM mysql.user;
/* OUTPUT:
# user	host
mysql.infoschema	localhost
mysql.session	localhost
mysql.sys	localhost
root	localhost
user01	localhost
user02	localhost
user03	localhost
user04	localhost
user05	localhost
*/

-- Task 2 : Alter / Changing the password
ALTER USER 'user03'@'localhost' IDENTIFIED BY 'newpass345';

-- Task 3 : Privileges
 GRANT ALL PRIVILEGES ON *.* TO 'user01'@'localhost';
GRANT SELECT, INSERT ON college.* TO 'user02'@'localhost';
GRANT SELECT ON testdb.* TO 'user03'@'localhost';
GRANT CREATE, DROP ON *.* TO 'user04'@'localhost';
GRANT UPDATE, DELETE ON *.* TO 'user05'@'localhost';

SHOW GRANTS FOR 'user01'@'localhost';
/* OUTPUT:
# Grants for user01@localhost
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE, CREATE ROLE, DROP ROLE ON *.* TO `user01`@`localhost`
GRANT ALLOW_NONEXISTENT_DEFINER,APPLICATION_PASSWORD_ADMIN,AUDIT_ABORT_EXEMPT,AUDIT_ADMIN,AUTHENTICATION_POLICY_ADMIN,BACKUP_ADMIN,BINLOG_ADMIN,BINLOG_ENCRYPTION_ADMIN,CLONE_ADMIN,CONNECTION_ADMIN,CREATE_SPATIAL_REFERENCE_SYSTEM,ENCRYPTION_KEY_ADMIN,FIREWALL_EXEMPT,FLUSH_OPTIMIZER_COSTS,FLUSH_PRIVILEGES,FLUSH_STATUS,FLUSH_TABLES,FLUSH_USER_RESOURCES,GROUP_REPLICATION_ADMIN,GROUP_REPLICATION_STREAM,INNODB_REDO_LOG_ARCHIVE,INNODB_REDO_LOG_ENABLE,OPTIMIZE_LOCAL_TABLE,PASSWORDLESS_USER_ADMIN,PERSIST_RO_VARIABLES_ADMIN,REPLICATION_APPLIER,REPLICATION_SLAVE_ADMIN,RESOURCE_GROUP_ADMIN,RESOURCE_GROUP_USER,ROLE_ADMIN,SENSITIVE_VARIABLES_OBSERVER,SERVICE_CONNECTION_ADMIN,SESSION_VARIABLES_ADMIN,SET_ANY_DEFINER,SHOW_ROUTINE,SYSTEM_USER,SYSTEM_VARIABLES_ADMIN,TABLE_ENCRYPTION_ADMIN,TELEMETRY_LOG_ADMIN,TRANSACTION_GTID_TAG,XA_RECOVER_ADMIN ON *.* TO `user01`@`localhost`
*/

SHOW GRANTS FOR 'user03'@'localhost';
/* OUTPUT:
# Grants for user03@localhost
GRANT USAGE ON *.* TO `user03`@`localhost`
GRANT SELECT ON `testdb`.* TO `user03`@`localhost`
*/

-- Task 4 : Switch the user from root to another (NOT DONE)


-- Task 5 : Revoking all permissions (grant must exist for that user for revoke to work)
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user01'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user02'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user03'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user04'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user05'@'localhost';

FLUSH PRIVILEGES;

-- Task 6 : Drop user
DROP USER 'user01'@'localhost';
DROP USER 'user02'@'localhost';
DROP USER 'user03'@'localhost';
DROP USER 'user04'@'localhost';
DROP USER 'user05'@'localhost';

SELECT user, host FROM mysql.user;
-- OUTPUT:
/*# user	host
mysql.infoschema	localhost
mysql.session	localhost
mysql.sys	localhost
root	localhost
*/
-- ----------------------------------------------------------------------------------
-- END OF EXPERIMENT
-- ----------------------------------------------------------------------------------
