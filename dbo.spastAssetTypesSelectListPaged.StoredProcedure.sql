USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetTypesSelectListPaged]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  AssetTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (AssetTypeID)
  SELECT [AST_AssetTypes].[AssetTypeID] FROM [AST_AssetTypes]
  ORDER BY
     CASE @orderBy WHEN 'AssetTypeID' THEN [AST_AssetTypes].[AssetTypeID] END,
     CASE @orderBy WHEN 'AssetTypeID DESC' THEN [AST_AssetTypes].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [AST_AssetTypes].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [AST_AssetTypes].[Description] END DESC 

  SET @RecordCount = @@RowCount

  SELECT
		[AST_AssetTypes].[AssetTypeID],
		[AST_AssetTypes].[Description] 
  FROM [AST_AssetTypes] 
    	INNER JOIN #PageIndex
          ON [AST_AssetTypes].[AssetTypeID] = #PageIndex.AssetTypeID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
GO
