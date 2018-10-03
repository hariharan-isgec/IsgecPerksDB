USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaBillGSTDelete]
  @Original_TABillNo Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_BillGST]
  WHERE
  [TA_BillGST].[TABillNo] = @Original_TABillNo
  AND [TA_BillGST].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
