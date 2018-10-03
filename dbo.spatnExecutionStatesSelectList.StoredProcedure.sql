USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnExecutionStatesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ATN_ExecutionStates].[ExecutionState],
		[ATN_ExecutionStates].[Description] 
  FROM [ATN_ExecutionStates] 
  ORDER BY
     CASE @orderBy WHEN 'ExecutionState' THEN [ATN_ExecutionStates].[ExecutionState] END,
     CASE @orderBy WHEN 'ExecutionState DESC' THEN [ATN_ExecutionStates].[ExecutionState] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ATN_ExecutionStates].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ATN_ExecutionStates].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
