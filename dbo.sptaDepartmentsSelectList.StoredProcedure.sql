USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaDepartmentsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  IF (@OrderBy = 'Code')
  SELECT
		[HRM_Departments].[DepartmentID] + ' [' + [HRM_Departments].[Description] + ']' As [Description],
		[HRM_Departments].[DepartmentID] 
  FROM [HRM_Departments] 
  ORDER By [HRM_Departments].[DepartmentID]
  ELSE
  SELECT
		[HRM_Departments].[Description] ,
		[HRM_Departments].[DepartmentID] 
  FROM [HRM_Departments] 
  ORDER By [HRM_Departments].[Description]

  SET @RecordCount = @@RowCount
GO
