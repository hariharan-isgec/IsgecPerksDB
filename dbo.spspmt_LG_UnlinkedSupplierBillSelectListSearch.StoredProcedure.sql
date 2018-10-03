USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmt_LG_UnlinkedSupplierBillSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @BillStatusID Int,
  @OrderBy NVarChar(50),
  @LoginID NVarChar(8), 
  @Filter_TranTypeID NVarChar(3),
  @Filter_VendorID NVarChar(6),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,IRNo Int NOT NULL
  )
  INSERT INTO #PageIndex (IRNo)
  SELECT [SPMT_SupplierBill].[IRNo] FROM [SPMT_SupplierBill]
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
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users7]
    ON [SPMT_SupplierBill].[ConcernedHOD] = [aspnet_Users7].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users8]
    ON [SPMT_SupplierBill].[EmployeeID] = [aspnet_Users8].[LoginID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments9]
    ON [SPMT_SupplierBill].[DepartmentID] = [HRM_Departments9].[DepartmentID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects10]
    ON [SPMT_SupplierBill].[ProjectID] = [IDM_Projects10].[ProjectID]
  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS11]
    ON [SPMT_SupplierBill].[ElementID] = [IDM_WBS11].[WBSID]
  LEFT OUTER JOIN [SPMT_ACVouchers] AS [SPMT_ACVouchers12]
    ON [SPMT_SupplierBill].[VoucherNo] = [SPMT_ACVouchers12].[VoucherNo]
  LEFT OUTER JOIN [SPMT_CostCenters] AS [SPMT_CostCenters13]
    ON [SPMT_SupplierBill].[CostCenterID] = [SPMT_CostCenters13].[CostCenterID]
 WHERE [SPMT_TranTypes3].[GroupID] IN (SELECT GroupID FROM SYS_GroupLogins WHERE LoginID = @LoginID)    
   AND   [SPMT_SupplierBill].[BillStatusID] = (@BillStatusID)
   AND [SPMT_SupplierBill].[TranTypeID] = (@Filter_TranTypeID)
   AND [SPMT_SupplierBill].[VendorID] = (@Filter_VendorID)
   AND ( 
         STR(ISNULL([SPMT_SupplierBill].[IRNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[TranTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[BillNumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[BillRemarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[BillAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[BillStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[BillStatusUser],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[ApprovedAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[PassedAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[RemarksAC],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[ReasonID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[AdviceNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[ConcernedHOD],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[CostCenter],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[ElementID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[EmployeeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[CostCenterID],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[VoucherNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[DocumentNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[DocumentLine],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[BaaNCompany],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[BaaNLedger],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'IRNo' THEN [SPMT_SupplierBill].[IRNo] END,
     CASE @orderBy WHEN 'IRNo DESC' THEN [SPMT_SupplierBill].[IRNo] END DESC,
     CASE @orderBy WHEN 'TranTypeID' THEN [SPMT_SupplierBill].[TranTypeID] END,
     CASE @orderBy WHEN 'TranTypeID DESC' THEN [SPMT_SupplierBill].[TranTypeID] END DESC,
     CASE @orderBy WHEN 'IRReceivedOn' THEN [SPMT_SupplierBill].[IRReceivedOn] END,
     CASE @orderBy WHEN 'IRReceivedOn DESC' THEN [SPMT_SupplierBill].[IRReceivedOn] END DESC,
     CASE @orderBy WHEN 'VendorID' THEN [SPMT_SupplierBill].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [SPMT_SupplierBill].[VendorID] END DESC,
     CASE @orderBy WHEN 'BillNumber' THEN [SPMT_SupplierBill].[BillNumber] END,
     CASE @orderBy WHEN 'BillNumber DESC' THEN [SPMT_SupplierBill].[BillNumber] END DESC,
     CASE @orderBy WHEN 'BillDate' THEN [SPMT_SupplierBill].[BillDate] END,
     CASE @orderBy WHEN 'BillDate DESC' THEN [SPMT_SupplierBill].[BillDate] END DESC,
     CASE @orderBy WHEN 'BillAmount' THEN [SPMT_SupplierBill].[BillAmount] END,
     CASE @orderBy WHEN 'BillAmount DESC' THEN [SPMT_SupplierBill].[BillAmount] END DESC,
     CASE @orderBy WHEN 'BillRemarks' THEN [SPMT_SupplierBill].[BillRemarks] END,
     CASE @orderBy WHEN 'BillRemarks DESC' THEN [SPMT_SupplierBill].[BillRemarks] END DESC,
     CASE @orderBy WHEN 'BillStatusID' THEN [SPMT_SupplierBill].[BillStatusID] END,
     CASE @orderBy WHEN 'BillStatusID DESC' THEN [SPMT_SupplierBill].[BillStatusID] END DESC,
     CASE @orderBy WHEN 'BillStatusDate' THEN [SPMT_SupplierBill].[BillStatusDate] END,
     CASE @orderBy WHEN 'BillStatusDate DESC' THEN [SPMT_SupplierBill].[BillStatusDate] END DESC,
     CASE @orderBy WHEN 'BillStatusUser' THEN [SPMT_SupplierBill].[BillStatusUser] END,
     CASE @orderBy WHEN 'BillStatusUser DESC' THEN [SPMT_SupplierBill].[BillStatusUser] END DESC,
     CASE @orderBy WHEN 'LogisticLinked' THEN [SPMT_SupplierBill].[LogisticLinked] END,
     CASE @orderBy WHEN 'LogisticLinked DESC' THEN [SPMT_SupplierBill].[LogisticLinked] END DESC,
     CASE @orderBy WHEN 'ApprovedAmount' THEN [SPMT_SupplierBill].[ApprovedAmount] END,
     CASE @orderBy WHEN 'ApprovedAmount DESC' THEN [SPMT_SupplierBill].[ApprovedAmount] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [SPMT_SupplierBill].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [SPMT_SupplierBill].[Remarks] END DESC,
     CASE @orderBy WHEN 'PassedAmount' THEN [SPMT_SupplierBill].[PassedAmount] END,
     CASE @orderBy WHEN 'PassedAmount DESC' THEN [SPMT_SupplierBill].[PassedAmount] END DESC,
     CASE @orderBy WHEN 'RemarksAC' THEN [SPMT_SupplierBill].[RemarksAC] END,
     CASE @orderBy WHEN 'RemarksAC DESC' THEN [SPMT_SupplierBill].[RemarksAC] END DESC,
     CASE @orderBy WHEN 'ReturnedByAC' THEN [SPMT_SupplierBill].[ReturnedByAC] END,
     CASE @orderBy WHEN 'ReturnedByAC DESC' THEN [SPMT_SupplierBill].[ReturnedByAC] END DESC,
     CASE @orderBy WHEN 'ReasonID' THEN [SPMT_SupplierBill].[ReasonID] END,
     CASE @orderBy WHEN 'ReasonID DESC' THEN [SPMT_SupplierBill].[ReasonID] END DESC,
     CASE @orderBy WHEN 'AdviceNo' THEN [SPMT_SupplierBill].[AdviceNo] END,
     CASE @orderBy WHEN 'AdviceNo DESC' THEN [SPMT_SupplierBill].[AdviceNo] END DESC,
     CASE @orderBy WHEN 'ConcernedHOD' THEN [SPMT_SupplierBill].[ConcernedHOD] END,
     CASE @orderBy WHEN 'ConcernedHOD DESC' THEN [SPMT_SupplierBill].[ConcernedHOD] END DESC,
     CASE @orderBy WHEN 'CostCenter' THEN [SPMT_SupplierBill].[CostCenter] END,
     CASE @orderBy WHEN 'CostCenter DESC' THEN [SPMT_SupplierBill].[CostCenter] END DESC,
     CASE @orderBy WHEN 'ProjectID' THEN [SPMT_SupplierBill].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [SPMT_SupplierBill].[ProjectID] END DESC,
     CASE @orderBy WHEN 'ElementID' THEN [SPMT_SupplierBill].[ElementID] END,
     CASE @orderBy WHEN 'ElementID DESC' THEN [SPMT_SupplierBill].[ElementID] END DESC,
     CASE @orderBy WHEN 'EmployeeID' THEN [SPMT_SupplierBill].[EmployeeID] END,
     CASE @orderBy WHEN 'EmployeeID DESC' THEN [SPMT_SupplierBill].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'DepartmentID' THEN [SPMT_SupplierBill].[DepartmentID] END,
     CASE @orderBy WHEN 'DepartmentID DESC' THEN [SPMT_SupplierBill].[DepartmentID] END DESC,
     CASE @orderBy WHEN 'CostCenterID' THEN [SPMT_SupplierBill].[CostCenterID] END,
     CASE @orderBy WHEN 'CostCenterID DESC' THEN [SPMT_SupplierBill].[CostCenterID] END DESC,
     CASE @orderBy WHEN 'VoucherNo' THEN [SPMT_SupplierBill].[VoucherNo] END,
     CASE @orderBy WHEN 'VoucherNo DESC' THEN [SPMT_SupplierBill].[VoucherNo] END DESC,
     CASE @orderBy WHEN 'DocumentNo' THEN [SPMT_SupplierBill].[DocumentNo] END,
     CASE @orderBy WHEN 'DocumentNo DESC' THEN [SPMT_SupplierBill].[DocumentNo] END DESC,
     CASE @orderBy WHEN 'DocumentLine' THEN [SPMT_SupplierBill].[DocumentLine] END,
     CASE @orderBy WHEN 'DocumentLine DESC' THEN [SPMT_SupplierBill].[DocumentLine] END DESC,
     CASE @orderBy WHEN 'BaaNCompany' THEN [SPMT_SupplierBill].[BaaNCompany] END,
     CASE @orderBy WHEN 'BaaNCompany DESC' THEN [SPMT_SupplierBill].[BaaNCompany] END DESC,
     CASE @orderBy WHEN 'BaaNLedger' THEN [SPMT_SupplierBill].[BaaNLedger] END,
     CASE @orderBy WHEN 'BaaNLedger DESC' THEN [SPMT_SupplierBill].[BaaNLedger] END DESC,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @orderBy WHEN 'SPMT_BillStatus2_Description' THEN [SPMT_BillStatus2].[Description] END,
     CASE @orderBy WHEN 'SPMT_BillStatus2_Description DESC' THEN [SPMT_BillStatus2].[Description] END DESC,
     CASE @orderBy WHEN 'SPMT_TranTypes3_Description' THEN [SPMT_TranTypes3].[Description] END,
     CASE @orderBy WHEN 'SPMT_TranTypes3_Description DESC' THEN [SPMT_TranTypes3].[Description] END DESC,
     CASE @orderBy WHEN 'SPMT_Vendors4_Description' THEN [SPMT_Vendors4].[Description] END,
     CASE @orderBy WHEN 'SPMT_Vendors4_Description DESC' THEN [SPMT_Vendors4].[Description] END DESC,
     CASE @orderBy WHEN 'SPMT_ReturnReason6_Description' THEN [SPMT_ReturnReason6].[Description] END,
     CASE @orderBy WHEN 'SPMT_ReturnReason6_Description DESC' THEN [SPMT_ReturnReason6].[Description] END DESC,
     CASE @orderBy WHEN 'aspnet_Users7_UserFullName' THEN [aspnet_Users7].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users7_UserFullName DESC' THEN [aspnet_Users7].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users8_UserFullName' THEN [aspnet_Users8].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users8_UserFullName DESC' THEN [aspnet_Users8].[UserFullName] END DESC,
     CASE @orderBy WHEN 'HRM_Departments9_Description' THEN [HRM_Departments9].[Description] END,
     CASE @orderBy WHEN 'HRM_Departments9_Description DESC' THEN [HRM_Departments9].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_Projects10_Description' THEN [IDM_Projects10].[Description] END,
     CASE @orderBy WHEN 'IDM_Projects10_Description DESC' THEN [IDM_Projects10].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_WBS11_Description' THEN [IDM_WBS11].[Description] END,
     CASE @orderBy WHEN 'IDM_WBS11_Description DESC' THEN [IDM_WBS11].[Description] END DESC,
     CASE @orderBy WHEN 'SPMT_CostCenters13_Description' THEN [SPMT_CostCenters13].[Description] END,
     CASE @orderBy WHEN 'SPMT_CostCenters13_Description DESC' THEN [SPMT_CostCenters13].[Description] END DESC 

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
		[SPMT_SupplierBill].[ConcernedHOD] ,
		[SPMT_SupplierBill].[CostCenter] ,
		[SPMT_SupplierBill].[ProjectID] ,
		[SPMT_SupplierBill].[ElementID] ,
		[SPMT_SupplierBill].[EmployeeID] ,
		[SPMT_SupplierBill].[DepartmentID] ,
		[SPMT_SupplierBill].[CostCenterID] ,
		[SPMT_SupplierBill].[VoucherNo] ,
		[SPMT_SupplierBill].[DocumentNo] ,
		[SPMT_SupplierBill].[DocumentLine] ,
		[SPMT_SupplierBill].[BaaNCompany] ,
		[SPMT_SupplierBill].[BaaNLedger] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[SPMT_BillStatus2].[Description] AS SPMT_BillStatus2_Description,
		[SPMT_TranTypes3].[Description] AS SPMT_TranTypes3_Description,
		[SPMT_Vendors4].[Description] AS SPMT_Vendors4_Description,
		[SPMT_ReturnReason6].[Description] AS SPMT_ReturnReason6_Description,
		[aspnet_Users7].[UserFullName] AS aspnet_Users7_UserFullName,
		[aspnet_Users8].[UserFullName] AS aspnet_Users8_UserFullName,
		[HRM_Departments9].[Description] AS HRM_Departments9_Description,
		[IDM_Projects10].[Description] AS IDM_Projects10_Description,
		[IDM_WBS11].[Description] AS IDM_WBS11_Description,
		[SPMT_CostCenters13].[Description] AS SPMT_CostCenters13_Description 
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
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users7]
    ON [SPMT_SupplierBill].[ConcernedHOD] = [aspnet_Users7].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users8]
    ON [SPMT_SupplierBill].[EmployeeID] = [aspnet_Users8].[LoginID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments9]
    ON [SPMT_SupplierBill].[DepartmentID] = [HRM_Departments9].[DepartmentID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects10]
    ON [SPMT_SupplierBill].[ProjectID] = [IDM_Projects10].[ProjectID]
  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS11]
    ON [SPMT_SupplierBill].[ElementID] = [IDM_WBS11].[WBSID]
  LEFT OUTER JOIN [SPMT_ACVouchers] AS [SPMT_ACVouchers12]
    ON [SPMT_SupplierBill].[VoucherNo] = [SPMT_ACVouchers12].[VoucherNo]
  LEFT OUTER JOIN [SPMT_CostCenters] AS [SPMT_CostCenters13]
    ON [SPMT_SupplierBill].[CostCenterID] = [SPMT_CostCenters13].[CostCenterID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
