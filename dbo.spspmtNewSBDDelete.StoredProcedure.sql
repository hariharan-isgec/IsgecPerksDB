USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtNewSBDDelete]
  @Original_IRNo Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_newSBD]
  WHERE
  [SPMT_newSBD].[IRNo] = @Original_IRNo
  AND [SPMT_newSBD].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
