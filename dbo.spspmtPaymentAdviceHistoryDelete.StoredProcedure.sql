USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtPaymentAdviceHistoryDelete]
  @Original_AdviceNo Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_PaymentAdviceHistory]
  WHERE
  [SPMT_PaymentAdviceHistory].[AdviceNo] = @Original_AdviceNo
  AND [SPMT_PaymentAdviceHistory].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
