USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnExecutionStatesSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  ExecutionState Int NOT NULL
  )
  INSERT INTO #PageIndex (ExecutionState)
  SELECT [ATN_ExecutionStates].[ExecutionState] FROM [ATN_ExecutionStates]
 WHERE  
   ( 
         STR(ISNULL([ATN_ExecutionStates].[ExecutionState], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ExecutionStates].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'ExecutionState' THEN [ATN_ExecutionStates].[ExecutionState] END,
     CASE @orderBy WHEN 'ExecutionState DESC' THEN [ATN_ExecutionStates].[ExecutionState] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ATN_ExecutionStates].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ATN_ExecutionStates].[Description] END DESC 

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
