USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmDepartmentsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_Departments].[DepartmentID] ,
		[HRM_Departments].[Description]  
  FROM [HRM_Departments] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'DepartmentID' THEN [HRM_Departments].[DepartmentID] END,
     CASE @OrderBy WHEN 'DepartmentID DESC' THEN [HRM_Departments].[DepartmentID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [HRM_Departments].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [HRM_Departments].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
