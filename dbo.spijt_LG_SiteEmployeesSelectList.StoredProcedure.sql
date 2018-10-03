USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijt_LG_SiteEmployeesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  WHERE [HRM_Employees].[ActiveState] = 1 
    AND [HRM_Employees].[C_OfficeID] = 6  
    AND [HRM_Employees].[C_ProjectSiteID] IS NOT NULL 
  ORDER BY
     CASE @orderBy WHEN 'CardNo' THEN [HRM_Employees].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [HRM_Employees].[CardNo] END DESC,
     CASE @orderBy WHEN 'EmployeeName' THEN [HRM_Employees].[EmployeeName] END,
     CASE @orderBy WHEN 'EmployeeName DESC' THEN [HRM_Employees].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'C_DateOfJoining' THEN [HRM_Employees].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'C_DateOfJoining DESC' THEN [HRM_Employees].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'C_OfficeID' THEN [HRM_Employees].[C_OfficeID] END,
     CASE @orderBy WHEN 'C_OfficeID DESC' THEN [HRM_Employees].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'C_DepartmentID' THEN [HRM_Employees].[C_DepartmentID] END,
     CASE @orderBy WHEN 'C_DepartmentID DESC' THEN [HRM_Employees].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'C_DesignationID' THEN [HRM_Employees].[C_DesignationID] END,
     CASE @orderBy WHEN 'C_DesignationID DESC' THEN [HRM_Employees].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'C_ProjectSiteID' THEN [HRM_Employees].[C_ProjectSiteID] END,
     CASE @orderBy WHEN 'C_ProjectSiteID DESC' THEN [HRM_Employees].[C_ProjectSiteID] END DESC,
     CASE @orderBy WHEN 'ActiveState' THEN [HRM_Employees].[ActiveState] END,
     CASE @orderBy WHEN 'ActiveState DESC' THEN [HRM_Employees].[ActiveState] END DESC,
     CASE @orderBy WHEN 'IDM_Projects4_ProjectID' THEN [IDM_Projects4].[ProjectID] END,
     CASE @orderBy WHEN 'IDM_Projects4_ProjectID DESC' THEN [IDM_Projects4].[ProjectID] END DESC,
     CASE @orderBy WHEN 'IDM_Projects4_Description' THEN [IDM_Projects4].[Description] END,
     CASE @orderBy WHEN 'IDM_Projects4_Description DESC' THEN [IDM_Projects4].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Departments2_DepartmentID' THEN [HRM_Departments2].[DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Departments2_DepartmentID DESC' THEN [HRM_Departments2].[DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Departments2_Description' THEN [HRM_Departments2].[Description] END,
     CASE @orderBy WHEN 'HRM_Departments2_Description DESC' THEN [HRM_Departments2].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations3_DesignationID' THEN [HRM_Designations3].[DesignationID] END,
     CASE @orderBy WHEN 'HRM_Designations3_DesignationID DESC' THEN [HRM_Designations3].[DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Designations3_Description' THEN [HRM_Designations3].[Description] END,
     CASE @orderBy WHEN 'HRM_Designations3_Description DESC' THEN [HRM_Designations3].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations3_Sequence' THEN [HRM_Designations3].[Sequence] END,
     CASE @orderBy WHEN 'HRM_Designations3_Sequence DESC' THEN [HRM_Designations3].[Sequence] END DESC,
     CASE @orderBy WHEN 'HRM_Offices1_OfficeID' THEN [HRM_Offices1].[OfficeID] END,
     CASE @orderBy WHEN 'HRM_Offices1_OfficeID DESC' THEN [HRM_Offices1].[OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices1_Description' THEN [HRM_Offices1].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices1_Description DESC' THEN [HRM_Offices1].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO