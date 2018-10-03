USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostQuartersSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [COST_Quarters].*  
  FROM [COST_Quarters] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'Quarter' THEN [COST_Quarters].[Quarter] END,
     CASE @OrderBy WHEN 'Quarter DESC' THEN [COST_Quarters].[Quarter] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [COST_Quarters].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [COST_Quarters].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
