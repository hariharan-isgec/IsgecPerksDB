USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmEmployeesSelectList]
  @ActiveState Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_Employees].[CardNo],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[C_CompanyID],
		[HRM_Employees].[C_DepartmentID],
		[HRM_Employees].[ActiveState] 
  FROM [HRM_Employees] 
  WHERE [HRM_Employees].[ActiveState] = @ActiveState
  ORDER BY
     CASE @orderBy WHEN 'CardNo' THEN [HRM_Employees].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [HRM_Employees].[CardNo] END DESC,
     CASE @orderBy WHEN 'EmployeeName' THEN [HRM_Employees].[EmployeeName] END,
     CASE @orderBy WHEN 'EmployeeName DESC' THEN [HRM_Employees].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'C_CompanyID' THEN [HRM_Employees].[C_CompanyID] END,
     CASE @orderBy WHEN 'C_CompanyID DESC' THEN [HRM_Employees].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'C_DepartmentID' THEN [HRM_Employees].[C_DepartmentID] END,
     CASE @orderBy WHEN 'C_DepartmentID DESC' THEN [HRM_Employees].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'ActiveState' THEN [HRM_Employees].[ActiveState] END,
     CASE @orderBy WHEN 'ActiveState DESC' THEN [HRM_Employees].[ActiveState] END DESC 
  SET @RecordCount = @@RowCount
GO
