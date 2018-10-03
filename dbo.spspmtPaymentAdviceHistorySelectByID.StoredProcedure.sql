USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtPaymentAdviceHistorySelectByID]
  @AdviceNo Int,
  @SerialNo Int 
  AS
  SELECT
		[SPMT_PaymentAdviceHistory].[AdviceNo] ,
		[SPMT_PaymentAdviceHistory].[SerialNo] ,
		[SPMT_PaymentAdviceHistory].[TranTypeID] ,
		[SPMT_PaymentAdviceHistory].[VendorID] ,
		[SPMT_PaymentAdviceHistory].[CostCenter] ,
		[SPMT_PaymentAdviceHistory].[ConcernedHOD] ,
		[SPMT_PaymentAdviceHistory].[AdviceStatusID] ,
		[SPMT_PaymentAdviceHistory].[AdviceStatusOn] ,
		[SPMT_PaymentAdviceHistory].[AdviceStatusUser] ,
		[SPMT_PaymentAdviceHistory].[Remarks] ,
		[SPMT_PaymentAdviceHistory].[RemarksHOD] ,
		[SPMT_PaymentAdviceHistory].[RemarksHR] ,
		[SPMT_PaymentAdviceHistory].[RemarksAC] ,
		[SPMT_PaymentAdviceHistory].[Returned] ,
		[SPMT_PaymentAdviceHistory].[Forward] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[SPMT_PAStatus3].[Description] AS SPMT_PAStatus3_Description,
		[SPMT_Vendors5].[Description] AS SPMT_Vendors5_Description 
  FROM [SPMT_PaymentAdviceHistory] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SPMT_PaymentAdviceHistory].[ConcernedHOD] = [aspnet_Users1].[LoginID]
  INNER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [SPMT_PaymentAdviceHistory].[AdviceStatusUser] = [aspnet_Users2].[LoginID]
  INNER JOIN [SPMT_PAStatus] AS [SPMT_PAStatus3]
    ON [SPMT_PaymentAdviceHistory].[AdviceStatusID] = [SPMT_PAStatus3].[AdviceStatusID]
  INNER JOIN [SPMT_PaymentAdvice] AS [SPMT_PaymentAdvice4]
    ON [SPMT_PaymentAdviceHistory].[AdviceNo] = [SPMT_PaymentAdvice4].[AdviceNo]
  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors5]
    ON [SPMT_PaymentAdviceHistory].[VendorID] = [SPMT_Vendors5].[VendorID]
  WHERE
  [SPMT_PaymentAdviceHistory].[AdviceNo] = @AdviceNo
  AND [SPMT_PaymentAdviceHistory].[SerialNo] = @SerialNo
GO
