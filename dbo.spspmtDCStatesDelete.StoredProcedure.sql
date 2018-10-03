USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCStatesDelete]
  @Original_StatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_DCStates]
  WHERE
  [SPMT_DCStates].[StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
