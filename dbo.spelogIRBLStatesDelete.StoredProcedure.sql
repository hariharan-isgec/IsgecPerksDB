USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogIRBLStatesDelete]
  @Original_StatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_IRBLStates]
  WHERE
  [ELOG_IRBLStates].[StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
