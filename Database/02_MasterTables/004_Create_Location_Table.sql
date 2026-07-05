/*------------------------------------------------------------------
Project Name: HR Management System
Module: Master Tables
Script Name: 004_Create_Location_Table.sql
Author: Sumit
Created Date: 05-07-2026
Purpose: Create Location master table
Dependencies: 001_Create_Database.sql
              002_Schemas.sql
Execution Order: 004
--------------------------------------------------------------------*/

USE HRManagementSystem;
GO

IF OBJECT_ID('hr.Location') IS NOT NULL
BEGIN
  DROP TABLE hr.Location;
END;
GO

CREATE TABLE hr.Location 
(
  LocationID INT IDENTITY(1,1) NOT NULL,
  LocationCode VARCHAR(20) NOT NULL,
  LocationName NVARCHAR(100) NOT NULL,
  City NVARCHAR(100) NOT NULL,
  [State] NVARCHAR(100) NOT NULL,
  Country NVARCHAR(100) NOT NULL,
  IsActive BIT NOT NULL
    CONSTRAINT DF_Location_IsActive DEFAULT(1),
  CreatedDate DATETIME2(0) NOT NULL
    CONSTRAINT DF_Location_CreatedDate DEFAULT(SYSDATETIME()),
  ModifiedDate DATETIME2(0) NULL

  CONSTRAINT PK_Location 
    PRIMARY KEY CLUSTERED(LocationID),
  
  CONSTRAINT UQ_Location_LocationName
    UNIQUE(LocationName)
);
GO

-----------------------VERIFY THE TABLE-----------------------------

SP_HELP 'hr.Location'

-----------------------INSERT SAMPLE DATA---------------------------

INSERT INTO hr.[Location]
(
  LocationCode,
  LocationName,
  City,
  [State],
  Country
)
VALUES
('DEL', 'Delhi Head Office', 'New Delhi', 'Delhi', 'India'),
('MUM', 'Mumbai Office', 'Mumbai', 'Maharashtra', 'India'),
('BLR', 'Banglore Office', 'Bangalore', 'Karnataka', 'India'),
('MNS', 'Manesar Warehouse', 'Gurugram', 'Haryana', 'India')
GO

SELECT * FROM hr.[Location];