USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLocationsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ASM_AstLocations].[LocationID],
		[ASM_AstLocations].[Description] 
  FROM [ASM_AstLocations] 
  ORDER BY
     CASE @orderBy WHEN 'LocationID' THEN [ASM_AstLocations].[LocationID] END,
     CASE @orderBy WHEN 'LocationID DESC' THEN [ASM_AstLocations].[LocationID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ASM_AstLocations].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ASM_AstLocations].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
