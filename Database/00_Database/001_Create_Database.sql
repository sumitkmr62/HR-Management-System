/*-----------------------------------------------------
Project Name: HR Management System
Module: Database
Script Name: 001_Create_Database.sql
Author: Sumit
Created Date: 05-07-2026
Purpose: Create HR Management System Database
Dependencies: None
Execution Order: 001
-------------------------------------------------------*/

USE MASTER;
GO

IF DB_ID(N'HRManagementSystem') IS NOT NULL
BEGIN
  ALTER DATABASE[HRManagementSystem]
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE

  DROP DATABASE [HRManagementSystem]
END
GO

CREATE DATABASE [HRManagementSystem]
GO
-- ON PRIMARY
-- (
--   NAME = N'HRManagementSystem_Data'
--   --FILENAME = N'C:\Users\Sumit\OneDrive\sql_developer\HR_Management_System\HRManagementSystemData.mdf',
--   --SIZE = 100MB,
--   --MAXSIZE = UNLIMITED,
--   --FILEGROWTH = 25MB
-- )
-- LOG ON
-- (
--   NAME = N'HRManagementSystem_Log'
--   --FILENAME = N'C:\Users\Sumit\OneDrive\sql_developer\HR_Management_System\HRManagementSystemData.log',
--   --SIZE = 50MB,
--   --MAXSIZE = UNLIMITED,
--   --FILEGROWTH = 50MB
-- );

ALTER DATABASE [HRManagementSystem]
SET RECOVERY SIMPLE;
GO

ALTER DATABASE [HRManagementSystem]
SET COMPATIBILITY_LEVEL = 170;
GO

SELECT 
  DatabaseName = name,
  State = state_desc,
  RecoveryModel = recovery_model_desc,
  CompatibilityLevel = compatibility_level
FROM SYS.DATABASES WHERE NAME = N'HRManagementSystem'

