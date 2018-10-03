USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnEmployeesSelectList]
  @ActiveState Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_Employees].[CardNo] ,
		[HRM_Employees].[EmployeeName] ,
		[HRM_Employees].[C_CompanyID] ,
		[HRM_Employees].[C_DivisionID] ,
		[HRM_Employees].[C_DepartmentID] ,
		[HRM_Employees].[C_DesignationID] ,
		[HRM_Employees].[C_OfficeID] ,
		[HRM_Employees].[C_ProjectSiteID] ,
		[HRM_Employees].[C_DateOfJoining] ,
		[HRM_Employees].[ContactNumbers] ,
		[HRM_Employees].[EMailID] ,
		[HRM_Employees].[Contractual] ,
		[HRM_Employees].[ActiveState] ,
		[HRM_Departments3].[Description] AS HRM_Departments3_Description,
		[HRM_Designations4].[Description] AS HRM_Designations4_Description,
		[HRM_Offices5].[Description] AS HRM_Offices5_Description,
		[IDM_Projects6].[Description] AS IDM_Projects6_Description,
		[HRM_Companies1].[Description] AS HRM_Companies1_Description,
		[HRM_Divisions2].[Description] AS HRM_Divisions2_Description 
  FROM [HRM_Employees] 
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments3]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments3].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations4]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations4].[DesignationID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices5]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices5].[OfficeID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects6]
    ON [HRM_Employees].[C_ProjectSiteID] = [IDM_Projects6].[ProjectID]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies1]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies1].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions2]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions2].[DivisionID]
  WHERE 1 = 1  
  AND [HRM_Employees].[ActiveState] = (@ActiveState)  
  ORDER BY
     CASE @orderBy WHEN 'CardNo' THEN [HRM_Employees].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [HRM_Employees].[CardNo] END DESC,
     CASE @orderBy WHEN 'EmployeeName' THEN [HRM_Employees].[EmployeeName] END,
     CASE @orderBy WHEN 'EmployeeName DESC' THEN [HRM_Employees].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'C_CompanyID' THEN [HRM_Employees].[C_CompanyID] END,
     CASE @orderBy WHEN 'C_CompanyID DESC' THEN [HRM_Employees].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'C_DivisionID' THEN [HRM_Employees].[C_DivisionID] END,
     CASE @orderBy WHEN 'C_DivisionID DESC' THEN [HRM_Employees].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'C_DepartmentID' THEN [HRM_Employees].[C_DepartmentID] END,
     CASE @orderBy WHEN 'C_DepartmentID DESC' THEN [HRM_Employees].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'C_DesignationID' THEN [HRM_Employees].[C_DesignationID] END,
     CASE @orderBy WHEN 'C_DesignationID DESC' THEN [HRM_Employees].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'C_OfficeID' THEN [HRM_Employees].[C_OfficeID] END,
     CASE @orderBy WHEN 'C_OfficeID DESC' THEN [HRM_Employees].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'C_ProjectSiteID' THEN [HRM_Employees].[C_ProjectSiteID] END,
     CASE @orderBy WHEN 'C_ProjectSiteID DESC' THEN [HRM_Employees].[C_ProjectSiteID] END DESC,
     CASE @orderBy WHEN 'C_DateOfJoining' THEN [HRM_Employees].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'C_DateOfJoining DESC' THEN [HRM_Employees].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'ContactNumbers' THEN [HRM_Employees].[ContactNumbers] END,
     CASE @orderBy WHEN 'ContactNumbers DESC' THEN [HRM_Employees].[ContactNumbers] END DESC,
     CASE @orderBy WHEN 'EMailID' THEN [HRM_Employees].[EMailID] END,
     CASE @orderBy WHEN 'EMailID DESC' THEN [HRM_Employees].[EMailID] END DESC,
     CASE @orderBy WHEN 'Contractual' THEN [HRM_Employees].[Contractual] END,
     CASE @orderBy WHEN 'Contractual DESC' THEN [HRM_Employees].[Contractual] END DESC,
     CASE @orderBy WHEN 'ActiveState' THEN [HRM_Employees].[ActiveState] END,
     CASE @orderBy WHEN 'ActiveState DESC' THEN [HRM_Employees].[ActiveState] END DESC,
     CASE @orderBy WHEN 'HRM_Departments3_Description' THEN [HRM_Departments3].[Description] END,
     CASE @orderBy WHEN 'HRM_Departments3_Description DESC' THEN [HRM_Departments3].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations4_Description' THEN [HRM_Designations4].[Description] END,
     CASE @orderBy WHEN 'HRM_Designations4_Description DESC' THEN [HRM_Designations4].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices5_Description' THEN [HRM_Offices5].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices5_Description DESC' THEN [HRM_Offices5].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_Projects6_Description' THEN [IDM_Projects6].[Description] END,
     CASE @orderBy WHEN 'IDM_Projects6_Description DESC' THEN [IDM_Projects6].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Companies1_Description' THEN [HRM_Companies1].[Description] END,
     CASE @orderBy WHEN 'HRM_Companies1_Description DESC' THEN [HRM_Companies1].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions2_Description' THEN [HRM_Divisions2].[Description] END,
     CASE @orderBy WHEN 'HRM_Divisions2_Description DESC' THEN [HRM_Divisions2].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
