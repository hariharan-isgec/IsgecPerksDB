USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchastAssetTypes]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  AssetTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (AssetTypeID)
  SELECT [AST_AssetTypes].[AssetTypeID] FROM [AST_AssetTypes]
  WHERE STR(ISNULL([AST_AssetTypes].[AssetTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_AssetTypes].[Description],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [AST_AssetTypes].[AssetTypeID] AS SearchCode, 
  ISNULL([AST_AssetTypes].[Description],'') 
  AS SearchDescription 
  FROM [AST_AssetTypes] 
    	INNER JOIN #PageIndex
          ON [AST_AssetTypes].[AssetTypeID] = #PageIndex.AssetTypeID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
