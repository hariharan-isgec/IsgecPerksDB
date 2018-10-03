USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnExecutionStatesDelete]
  @Original_ExecutionState Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_ExecutionStates]
  WHERE
  [ATN_ExecutionStates].[ExecutionState] = @Original_ExecutionState
  SET @RowCount = @@RowCount
GO
