USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmstDepartmentsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_Departments].[DepartmentID] ,
		[HRM_Departments].[Description]  
  FROM [HRM_Departments] 
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'DepartmentID' THEN [HRM_Departments].[DepartmentID] END,
     CASE @orderBy WHEN 'DepartmentID DESC' THEN [HRM_Departments].[DepartmentID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_Departments].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_Departments].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
