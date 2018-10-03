USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmNewEmployeesSelectList]
  @ActiveState Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  WHERE [HRM_Employees].[ActiveState] = @ActiveState
  ORDER BY
     CASE @orderBy WHEN 'CardNo' THEN [HRM_Employees].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [HRM_Employees].[CardNo] END DESC,
     CASE @orderBy WHEN 'EmployeeName' THEN [HRM_Employees].[EmployeeName] END,
     CASE @orderBy WHEN 'EmployeeName DESC' THEN [HRM_Employees].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'C_DateOfJoining' THEN [HRM_Employees].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'C_DateOfJoining DESC' THEN [HRM_Employees].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'C_CompanyID' THEN [HRM_Employees].[C_CompanyID] END,
     CASE @orderBy WHEN 'C_CompanyID DESC' THEN [HRM_Employees].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'C_DivisionID' THEN [HRM_Employees].[C_DivisionID] END,
     CASE @orderBy WHEN 'C_DivisionID DESC' THEN [HRM_Employees].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'C_OfficeID' THEN [HRM_Employees].[C_OfficeID] END,
     CASE @orderBy WHEN 'C_OfficeID DESC' THEN [HRM_Employees].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'C_DepartmentID' THEN [HRM_Employees].[C_DepartmentID] END,
     CASE @orderBy WHEN 'C_DepartmentID DESC' THEN [HRM_Employees].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'C_DesignationID' THEN [HRM_Employees].[C_DesignationID] END,
     CASE @orderBy WHEN 'C_DesignationID DESC' THEN [HRM_Employees].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'ActiveState' THEN [HRM_Employees].[ActiveState] END,
     CASE @orderBy WHEN 'ActiveState DESC' THEN [HRM_Employees].[ActiveState] END DESC,
     CASE @orderBy WHEN 'HRM_Companies8_CompanyID' THEN [HRM_Companies8].[CompanyID] END,
     CASE @orderBy WHEN 'HRM_Companies8_CompanyID DESC' THEN [HRM_Companies8].[CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Companies8_Description' THEN [HRM_Companies8].[Description] END,
     CASE @orderBy WHEN 'HRM_Companies8_Description DESC' THEN [HRM_Companies8].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Companies8_ShortName' THEN [HRM_Companies8].[ShortName] END,
     CASE @orderBy WHEN 'HRM_Companies8_ShortName DESC' THEN [HRM_Companies8].[ShortName] END DESC,
     CASE @orderBy WHEN 'HRM_Companies8_BaaNID' THEN [HRM_Companies8].[BaaNID] END,
     CASE @orderBy WHEN 'HRM_Companies8_BaaNID DESC' THEN [HRM_Companies8].[BaaNID] END DESC,
     CASE @orderBy WHEN 'HRM_Departments11_DepartmentID' THEN [HRM_Departments11].[DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Departments11_DepartmentID DESC' THEN [HRM_Departments11].[DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Departments11_Description' THEN [HRM_Departments11].[Description] END,
     CASE @orderBy WHEN 'HRM_Departments11_Description DESC' THEN [HRM_Departments11].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations14_DesignationID' THEN [HRM_Designations14].[DesignationID] END,
     CASE @orderBy WHEN 'HRM_Designations14_DesignationID DESC' THEN [HRM_Designations14].[DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Designations14_Description' THEN [HRM_Designations14].[Description] END,
     CASE @orderBy WHEN 'HRM_Designations14_Description DESC' THEN [HRM_Designations14].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations14_ShortName' THEN [HRM_Designations14].[ShortName] END,
     CASE @orderBy WHEN 'HRM_Designations14_ShortName DESC' THEN [HRM_Designations14].[ShortName] END DESC,
     CASE @orderBy WHEN 'HRM_Designations14_Sequence' THEN [HRM_Designations14].[Sequence] END,
     CASE @orderBy WHEN 'HRM_Designations14_Sequence DESC' THEN [HRM_Designations14].[Sequence] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions16_DivisionID' THEN [HRM_Divisions16].[DivisionID] END,
     CASE @orderBy WHEN 'HRM_Divisions16_DivisionID DESC' THEN [HRM_Divisions16].[DivisionID] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions16_Description' THEN [HRM_Divisions16].[Description] END,
     CASE @orderBy WHEN 'HRM_Divisions16_Description DESC' THEN [HRM_Divisions16].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices25_OfficeID' THEN [HRM_Offices25].[OfficeID] END,
     CASE @orderBy WHEN 'HRM_Offices25_OfficeID DESC' THEN [HRM_Offices25].[OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices25_Description' THEN [HRM_Offices25].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices25_Description DESC' THEN [HRM_Offices25].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices25_Address' THEN [HRM_Offices25].[Address] END,
     CASE @orderBy WHEN 'HRM_Offices25_Address DESC' THEN [HRM_Offices25].[Address] END DESC,
     CASE @orderBy WHEN 'HRM_Offices25_City' THEN [HRM_Offices25].[City] END,
     CASE @orderBy WHEN 'HRM_Offices25_City DESC' THEN [HRM_Offices25].[City] END DESC 
  SET @RecordCount = @@RowCount
GO
