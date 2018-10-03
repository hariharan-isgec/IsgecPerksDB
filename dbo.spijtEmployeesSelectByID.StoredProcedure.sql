USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijtEmployeesSelectByID]
  @CardNo NVarChar(8) 
  AS
  SELECT
		[HRM_Employees].[CardNo],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[C_DateOfJoining],
		[HRM_Employees].[C_OfficeID],
		[HRM_Employees].[C_DepartmentID],
		[HRM_Employees].[C_DesignationID],
		[HRM_Employees].[C_ProjectSiteID],
		[HRM_Employees].[ActiveState],
		[IDM_Projects4].[ProjectID] AS IDM_Projects4_ProjectID,
		[IDM_Projects4].[Description] AS IDM_Projects4_Description,
		[HRM_Departments2].[DepartmentID] AS HRM_Departments2_DepartmentID,
		[HRM_Departments2].[Description] AS HRM_Departments2_Description,
		[HRM_Designations3].[DesignationID] AS HRM_Designations3_DesignationID,
		[HRM_Designations3].[Description] AS HRM_Designations3_Description,
		[HRM_Designations3].[Sequence] AS HRM_Designations3_Sequence,
		[HRM_Offices1].[OfficeID] AS HRM_Offices1_OfficeID,
		[HRM_Offices1].[Description] AS HRM_Offices1_Description 
  FROM [HRM_Employees] 
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]
    ON [HRM_Employees].[C_ProjectSiteID] = [IDM_Projects4].[ProjectID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments2]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments2].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations3]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations3].[DesignationID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices1]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices1].[OfficeID]
  WHERE
  [HRM_Employees].[CardNo] = @CardNo
GO
