USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spolcEmployeesSelectByID]
  @CardNo NVarChar(8) 
  AS
  SELECT
		[HRM_Employees].[CardNo] ,
		[HRM_Employees].[EmployeeName] ,
		[HRM_Employees].[C_CompanyID] ,
		[HRM_Employees].[C_DivisionID] ,
		[HRM_Employees].[C_DepartmentID] ,
		[HRM_Employees].[C_DesignationID] ,
		[HRM_Employees].[C_OfficeID] ,
		[HRM_Employees].[C_DateOfJoining] ,
		[HRM_Employees].[ContactNumbers] ,
		[HRM_Employees].[EMailID] ,
		[HRM_Employees].[Contractual] ,
		[HRM_Employees].[ActiveState] ,
		[HRM_Departments3].[Description] AS HRM_Departments3_Description,
		[HRM_Designations4].[Description] AS HRM_Designations4_Description,
		[HRM_Offices5].[Description] AS HRM_Offices5_Description,
		[HRM_Companies1].[Description] AS HRM_Companies1_Description,
		[HRM_Divisions2].[Description] AS HRM_Divisions2_Description 
  FROM [HRM_Employees] 
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments3]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments3].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations4]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations4].[DesignationID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices5]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices5].[OfficeID]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies1]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies1].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions2]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions2].[DivisionID]
  WHERE
  [HRM_Employees].[CardNo] = @CardNo
GO
