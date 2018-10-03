USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetStatesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [COST_CostSheetStates].*  
  FROM [COST_CostSheetStates] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [COST_CostSheetStates].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [COST_CostSheetStates].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [COST_CostSheetStates].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [COST_CostSheetStates].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
