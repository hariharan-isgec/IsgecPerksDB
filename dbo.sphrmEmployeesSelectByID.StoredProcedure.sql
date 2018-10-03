USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmEmployeesSelectByID]
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
		[HRM_Employees].[C_ProjectSiteID],
		[HRM_Employees].[C_DesignationID],
		[HRM_Employees].[ActiveState],
		[HRM_Employees].[CategoryID],
		[HRM_Companies1].[CompanyID] AS HRM_Companies1_CompanyID,
		[HRM_Companies1].[Description] AS HRM_Companies1_Description,
		[HRM_Companies1].[ShortName] AS HRM_Companies1_ShortName,
		[HRM_Companies1].[BaaNID] AS HRM_Companies1_BaaNID,
		[HRM_Divisions2].[DivisionID] AS HRM_Divisions2_DivisionID,
		[HRM_Divisions2].[Description] AS HRM_Divisions2_Description,
		[HRM_Offices3].[OfficeID] AS HRM_Offices3_OfficeID,
		[HRM_Offices3].[Description] AS HRM_Offices3_Description,
		[HRM_Offices3].[Address] AS HRM_Offices3_Address,
		[HRM_Offices3].[City] AS HRM_Offices3_City,
		[HRM_Departments4].[DepartmentID] AS HRM_Departments4_DepartmentID,
		[HRM_Departments4].[Description] AS HRM_Departments4_Description,
		[DCM_Projects5].[ProjectCode] AS DCM_Projects5_ProjectCode,
		[DCM_Projects5].[Description] AS DCM_Projects5_Description,
		[HRM_Designations6].[DesignationID] AS HRM_Designations6_DesignationID,
		[HRM_Designations6].[Description] AS HRM_Designations6_Description,
		[HRM_Designations6].[ShortName] AS HRM_Designations6_ShortName,
		[HRM_Designations6].[Sequence] AS HRM_Designations6_Sequence 
  FROM [HRM_Employees] 
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies1]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies1].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions2]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions2].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices3]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices3].[OfficeID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments4]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments4].[DepartmentID]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects5]
    ON [HRM_Employees].[C_ProjectSiteID] = [DCM_Projects5].[ProjectCode]
  INNER JOIN [HRM_Designations] AS [HRM_Designations6]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations6].[DesignationID]
  WHERE
  [HRM_Employees].[CardNo] = @CardNo
GO
