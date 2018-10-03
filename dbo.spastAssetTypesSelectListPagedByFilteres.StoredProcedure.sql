USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetTypesSelectListPagedByFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  AssetTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (AssetTypeID) ' + 
               'SELECT [AST_AssetTypes].[AssetTypeID] FROM [AST_AssetTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'AssetTypeID' THEN '[AST_AssetTypes].[AssetTypeID]'
                        WHEN 'AssetTypeID DESC' THEN '[AST_AssetTypes].[AssetTypeID] DESC'
                        WHEN 'Description' THEN '[AST_AssetTypes].[Description]'
                        WHEN 'Description DESC' THEN '[AST_AssetTypes].[Description] DESC'
                        ELSE '[AST_AssetTypes].[AssetTypeID]'
                    END
  EXEC (@LGSQL)

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
  END
GO
