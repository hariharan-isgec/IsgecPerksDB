USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmNewEmployeesSelectByID]
  @CardNo NVarChar(8) 
  AS
  SELECT
		[HRM_Employees].[CardNo],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[C_DateOfJoining],
		[HRM_Employees].[C_CompanyID],
		[HRM_Employees].[C_DivisionID],
		[HRM_Employees].[C_OfficeID],
		[HRM_Employees].[C_DepartmentID],
		[HRM_Employees].[C_DesignationID],
		[HRM_Employees].[ActiveState],
		[HRM_Companies8].[CompanyID] AS HRM_Companies8_CompanyID,
		[HRM_Companies8].[Description] AS HRM_Companies8_Description,
		[HRM_Companies8].[ShortName] AS HRM_Companies8_ShortName,
		[HRM_Companies8].[BaaNID] AS HRM_Companies8_BaaNID,
		[HRM_Departments11].[DepartmentID] AS HRM_Departments11_DepartmentID,
		[HRM_Departments11].[Description] AS HRM_Departments11_Description,
		[HRM_Designations14].[DesignationID] AS HRM_Designations14_DesignationID,
		[HRM_Designations14].[Description] AS HRM_Designations14_Description,
		[HRM_Designations14].[ShortName] AS HRM_Designations14_ShortName,
		[HRM_Designations14].[Sequence] AS HRM_Designations14_Sequence,
		[HRM_Divisions16].[DivisionID] AS HRM_Divisions16_DivisionID,
		[HRM_Divisions16].[Description] AS HRM_Divisions16_Description,
		[HRM_Offices25].[OfficeID] AS HRM_Offices25_OfficeID,
		[HRM_Offices25].[Description] AS HRM_Offices25_Description,
		[HRM_Offices25].[Address] AS HRM_Offices25_Address,
		[HRM_Offices25].[City] AS HRM_Offices25_City 
  FROM [HRM_Employees] 
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies8]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies8].[CompanyID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments11]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments11].[DepartmentID]
  INNER JOIN [HRM_Designations] AS [HRM_Designations14]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations14].[DesignationID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions16]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions16].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices25]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices25].[OfficeID]
  WHERE
  [HRM_Employees].[CardNo] = @CardNo
GO
