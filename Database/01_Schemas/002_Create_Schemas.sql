/*---------------------------------------------------
Project Name: HR Management System
Module: Database
Script Name: 002_Create_Schemas.sql
Author: Sumit
Created Date: 05-07-2026
Purpose: Create Database Schema
Dependencies: 001_Create_Database.sql
Execution Order: 002
------------------------------------------------------*/

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'hr')
EXEC ('CREATE SCHEMA hr')
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE NAME = 'attendance')
EXEC ('CREATE SCHEMA attendance')
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE NAME = 'leave_management')
EXEC ('CREATE SCHEMA leave_management')
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE NAME = 'payroll')
EXEC ('CREATE SCHEMA payroll')
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE NAME = 'security')
EXEC ('CREATE SCHEMA security')
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE NAME = 'audit')
EXEC ('CREATE SCHEMA audit')
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE NAME = 'staging')
EXEC ('CREATE SCHEMA staging')
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE NAME = 'reporting')
EXEC ('CREATE SCHEMA reporting')
GO