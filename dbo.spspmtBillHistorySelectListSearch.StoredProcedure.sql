USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtBillHistorySelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,IRNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (IRNo, SerialNo)
  SELECT [SPMT_BillHistory].[IRNo], [SPMT_BillHistory].[SerialNo] FROM [SPMT_BillHistory]
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
   ( 
         STR(ISNULL([SPMT_BillHistory].[IRNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_BillHistory].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_BillHistory].[TranTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_BillHistory].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_BillHistory].[BillNumber],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_BillHistory].[BillAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_BillHistory].[BillStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_BillHistory].[BillStatusUser],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_BillHistory].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_BillHistory].[PassedAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_BillHistory].[ApprovedAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_BillHistory].[RemarksAC],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_BillHistory].[ReasonID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_BillHistory].[AdviceNo], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'IRNo' THEN [SPMT_BillHistory].[IRNo] END,
     CASE @orderBy WHEN 'IRNo DESC' THEN [SPMT_BillHistory].[IRNo] END DESC,
     CASE @orderBy WHEN 'SerialNo' THEN [SPMT_BillHistory].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [SPMT_BillHistory].[SerialNo] END DESC,
     CASE @orderBy WHEN 'TranTypeID' THEN [SPMT_BillHistory].[TranTypeID] END,
     CASE @orderBy WHEN 'TranTypeID DESC' THEN [SPMT_BillHistory].[TranTypeID] END DESC,
     CASE @orderBy WHEN 'IRReceivedOn' THEN [SPMT_BillHistory].[IRReceivedOn] END,
     CASE @orderBy WHEN 'IRReceivedOn DESC' THEN [SPMT_BillHistory].[IRReceivedOn] END DESC,
     CASE @orderBy WHEN 'VendorID' THEN [SPMT_BillHistory].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [SPMT_BillHistory].[VendorID] END DESC,
     CASE @orderBy WHEN 'BillNumber' THEN [SPMT_BillHistory].[BillNumber] END,
     CASE @orderBy WHEN 'BillNumber DESC' THEN [SPMT_BillHistory].[BillNumber] END DESC,
     CASE @orderBy WHEN 'BillDate' THEN [SPMT_BillHistory].[BillDate] END,
     CASE @orderBy WHEN 'BillDate DESC' THEN [SPMT_BillHistory].[BillDate] END DESC,
     CASE @orderBy WHEN 'BillAmount' THEN [SPMT_BillHistory].[BillAmount] END,
     CASE @orderBy WHEN 'BillAmount DESC' THEN [SPMT_BillHistory].[BillAmount] END DESC,
     CASE @orderBy WHEN 'BillStatusID' THEN [SPMT_BillHistory].[BillStatusID] END,
     CASE @orderBy WHEN 'BillStatusID DESC' THEN [SPMT_BillHistory].[BillStatusID] END DESC,
     CASE @orderBy WHEN 'BillStatusDate' THEN [SPMT_BillHistory].[BillStatusDate] END,
     CASE @orderBy WHEN 'BillStatusDate DESC' THEN [SPMT_BillHistory].[BillStatusDate] END DESC,
     CASE @orderBy WHEN 'BillStatusUser' THEN [SPMT_BillHistory].[BillStatusUser] END,
     CASE @orderBy WHEN 'BillStatusUser DESC' THEN [SPMT_BillHistory].[BillStatusUser] END DESC,
     CASE @orderBy WHEN 'LogisticLinked' THEN [SPMT_BillHistory].[LogisticLinked] END,
     CASE @orderBy WHEN 'LogisticLinked DESC' THEN [SPMT_BillHistory].[LogisticLinked] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [SPMT_BillHistory].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [SPMT_BillHistory].[Remarks] END DESC,
     CASE @orderBy WHEN 'PassedAmount' THEN [SPMT_BillHistory].[PassedAmount] END,
     CASE @orderBy WHEN 'PassedAmount DESC' THEN [SPMT_BillHistory].[PassedAmount] END DESC,
     CASE @orderBy WHEN 'ApprovedAmount' THEN [SPMT_BillHistory].[ApprovedAmount] END,
     CASE @orderBy WHEN 'ApprovedAmount DESC' THEN [SPMT_BillHistory].[ApprovedAmount] END DESC,
     CASE @orderBy WHEN 'RemarksAC' THEN [SPMT_BillHistory].[RemarksAC] END,
     CASE @orderBy WHEN 'RemarksAC DESC' THEN [SPMT_BillHistory].[RemarksAC] END DESC,
     CASE @orderBy WHEN 'ReturnedByAC' THEN [SPMT_BillHistory].[ReturnedByAC] END,
     CASE @orderBy WHEN 'ReturnedByAC DESC' THEN [SPMT_BillHistory].[ReturnedByAC] END DESC,
     CASE @orderBy WHEN 'ReasonID' THEN [SPMT_BillHistory].[ReasonID] END,
     CASE @orderBy WHEN 'ReasonID DESC' THEN [SPMT_BillHistory].[ReasonID] END DESC,
     CASE @orderBy WHEN 'AdviceNo' THEN [SPMT_BillHistory].[AdviceNo] END,
     CASE @orderBy WHEN 'AdviceNo DESC' THEN [SPMT_BillHistory].[AdviceNo] END DESC,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @orderBy WHEN 'SPMT_BillStatus2_Description' THEN [SPMT_BillStatus2].[Description] END,
     CASE @orderBy WHEN 'SPMT_BillStatus2_Description DESC' THEN [SPMT_BillStatus2].[Description] END DESC,
     CASE @orderBy WHEN 'SPMT_Vendors1_Description' THEN [SPMT_Vendors1].[Description] END,
     CASE @orderBy WHEN 'SPMT_Vendors1_Description DESC' THEN [SPMT_Vendors1].[Description] END DESC,
     CASE @orderBy WHEN 'SPMT_ReturnReason2_Description' THEN [SPMT_ReturnReason2].[Description] END,
     CASE @orderBy WHEN 'SPMT_ReturnReason2_Description DESC' THEN [SPMT_ReturnReason2].[Description] END DESC 

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
