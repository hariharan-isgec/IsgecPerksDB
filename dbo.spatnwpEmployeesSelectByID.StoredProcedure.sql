USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnwpEmployeesSelectByID]
  @LoginID NVarChar(8),
  @CardNo NVarChar(8) 
  AS
  SELECT
    [HRM_Employees].* ,
    [HRM_Companies2].[Description] AS HRM_Companies2_Description,
    [HRM_Departments6].[Description] AS HRM_Departments6_Description,
    [HRM_Designations9].[Description] AS HRM_Designations9_Description,
    [HRM_Divisions12].[Description] AS HRM_Divisions12_Description,
    [HRM_Offices20].[Description] AS HRM_Offices20_Description,
    [IDM_Projects30].[Description] AS IDM_Projects30_Description,
    [TA_Categories34].[cmba] AS TA_Categories34_cmba 
  FROM [HRM_Employees] 
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies2]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies2].[CompanyID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments6]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments6].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations9]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations9].[DesignationID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions12]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions12].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices20]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices20].[OfficeID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects30]
    ON [HRM_Employees].[C_ProjectSiteID] = [IDM_Projects30].[ProjectID]
  LEFT OUTER JOIN [TA_Categories] AS [TA_Categories34]
    ON [HRM_Employees].[CategoryID] = [TA_Categories34].[CategoryID]
  WHERE
  [HRM_Employees].[CardNo] = @CardNo
GO
