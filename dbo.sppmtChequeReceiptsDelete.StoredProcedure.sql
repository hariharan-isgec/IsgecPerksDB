USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtChequeReceiptsDelete]
  @Original_CQRNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PMT_CQReceipts]
  WHERE
  [PMT_CQReceipts].[CQRNo] = @Original_CQRNo
  SET @RowCount = @@RowCount
GO
