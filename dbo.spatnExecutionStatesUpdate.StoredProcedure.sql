USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnExecutionStatesUpdate]
  @Description NVarChar(20),
  @Original_ExecutionState Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_ExecutionStates] SET 
   [Description] = @Description
  WHERE
  [ExecutionState] = @Original_ExecutionState
  SET @RowCount = @@RowCount
GO
