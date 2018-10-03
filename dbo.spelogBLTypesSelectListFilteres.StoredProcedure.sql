USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBLTypesSelectListFilteres]
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
 ,BLTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'BLTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ELOG_BLTypes].[BLTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [ELOG_BLTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'BLTypeID' THEN '[ELOG_BLTypes].[BLTypeID]'
                        WHEN 'BLTypeID DESC' THEN '[ELOG_BLTypes].[BLTypeID] DESC'
                        WHEN 'Description' THEN '[ELOG_BLTypes].[Description]'
                        WHEN 'Description DESC' THEN '[ELOG_BLTypes].[Description] DESC'
                        ELSE '[ELOG_BLTypes].[BLTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ELOG_BLTypes].*  
  FROM [ELOG_BLTypes] 
      INNER JOIN #PageIndex
          ON [ELOG_BLTypes].[BLTypeID] = #PageIndex.BLTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
