USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFinYearSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[PMS_FinYear].[FinYear] ,
		[PMS_FinYear].[Description] ,
		[PMS_FinYear].[Active] ,
		[PMS_FinYear].[PlanningOpen] ,
		[PMS_FinYear].[MidTermOpen] ,
		[PMS_FinYear].[FinalOpen]  
  FROM [PMS_FinYear] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'FinYear' THEN [PMS_FinYear].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [PMS_FinYear].[FinYear] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PMS_FinYear].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PMS_FinYear].[Description] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [PMS_FinYear].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [PMS_FinYear].[Active] END DESC,
     CASE @OrderBy WHEN 'PlanningOpen' THEN [PMS_FinYear].[PlanningOpen] END,
     CASE @OrderBy WHEN 'PlanningOpen DESC' THEN [PMS_FinYear].[PlanningOpen] END DESC,
     CASE @OrderBy WHEN 'MidTermOpen' THEN [PMS_FinYear].[MidTermOpen] END,
     CASE @OrderBy WHEN 'MidTermOpen DESC' THEN [PMS_FinYear].[MidTermOpen] END DESC,
     CASE @OrderBy WHEN 'FinalOpen' THEN [PMS_FinYear].[FinalOpen] END,
     CASE @OrderBy WHEN 'FinalOpen DESC' THEN [PMS_FinYear].[FinalOpen] END DESC 
  SET @RecordCount = @@RowCount
GO
