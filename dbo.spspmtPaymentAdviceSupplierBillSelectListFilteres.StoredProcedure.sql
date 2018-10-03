USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtPaymentAdviceSupplierBillSelectListFilteres]
  @Filter_AdviceNo Int,
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
  SET @LGSQL = @LGSQL + '[SPMT_SupplierBill].[IRNo]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_SupplierBill] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[BillStatusUser] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[ConcernedHOD] = [aspnet_users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[EmployeeID] = [aspnet_users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments4]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[DepartmentID] = [HRM_Departments4].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects5]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[ProjectID] = [IDM_Projects5].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS6]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[ElementID] = [IDM_WBS6].[WBSID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_BillStatus] AS [SPMT_BillStatus7]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[BillStatusID] = [SPMT_BillStatus7].[BillStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes8]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[BillType] = [SPMT_BillTypes8].[BillType]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_CostCenters] AS [SPMT_CostCenters9]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[CostCenterID] = [SPMT_CostCenters9].[CostCenterID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates10]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[ShipToState] = [SPMT_ERPStates10].[StateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ERPUnits] AS [SPMT_ERPUnits11]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[UOM] = [SPMT_ERPUnits11].[UOM]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_HSNSACCodes] AS [SPMT_HSNSACCodes12]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[BillType] = [SPMT_HSNSACCodes12].[BillType]'
  SET @LGSQL = @LGSQL + '    AND [SPMT_SupplierBill].[HSNSACCode] = [SPMT_HSNSACCodes12].[HSNSACCode]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN13]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[IsgecGSTIN] = [SPMT_IsgecGSTIN13].[GSTID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_PaymentAdvice] AS [SPMT_PaymentAdvice14]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[AdviceNo] = [SPMT_PaymentAdvice14].[AdviceNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ReturnReason] AS [SPMT_ReturnReason15]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[ReasonID] = [SPMT_ReturnReason15].[ReasonID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_TranTypes] AS [SPMT_TranTypes16]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[TranTypeID] = [SPMT_TranTypes16].[TranTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN17]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[BPID] = [VR_BPGSTIN17].[BPID]'
  SET @LGSQL = @LGSQL + '    AND [SPMT_SupplierBill].[SupplierGSTIN] = [VR_BPGSTIN17].[GSTIN]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner18]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_SupplierBill].[BPID] = [VR_BusinessPartner18].[BPID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_AdviceNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [SPMT_SupplierBill].[AdviceNo] = ' + STR(@Filter_AdviceNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'IRNo' THEN '[SPMT_SupplierBill].[IRNo]'
                        WHEN 'IRNo DESC' THEN '[SPMT_SupplierBill].[IRNo] DESC'
                        WHEN 'TranTypeID' THEN '[SPMT_SupplierBill].[TranTypeID]'
                        WHEN 'TranTypeID DESC' THEN '[SPMT_SupplierBill].[TranTypeID] DESC'
                        WHEN 'BPID' THEN '[SPMT_SupplierBill].[BPID]'
                        WHEN 'BPID DESC' THEN '[SPMT_SupplierBill].[BPID] DESC'
                        WHEN 'BillNumber' THEN '[SPMT_SupplierBill].[BillNumber]'
                        WHEN 'BillNumber DESC' THEN '[SPMT_SupplierBill].[BillNumber] DESC'
                        WHEN 'BillDate' THEN '[SPMT_SupplierBill].[BillDate]'
                        WHEN 'BillDate DESC' THEN '[SPMT_SupplierBill].[BillDate] DESC'
                        WHEN 'BillAmount' THEN '[SPMT_SupplierBill].[BillAmount]'
                        WHEN 'BillAmount DESC' THEN '[SPMT_SupplierBill].[BillAmount] DESC'
                        WHEN 'Currency' THEN '[SPMT_SupplierBill].[Currency]'
                        WHEN 'Currency DESC' THEN '[SPMT_SupplierBill].[Currency] DESC'
                        WHEN 'BillRemarks' THEN '[SPMT_SupplierBill].[BillRemarks]'
                        WHEN 'BillRemarks DESC' THEN '[SPMT_SupplierBill].[BillRemarks] DESC'
                        WHEN 'Quantity' THEN '[SPMT_SupplierBill].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[SPMT_SupplierBill].[Quantity] DESC'
                        WHEN 'UOM' THEN '[SPMT_SupplierBill].[UOM]'
                        WHEN 'UOM DESC' THEN '[SPMT_SupplierBill].[UOM] DESC'
                        WHEN 'SupplierGSTIN' THEN '[SPMT_SupplierBill].[SupplierGSTIN]'
                        WHEN 'SupplierGSTIN DESC' THEN '[SPMT_SupplierBill].[SupplierGSTIN] DESC'
                        WHEN 'IsgecGSTIN' THEN '[SPMT_SupplierBill].[IsgecGSTIN]'
                        WHEN 'IsgecGSTIN DESC' THEN '[SPMT_SupplierBill].[IsgecGSTIN] DESC'
                        WHEN 'DocLine' THEN '[SPMT_SupplierBill].[DocLine]'
                        WHEN 'DocLine DESC' THEN '[SPMT_SupplierBill].[DocLine] DESC'
                        WHEN 'ShipToState' THEN '[SPMT_SupplierBill].[ShipToState]'
                        WHEN 'ShipToState DESC' THEN '[SPMT_SupplierBill].[ShipToState] DESC'
                        WHEN 'HSNSACCode' THEN '[SPMT_SupplierBill].[HSNSACCode]'
                        WHEN 'HSNSACCode DESC' THEN '[SPMT_SupplierBill].[HSNSACCode] DESC'
                        WHEN 'BillType' THEN '[SPMT_SupplierBill].[BillType]'
                        WHEN 'BillType DESC' THEN '[SPMT_SupplierBill].[BillType] DESC'
                        WHEN 'ConversionFactorINR' THEN '[SPMT_SupplierBill].[ConversionFactorINR]'
                        WHEN 'ConversionFactorINR DESC' THEN '[SPMT_SupplierBill].[ConversionFactorINR] DESC'
                        WHEN 'TaxAmount' THEN '[SPMT_SupplierBill].[TaxAmount]'
                        WHEN 'TaxAmount DESC' THEN '[SPMT_SupplierBill].[TaxAmount] DESC'
                        WHEN 'TotalGST' THEN '[SPMT_SupplierBill].[TotalGST]'
                        WHEN 'TotalGST DESC' THEN '[SPMT_SupplierBill].[TotalGST] DESC'
                        WHEN 'CessAmount' THEN '[SPMT_SupplierBill].[CessAmount]'
                        WHEN 'CessAmount DESC' THEN '[SPMT_SupplierBill].[CessAmount] DESC'
                        WHEN 'TotalAmount' THEN '[SPMT_SupplierBill].[TotalAmount]'
                        WHEN 'TotalAmount DESC' THEN '[SPMT_SupplierBill].[TotalAmount] DESC'
                        WHEN 'IRReceivedOn' THEN '[SPMT_SupplierBill].[IRReceivedOn]'
                        WHEN 'IRReceivedOn DESC' THEN '[SPMT_SupplierBill].[IRReceivedOn] DESC'
                        WHEN 'RemarksGST' THEN '[SPMT_SupplierBill].[RemarksGST]'
                        WHEN 'RemarksGST DESC' THEN '[SPMT_SupplierBill].[RemarksGST] DESC'
                        WHEN 'TotalAmountINR' THEN '[SPMT_SupplierBill].[TotalAmountINR]'
                        WHEN 'TotalAmountINR DESC' THEN '[SPMT_SupplierBill].[TotalAmountINR] DESC'
                        WHEN 'CessRate' THEN '[SPMT_SupplierBill].[CessRate]'
                        WHEN 'CessRate DESC' THEN '[SPMT_SupplierBill].[CessRate] DESC'
                        WHEN 'IGSTAmount' THEN '[SPMT_SupplierBill].[IGSTAmount]'
                        WHEN 'IGSTAmount DESC' THEN '[SPMT_SupplierBill].[IGSTAmount] DESC'
                        WHEN 'IGSTRate' THEN '[SPMT_SupplierBill].[IGSTRate]'
                        WHEN 'IGSTRate DESC' THEN '[SPMT_SupplierBill].[IGSTRate] DESC'
                        WHEN 'AssessableValue' THEN '[SPMT_SupplierBill].[AssessableValue]'
                        WHEN 'AssessableValue DESC' THEN '[SPMT_SupplierBill].[AssessableValue] DESC'
                        WHEN 'CGSTRate' THEN '[SPMT_SupplierBill].[CGSTRate]'
                        WHEN 'CGSTRate DESC' THEN '[SPMT_SupplierBill].[CGSTRate] DESC'
                        WHEN 'SGSTAmount' THEN '[SPMT_SupplierBill].[SGSTAmount]'
                        WHEN 'SGSTAmount DESC' THEN '[SPMT_SupplierBill].[SGSTAmount] DESC'
                        WHEN 'SGSTRate' THEN '[SPMT_SupplierBill].[SGSTRate]'
                        WHEN 'SGSTRate DESC' THEN '[SPMT_SupplierBill].[SGSTRate] DESC'
                        WHEN 'CGSTAmount' THEN '[SPMT_SupplierBill].[CGSTAmount]'
                        WHEN 'CGSTAmount DESC' THEN '[SPMT_SupplierBill].[CGSTAmount] DESC'
                        WHEN 'ReturnedByAC' THEN '[SPMT_SupplierBill].[ReturnedByAC]'
                        WHEN 'ReturnedByAC DESC' THEN '[SPMT_SupplierBill].[ReturnedByAC] DESC'
                        WHEN 'RemarksAC' THEN '[SPMT_SupplierBill].[RemarksAC]'
                        WHEN 'RemarksAC DESC' THEN '[SPMT_SupplierBill].[RemarksAC] DESC'
                        WHEN 'PassedAmount' THEN '[SPMT_SupplierBill].[PassedAmount]'
                        WHEN 'PassedAmount DESC' THEN '[SPMT_SupplierBill].[PassedAmount] DESC'
                        WHEN 'ReasonID' THEN '[SPMT_SupplierBill].[ReasonID]'
                        WHEN 'ReasonID DESC' THEN '[SPMT_SupplierBill].[ReasonID] DESC'
                        WHEN 'CostCenter' THEN '[SPMT_SupplierBill].[CostCenter]'
                        WHEN 'CostCenter DESC' THEN '[SPMT_SupplierBill].[CostCenter] DESC'
                        WHEN 'ConcernedHOD' THEN '[SPMT_SupplierBill].[ConcernedHOD]'
                        WHEN 'ConcernedHOD DESC' THEN '[SPMT_SupplierBill].[ConcernedHOD] DESC'
                        WHEN 'AdviceNo' THEN '[SPMT_SupplierBill].[AdviceNo]'
                        WHEN 'AdviceNo DESC' THEN '[SPMT_SupplierBill].[AdviceNo] DESC'
                        WHEN 'Remarks' THEN '[SPMT_SupplierBill].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[SPMT_SupplierBill].[Remarks] DESC'
                        WHEN 'BillStatusID' THEN '[SPMT_SupplierBill].[BillStatusID]'
                        WHEN 'BillStatusID DESC' THEN '[SPMT_SupplierBill].[BillStatusID] DESC'
                        WHEN 'VendorID' THEN '[SPMT_SupplierBill].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[SPMT_SupplierBill].[VendorID] DESC'
                        WHEN 'PurchaseType' THEN '[SPMT_SupplierBill].[PurchaseType]'
                        WHEN 'PurchaseType DESC' THEN '[SPMT_SupplierBill].[PurchaseType] DESC'
                        WHEN 'BillStatusDate' THEN '[SPMT_SupplierBill].[BillStatusDate]'
                        WHEN 'BillStatusDate DESC' THEN '[SPMT_SupplierBill].[BillStatusDate] DESC'
                        WHEN 'ApprovedAmount' THEN '[SPMT_SupplierBill].[ApprovedAmount]'
                        WHEN 'ApprovedAmount DESC' THEN '[SPMT_SupplierBill].[ApprovedAmount] DESC'
                        WHEN 'LogisticLinked' THEN '[SPMT_SupplierBill].[LogisticLinked]'
                        WHEN 'LogisticLinked DESC' THEN '[SPMT_SupplierBill].[LogisticLinked] DESC'
                        WHEN 'BillStatusUser' THEN '[SPMT_SupplierBill].[BillStatusUser]'
                        WHEN 'BillStatusUser DESC' THEN '[SPMT_SupplierBill].[BillStatusUser] DESC'
                        WHEN 'ProjectID' THEN '[SPMT_SupplierBill].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[SPMT_SupplierBill].[ProjectID] DESC'
                        WHEN 'Discount' THEN '[SPMT_SupplierBill].[Discount]'
                        WHEN 'Discount DESC' THEN '[SPMT_SupplierBill].[Discount] DESC'
                        WHEN 'BasicValue' THEN '[SPMT_SupplierBill].[BasicValue]'
                        WHEN 'BasicValue DESC' THEN '[SPMT_SupplierBill].[BasicValue] DESC'
                        WHEN 'BaaNLedger' THEN '[SPMT_SupplierBill].[BaaNLedger]'
                        WHEN 'BaaNLedger DESC' THEN '[SPMT_SupplierBill].[BaaNLedger] DESC'
                        WHEN 'ServiceCharge' THEN '[SPMT_SupplierBill].[ServiceCharge]'
                        WHEN 'ServiceCharge DESC' THEN '[SPMT_SupplierBill].[ServiceCharge] DESC'
                        WHEN 'DocNo' THEN '[SPMT_SupplierBill].[DocNo]'
                        WHEN 'DocNo DESC' THEN '[SPMT_SupplierBill].[DocNo] DESC'
                        WHEN 'BatchNo' THEN '[SPMT_SupplierBill].[BatchNo]'
                        WHEN 'BatchNo DESC' THEN '[SPMT_SupplierBill].[BatchNo] DESC'
                        WHEN 'TaxRate' THEN '[SPMT_SupplierBill].[TaxRate]'
                        WHEN 'TaxRate DESC' THEN '[SPMT_SupplierBill].[TaxRate] DESC'
                        WHEN 'BaaNCompany' THEN '[SPMT_SupplierBill].[BaaNCompany]'
                        WHEN 'BaaNCompany DESC' THEN '[SPMT_SupplierBill].[BaaNCompany] DESC'
                        WHEN 'DepartmentID' THEN '[SPMT_SupplierBill].[DepartmentID]'
                        WHEN 'DepartmentID DESC' THEN '[SPMT_SupplierBill].[DepartmentID] DESC'
                        WHEN 'EmployeeID' THEN '[SPMT_SupplierBill].[EmployeeID]'
                        WHEN 'EmployeeID DESC' THEN '[SPMT_SupplierBill].[EmployeeID] DESC'
                        WHEN 'ElementID' THEN '[SPMT_SupplierBill].[ElementID]'
                        WHEN 'ElementID DESC' THEN '[SPMT_SupplierBill].[ElementID] DESC'
                        WHEN 'CostCenterID' THEN '[SPMT_SupplierBill].[CostCenterID]'
                        WHEN 'CostCenterID DESC' THEN '[SPMT_SupplierBill].[CostCenterID] DESC'
                        WHEN 'DocumentLine' THEN '[SPMT_SupplierBill].[DocumentLine]'
                        WHEN 'DocumentLine DESC' THEN '[SPMT_SupplierBill].[DocumentLine] DESC'
                        WHEN 'DocumentNo' THEN '[SPMT_SupplierBill].[DocumentNo]'
                        WHEN 'DocumentNo DESC' THEN '[SPMT_SupplierBill].[DocumentNo] DESC'
                        WHEN 'VoucherNo' THEN '[SPMT_SupplierBill].[VoucherNo]'
                        WHEN 'VoucherNo DESC' THEN '[SPMT_SupplierBill].[VoucherNo] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'HRM_Departments4_Description' THEN '[HRM_Departments4].[Description]'
                        WHEN 'HRM_Departments4_Description DESC' THEN '[HRM_Departments4].[Description] DESC'
                        WHEN 'IDM_Projects5_Description' THEN '[IDM_Projects5].[Description]'
                        WHEN 'IDM_Projects5_Description DESC' THEN '[IDM_Projects5].[Description] DESC'
                        WHEN 'IDM_WBS6_Description' THEN '[IDM_WBS6].[Description]'
                        WHEN 'IDM_WBS6_Description DESC' THEN '[IDM_WBS6].[Description] DESC'
                        WHEN 'SPMT_BillStatus7_Description' THEN '[SPMT_BillStatus7].[Description]'
                        WHEN 'SPMT_BillStatus7_Description DESC' THEN '[SPMT_BillStatus7].[Description] DESC'
                        WHEN 'SPMT_BillTypes8_Description' THEN '[SPMT_BillTypes8].[Description]'
                        WHEN 'SPMT_BillTypes8_Description DESC' THEN '[SPMT_BillTypes8].[Description] DESC'
                        WHEN 'SPMT_CostCenters9_Description' THEN '[SPMT_CostCenters9].[Description]'
                        WHEN 'SPMT_CostCenters9_Description DESC' THEN '[SPMT_CostCenters9].[Description] DESC'
                        WHEN 'SPMT_ERPStates10_Description' THEN '[SPMT_ERPStates10].[Description]'
                        WHEN 'SPMT_ERPStates10_Description DESC' THEN '[SPMT_ERPStates10].[Description] DESC'
                        WHEN 'SPMT_ERPUnits11_Description' THEN '[SPMT_ERPUnits11].[Description]'
                        WHEN 'SPMT_ERPUnits11_Description DESC' THEN '[SPMT_ERPUnits11].[Description] DESC'
                        WHEN 'SPMT_HSNSACCodes12_HSNSACCode' THEN '[SPMT_HSNSACCodes12].[HSNSACCode]'
                        WHEN 'SPMT_HSNSACCodes12_HSNSACCode DESC' THEN '[SPMT_HSNSACCodes12].[HSNSACCode] DESC'
                        WHEN 'SPMT_IsgecGSTIN13_Description' THEN '[SPMT_IsgecGSTIN13].[Description]'
                        WHEN 'SPMT_IsgecGSTIN13_Description DESC' THEN '[SPMT_IsgecGSTIN13].[Description] DESC'
                        WHEN 'SPMT_PaymentAdvice14_BPID' THEN '[SPMT_PaymentAdvice14].[BPID]'
                        WHEN 'SPMT_PaymentAdvice14_BPID DESC' THEN '[SPMT_PaymentAdvice14].[BPID] DESC'
                        WHEN 'SPMT_ReturnReason15_Description' THEN '[SPMT_ReturnReason15].[Description]'
                        WHEN 'SPMT_ReturnReason15_Description DESC' THEN '[SPMT_ReturnReason15].[Description] DESC'
                        WHEN 'SPMT_TranTypes16_Description' THEN '[SPMT_TranTypes16].[Description]'
                        WHEN 'SPMT_TranTypes16_Description DESC' THEN '[SPMT_TranTypes16].[Description] DESC'
                        WHEN 'VR_BPGSTIN17_Description' THEN '[VR_BPGSTIN17].[Description]'
                        WHEN 'VR_BPGSTIN17_Description DESC' THEN '[VR_BPGSTIN17].[Description] DESC'
                        WHEN 'VR_BusinessPartner18_BPName' THEN '[VR_BusinessPartner18].[BPName]'
                        WHEN 'VR_BusinessPartner18_BPName DESC' THEN '[VR_BusinessPartner18].[BPName] DESC'
                        ELSE '[SPMT_SupplierBill].[IRNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SPMT_SupplierBill].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
    [HRM_Departments4].[Description] AS HRM_Departments4_Description,
    [IDM_Projects5].[Description] AS IDM_Projects5_Description,
    [IDM_WBS6].[Description] AS IDM_WBS6_Description,
    [SPMT_BillStatus7].[Description] AS SPMT_BillStatus7_Description,
    [SPMT_BillTypes8].[Description] AS SPMT_BillTypes8_Description,
    [SPMT_CostCenters9].[Description] AS SPMT_CostCenters9_Description,
    [SPMT_ERPStates10].[Description] AS SPMT_ERPStates10_Description,
    [SPMT_ERPUnits11].[Description] AS SPMT_ERPUnits11_Description,
    [SPMT_HSNSACCodes12].[HSNSACCode] AS SPMT_HSNSACCodes12_HSNSACCode,
    [SPMT_IsgecGSTIN13].[Description] AS SPMT_IsgecGSTIN13_Description,
    [SPMT_PaymentAdvice14].[BPID] AS SPMT_PaymentAdvice14_BPID,
    [SPMT_ReturnReason15].[Description] AS SPMT_ReturnReason15_Description,
    [SPMT_TranTypes16].[Description] AS SPMT_TranTypes16_Description,
    [VR_BPGSTIN17].[Description] AS VR_BPGSTIN17_Description,
    [VR_BusinessPartner18].[BPName] AS VR_BusinessPartner18_BPName 
  FROM [SPMT_SupplierBill] 
      INNER JOIN #PageIndex
          ON [SPMT_SupplierBill].[IRNo] = #PageIndex.IRNo
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [SPMT_SupplierBill].[BillStatusUser] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [SPMT_SupplierBill].[ConcernedHOD] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [SPMT_SupplierBill].[EmployeeID] = [aspnet_users3].[LoginID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments4]
    ON [SPMT_SupplierBill].[DepartmentID] = [HRM_Departments4].[DepartmentID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects5]
    ON [SPMT_SupplierBill].[ProjectID] = [IDM_Projects5].[ProjectID]
  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS6]
    ON [SPMT_SupplierBill].[ElementID] = [IDM_WBS6].[WBSID]
  INNER JOIN [SPMT_BillStatus] AS [SPMT_BillStatus7]
    ON [SPMT_SupplierBill].[BillStatusID] = [SPMT_BillStatus7].[BillStatusID]
  LEFT OUTER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes8]
    ON [SPMT_SupplierBill].[BillType] = [SPMT_BillTypes8].[BillType]
  LEFT OUTER JOIN [SPMT_CostCenters] AS [SPMT_CostCenters9]
    ON [SPMT_SupplierBill].[CostCenterID] = [SPMT_CostCenters9].[CostCenterID]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates10]
    ON [SPMT_SupplierBill].[ShipToState] = [SPMT_ERPStates10].[StateID]
  LEFT OUTER JOIN [SPMT_ERPUnits] AS [SPMT_ERPUnits11]
    ON [SPMT_SupplierBill].[UOM] = [SPMT_ERPUnits11].[UOM]
  LEFT OUTER JOIN [SPMT_HSNSACCodes] AS [SPMT_HSNSACCodes12]
    ON [SPMT_SupplierBill].[BillType] = [SPMT_HSNSACCodes12].[BillType]
    AND [SPMT_SupplierBill].[HSNSACCode] = [SPMT_HSNSACCodes12].[HSNSACCode]
  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN13]
    ON [SPMT_SupplierBill].[IsgecGSTIN] = [SPMT_IsgecGSTIN13].[GSTID]
  LEFT OUTER JOIN [SPMT_PaymentAdvice] AS [SPMT_PaymentAdvice14]
    ON [SPMT_SupplierBill].[AdviceNo] = [SPMT_PaymentAdvice14].[AdviceNo]
  LEFT OUTER JOIN [SPMT_ReturnReason] AS [SPMT_ReturnReason15]
    ON [SPMT_SupplierBill].[ReasonID] = [SPMT_ReturnReason15].[ReasonID]
  INNER JOIN [SPMT_TranTypes] AS [SPMT_TranTypes16]
    ON [SPMT_SupplierBill].[TranTypeID] = [SPMT_TranTypes16].[TranTypeID]
  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN17]
    ON [SPMT_SupplierBill].[BPID] = [VR_BPGSTIN17].[BPID]
    AND [SPMT_SupplierBill].[SupplierGSTIN] = [VR_BPGSTIN17].[GSTIN]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner18]
    ON [SPMT_SupplierBill].[BPID] = [VR_BusinessPartner18].[BPID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
