/*----------------------------------------------------------------
Project Name: HR Management System
Module: Master Tables
Script Name: 005_Create_Designation_Table.sql
Author: Sumit
Purpose: Create Designation master table
Dependencies: 001_Create_Database.sql
              002_Create_Schemas.sql
Execution Order: 005
------------------------------------------------------------------*/

USE HRManagementSystem;
GO

IF OBJECT_ID('hr.Designation') IS NOT NULL
BEGIN
  DROP TABLE hr.Designation;
END;
GO

CREATE TABLE hr.Designation
(
  DesignationID INT IDENTITY(1,1) NOT NULL,
  DesignationCode VARCHAR(20) NOT NULL,
  DesignationName NVARCHAR(100) NOT NULL,
  Description NVARCHAR(500) NULL,
  IsActive BIT NOT NULL
    CONSTRAINT DF_Designation_IsActive DEFAULT(1),
  CreatedDate DATETIME2(0) NOT NULL
    CONSTRAINT DF_Designation_CreatedDate DEFAULT(SYSDATETIME()),
  ModifiedDate DATETIME2(0) NULL

  CONSTRAINT PK_Designation PRIMARY KEY
    CLUSTERED (DesignationID),
  CONSTRAINT UQ_Designation_DesignationCode
    UNIQUE(DesignationCode),
  CONSTRAINT UQ_Designation_DesignationName
    UNIQUE(DesignationName)
);
GO
-------------------------VERIFY TABLE-----------------------
SP_HELP 'hr.Designation'
------------------------INSERT SAMPLE DATA------------------

INSERT INTO hr.Designation
(
  DesignationCode,
  DesignationName,
  Description
)
VALUES 
('CEO', 'Chief Executive Officer', 'Head of organization'),
('MGR', 'Manager', 'Manages a team or department'),
('SDA', 'Senior Data Analyst', 'Performs advanced data analytics'),
('SDE', 'Software Developer', 'Develops software applications'),
('HRE', 'HR Executive', 'Handles HR Operations'),
('ACC', 'Accountant', 'Manages financial records')

SELECT * FROM hr.Designation;

------------------------CHECK DUPLICATE INSERTS---------------------
INSERT INTO hr.Designation (DesignationCode, DesignationName) VALUES ('CEO', 'Chief Technology Officer')
INSERT INTO hr.Designation (DesignationCode, DesignationName) VALUES('CTO', 'Chief Technology Officer')