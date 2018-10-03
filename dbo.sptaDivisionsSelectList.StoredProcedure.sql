USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaDivisionsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_Divisions].[DivisionID] ,
		[HRM_Divisions].[Description] ,
		[HRM_Divisions].[DivisionHead] ,
		[HRM_Divisions].[ERP_EU] ,
		[HRM_Divisions].[ERP_Div] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [HRM_Divisions] 
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Divisions].[DivisionHead] = [HRM_Employees1].[CardNo]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'DivisionID' THEN [HRM_Divisions].[DivisionID] END,
     CASE @OrderBy WHEN 'DivisionID DESC' THEN [HRM_Divisions].[DivisionID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [HRM_Divisions].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [HRM_Divisions].[Description] END DESC,
     CASE @OrderBy WHEN 'DivisionHead' THEN [HRM_Divisions].[DivisionHead] END,
     CASE @OrderBy WHEN 'DivisionHead DESC' THEN [HRM_Divisions].[DivisionHead] END DESC,
     CASE @OrderBy WHEN 'ERP_EU' THEN [HRM_Divisions].[ERP_EU] END,
     CASE @OrderBy WHEN 'ERP_EU DESC' THEN [HRM_Divisions].[ERP_EU] END DESC,
     CASE @OrderBy WHEN 'ERP_Div' THEN [HRM_Divisions].[ERP_Div] END,
     CASE @OrderBy WHEN 'ERP_Div DESC' THEN [HRM_Divisions].[ERP_Div] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC 
  SET @RecordCount = @@RowCount
GO
