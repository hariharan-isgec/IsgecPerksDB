USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtNewSBHDelete]
  @Original_IRNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_newSBH]
  WHERE
  [SPMT_newSBH].[IRNo] = @Original_IRNo
  SET @RowCount = @@RowCount
GO
