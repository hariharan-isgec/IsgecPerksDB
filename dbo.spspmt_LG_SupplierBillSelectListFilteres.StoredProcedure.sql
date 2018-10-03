USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmt_LG_SupplierBillSelectListFilteres]
  @Filter_TranTypeID NVarChar(3),
  @Filter_VendorID NVarChar(6),
  @Filter_BillStatusID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @LoginID NVarChar(8), 
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
  SET @LGSQL = @LGSQL + ' [SPMT_SupplierBill].[IRNo]'
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users7]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[ConcernedHOD] = [aspnet_Users7].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users8]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[EmployeeID] = [aspnet_Users8].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments9]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[DepartmentID] = [HRM_Departments9].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects10]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[ProjectID] = [IDM_Projects10].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS11]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[ElementID] = [IDM_WBS11].[WBSID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ACVouchers] AS [SPMT_ACVouchers12]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[VoucherNo] = [SPMT_ACVouchers12].[VoucherNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_CostCenters] AS [SPMT_CostCenters13]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[CostCenterID] = [SPMT_CostCenters13].[CostCenterID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes14]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[BillType] = [SPMT_BillTypes14].[BillType]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates15]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[ShipToState] = [SPMT_ERPStates15].[StateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ERPUnits] AS [SPMT_ERPUnits16]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[UOM] = [SPMT_ERPUnits16].[UOM]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_HSNSACCodes] AS [SPMT_HSNSACCodes17]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[BillType] = [SPMT_HSNSACCodes17].[BillType]'
  SET @LGSQL = @LGSQL + '    AND [SPMT_SupplierBill].[HSNSACCode] = [SPMT_HSNSACCodes17].[HSNSACCode]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN18]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[IsgecGSTIN] = [SPMT_IsgecGSTIN18].[GSTID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN19]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[BPID] = [VR_BPGSTIN19].[BPID]'
  SET @LGSQL = @LGSQL + '    AND [SPMT_SupplierBill].[SupplierGSTIN] = [VR_BPGSTIN19].[GSTIN]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner20]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[BPID] = [VR_BusinessPartner20].[BPID]'
  SET @LGSQL = @LGSQL + '  WHERE [SPMT_TranTypes3].[GroupID] IN (SELECT GroupID FROM SYS_GroupLogins WHERE LoginID = ' + @LoginID + ') '
  IF (@Filter_TranTypeID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_SupplierBill].[TranTypeID] = ''' + @Filter_TranTypeID + ''''
  IF (@Filter_VendorID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_SupplierBill].[VendorID] = ''' + @Filter_VendorID + ''''
  IF (@Filter_BillStatusID > 0) 
    SET @LGSQL = @LGSQL + ' AND [SPMT_SupplierBill].[BillStatusID] = ' + STR(@Filter_BillStatusID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'IRNo' THEN '[SPMT_SupplierBill].[IRNo]'
                        WHEN 'IRNo DESC' THEN '[SPMT_SupplierBill].[IRNo] DESC'
                        WHEN 'TranTypeID' THEN '[SPMT_SupplierBill].[TranTypeID]'
                        WHEN 'TranTypeID DESC' THEN '[SPMT_SupplierBill].[TranTypeID] DESC'
                        WHEN 'IRReceivedOn' THEN '[SPMT_SupplierBill].[IRReceivedOn]'
                        WHEN 'IRReceivedOn DESC' THEN '[SPMT_SupplierBill].[IRReceivedOn] DESC'
                        WHEN 'IsgecGSTIN' THEN '[SPMT_SupplierBill].[IsgecGSTIN]'
                        WHEN 'IsgecGSTIN DESC' THEN '[SPMT_SupplierBill].[IsgecGSTIN] DESC'
                        WHEN 'BPID' THEN '[SPMT_SupplierBill].[BPID]'
                        WHEN 'BPID DESC' THEN '[SPMT_SupplierBill].[BPID] DESC'
                        WHEN 'SupplierGSTIN' THEN '[SPMT_SupplierBill].[SupplierGSTIN]'
                        WHEN 'SupplierGSTIN DESC' THEN '[SPMT_SupplierBill].[SupplierGSTIN] DESC'
                        WHEN 'BillType' THEN '[SPMT_SupplierBill].[BillType]'
                        WHEN 'BillType DESC' THEN '[SPMT_SupplierBill].[BillType] DESC'
                        WHEN 'HSNSACCode' THEN '[SPMT_SupplierBill].[HSNSACCode]'
                        WHEN 'HSNSACCode DESC' THEN '[SPMT_SupplierBill].[HSNSACCode] DESC'
                        WHEN 'Remarks' THEN '[SPMT_SupplierBill].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[SPMT_SupplierBill].[Remarks] DESC'
                        WHEN 'ShipToState' THEN '[SPMT_SupplierBill].[ShipToState]'
                        WHEN 'ShipToState DESC' THEN '[SPMT_SupplierBill].[ShipToState] DESC'
                        WHEN 'BillNumber' THEN '[SPMT_SupplierBill].[BillNumber]'
                        WHEN 'BillNumber DESC' THEN '[SPMT_SupplierBill].[BillNumber] DESC'
                        WHEN 'BillDate' THEN '[SPMT_SupplierBill].[BillDate]'
                        WHEN 'BillDate DESC' THEN '[SPMT_SupplierBill].[BillDate] DESC'
                        WHEN 'UOM' THEN '[SPMT_SupplierBill].[UOM]'
                        WHEN 'UOM DESC' THEN '[SPMT_SupplierBill].[UOM] DESC'
                        WHEN 'Quantity' THEN '[SPMT_SupplierBill].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[SPMT_SupplierBill].[Quantity] DESC'
                        WHEN 'BasicValue' THEN '[SPMT_SupplierBill].[BasicValue]'
                        WHEN 'BasicValue DESC' THEN '[SPMT_SupplierBill].[BasicValue] DESC'
                        WHEN 'Discount' THEN '[SPMT_SupplierBill].[Discount]'
                        WHEN 'Discount DESC' THEN '[SPMT_SupplierBill].[Discount] DESC'
                        WHEN 'ServiceCharge' THEN '[SPMT_SupplierBill].[ServiceCharge]'
                        WHEN 'ServiceCharge DESC' THEN '[SPMT_SupplierBill].[ServiceCharge] DESC'
                        WHEN 'AssessableValue' THEN '[SPMT_SupplierBill].[AssessableValue]'
                        WHEN 'AssessableValue DESC' THEN '[SPMT_SupplierBill].[AssessableValue] DESC'
                        WHEN 'TaxRate' THEN '[SPMT_SupplierBill].[TaxRate]'
                        WHEN 'TaxRate DESC' THEN '[SPMT_SupplierBill].[TaxRate] DESC'
                        WHEN 'TaxAmount' THEN '[SPMT_SupplierBill].[TaxAmount]'
                        WHEN 'TaxAmount DESC' THEN '[SPMT_SupplierBill].[TaxAmount] DESC'
                        WHEN 'CessRate' THEN '[SPMT_SupplierBill].[CessRate]'
                        WHEN 'CessRate DESC' THEN '[SPMT_SupplierBill].[CessRate] DESC'
                        WHEN 'CessAmount' THEN '[SPMT_SupplierBill].[CessAmount]'
                        WHEN 'CessAmount DESC' THEN '[SPMT_SupplierBill].[CessAmount] DESC'
                        WHEN 'TotalGST' THEN '[SPMT_SupplierBill].[TotalGST]'
                        WHEN 'TotalGST DESC' THEN '[SPMT_SupplierBill].[TotalGST] DESC'
                        WHEN 'TotalAmount' THEN '[SPMT_SupplierBill].[TotalAmount]'
                        WHEN 'TotalAmount DESC' THEN '[SPMT_SupplierBill].[TotalAmount] DESC'
                        WHEN 'RemarksGST' THEN '[SPMT_SupplierBill].[RemarksGST]'
                        WHEN 'RemarksGST DESC' THEN '[SPMT_SupplierBill].[RemarksGST] DESC'
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
                        WHEN 'BillRemarks' THEN '[SPMT_SupplierBill].[BillRemarks]'
                        WHEN 'BillRemarks DESC' THEN '[SPMT_SupplierBill].[BillRemarks] DESC'
                        WHEN 'PassedAmount' THEN '[SPMT_SupplierBill].[PassedAmount]'
                        WHEN 'PassedAmount DESC' THEN '[SPMT_SupplierBill].[PassedAmount] DESC'
                        WHEN 'VendorID' THEN '[SPMT_SupplierBill].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[SPMT_SupplierBill].[VendorID] DESC'
                        WHEN 'RemarksAC' THEN '[SPMT_SupplierBill].[RemarksAC]'
                        WHEN 'RemarksAC DESC' THEN '[SPMT_SupplierBill].[RemarksAC] DESC'
                        WHEN 'ReturnedByAC' THEN '[SPMT_SupplierBill].[ReturnedByAC]'
                        WHEN 'ReturnedByAC DESC' THEN '[SPMT_SupplierBill].[ReturnedByAC] DESC'
                        WHEN 'ReasonID' THEN '[SPMT_SupplierBill].[ReasonID]'
                        WHEN 'ReasonID DESC' THEN '[SPMT_SupplierBill].[ReasonID] DESC'
                        WHEN 'AdviceNo' THEN '[SPMT_SupplierBill].[AdviceNo]'
                        WHEN 'AdviceNo DESC' THEN '[SPMT_SupplierBill].[AdviceNo] DESC'
                        WHEN 'ConcernedHOD' THEN '[SPMT_SupplierBill].[ConcernedHOD]'
                        WHEN 'ConcernedHOD DESC' THEN '[SPMT_SupplierBill].[ConcernedHOD] DESC'
                        WHEN 'CostCenter' THEN '[SPMT_SupplierBill].[CostCenter]'
                        WHEN 'CostCenter DESC' THEN '[SPMT_SupplierBill].[CostCenter] DESC'
                        WHEN 'CostCenterID' THEN '[SPMT_SupplierBill].[CostCenterID]'
                        WHEN 'CostCenterID DESC' THEN '[SPMT_SupplierBill].[CostCenterID] DESC'
                        WHEN 'ProjectID' THEN '[SPMT_SupplierBill].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[SPMT_SupplierBill].[ProjectID] DESC'
                        WHEN 'ElementID' THEN '[SPMT_SupplierBill].[ElementID]'
                        WHEN 'ElementID DESC' THEN '[SPMT_SupplierBill].[ElementID] DESC'
                        WHEN 'DepartmentID' THEN '[SPMT_SupplierBill].[DepartmentID]'
                        WHEN 'DepartmentID DESC' THEN '[SPMT_SupplierBill].[DepartmentID] DESC'
                        WHEN 'EmployeeID' THEN '[SPMT_SupplierBill].[EmployeeID]'
                        WHEN 'EmployeeID DESC' THEN '[SPMT_SupplierBill].[EmployeeID] DESC'
                        WHEN 'VoucherNo' THEN '[SPMT_SupplierBill].[VoucherNo]'
                        WHEN 'VoucherNo DESC' THEN '[SPMT_SupplierBill].[VoucherNo] DESC'
                        WHEN 'DocumentNo' THEN '[SPMT_SupplierBill].[DocumentNo]'
                        WHEN 'DocumentNo DESC' THEN '[SPMT_SupplierBill].[DocumentNo] DESC'
                        WHEN 'DocumentLine' THEN '[SPMT_SupplierBill].[DocumentLine]'
                        WHEN 'DocumentLine DESC' THEN '[SPMT_SupplierBill].[DocumentLine] DESC'
                        WHEN 'BaaNCompany' THEN '[SPMT_SupplierBill].[BaaNCompany]'
                        WHEN 'BaaNCompany DESC' THEN '[SPMT_SupplierBill].[BaaNCompany] DESC'
                        WHEN 'BaaNLedger' THEN '[SPMT_SupplierBill].[BaaNLedger]'
                        WHEN 'BaaNLedger DESC' THEN '[SPMT_SupplierBill].[BaaNLedger] DESC'
                        WHEN 'BillAmount' THEN '[SPMT_SupplierBill].[BillAmount]'
                        WHEN 'BillAmount DESC' THEN '[SPMT_SupplierBill].[BillAmount] DESC'
                        WHEN 'Currency' THEN '[SPMT_SupplierBill].[Currency]'
                        WHEN 'Currency DESC' THEN '[SPMT_SupplierBill].[Currency] DESC'
                        WHEN 'ConversionFactorINR' THEN '[SPMT_SupplierBill].[ConversionFactorINR]'
                        WHEN 'ConversionFactorINR DESC' THEN '[SPMT_SupplierBill].[ConversionFactorINR] DESC'
                        WHEN 'TotalAmountINR' THEN '[SPMT_SupplierBill].[TotalAmountINR]'
                        WHEN 'TotalAmountINR DESC' THEN '[SPMT_SupplierBill].[TotalAmountINR] DESC'
                        WHEN 'PurchaseType' THEN '[SPMT_SupplierBill].[PurchaseType]'
                        WHEN 'PurchaseType DESC' THEN '[SPMT_SupplierBill].[PurchaseType] DESC'
                        WHEN 'IGSTRate' THEN '[SPMT_SupplierBill].[IGSTRate]'
                        WHEN 'IGSTRate DESC' THEN '[SPMT_SupplierBill].[IGSTRate] DESC'
                        WHEN 'IGSTAmount' THEN '[SPMT_SupplierBill].[IGSTAmount]'
                        WHEN 'IGSTAmount DESC' THEN '[SPMT_SupplierBill].[IGSTAmount] DESC'
                        WHEN 'SGSTRate' THEN '[SPMT_SupplierBill].[SGSTRate]'
                        WHEN 'SGSTRate DESC' THEN '[SPMT_SupplierBill].[SGSTRate] DESC'
                        WHEN 'SGSTAmount' THEN '[SPMT_SupplierBill].[SGSTAmount]'
                        WHEN 'SGSTAmount DESC' THEN '[SPMT_SupplierBill].[SGSTAmount] DESC'
                        WHEN 'CGSTRate' THEN '[SPMT_SupplierBill].[CGSTRate]'
                        WHEN 'CGSTRate DESC' THEN '[SPMT_SupplierBill].[CGSTRate] DESC'
                        WHEN 'CGSTAmount' THEN '[SPMT_SupplierBill].[CGSTAmount]'
                        WHEN 'CGSTAmount DESC' THEN '[SPMT_SupplierBill].[CGSTAmount] DESC'
                        WHEN 'BatchNo' THEN '[SPMT_SupplierBill].[BatchNo]'
                        WHEN 'BatchNo DESC' THEN '[SPMT_SupplierBill].[BatchNo] DESC'
                        WHEN 'DocNo' THEN '[SPMT_SupplierBill].[DocNo]'
                        WHEN 'DocNo DESC' THEN '[SPMT_SupplierBill].[DocNo] DESC'
                        WHEN 'DocLine' THEN '[SPMT_SupplierBill].[DocLine]'
                        WHEN 'DocLine DESC' THEN '[SPMT_SupplierBill].[DocLine] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'SPMT_BillStatus2_Description' THEN '[SPMT_BillStatus2].[Description]'
                        WHEN 'SPMT_BillStatus2_Description DESC' THEN '[SPMT_BillStatus2].[Description] DESC'
                        WHEN 'SPMT_TranTypes3_Description' THEN '[SPMT_TranTypes3].[Description]'
                        WHEN 'SPMT_TranTypes3_Description DESC' THEN '[SPMT_TranTypes3].[Description] DESC'
                        WHEN 'SPMT_Vendors4_Description' THEN '[SPMT_Vendors4].[Description]'
                        WHEN 'SPMT_Vendors4_Description DESC' THEN '[SPMT_Vendors4].[Description] DESC'
                        WHEN 'SPMT_ReturnReason6_Description' THEN '[SPMT_ReturnReason6].[Description]'
                        WHEN 'SPMT_ReturnReason6_Description DESC' THEN '[SPMT_ReturnReason6].[Description] DESC'
                        WHEN 'aspnet_Users7_UserFullName' THEN '[aspnet_Users7].[UserFullName]'
                        WHEN 'aspnet_Users7_UserFullName DESC' THEN '[aspnet_Users7].[UserFullName] DESC'
                        WHEN 'aspnet_Users8_UserFullName' THEN '[aspnet_Users8].[UserFullName]'
                        WHEN 'aspnet_Users8_UserFullName DESC' THEN '[aspnet_Users8].[UserFullName] DESC'
                        WHEN 'HRM_Departments9_Description' THEN '[HRM_Departments9].[Description]'
                        WHEN 'HRM_Departments9_Description DESC' THEN '[HRM_Departments9].[Description] DESC'
                        WHEN 'IDM_Projects10_Description' THEN '[IDM_Projects10].[Description]'
                        WHEN 'IDM_Projects10_Description DESC' THEN '[IDM_Projects10].[Description] DESC'
                        WHEN 'IDM_WBS11_Description' THEN '[IDM_WBS11].[Description]'
                        WHEN 'IDM_WBS11_Description DESC' THEN '[IDM_WBS11].[Description] DESC'
                        WHEN 'SPMT_CostCenters13_Description' THEN '[SPMT_CostCenters13].[Description]'
                        WHEN 'SPMT_CostCenters13_Description DESC' THEN '[SPMT_CostCenters13].[Description] DESC'
                        WHEN 'SPMT_BillTypes14_Description' THEN '[SPMT_BillTypes14].[Description]'
                        WHEN 'SPMT_BillTypes14_Description DESC' THEN '[SPMT_BillTypes14].[Description] DESC'
                        WHEN 'SPMT_ERPStates15_Description' THEN '[SPMT_ERPStates15].[Description]'
                        WHEN 'SPMT_ERPStates15_Description DESC' THEN '[SPMT_ERPStates15].[Description] DESC'
                        WHEN 'SPMT_ERPUnits16_Description' THEN '[SPMT_ERPUnits16].[Description]'
                        WHEN 'SPMT_ERPUnits16_Description DESC' THEN '[SPMT_ERPUnits16].[Description] DESC'
                        WHEN 'SPMT_HSNSACCodes17_HSNSACCode' THEN '[SPMT_HSNSACCodes17].[HSNSACCode]'
                        WHEN 'SPMT_HSNSACCodes17_HSNSACCode DESC' THEN '[SPMT_HSNSACCodes17].[HSNSACCode] DESC'
                        WHEN 'SPMT_IsgecGSTIN18_Description' THEN '[SPMT_IsgecGSTIN18].[Description]'
                        WHEN 'SPMT_IsgecGSTIN18_Description DESC' THEN '[SPMT_IsgecGSTIN18].[Description] DESC'
                        WHEN 'VR_BPGSTIN19_Description' THEN '[VR_BPGSTIN19].[Description]'
                        WHEN 'VR_BPGSTIN19_Description DESC' THEN '[VR_BPGSTIN19].[Description] DESC'
                        WHEN 'VR_BusinessPartner20_BPName' THEN '[VR_BusinessPartner20].[BPName]'
                        WHEN 'VR_BusinessPartner20_BPName DESC' THEN '[VR_BusinessPartner20].[BPName] DESC'
                        ELSE '[SPMT_SupplierBill].[IRNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[SPMT_SupplierBill].[IRNo] ,
		[SPMT_SupplierBill].[TranTypeID] ,
		[SPMT_SupplierBill].[IRReceivedOn] ,
		[SPMT_SupplierBill].[IsgecGSTIN] ,
		[SPMT_SupplierBill].[BPID] ,
		[SPMT_SupplierBill].[SupplierGSTIN] ,
		[SPMT_SupplierBill].[BillType] ,
		[SPMT_SupplierBill].[HSNSACCode] ,
		[SPMT_SupplierBill].[Remarks] ,
		[SPMT_SupplierBill].[ShipToState] ,
		[SPMT_SupplierBill].[BillNumber] ,
		[SPMT_SupplierBill].[BillDate] ,
		[SPMT_SupplierBill].[UOM] ,
		[SPMT_SupplierBill].[Quantity] ,
		[SPMT_SupplierBill].[BasicValue] ,
		[SPMT_SupplierBill].[Discount] ,
		[SPMT_SupplierBill].[ServiceCharge] ,
		[SPMT_SupplierBill].[AssessableValue] ,
		[SPMT_SupplierBill].[TaxRate] ,
		[SPMT_SupplierBill].[TaxAmount] ,
		[SPMT_SupplierBill].[CessRate] ,
		[SPMT_SupplierBill].[CessAmount] ,
		[SPMT_SupplierBill].[TotalGST] ,
		[SPMT_SupplierBill].[TotalAmount] ,
		[SPMT_SupplierBill].[RemarksGST] ,
		[SPMT_SupplierBill].[BillStatusID] ,
		[SPMT_SupplierBill].[BillStatusDate] ,
		[SPMT_SupplierBill].[BillStatusUser] ,
		[SPMT_SupplierBill].[LogisticLinked] ,
		[SPMT_SupplierBill].[ApprovedAmount] ,
		[SPMT_SupplierBill].[BillRemarks] ,
		[SPMT_SupplierBill].[PassedAmount] ,
		[SPMT_SupplierBill].[VendorID] ,
		[SPMT_SupplierBill].[RemarksAC] ,
		[SPMT_SupplierBill].[ReturnedByAC] ,
		[SPMT_SupplierBill].[ReasonID] ,
		[SPMT_SupplierBill].[AdviceNo] ,
		[SPMT_SupplierBill].[ConcernedHOD] ,
		[SPMT_SupplierBill].[CostCenter] ,
		[SPMT_SupplierBill].[CostCenterID] ,
		[SPMT_SupplierBill].[ProjectID] ,
		[SPMT_SupplierBill].[ElementID] ,
		[SPMT_SupplierBill].[DepartmentID] ,
		[SPMT_SupplierBill].[EmployeeID] ,
		[SPMT_SupplierBill].[VoucherNo] ,
		[SPMT_SupplierBill].[DocumentNo] ,
		[SPMT_SupplierBill].[DocumentLine] ,
		[SPMT_SupplierBill].[BaaNCompany] ,
		[SPMT_SupplierBill].[BaaNLedger] ,
		[SPMT_SupplierBill].[BillAmount] ,
		[SPMT_SupplierBill].[Currency] ,
		[SPMT_SupplierBill].[ConversionFactorINR] ,
		[SPMT_SupplierBill].[TotalAmountINR] ,
		[SPMT_SupplierBill].[PurchaseType] ,
		[SPMT_SupplierBill].[IGSTRate] ,
		[SPMT_SupplierBill].[IGSTAmount] ,
		[SPMT_SupplierBill].[SGSTRate] ,
		[SPMT_SupplierBill].[SGSTAmount] ,
		[SPMT_SupplierBill].[CGSTRate] ,
		[SPMT_SupplierBill].[CGSTAmount] ,
		[SPMT_SupplierBill].[BatchNo] ,
		[SPMT_SupplierBill].[DocNo] ,
		[SPMT_SupplierBill].[DocLine] ,
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
		[SPMT_CostCenters13].[Description] AS SPMT_CostCenters13_Description,
		[SPMT_BillTypes14].[Description] AS SPMT_BillTypes14_Description,
		[SPMT_ERPStates15].[Description] AS SPMT_ERPStates15_Description,
		[SPMT_ERPUnits16].[Description] AS SPMT_ERPUnits16_Description,
		[SPMT_HSNSACCodes17].[HSNSACCode] AS SPMT_HSNSACCodes17_HSNSACCode,
		[SPMT_IsgecGSTIN18].[Description] AS SPMT_IsgecGSTIN18_Description,
		[VR_BPGSTIN19].[Description] AS VR_BPGSTIN19_Description,
		[VR_BusinessPartner20].[BPName] AS VR_BusinessPartner20_BPName 
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
  LEFT OUTER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes14]
    ON [SPMT_SupplierBill].[BillType] = [SPMT_BillTypes14].[BillType]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates15]
    ON [SPMT_SupplierBill].[ShipToState] = [SPMT_ERPStates15].[StateID]
  LEFT OUTER JOIN [SPMT_ERPUnits] AS [SPMT_ERPUnits16]
    ON [SPMT_SupplierBill].[UOM] = [SPMT_ERPUnits16].[UOM]
  LEFT OUTER JOIN [SPMT_HSNSACCodes] AS [SPMT_HSNSACCodes17]
    ON [SPMT_SupplierBill].[BillType] = [SPMT_HSNSACCodes17].[BillType]
    AND [SPMT_SupplierBill].[HSNSACCode] = [SPMT_HSNSACCodes17].[HSNSACCode]
  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN18]
    ON [SPMT_SupplierBill].[IsgecGSTIN] = [SPMT_IsgecGSTIN18].[GSTID]
  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN19]
    ON [SPMT_SupplierBill].[BPID] = [VR_BPGSTIN19].[BPID]
    AND [SPMT_SupplierBill].[SupplierGSTIN] = [VR_BPGSTIN19].[GSTIN]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner20]
    ON [SPMT_SupplierBill].[BPID] = [VR_BusinessPartner20].[BPID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
