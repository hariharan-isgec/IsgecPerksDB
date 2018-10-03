USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastLocationsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[AST_Locations].[LocationID],
		[AST_Locations].[Descriptions] 
  FROM [AST_Locations] 
  ORDER BY
     CASE @orderBy WHEN 'LocationID' THEN [AST_Locations].[LocationID] END,
     CASE @orderBy WHEN 'LocationID DESC' THEN [AST_Locations].[LocationID] END DESC,
     CASE @orderBy WHEN 'Descriptions' THEN [AST_Locations].[Descriptions] END,
     CASE @orderBy WHEN 'Descriptions DESC' THEN [AST_Locations].[Descriptions] END DESC 
  SET @RecordCount = @@RowCount
GO
