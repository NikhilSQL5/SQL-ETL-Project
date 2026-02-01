/*
this script is use to create the database and schema (bronze, silver,gold).
this script check the database exists or not then it drop the database.

note: take a backup before the script execute. 
if the database drop all the data in the database will be permanently deleted
*/

USE master;
GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWareHouse')
/* if the database exists then condition become true*/

BEGIN
	ALTER DATABASE DataWareHouse 
	SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	/* set database to single user mode */
	/*any active connection will be rollback. all the other connection is disconected*/

	DROP DATABASE DataWareHouse;
	/*drop the databse*/
END;
GO

/*create the database*/
CREATE DATABASE DataWareHouse;
GO

/*use database*/
USE DataWareHouse;
GO

/*create bronze schema*/
CREATE SCHEMA bronze;
GO

/*create silver schema*/
CREATE SCHEMA silver;
GO

/*create gold schema*/
CREATE SCHEMA gold;
GO
