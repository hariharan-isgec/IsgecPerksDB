USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstTypesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ASM_AstTypes].[AssetTypeID],
		[ASM_AstTypes].[Description],
		[ASM_AstTypes].[IssueToLocation] 
  FROM [ASM_AstTypes] 
  ORDER BY
     CASE @orderBy WHEN 'AssetTypeID' THEN [ASM_AstTypes].[AssetTypeID] END,
     CASE @orderBy WHEN 'AssetTypeID DESC' THEN [ASM_AstTypes].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ASM_AstTypes].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ASM_AstTypes].[Description] END DESC,
     CASE @orderBy WHEN 'IssueToLocation' THEN [ASM_AstTypes].[IssueToLocation] END,
     CASE @orderBy WHEN 'IssueToLocation DESC' THEN [ASM_AstTypes].[IssueToLocation] END DESC 
  SET @RecordCount = @@RowCount
GO
