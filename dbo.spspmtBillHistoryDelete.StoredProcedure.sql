USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtBillHistoryDelete]
  @Original_IRNo Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_BillHistory]
  WHERE
  [SPMT_BillHistory].[IRNo] = @Original_IRNo
  AND [SPMT_BillHistory].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
