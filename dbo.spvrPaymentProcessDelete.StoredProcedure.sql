USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrPaymentProcessDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_PaymentProcess]
  WHERE
  [VR_PaymentProcess].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
