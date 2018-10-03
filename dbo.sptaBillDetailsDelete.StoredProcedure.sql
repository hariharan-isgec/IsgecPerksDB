USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaBillDetailsDelete]
  @Original_TABillNo Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_BillDetails]
  WHERE
  [TA_BillDetails].[TABillNo] = @Original_TABillNo
  AND [TA_BillDetails].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
