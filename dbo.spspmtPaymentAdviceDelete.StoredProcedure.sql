USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtPaymentAdviceDelete]
  @Original_AdviceNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_PaymentAdvice]
  WHERE
  [SPMT_PaymentAdvice].[AdviceNo] = @Original_AdviceNo
  SET @RowCount = @@RowCount
GO
