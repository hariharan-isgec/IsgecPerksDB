USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillPrjAmountsDelete]
  @Original_TABillNo Int,
  @Original_ProjectID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_BillPrjAmounts]
  WHERE
  [TA_BillPrjAmounts].[TABillNo] = @Original_TABillNo
  AND [TA_BillPrjAmounts].[ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
