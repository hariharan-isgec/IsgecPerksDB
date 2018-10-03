USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakDivisionsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_Divisions].*  
  FROM [PAK_Divisions] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'DivisionID' THEN [PAK_Divisions].[DivisionID] END,
     CASE @OrderBy WHEN 'DivisionID DESC' THEN [PAK_Divisions].[DivisionID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_Divisions].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_Divisions].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
