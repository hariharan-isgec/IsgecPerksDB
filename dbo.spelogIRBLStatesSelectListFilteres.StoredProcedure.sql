USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogIRBLStatesSelectListFilteres]
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
 ,StatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'StatusID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ELOG_IRBLStates].[StatusID]'
  SET @LGSQL = @LGSQL + ' FROM [ELOG_IRBLStates] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'StatusID' THEN '[ELOG_IRBLStates].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[ELOG_IRBLStates].[StatusID] DESC'
                        WHEN 'Description' THEN '[ELOG_IRBLStates].[Description]'
                        WHEN 'Description DESC' THEN '[ELOG_IRBLStates].[Description] DESC'
                        ELSE '[ELOG_IRBLStates].[StatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ELOG_IRBLStates].*  
  FROM [ELOG_IRBLStates] 
      INNER JOIN #PageIndex
          ON [ELOG_IRBLStates].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
