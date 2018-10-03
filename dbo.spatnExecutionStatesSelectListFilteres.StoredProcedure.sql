USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnExecutionStatesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  ExecutionState Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (ExecutionState) ' + 
               'SELECT [ATN_ExecutionStates].[ExecutionState] FROM [ATN_ExecutionStates] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ExecutionState' THEN '[ATN_ExecutionStates].[ExecutionState]'
                        WHEN 'ExecutionState DESC' THEN '[ATN_ExecutionStates].[ExecutionState] DESC'
                        WHEN 'Description' THEN '[ATN_ExecutionStates].[Description]'
                        WHEN 'Description DESC' THEN '[ATN_ExecutionStates].[Description] DESC'
                        ELSE '[ATN_ExecutionStates].[ExecutionState]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_ExecutionStates].[ExecutionState],
		[ATN_ExecutionStates].[Description] 
  FROM [ATN_ExecutionStates] 
    	INNER JOIN #PageIndex
          ON [ATN_ExecutionStates].[ExecutionState] = #PageIndex.ExecutionState
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
