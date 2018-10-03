USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillPrjAmountsUpdate]
  @Original_TABillNo Int, 
  @Original_ProjectID NVarChar(6), 
  @TABillNo Int,
  @ProjectID NVarChar(6),
  @Percentage Decimal(6,2),
  @TotalAmountinINR Decimal(18,2),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_BillPrjAmounts] SET 
   [TABillNo] = @TABillNo
  ,[ProjectID] = @ProjectID
  ,[Percentage] = @Percentage
  ,[TotalAmountinINR] = @TotalAmountinINR
  WHERE
  [TABillNo] = @Original_TABillNo
  AND [ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
