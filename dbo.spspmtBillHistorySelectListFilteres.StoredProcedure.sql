USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtBillHistorySelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,IRNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'IRNo'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_BillHistory].[IRNo]'
  SET @LGSQL = @LGSQL + ', [SPMT_BillHistory].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_BillHistory] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_BillHistory].[BillStatusUser] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_BillStatus] AS [SPMT_BillStatus2]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_BillHistory].[BillStatusID] = [SPMT_BillStatus2].[BillStatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_SupplierBill] AS [SPMT_SupplierBill3]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_BillHistory].[IRNo] = [SPMT_SupplierBill3].[IRNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_BillHistory].[VendorID] = [SPMT_Vendors1].[VendorID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_PaymentAdvice] AS [SPMT_PaymentAdvice1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_BillHistory].[AdviceNo] = [SPMT_PaymentAdvice1].[AdviceNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ReturnReason] AS [SPMT_ReturnReason2]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_BillHistory].[ReasonID] = [SPMT_ReturnReason2].[ReasonID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'IRNo' THEN '[SPMT_BillHistory].[IRNo]'
                        WHEN 'IRNo DESC' THEN '[SPMT_BillHistory].[IRNo] DESC'
                        WHEN 'SerialNo' THEN '[SPMT_BillHistory].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[SPMT_BillHistory].[SerialNo] DESC'
                        WHEN 'TranTypeID' THEN '[SPMT_BillHistory].[TranTypeID]'
                        WHEN 'TranTypeID DESC' THEN '[SPMT_BillHistory].[TranTypeID] DESC'
                        WHEN 'IRReceivedOn' THEN '[SPMT_BillHistory].[IRReceivedOn]'
                        WHEN 'IRReceivedOn DESC' THEN '[SPMT_BillHistory].[IRReceivedOn] DESC'
                        WHEN 'VendorID' THEN '[SPMT_BillHistory].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[SPMT_BillHistory].[VendorID] DESC'
                        WHEN 'BillNumber' THEN '[SPMT_BillHistory].[BillNumber]'
                        WHEN 'BillNumber DESC' THEN '[SPMT_BillHistory].[BillNumber] DESC'
                        WHEN 'BillDate' THEN '[SPMT_BillHistory].[BillDate]'
                        WHEN 'BillDate DESC' THEN '[SPMT_BillHistory].[BillDate] DESC'
                        WHEN 'BillAmount' THEN '[SPMT_BillHistory].[BillAmount]'
                        WHEN 'BillAmount DESC' THEN '[SPMT_BillHistory].[BillAmount] DESC'
                        WHEN 'BillStatusID' THEN '[SPMT_BillHistory].[BillStatusID]'
                        WHEN 'BillStatusID DESC' THEN '[SPMT_BillHistory].[BillStatusID] DESC'
                        WHEN 'BillStatusDate' THEN '[SPMT_BillHistory].[BillStatusDate]'
                        WHEN 'BillStatusDate DESC' THEN '[SPMT_BillHistory].[BillStatusDate] DESC'
                        WHEN 'BillStatusUser' THEN '[SPMT_BillHistory].[BillStatusUser]'
                        WHEN 'BillStatusUser DESC' THEN '[SPMT_BillHistory].[BillStatusUser] DESC'
                        WHEN 'LogisticLinked' THEN '[SPMT_BillHistory].[LogisticLinked]'
                        WHEN 'LogisticLinked DESC' THEN '[SPMT_BillHistory].[LogisticLinked] DESC'
                        WHEN 'Remarks' THEN '[SPMT_BillHistory].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[SPMT_BillHistory].[Remarks] DESC'
                        WHEN 'PassedAmount' THEN '[SPMT_BillHistory].[PassedAmount]'
                        WHEN 'PassedAmount DESC' THEN '[SPMT_BillHistory].[PassedAmount] DESC'
                        WHEN 'ApprovedAmount' THEN '[SPMT_BillHistory].[ApprovedAmount]'
                        WHEN 'ApprovedAmount DESC' THEN '[SPMT_BillHistory].[ApprovedAmount] DESC'
                        WHEN 'RemarksAC' THEN '[SPMT_BillHistory].[RemarksAC]'
                        WHEN 'RemarksAC DESC' THEN '[SPMT_BillHistory].[RemarksAC] DESC'
                        WHEN 'ReturnedByAC' THEN '[SPMT_BillHistory].[ReturnedByAC]'
                        WHEN 'ReturnedByAC DESC' THEN '[SPMT_BillHistory].[ReturnedByAC] DESC'
                        WHEN 'ReasonID' THEN '[SPMT_BillHistory].[ReasonID]'
                        WHEN 'ReasonID DESC' THEN '[SPMT_BillHistory].[ReasonID] DESC'
                        WHEN 'AdviceNo' THEN '[SPMT_BillHistory].[AdviceNo]'
                        WHEN 'AdviceNo DESC' THEN '[SPMT_BillHistory].[AdviceNo] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'SPMT_BillStatus2_Description' THEN '[SPMT_BillStatus].[Description]'
                        WHEN 'SPMT_BillStatus2_Description DESC' THEN '[SPMT_BillStatus2].[Description] DESC'
                        WHEN 'SPMT_Vendors1_Description' THEN '[SPMT_Vendors].[Description]'
                        WHEN 'SPMT_Vendors1_Description DESC' THEN '[SPMT_Vendors1].[Description] DESC'
                        WHEN 'SPMT_ReturnReason2_Description' THEN '[SPMT_ReturnReason].[Description]'
                        WHEN 'SPMT_ReturnReason2_Description DESC' THEN '[SPMT_ReturnReason2].[Description] DESC'
                        ELSE '[SPMT_BillHistory].[IRNo],[SPMT_BillHistory].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [SPMT_BillHistory].[IRNo] = #PageIndex.IRNo
          AND [SPMT_BillHistory].[SerialNo] = #PageIndex.SerialNo
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
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
