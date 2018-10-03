USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostFinYearSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [COST_FinYear].*  
  FROM [COST_FinYear] 
  WHERE 1 = 1  
  ORDER BY FinYear DESC
     --CASE @OrderBy WHEN 'FinYear' THEN [COST_FinYear].[FinYear] END,
     --CASE @OrderBy WHEN 'FinYear DESC' THEN [COST_FinYear].[FinYear] END DESC,
     --CASE @OrderBy WHEN 'Descpription' THEN [COST_FinYear].[Descpription] END,
     --CASE @OrderBy WHEN 'Descpription DESC' THEN [COST_FinYear].[Descpription] END DESC 
  SET @RecordCount = @@RowCount
GO
