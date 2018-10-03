USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostDivisionsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [COST_Divisions].*  
  FROM [COST_Divisions] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'DivisionID' THEN [COST_Divisions].[DivisionID] END,
     CASE @OrderBy WHEN 'DivisionID DESC' THEN [COST_Divisions].[DivisionID] END DESC,
     CASE @OrderBy WHEN 'DivisionName' THEN [COST_Divisions].[DivisionName] END,
     CASE @OrderBy WHEN 'DivisionName DESC' THEN [COST_Divisions].[DivisionName] END DESC 
  SET @RecordCount = @@RowCount
GO
