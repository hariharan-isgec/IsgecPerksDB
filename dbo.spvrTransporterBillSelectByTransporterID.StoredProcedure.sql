USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrTransporterBillSelectByTransporterID]
  @TransporterID NVarChar(9),
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  [VR_TransporterBill].[TransporterID] = @TransporterID
  ORDER BY
     CASE @OrderBy WHEN 'IRNo' THEN [VR_TransporterBill].[IRNo] END,
     CASE @OrderBy WHEN 'IRNo DESC' THEN [VR_TransporterBill].[IRNo] END DESC,
     CASE @OrderBy WHEN 'IRDescription' THEN [VR_TransporterBill].[IRDescription] END,
     CASE @OrderBy WHEN 'IRDescription DESC' THEN [VR_TransporterBill].[IRDescription] END DESC,
     CASE @OrderBy WHEN 'ISGECPONumber' THEN [VR_TransporterBill].[ISGECPONumber] END,
     CASE @OrderBy WHEN 'ISGECPONumber DESC' THEN [VR_TransporterBill].[ISGECPONumber] END DESC,
     CASE @OrderBy WHEN 'ISGECPODate' THEN [VR_TransporterBill].[ISGECPODate] END,
     CASE @OrderBy WHEN 'ISGECPODate DESC' THEN [VR_TransporterBill].[ISGECPODate] END DESC,
     CASE @OrderBy WHEN 'ISGECPOAmount' THEN [VR_TransporterBill].[ISGECPOAmount] END,
     CASE @OrderBy WHEN 'ISGECPOAmount DESC' THEN [VR_TransporterBill].[ISGECPOAmount] END DESC,
     CASE @OrderBy WHEN 'TransporterID' THEN [VR_TransporterBill].[TransporterID] END,
     CASE @OrderBy WHEN 'TransporterID DESC' THEN [VR_TransporterBill].[TransporterID] END DESC,
     CASE @OrderBy WHEN 'TransporterBillNo' THEN [VR_TransporterBill].[TransporterBillNo] END,
     CASE @OrderBy WHEN 'TransporterBillNo DESC' THEN [VR_TransporterBill].[TransporterBillNo] END DESC,
     CASE @OrderBy WHEN 'TransporterBillDate' THEN [VR_TransporterBill].[TransporterBillDate] END,
     CASE @OrderBy WHEN 'TransporterBillDate DESC' THEN [VR_TransporterBill].[TransporterBillDate] END DESC,
     CASE @OrderBy WHEN 'BillAmount' THEN [VR_TransporterBill].[BillAmount] END,
     CASE @OrderBy WHEN 'BillAmount DESC' THEN [VR_TransporterBill].[BillAmount] END DESC,
     CASE @OrderBy WHEN 'BillReceivedOn' THEN [VR_TransporterBill].[BillReceivedOn] END,
     CASE @OrderBy WHEN 'BillReceivedOn DESC' THEN [VR_TransporterBill].[BillReceivedOn] END DESC,
     CASE @OrderBy WHEN 'BillReceivedBy' THEN [VR_TransporterBill].[BillReceivedBy] END,
     CASE @OrderBy WHEN 'BillReceivedBy DESC' THEN [VR_TransporterBill].[BillReceivedBy] END DESC,
     CASE @OrderBy WHEN 'BillReceiverDivisionID' THEN [VR_TransporterBill].[BillReceiverDivisionID] END,
     CASE @OrderBy WHEN 'BillReceiverDivisionID DESC' THEN [VR_TransporterBill].[BillReceiverDivisionID] END DESC,
     CASE @OrderBy WHEN 'BillStatusID' THEN [VR_TransporterBill].[BillStatusID] END,
     CASE @OrderBy WHEN 'BillStatusID DESC' THEN [VR_TransporterBill].[BillStatusID] END DESC,
     CASE @OrderBy WHEN 'DiscripantBill' THEN [VR_TransporterBill].[DiscripantBill] END,
     CASE @OrderBy WHEN 'DiscripantBill DESC' THEN [VR_TransporterBill].[DiscripantBill] END DESC,
     CASE @OrderBy WHEN 'BillReturnRemarks' THEN [VR_TransporterBill].[BillReturnRemarks] END,
     CASE @OrderBy WHEN 'BillReturnRemarks DESC' THEN [VR_TransporterBill].[BillReturnRemarks] END DESC,
     CASE @OrderBy WHEN 'BillReturnedOn' THEN [VR_TransporterBill].[BillReturnedOn] END,
     CASE @OrderBy WHEN 'BillReturnedOn DESC' THEN [VR_TransporterBill].[BillReturnedOn] END DESC,
     CASE @OrderBy WHEN 'BillReturneddBy' THEN [VR_TransporterBill].[BillReturneddBy] END,
     CASE @OrderBy WHEN 'BillReturneddBy DESC' THEN [VR_TransporterBill].[BillReturneddBy] END DESC,
     CASE @OrderBy WHEN 'ReceiptNo' THEN [VR_TransporterBill].[ReceiptNo] END,
     CASE @OrderBy WHEN 'ReceiptNo DESC' THEN [VR_TransporterBill].[ReceiptNo] END DESC,
     CASE @OrderBy WHEN 'ReceiptDate' THEN [VR_TransporterBill].[ReceiptDate] END,
     CASE @OrderBy WHEN 'ReceiptDate DESC' THEN [VR_TransporterBill].[ReceiptDate] END DESC,
     CASE @OrderBy WHEN 'ReceiptLine' THEN [VR_TransporterBill].[ReceiptLine] END,
     CASE @OrderBy WHEN 'ReceiptLine DESC' THEN [VR_TransporterBill].[ReceiptLine] END DESC,
     CASE @OrderBy WHEN 'PassedAmount' THEN [VR_TransporterBill].[PassedAmount] END,
     CASE @OrderBy WHEN 'PassedAmount DESC' THEN [VR_TransporterBill].[PassedAmount] END DESC,
     CASE @OrderBy WHEN 'ForwardedToAccount' THEN [VR_TransporterBill].[ForwardedToAccount] END,
     CASE @OrderBy WHEN 'ForwardedToAccount DESC' THEN [VR_TransporterBill].[ForwardedToAccount] END DESC,
     CASE @OrderBy WHEN 'ForwardedOn' THEN [VR_TransporterBill].[ForwardedOn] END,
     CASE @OrderBy WHEN 'ForwardedOn DESC' THEN [VR_TransporterBill].[ForwardedOn] END DESC,
     CASE @OrderBy WHEN 'ForwardedBy' THEN [VR_TransporterBill].[ForwardedBy] END,
     CASE @OrderBy WHEN 'ForwardedBy DESC' THEN [VR_TransporterBill].[ForwardedBy] END DESC,
     CASE @OrderBy WHEN 'ReceiptAcknowledgement' THEN [VR_TransporterBill].[ReceiptAcknowledgement] END,
     CASE @OrderBy WHEN 'ReceiptAcknowledgement DESC' THEN [VR_TransporterBill].[ReceiptAcknowledgement] END DESC,
     CASE @OrderBy WHEN 'ReceiptAcknowledgedOn' THEN [VR_TransporterBill].[ReceiptAcknowledgedOn] END,
     CASE @OrderBy WHEN 'ReceiptAcknowledgedOn DESC' THEN [VR_TransporterBill].[ReceiptAcknowledgedOn] END DESC,
     CASE @OrderBy WHEN 'ReceiptAcknowledgedBy' THEN [VR_TransporterBill].[ReceiptAcknowledgedBy] END,
     CASE @OrderBy WHEN 'ReceiptAcknowledgedBy DESC' THEN [VR_TransporterBill].[ReceiptAcknowledgedBy] END DESC,
     CASE @OrderBy WHEN 'DiscripantReceipt' THEN [VR_TransporterBill].[DiscripantReceipt] END,
     CASE @OrderBy WHEN 'DiscripantReceipt DESC' THEN [VR_TransporterBill].[DiscripantReceipt] END DESC,
     CASE @OrderBy WHEN 'ReceiptReturnedOn' THEN [VR_TransporterBill].[ReceiptReturnedOn] END,
     CASE @OrderBy WHEN 'ReceiptReturnedOn DESC' THEN [VR_TransporterBill].[ReceiptReturnedOn] END DESC,
     CASE @OrderBy WHEN 'ReceiptReturnedBy' THEN [VR_TransporterBill].[ReceiptReturnedBy] END,
     CASE @OrderBy WHEN 'ReceiptReturnedBy DESC' THEN [VR_TransporterBill].[ReceiptReturnedBy] END DESC,
     CASE @OrderBy WHEN 'ReceiptReturnRemarks' THEN [VR_TransporterBill].[ReceiptReturnRemarks] END,
     CASE @OrderBy WHEN 'ReceiptReturnRemarks DESC' THEN [VR_TransporterBill].[ReceiptReturnRemarks] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [VR_TransporterBill].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [VR_TransporterBill].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users4_UserFullName' THEN [aspnet_Users4].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users4_UserFullName DESC' THEN [aspnet_Users4].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users5_UserFullName' THEN [aspnet_Users5].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users5_UserFullName DESC' THEN [aspnet_Users5].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description' THEN [HRM_Divisions6].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description DESC' THEN [HRM_Divisions6].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_PaymentProcess7_PaymentDescription' THEN [VR_PaymentProcess7].[PaymentDescription] END,
     CASE @OrderBy WHEN 'VR_PaymentProcess7_PaymentDescription DESC' THEN [VR_PaymentProcess7].[PaymentDescription] END DESC,
     CASE @OrderBy WHEN 'VR_BillStatus8_Description' THEN [VR_BillStatus8].[Description] END,
     CASE @OrderBy WHEN 'VR_BillStatus8_Description DESC' THEN [VR_BillStatus8].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_Transporters9_TransporterName' THEN [VR_Transporters9].[TransporterName] END,
     CASE @OrderBy WHEN 'VR_Transporters9_TransporterName DESC' THEN [VR_Transporters9].[TransporterName] END DESC 
  SET @RecordCount = @@RowCount
GO
