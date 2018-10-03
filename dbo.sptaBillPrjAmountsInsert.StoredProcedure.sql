USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillPrjAmountsInsert]
  @TABillNo Int,
  @ProjectID NVarChar(6),
  @Percentage Decimal(6,2),
  @TotalAmountinINR Decimal(18,2),
  @Return_TABillNo Int = null OUTPUT, 
  @Return_ProjectID NVarChar(6) = null OUTPUT 
  AS
  INSERT [TA_BillPrjAmounts]
  (
   [TABillNo]
  ,[ProjectID]
  ,[Percentage]
  ,[TotalAmountinINR]
  )
  VALUES
  (
   @TABillNo
  ,UPPER(@ProjectID)
  ,@Percentage
  ,@TotalAmountinINR
  )
  SET @Return_TABillNo = @TABillNo
  SET @Return_ProjectID = @ProjectID
GO
