USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnewHrmEmployeesSelectByID]
  @LoginID NVarChar(8),
  @CardNo NVarChar(8) 
  AS
  SELECT
    [HRM_Employees].* ,
    [HRM_Companies2].[Description] AS HRM_Companies2_Description,
    [HRM_Departments6].[Description] AS HRM_Departments6_Description,
    [HRM_Designations9].[Description] AS HRM_Designations9_Description,
    [HRM_Divisions12].[Description] AS HRM_Divisions12_Description,
    [HRM_Employees15].[EmployeeName] AS HRM_Employees15_EmployeeName,
    [HRM_Employees16].[EmployeeName] AS HRM_Employees16_EmployeeName,
    [HRM_Employees17].[EmployeeName] AS HRM_Employees17_EmployeeName,
    [HRM_Employees18].[EmployeeName] AS HRM_Employees18_EmployeeName,
    [HRM_Employees19].[EmployeeName] AS HRM_Employees19_EmployeeName,
    [HRM_Employees20].[EmployeeName] AS HRM_Employees20_EmployeeName,
    [HRM_Offices26].[Description] AS HRM_Offices26_Description,
    [IDM_Projects36].[Description] AS IDM_Projects36_Description,
    [TA_Categories40].[CategoryDescription] AS TA_Categories40_CategoryDescription 
  FROM [HRM_Employees] 
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies2]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies2].[CompanyID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments6]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments6].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations9]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations9].[DesignationID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions12]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions12].[DivisionID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees15]
    ON [HRM_Employees].[SiteAllowanceApprover] = [HRM_Employees15].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees16]
    ON [HRM_Employees].[VerifierID] = [HRM_Employees16].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees17]
    ON [HRM_Employees].[ApproverID] = [HRM_Employees17].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees18]
    ON [HRM_Employees].[TAVerifier] = [HRM_Employees18].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees19]
    ON [HRM_Employees].[TAApprover] = [HRM_Employees19].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees20]
    ON [HRM_Employees].[TASanctioningAuthority] = [HRM_Employees20].[CardNo]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices26]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices26].[OfficeID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects36]
    ON [HRM_Employees].[C_ProjectSiteID] = [IDM_Projects36].[ProjectID]
  LEFT OUTER JOIN [TA_Categories] AS [TA_Categories40]
    ON [HRM_Employees].[CategoryID] = [TA_Categories40].[CategoryID]
  WHERE
  [HRM_Employees].[CardNo] = @CardNo
GO
