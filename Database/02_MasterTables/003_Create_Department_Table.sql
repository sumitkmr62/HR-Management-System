/*------------------------------------------------------------------------
Project Name: HR Management System
Module: Master Tables
Script Name: 003_Create_Department_Table.sql
Author: Sumit
Created Date: 05-07-2026
Purpose: Create Department mster table
Dependencies: 001_Create_Database.sql
              002_Create_Schemas.sql
Execution Order: 003
------------------------------------------------------------------------*/

USE HRManagementSystem;
GO

IF OBJECT_ID (N'hr.Department', N'U') IS NOT NULL
BEGIN
  DROP TABLE hr.Department
END;
GO 

CREATE TABLE hr.Department
(
  DepartmentID    INT IDENTITY(1,1) NOT NULL,
  DepartmentCode  VARCHAR(20)       NOT NULL,
  DepartmentName  NVARCHAR(100)     NOT NULL,
  [Description]   NVARCHAR(500)     NULL,
  IsActive        BIT               NOT NULL
    CONSTRAINT DF_Department_IsActive DEFAULT(1),
  CreatedDate     DATETIME2(0)      NOT NULL
    CONSTRAINT DF_Department_CreatedDate DEFAULT(SYSDATETIME()),
  ModifiedDate    DATETIME2(0)      NULL

  CONSTRAINT PK_Department PRIMARY KEY CLUSTERED(DepartmentID),
  CONSTRAINT UQ_Department_DepartmentCode UNIQUE(DepartmentCode),
  CONSTRAINT UQ_Department_DepartmentName UNIQUE(DepartmentName)
);
GO

----------------------VERIFY THE TABLE----------------------------
SELECT 
  t.name AS TableName,
  s.name AS SchemaName
FROM sys.tables t 
INNER JOIN sys.schemas AS s 
  ON t.schema_id = s.schema_id
WHERE s.name = 'hr'
  AND t.name = 'Department'
GO
---------------------INSPECT THE COLUMNS--------------------------

  SP_HELP 'hr.Department';

--------------------INSERT A FEW ROWS-----------------------------

INSERT INTO hr.Department
(
  DepartmentCode,
  DepartmentName,
  [Description]
)
VALUES
('HR', 'Human Resources', 'Employee Lifecycle'),
('IT', 'Information Technology', 'Technology Operations'),
('FIN', 'Finance', 'Accounting and Finance'),
('OPS', 'Operations', 'Business operations');
GO

SELECT * FROM hr.Department;