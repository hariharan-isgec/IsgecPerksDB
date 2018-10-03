USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwDepartmentsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [HRM_Departments].* ,
    [HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
    [HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName 
  FROM [HRM_Departments] 
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Departments].[BusinessHead] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [HRM_Departments].[DepartmentHead] = [HRM_Employees2].[CardNo]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'DepartmentID' THEN [HRM_Departments].[DepartmentID] END,
     CASE @OrderBy WHEN 'DepartmentID DESC' THEN [HRM_Departments].[DepartmentID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [HRM_Departments].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [HRM_Departments].[Description] END DESC,
     CASE @OrderBy WHEN 'DepartmentHead' THEN [HRM_Departments].[DepartmentHead] END,
     CASE @OrderBy WHEN 'DepartmentHead DESC' THEN [HRM_Departments].[DepartmentHead] END DESC,
     CASE @OrderBy WHEN 'BusinessHead' THEN [HRM_Departments].[BusinessHead] END,
     CASE @OrderBy WHEN 'BusinessHead DESC' THEN [HRM_Departments].[BusinessHead] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC 
  SET @RecordCount = @@RowCount
GO
