USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstTypesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,AssetTypeID NVarChar(10) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'AssetTypeID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ASM_AstTypes].[AssetTypeID]'  SET @LGSQL = @LGSQL + ' FROM [ASM_AstTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'AssetTypeID' THEN '[ASM_AstTypes].[AssetTypeID]'
                        WHEN 'AssetTypeID DESC' THEN '[ASM_AstTypes].[AssetTypeID] DESC'
                        WHEN 'Description' THEN '[ASM_AstTypes].[Description]'
                        WHEN 'Description DESC' THEN '[ASM_AstTypes].[Description] DESC'
                        WHEN 'IssueToLocation' THEN '[ASM_AstTypes].[IssueToLocation]'
                        WHEN 'IssueToLocation DESC' THEN '[ASM_AstTypes].[IssueToLocation] DESC'
                        ELSE '[ASM_AstTypes].[AssetTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ASM_AstTypes].[AssetTypeID],
		[ASM_AstTypes].[Description],
		[ASM_AstTypes].[IssueToLocation] 
  FROM [ASM_AstTypes] 
    	INNER JOIN #PageIndex
          ON [ASM_AstTypes].[AssetTypeID] = #PageIndex.AssetTypeID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
