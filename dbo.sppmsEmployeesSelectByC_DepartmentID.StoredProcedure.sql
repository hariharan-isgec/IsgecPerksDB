USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsEmployeesSelectByC_DepartmentID]
  @ActiveState Bit,
  @C_DepartmentID NVarChar(6),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_Employees].[CardNo] ,
		[HRM_Employees].[EmployeeName] ,
		[HRM_Employees].[C_DateOfJoining] ,
		[HRM_Employees].[C_OfficeID] ,
		[HRM_Employees].[C_DepartmentID] ,
		[HRM_Employees].[C_DesignationID] ,
		[HRM_Employees].[C_CompanyID] ,
		[HRM_Employees].[C_DivisionID] ,
		[HRM_Employees].[ActiveState] ,
		[HRM_Employees].[Contractual] ,
		[HRM_Departments2].[Description] AS HRM_Departments2_Description,
		[HRM_Designations3].[Description] AS HRM_Designations3_Description,
		[HRM_Offices1].[Description] AS HRM_Offices1_Description 
  FROM [HRM_Employees] 
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments2]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments2].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations3]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations3].[DesignationID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices1]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices1].[OfficeID]
  WHERE
  [HRM_Employees].[C_DepartmentID] = @C_DepartmentID
  AND [HRM_Employees].[ActiveState] = @ActiveState
  ORDER BY
     CASE @OrderBy WHEN 'CardNo' THEN [HRM_Employees].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [HRM_Employees].[CardNo] END DESC,
     CASE @OrderBy WHEN 'EmployeeName' THEN [HRM_Employees].[EmployeeName] END,
     CASE @OrderBy WHEN 'EmployeeName DESC' THEN [HRM_Employees].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'C_DateOfJoining' THEN [HRM_Employees].[C_DateOfJoining] END,
     CASE @OrderBy WHEN 'C_DateOfJoining DESC' THEN [HRM_Employees].[C_DateOfJoining] END DESC,
     CASE @OrderBy WHEN 'C_OfficeID' THEN [HRM_Employees].[C_OfficeID] END,
     CASE @OrderBy WHEN 'C_OfficeID DESC' THEN [HRM_Employees].[C_OfficeID] END DESC,
     CASE @OrderBy WHEN 'C_DepartmentID' THEN [HRM_Employees].[C_DepartmentID] END,
     CASE @OrderBy WHEN 'C_DepartmentID DESC' THEN [HRM_Employees].[C_DepartmentID] END DESC,
     CASE @OrderBy WHEN 'C_DesignationID' THEN [HRM_Employees].[C_DesignationID] END,
     CASE @OrderBy WHEN 'C_DesignationID DESC' THEN [HRM_Employees].[C_DesignationID] END DESC,
     CASE @OrderBy WHEN 'C_CompanyID' THEN [HRM_Employees].[C_CompanyID] END,
     CASE @OrderBy WHEN 'C_CompanyID DESC' THEN [HRM_Employees].[C_CompanyID] END DESC,
     CASE @OrderBy WHEN 'C_DivisionID' THEN [HRM_Employees].[C_DivisionID] END,
     CASE @OrderBy WHEN 'C_DivisionID DESC' THEN [HRM_Employees].[C_DivisionID] END DESC,
     CASE @OrderBy WHEN 'ActiveState' THEN [HRM_Employees].[ActiveState] END,
     CASE @OrderBy WHEN 'ActiveState DESC' THEN [HRM_Employees].[ActiveState] END DESC,
     CASE @OrderBy WHEN 'Contractual' THEN [HRM_Employees].[Contractual] END,
     CASE @OrderBy WHEN 'Contractual DESC' THEN [HRM_Employees].[Contractual] END DESC,
     CASE @OrderBy WHEN 'HRM_Departments2_Description' THEN [HRM_Departments2].[Description] END,
     CASE @OrderBy WHEN 'HRM_Departments2_Description DESC' THEN [HRM_Departments2].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Designations3_Description' THEN [HRM_Designations3].[Description] END,
     CASE @OrderBy WHEN 'HRM_Designations3_Description DESC' THEN [HRM_Designations3].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Offices1_Description' THEN [HRM_Offices1].[Description] END,
     CASE @OrderBy WHEN 'HRM_Offices1_Description DESC' THEN [HRM_Offices1].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
