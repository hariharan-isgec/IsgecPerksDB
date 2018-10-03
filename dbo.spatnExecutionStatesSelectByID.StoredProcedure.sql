USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnExecutionStatesSelectByID]
  @ExecutionState Int
  AS
  SELECT
		[ATN_ExecutionStates].[ExecutionState],
		[ATN_ExecutionStates].[Description] 
  FROM [ATN_ExecutionStates] 
  WHERE
  [ATN_ExecutionStates].[ExecutionState] = @ExecutionState
GO
