USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmt_LG_UnlinkedSupplierBillSelectListFilteres]
  @Filter_TranTypeID NVarChar(3),
  @Filter_VendorID NVarChar(6),
  @LoginID NVarChar(8), 
  @StartRowIndex int,
  @MaximumRows int,
  @BillStatusID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,IRNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'IRNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_SupplierBill].[IRNo]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_SupplierBill] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[BillStatusUser] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_BillStatus] AS [SPMT_BillStatus2]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[BillStatusID] = [SPMT_BillStatus2].[BillStatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_TranTypes] AS [SPMT_TranTypes3]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[TranTypeID] = [SPMT_TranTypes3].[TranTypeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors4]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[VendorID] = [SPMT_Vendors4].[VendorID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_PaymentAdvice] AS [SPMT_PaymentAdvice5]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[AdviceNo] = [SPMT_PaymentAdvice5].[AdviceNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ReturnReason] AS [SPMT_ReturnReason6]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[ReasonID] = [SPMT_ReturnReason6].[ReasonID]'
  SET @LGSQL = @LGSQL + '  WHERE [SPMT_TranTypes3].[GroupID] IN (SELECT GroupID FROM SYS_GroupLogins WHERE LoginID = ' + @LoginID + ') '
  SET @LGSQL = @LGSQL + ' AND [SPMT_SupplierBill].[BillStatusID] = ''' + STR(@BillStatusID) + '''' 
  IF (@Filter_TranTypeID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_SupplierBill].[TranTypeID] = ''' + @Filter_TranTypeID + ''''
  IF (@Filter_VendorID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_SupplierBill].[VendorID] = ''' + @Filter_VendorID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'IRNo' THEN '[SPMT_SupplierBill].[IRNo]'
                        WHEN 'IRNo DESC' THEN '[SPMT_SupplierBill].[IRNo] DESC'
                        WHEN 'TranTypeID' THEN '[SPMT_SupplierBill].[TranTypeID]'
                        WHEN 'TranTypeID DESC' THEN '[SPMT_SupplierBill].[TranTypeID] DESC'
                        WHEN 'IRReceivedOn' THEN '[SPMT_SupplierBill].[IRReceivedOn]'
                        WHEN 'IRReceivedOn DESC' THEN '[SPMT_SupplierBill].[IRReceivedOn] DESC'
                        WHEN 'VendorID' THEN '[SPMT_SupplierBill].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[SPMT_SupplierBill].[VendorID] DESC'
                        WHEN 'BillNumber' THEN '[SPMT_SupplierBill].[BillNumber]'
                        WHEN 'BillNumber DESC' THEN '[SPMT_SupplierBill].[BillNumber] DESC'
                        WHEN 'BillDate' THEN '[SPMT_SupplierBill].[BillDate]'
                        WHEN 'BillDate DESC' THEN '[SPMT_SupplierBill].[BillDate] DESC'
                        WHEN 'BillAmount' THEN '[SPMT_SupplierBill].[BillAmount]'
                        WHEN 'BillAmount DESC' THEN '[SPMT_SupplierBill].[BillAmount] DESC'
                        WHEN 'BillRemarks' THEN '[SPMT_SupplierBill].[BillRemarks]'
                        WHEN 'BillRemarks DESC' THEN '[SPMT_SupplierBill].[BillRemarks] DESC'
                        WHEN 'BillStatusID' THEN '[SPMT_SupplierBill].[BillStatusID]'
                        WHEN 'BillStatusID DESC' THEN '[SPMT_SupplierBill].[BillStatusID] DESC'
                        WHEN 'BillStatusDate' THEN '[SPMT_SupplierBill].[BillStatusDate]'
                        WHEN 'BillStatusDate DESC' THEN '[SPMT_SupplierBill].[BillStatusDate] DESC'
                        WHEN 'BillStatusUser' THEN '[SPMT_SupplierBill].[BillStatusUser]'
                        WHEN 'BillStatusUser DESC' THEN '[SPMT_SupplierBill].[BillStatusUser] DESC'
                        WHEN 'LogisticLinked' THEN '[SPMT_SupplierBill].[LogisticLinked]'
                        WHEN 'LogisticLinked DESC' THEN '[SPMT_SupplierBill].[LogisticLinked] DESC'
                        WHEN 'ApprovedAmount' THEN '[SPMT_SupplierBill].[ApprovedAmount]'
                        WHEN 'ApprovedAmount DESC' THEN '[SPMT_SupplierBill].[ApprovedAmount] DESC'
                        WHEN 'Remarks' THEN '[SPMT_SupplierBill].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[SPMT_SupplierBill].[Remarks] DESC'
                        WHEN 'PassedAmount' THEN '[SPMT_SupplierBill].[PassedAmount]'
                        WHEN 'PassedAmount DESC' THEN '[SPMT_SupplierBill].[PassedAmount] DESC'
                        WHEN 'RemarksAC' THEN '[SPMT_SupplierBill].[RemarksAC]'
                        WHEN 'RemarksAC DESC' THEN '[SPMT_SupplierBill].[RemarksAC] DESC'
                        WHEN 'ReturnedByAC' THEN '[SPMT_SupplierBill].[ReturnedByAC]'
                        WHEN 'ReturnedByAC DESC' THEN '[SPMT_SupplierBill].[ReturnedByAC] DESC'
                        WHEN 'ReasonID' THEN '[SPMT_SupplierBill].[ReasonID]'
                        WHEN 'ReasonID DESC' THEN '[SPMT_SupplierBill].[ReasonID] DESC'
                        WHEN 'AdviceNo' THEN '[SPMT_SupplierBill].[AdviceNo]'
                        WHEN 'AdviceNo DESC' THEN '[SPMT_SupplierBill].[AdviceNo] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'SPMT_BillStatus2_Description' THEN '[SPMT_BillStatus].[Description]'
                        WHEN 'SPMT_BillStatus2_Description DESC' THEN '[SPMT_BillStatus2].[Description] DESC'
                        WHEN 'SPMT_TranTypes3_Description' THEN '[SPMT_TranTypes].[Description]'
                        WHEN 'SPMT_TranTypes3_Description DESC' THEN '[SPMT_TranTypes3].[Description] DESC'
                        WHEN 'SPMT_Vendors4_Description' THEN '[SPMT_Vendors].[Description]'
                        WHEN 'SPMT_Vendors4_Description DESC' THEN '[SPMT_Vendors4].[Description] DESC'
                        WHEN 'SPMT_ReturnReason6_Description' THEN '[SPMT_ReturnReason].[Description]'
                        WHEN 'SPMT_ReturnReason6_Description DESC' THEN '[SPMT_ReturnReason6].[Description] DESC'
                        ELSE '[SPMT_SupplierBill].[IRNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[SPMT_SupplierBill].[IRNo] ,
		[SPMT_SupplierBill].[TranTypeID] ,
		[SPMT_SupplierBill].[IRReceivedOn] ,
		[SPMT_SupplierBill].[VendorID] ,
		[SPMT_SupplierBill].[BillNumber] ,
		[SPMT_SupplierBill].[BillDate] ,
		[SPMT_SupplierBill].[BillAmount] ,
		[SPMT_SupplierBill].[BillRemarks] ,
		[SPMT_SupplierBill].[BillStatusID] ,
		[SPMT_SupplierBill].[BillStatusDate] ,
		[SPMT_SupplierBill].[BillStatusUser] ,
		[SPMT_SupplierBill].[LogisticLinked] ,
		[SPMT_SupplierBill].[ApprovedAmount] ,
		[SPMT_SupplierBill].[Remarks] ,
		[SPMT_SupplierBill].[PassedAmount] ,
		[SPMT_SupplierBill].[RemarksAC] ,
		[SPMT_SupplierBill].[ReturnedByAC] ,
		[SPMT_SupplierBill].[ReasonID] ,
		[SPMT_SupplierBill].[AdviceNo] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[SPMT_BillStatus2].[Description] AS SPMT_BillStatus2_Description,
		[SPMT_TranTypes3].[Description] AS SPMT_TranTypes3_Description,
		[SPMT_Vendors4].[Description] AS SPMT_Vendors4_Description,
		[SPMT_ReturnReason6].[Description] AS SPMT_ReturnReason6_Description 
  FROM [SPMT_SupplierBill] 
    	INNER JOIN #PageIndex
          ON [SPMT_SupplierBill].[IRNo] = #PageIndex.IRNo
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SPMT_SupplierBill].[BillStatusUser] = [aspnet_Users1].[LoginID]
  INNER JOIN [SPMT_BillStatus] AS [SPMT_BillStatus2]
    ON [SPMT_SupplierBill].[BillStatusID] = [SPMT_BillStatus2].[BillStatusID]
  INNER JOIN [SPMT_TranTypes] AS [SPMT_TranTypes3]
    ON [SPMT_SupplierBill].[TranTypeID] = [SPMT_TranTypes3].[TranTypeID]
  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors4]
    ON [SPMT_SupplierBill].[VendorID] = [SPMT_Vendors4].[VendorID]
  LEFT OUTER JOIN [SPMT_PaymentAdvice] AS [SPMT_PaymentAdvice5]
    ON [SPMT_SupplierBill].[AdviceNo] = [SPMT_PaymentAdvice5].[AdviceNo]
  LEFT OUTER JOIN [SPMT_ReturnReason] AS [SPMT_ReturnReason6]
    ON [SPMT_SupplierBill].[ReasonID] = [SPMT_ReturnReason6].[ReasonID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
