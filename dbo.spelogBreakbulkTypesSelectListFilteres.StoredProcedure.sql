USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBreakbulkTypesSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,BreakbulkTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'BreakbulkTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ELOG_BreakbulkTypes].[BreakbulkTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [ELOG_BreakbulkTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'BreakbulkTypeID' THEN '[ELOG_BreakbulkTypes].[BreakbulkTypeID]'
                        WHEN 'BreakbulkTypeID DESC' THEN '[ELOG_BreakbulkTypes].[BreakbulkTypeID] DESC'
                        WHEN 'Description' THEN '[ELOG_BreakbulkTypes].[Description]'
                        WHEN 'Description DESC' THEN '[ELOG_BreakbulkTypes].[Description] DESC'
                        ELSE '[ELOG_BreakbulkTypes].[BreakbulkTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ELOG_BreakbulkTypes].*  
  FROM [ELOG_BreakbulkTypes] 
      INNER JOIN #PageIndex
          ON [ELOG_BreakbulkTypes].[BreakbulkTypeID] = #PageIndex.BreakbulkTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
