USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaBillLastDelete]
  @Original_TABillNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_BillLast]
  WHERE
  [TA_BillLast].[TABillNo] = @Original_TABillNo
  SET @RowCount = @@RowCount
GO
