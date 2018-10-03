USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrTransporterBillSelectListFilteres]
  @Filter_TransporterID NVarChar(9),
  @Filter_BillReceiverDivisionID NVarChar(6),
  @Filter_BillStatusID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,IRNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'IRNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_TransporterBill].[IRNo]'
  SET @LGSQL = @LGSQL + ' FROM [VR_TransporterBill] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [VR_TransporterBill].[BillReturneddBy] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [VR_TransporterBill].[ForwardedBy] = [aspnet_Users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]'
  SET @LGSQL = @LGSQL + '    ON [VR_TransporterBill].[ReceiptAcknowledgedBy] = [aspnet_Users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]'
  SET @LGSQL = @LGSQL + '    ON [VR_TransporterBill].[ReceiptReturnedBy] = [aspnet_Users4].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users5]'
  SET @LGSQL = @LGSQL + '    ON [VR_TransporterBill].[BillReceivedBy] = [aspnet_Users5].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Divisions] AS [HRM_Divisions6]'
  SET @LGSQL = @LGSQL + '    ON [VR_TransporterBill].[BillReceiverDivisionID] = [HRM_Divisions6].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_PaymentProcess] AS [VR_PaymentProcess7]'
  SET @LGSQL = @LGSQL + '    ON [VR_TransporterBill].[SerialNo] = [VR_PaymentProcess7].[SerialNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [VR_BillStatus] AS [VR_BillStatus8]'
  SET @LGSQL = @LGSQL + '    ON [VR_TransporterBill].[BillStatusID] = [VR_BillStatus8].[BillStatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [VR_Transporters] AS [VR_Transporters9]'
  SET @LGSQL = @LGSQL + '    ON [VR_TransporterBill].[TransporterID] = [VR_Transporters9].[TransporterID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_TransporterID > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_TransporterBill].[TransporterID] = ''' + @Filter_TransporterID + ''''
  IF (@Filter_BillReceiverDivisionID > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_TransporterBill].[BillReceiverDivisionID] = ''' + @Filter_BillReceiverDivisionID + ''''
  IF (@Filter_BillStatusID > 0) 
    SET @LGSQL = @LGSQL + ' AND [VR_TransporterBill].[BillStatusID] = ' + STR(@Filter_BillStatusID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'IRNo' THEN '[VR_TransporterBill].[IRNo]'
                        WHEN 'IRNo DESC' THEN '[VR_TransporterBill].[IRNo] DESC'
                        WHEN 'IRDescription' THEN '[VR_TransporterBill].[IRDescription]'
                        WHEN 'IRDescription DESC' THEN '[VR_TransporterBill].[IRDescription] DESC'
                        WHEN 'ISGECPONumber' THEN '[VR_TransporterBill].[ISGECPONumber]'
                        WHEN 'ISGECPONumber DESC' THEN '[VR_TransporterBill].[ISGECPONumber] DESC'
                        WHEN 'ISGECPODate' THEN '[VR_TransporterBill].[ISGECPODate]'
                        WHEN 'ISGECPODate DESC' THEN '[VR_TransporterBill].[ISGECPODate] DESC'
                        WHEN 'ISGECPOAmount' THEN '[VR_TransporterBill].[ISGECPOAmount]'
                        WHEN 'ISGECPOAmount DESC' THEN '[VR_TransporterBill].[ISGECPOAmount] DESC'
                        WHEN 'TransporterID' THEN '[VR_TransporterBill].[TransporterID]'
                        WHEN 'TransporterID DESC' THEN '[VR_TransporterBill].[TransporterID] DESC'
                        WHEN 'TransporterBillNo' THEN '[VR_TransporterBill].[TransporterBillNo]'
                        WHEN 'TransporterBillNo DESC' THEN '[VR_TransporterBill].[TransporterBillNo] DESC'
                        WHEN 'TransporterBillDate' THEN '[VR_TransporterBill].[TransporterBillDate]'
                        WHEN 'TransporterBillDate DESC' THEN '[VR_TransporterBill].[TransporterBillDate] DESC'
                        WHEN 'BillAmount' THEN '[VR_TransporterBill].[BillAmount]'
                        WHEN 'BillAmount DESC' THEN '[VR_TransporterBill].[BillAmount] DESC'
                        WHEN 'BillReceivedOn' THEN '[VR_TransporterBill].[BillReceivedOn]'
                        WHEN 'BillReceivedOn DESC' THEN '[VR_TransporterBill].[BillReceivedOn] DESC'
                        WHEN 'BillReceivedBy' THEN '[VR_TransporterBill].[BillReceivedBy]'
                        WHEN 'BillReceivedBy DESC' THEN '[VR_TransporterBill].[BillReceivedBy] DESC'
                        WHEN 'BillReceiverDivisionID' THEN '[VR_TransporterBill].[BillReceiverDivisionID]'
                        WHEN 'BillReceiverDivisionID DESC' THEN '[VR_TransporterBill].[BillReceiverDivisionID] DESC'
                        WHEN 'BillStatusID' THEN '[VR_TransporterBill].[BillStatusID]'
                        WHEN 'BillStatusID DESC' THEN '[VR_TransporterBill].[BillStatusID] DESC'
                        WHEN 'DiscripantBill' THEN '[VR_TransporterBill].[DiscripantBill]'
                        WHEN 'DiscripantBill DESC' THEN '[VR_TransporterBill].[DiscripantBill] DESC'
                        WHEN 'BillReturnRemarks' THEN '[VR_TransporterBill].[BillReturnRemarks]'
                        WHEN 'BillReturnRemarks DESC' THEN '[VR_TransporterBill].[BillReturnRemarks] DESC'
                        WHEN 'BillReturnedOn' THEN '[VR_TransporterBill].[BillReturnedOn]'
                        WHEN 'BillReturnedOn DESC' THEN '[VR_TransporterBill].[BillReturnedOn] DESC'
                        WHEN 'BillReturneddBy' THEN '[VR_TransporterBill].[BillReturneddBy]'
                        WHEN 'BillReturneddBy DESC' THEN '[VR_TransporterBill].[BillReturneddBy] DESC'
                        WHEN 'ReceiptNo' THEN '[VR_TransporterBill].[ReceiptNo]'
                        WHEN 'ReceiptNo DESC' THEN '[VR_TransporterBill].[ReceiptNo] DESC'
                        WHEN 'ReceiptDate' THEN '[VR_TransporterBill].[ReceiptDate]'
                        WHEN 'ReceiptDate DESC' THEN '[VR_TransporterBill].[ReceiptDate] DESC'
                        WHEN 'ReceiptLine' THEN '[VR_TransporterBill].[ReceiptLine]'
                        WHEN 'ReceiptLine DESC' THEN '[VR_TransporterBill].[ReceiptLine] DESC'
                        WHEN 'PassedAmount' THEN '[VR_TransporterBill].[PassedAmount]'
                        WHEN 'PassedAmount DESC' THEN '[VR_TransporterBill].[PassedAmount] DESC'
                        WHEN 'ForwardedToAccount' THEN '[VR_TransporterBill].[ForwardedToAccount]'
                        WHEN 'ForwardedToAccount DESC' THEN '[VR_TransporterBill].[ForwardedToAccount] DESC'
                        WHEN 'ForwardedOn' THEN '[VR_TransporterBill].[ForwardedOn]'
                        WHEN 'ForwardedOn DESC' THEN '[VR_TransporterBill].[ForwardedOn] DESC'
                        WHEN 'ForwardedBy' THEN '[VR_TransporterBill].[ForwardedBy]'
                        WHEN 'ForwardedBy DESC' THEN '[VR_TransporterBill].[ForwardedBy] DESC'
                        WHEN 'ReceiptAcknowledgement' THEN '[VR_TransporterBill].[ReceiptAcknowledgement]'
                        WHEN 'ReceiptAcknowledgement DESC' THEN '[VR_TransporterBill].[ReceiptAcknowledgement] DESC'
                        WHEN 'ReceiptAcknowledgedOn' THEN '[VR_TransporterBill].[ReceiptAcknowledgedOn]'
                        WHEN 'ReceiptAcknowledgedOn DESC' THEN '[VR_TransporterBill].[ReceiptAcknowledgedOn] DESC'
                        WHEN 'ReceiptAcknowledgedBy' THEN '[VR_TransporterBill].[ReceiptAcknowledgedBy]'
                        WHEN 'ReceiptAcknowledgedBy DESC' THEN '[VR_TransporterBill].[ReceiptAcknowledgedBy] DESC'
                        WHEN 'DiscripantReceipt' THEN '[VR_TransporterBill].[DiscripantReceipt]'
                        WHEN 'DiscripantReceipt DESC' THEN '[VR_TransporterBill].[DiscripantReceipt] DESC'
                        WHEN 'ReceiptReturnedOn' THEN '[VR_TransporterBill].[ReceiptReturnedOn]'
                        WHEN 'ReceiptReturnedOn DESC' THEN '[VR_TransporterBill].[ReceiptReturnedOn] DESC'
                        WHEN 'ReceiptReturnedBy' THEN '[VR_TransporterBill].[ReceiptReturnedBy]'
                        WHEN 'ReceiptReturnedBy DESC' THEN '[VR_TransporterBill].[ReceiptReturnedBy] DESC'
                        WHEN 'ReceiptReturnRemarks' THEN '[VR_TransporterBill].[ReceiptReturnRemarks]'
                        WHEN 'ReceiptReturnRemarks DESC' THEN '[VR_TransporterBill].[ReceiptReturnRemarks] DESC'
                        WHEN 'SerialNo' THEN '[VR_TransporterBill].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[VR_TransporterBill].[SerialNo] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'aspnet_Users4_UserFullName' THEN '[aspnet_Users4].[UserFullName]'
                        WHEN 'aspnet_Users4_UserFullName DESC' THEN '[aspnet_Users4].[UserFullName] DESC'
                        WHEN 'aspnet_Users5_UserFullName' THEN '[aspnet_Users5].[UserFullName]'
                        WHEN 'aspnet_Users5_UserFullName DESC' THEN '[aspnet_Users5].[UserFullName] DESC'
                        WHEN 'HRM_Divisions6_Description' THEN '[HRM_Divisions6].[Description]'
                        WHEN 'HRM_Divisions6_Description DESC' THEN '[HRM_Divisions6].[Description] DESC'
                        WHEN 'VR_PaymentProcess7_PaymentDescription' THEN '[VR_PaymentProcess7].[PaymentDescription]'
                        WHEN 'VR_PaymentProcess7_PaymentDescription DESC' THEN '[VR_PaymentProcess7].[PaymentDescription] DESC'
                        WHEN 'VR_BillStatus8_Description' THEN '[VR_BillStatus8].[Description]'
                        WHEN 'VR_BillStatus8_Description DESC' THEN '[VR_BillStatus8].[Description] DESC'
                        WHEN 'VR_Transporters9_TransporterName' THEN '[VR_Transporters9].[TransporterName]'
                        WHEN 'VR_Transporters9_TransporterName DESC' THEN '[VR_Transporters9].[TransporterName] DESC'
                        ELSE '[VR_TransporterBill].[IRNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [VR_TransporterBill].[IRNo] = #PageIndex.IRNo
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
