USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrTransporterBillSelectByID]
  @LoginID NVarChar(8),
  @IRNo Int 
  AS
  SELECT
		[VR_TransporterBill].[IRNo] ,
		[VR_TransporterBill].[IRDescription] ,
		[VR_TransporterBill].[ISGECPONumber] ,
		[VR_TransporterBill].[ISGECPODate] ,
		[VR_TransporterBill].[ISGECPOAmount] ,
		[VR_TransporterBill].[TransporterID] ,
		[VR_TransporterBill].[TransporterBillNo] ,
		[VR_TransporterBill].[TransporterBillDate] ,
		[VR_TransporterBill].[BillAmount] ,
		[VR_TransporterBill].[BillReceivedOn] ,
		[VR_TransporterBill].[BillReceivedBy] ,
		[VR_TransporterBill].[BillReceiverDivisionID] ,
		[VR_TransporterBill].[BillStatusID] ,
		[VR_TransporterBill].[DiscripantBill] ,
		[VR_TransporterBill].[BillReturnRemarks] ,
		[VR_TransporterBill].[BillReturnedOn] ,
		[VR_TransporterBill].[BillReturneddBy] ,
		[VR_TransporterBill].[ReceiptNo] ,
		[VR_TransporterBill].[ReceiptDate] ,
		[VR_TransporterBill].[ReceiptLine] ,
		[VR_TransporterBill].[PassedAmount] ,
		[VR_TransporterBill].[ForwardedToAccount] ,
		[VR_TransporterBill].[ForwardedOn] ,
		[VR_TransporterBill].[ForwardedBy] ,
		[VR_TransporterBill].[ReceiptAcknowledgement] ,
		[VR_TransporterBill].[ReceiptAcknowledgedOn] ,
		[VR_TransporterBill].[ReceiptAcknowledgedBy] ,
		[VR_TransporterBill].[DiscripantReceipt] ,
		[VR_TransporterBill].[ReceiptReturnedOn] ,
		[VR_TransporterBill].[ReceiptReturnedBy] ,
		[VR_TransporterBill].[ReceiptReturnRemarks] ,
		[VR_TransporterBill].[SerialNo] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[aspnet_Users4].[UserFullName] AS aspnet_Users4_UserFullName,
		[aspnet_Users5].[UserFullName] AS aspnet_Users5_UserFullName,
		[HRM_Divisions6].[Description] AS HRM_Divisions6_Description,
		[VR_PaymentProcess7].[PaymentDescription] AS VR_PaymentProcess7_PaymentDescription,
		[VR_BillStatus8].[Description] AS VR_BillStatus8_Description,
		[VR_Transporters9].[TransporterName] AS VR_Transporters9_TransporterName 
  FROM [VR_TransporterBill] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VR_TransporterBill].[BillReturneddBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [VR_TransporterBill].[ForwardedBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [VR_TransporterBill].[ReceiptAcknowledgedBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]
    ON [VR_TransporterBill].[ReceiptReturnedBy] = [aspnet_Users4].[LoginID]
  INNER JOIN [aspnet_Users] AS [aspnet_Users5]
    ON [VR_TransporterBill].[BillReceivedBy] = [aspnet_Users5].[LoginID]
  INNER JOIN [HRM_Divisions] AS [HRM_Divisions6]
    ON [VR_TransporterBill].[BillReceiverDivisionID] = [HRM_Divisions6].[DivisionID]
  LEFT OUTER JOIN [VR_PaymentProcess] AS [VR_PaymentProcess7]
    ON [VR_TransporterBill].[SerialNo] = [VR_PaymentProcess7].[SerialNo]
  INNER JOIN [VR_BillStatus] AS [VR_BillStatus8]
    ON [VR_TransporterBill].[BillStatusID] = [VR_BillStatus8].[BillStatusID]
  INNER JOIN [VR_Transporters] AS [VR_Transporters9]
    ON [VR_TransporterBill].[TransporterID] = [VR_Transporters9].[TransporterID]
  WHERE
  [VR_TransporterBill].[IRNo] = @IRNo
GO
