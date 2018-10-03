USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtACVouchersSelectByID]
  @VoucherNo Int 
  AS
  SELECT
		[SPMT_ACVouchers].[VoucherNo] ,
		[SPMT_ACVouchers].[VoucherDate] ,
		[SPMT_ACVouchers].[VendorID] ,
		[SPMT_ACVouchers].[CreatedBy] ,
		[SPMT_ACVouchers].[CreatedOn] ,
		[SPMT_ACVouchers].[PostedInBaaN] ,
		[SPMT_ACVouchers].[BatchNo] ,
		[SPMT_ACVouchers].[BatchDate] ,
		[SPMT_ACVouchers].[DocumentNo] ,
		[SPMT_ACVouchers].[ChequeNo] ,
		[SPMT_ACVouchers].[ChequeDate] ,
		[SPMT_ACVouchers].[PostedBy] ,
		[SPMT_ACVouchers].[PostedOn] ,
		[SPMT_ACVouchers].[PostingRemarks] ,
		[SPMT_ACVouchers].[PaidToSupplier] ,
		[SPMT_ACVouchers].[PaidOn] ,
		[SPMT_ACVouchers].[PaidBy] ,
		[SPMT_ACVouchers].[PaidRemarks] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[SPMT_Vendors4].[Description] AS SPMT_Vendors4_Description 
  FROM [SPMT_ACVouchers] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SPMT_ACVouchers].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [SPMT_ACVouchers].[PostedBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [SPMT_ACVouchers].[PaidBy] = [aspnet_Users3].[LoginID]
  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors4]
    ON [SPMT_ACVouchers].[VendorID] = [SPMT_Vendors4].[VendorID]
  WHERE
  [SPMT_ACVouchers].[VoucherNo] = @VoucherNo
GO
