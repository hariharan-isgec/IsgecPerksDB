USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetTypesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[AST_AssetTypes].[AssetTypeID],
		[AST_AssetTypes].[Description] 
  FROM [AST_AssetTypes] 
  ORDER BY
     CASE @orderBy WHEN 'AssetTypeID' THEN [AST_AssetTypes].[AssetTypeID] END,
     CASE @orderBy WHEN 'AssetTypeID DESC' THEN [AST_AssetTypes].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [AST_AssetTypes].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [AST_AssetTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
