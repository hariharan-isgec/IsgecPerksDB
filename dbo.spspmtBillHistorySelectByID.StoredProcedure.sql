USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtBillHistorySelectByID]
  @IRNo Int,
  @SerialNo Int 
  AS
  SELECT
		[SPMT_BillHistory].[IRNo] ,
		[SPMT_BillHistory].[SerialNo] ,
		[SPMT_BillHistory].[TranTypeID] ,
		[SPMT_BillHistory].[IRReceivedOn] ,
		[SPMT_BillHistory].[VendorID] ,
		[SPMT_BillHistory].[BillNumber] ,
		[SPMT_BillHistory].[BillDate] ,
		[SPMT_BillHistory].[BillAmount] ,
		[SPMT_BillHistory].[BillStatusID] ,
		[SPMT_BillHistory].[BillStatusDate] ,
		[SPMT_BillHistory].[BillStatusUser] ,
		[SPMT_BillHistory].[LogisticLinked] ,
		[SPMT_BillHistory].[Remarks] ,
		[SPMT_BillHistory].[PassedAmount] ,
		[SPMT_BillHistory].[ApprovedAmount] ,
		[SPMT_BillHistory].[RemarksAC] ,
		[SPMT_BillHistory].[ReturnedByAC] ,
		[SPMT_BillHistory].[ReasonID] ,
		[SPMT_BillHistory].[AdviceNo] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[SPMT_BillStatus2].[Description] AS SPMT_BillStatus2_Description,
		[SPMT_Vendors1].[Description] AS SPMT_Vendors1_Description,
		[SPMT_ReturnReason2].[Description] AS SPMT_ReturnReason2_Description 
  FROM [SPMT_BillHistory] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SPMT_BillHistory].[BillStatusUser] = [aspnet_Users1].[LoginID]
  INNER JOIN [SPMT_BillStatus] AS [SPMT_BillStatus2]
    ON [SPMT_BillHistory].[BillStatusID] = [SPMT_BillStatus2].[BillStatusID]
  INNER JOIN [SPMT_SupplierBill] AS [SPMT_SupplierBill3]
    ON [SPMT_BillHistory].[IRNo] = [SPMT_SupplierBill3].[IRNo]
  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors1]
    ON [SPMT_BillHistory].[VendorID] = [SPMT_Vendors1].[VendorID]
  LEFT OUTER JOIN [SPMT_PaymentAdvice] AS [SPMT_PaymentAdvice1]
    ON [SPMT_BillHistory].[AdviceNo] = [SPMT_PaymentAdvice1].[AdviceNo]
  LEFT OUTER JOIN [SPMT_ReturnReason] AS [SPMT_ReturnReason2]
    ON [SPMT_BillHistory].[ReasonID] = [SPMT_ReturnReason2].[ReasonID]
  WHERE
  [SPMT_BillHistory].[IRNo] = @IRNo
  AND [SPMT_BillHistory].[SerialNo] = @SerialNo
GO
