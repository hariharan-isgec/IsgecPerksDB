USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaEmployeesSelectByID]
  @LoginID NVarChar(8),
  @CardNo NVarChar(8) 
  AS
  SELECT
		[HRM_Employees].*,
		[HRM_Companies4].[Description] AS HRM_Companies4_Description,
		[HRM_Departments2].[Description] AS HRM_Departments2_Description,
		[HRM_Designations3].[Description] AS HRM_Designations3_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Offices1].[Description] AS HRM_Offices1_Description,
		[HRM_Employees6].[EmployeeName] AS HRM_Employees6_EmployeeName,
		[HRM_Employees7].[EmployeeName] AS HRM_Employees7_EmployeeName,
		[HRM_Employees9].[EmployeeName] AS HRM_Employees9_EmployeeName,
		[HRM_Employees10].[EmployeeName] AS HRM_Employees10_EmployeeName,
		[TA_Categories8].[cmba] AS TA_Categories8_cmba 
  FROM [HRM_Employees] 
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies4]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies4].[CompanyID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments2]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments2].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations3]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations3].[DesignationID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions5].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices1]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices1].[OfficeID]
  LEFT OUTER JOIN [TA_Categories] AS [TA_Categories8]
    ON [HRM_Employees].[CategoryID] = [TA_Categories8].[CategoryID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees6]
    ON [HRM_Employees].[TAVerifier] = [HRM_Employees6].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees7]
    ON [HRM_Employees].[TAApprover] = [HRM_Employees7].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees9]
    ON [HRM_Employees].[TASanctioningAuthority] = [HRM_Employees9].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees10]
    ON [HRM_Employees].[SiteAllowanceApprover] = [HRM_Employees10].[CardNo]
  WHERE
  [HRM_Employees].[CardNo] = @CardNo
GO
