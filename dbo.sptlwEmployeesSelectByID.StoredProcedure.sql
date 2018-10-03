USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwEmployeesSelectByID]
  @LoginID NVarChar(8),
  @CardNo NVarChar(8) 
  AS
  SELECT
    [HRM_Employees].* ,
    [HRM_Companies4].[Description] AS HRM_Companies4_Description,
    [HRM_Departments7].[Description] AS HRM_Departments7_Description,
    [HRM_Designations11].[Description] AS HRM_Designations11_Description,
    [HRM_Divisions14].[Description] AS HRM_Divisions14_Description,
    [HRM_Offices22].[Description] AS HRM_Offices22_Description 
  FROM [HRM_Employees] 
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies4]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies4].[CompanyID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments7]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments7].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations11]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations11].[DesignationID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions14]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions14].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices22]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices22].[OfficeID]
  WHERE
  [HRM_Employees].[CardNo] = @CardNo
GO
