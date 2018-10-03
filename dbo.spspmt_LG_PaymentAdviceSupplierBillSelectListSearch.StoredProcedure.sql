USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmt_LG_PaymentAdviceSupplierBillSelectListSearch]
  @LoginID NVarChar(8),
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
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,IRNo Int NOT NULL
  )
  INSERT INTO #PageIndex (IRNo)
  SELECT [SPMT_SupplierBill].[IRNo] FROM [SPMT_SupplierBill]
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
 WHERE  [SPMT_SupplierBill].[DocNo] <> 'AIRY'
   AND ( 
         STR(ISNULL([SPMT_SupplierBill].[IRNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[TranTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[BillNumber],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[BillAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[BillRemarks],'')) LIKE @KeyWord1
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
     OR STR(ISNULL([SPMT_SupplierBill].[IsgecGSTIN], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[BPID],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[SupplierGSTIN], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[BillType], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[HSNSACCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[UOM],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[ShipToState],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[Quantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[BasicValue], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[Discount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[ServiceCharge], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[AssessableValue], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[TaxRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[TaxAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[CessRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[CessAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[TotalGST], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[TotalAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[RemarksGST],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[Currency],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[ConversionFactorINR], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[TotalAmountINR], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[PurchaseType],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[IGSTRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[IGSTAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[SGSTRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[SGSTAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[CGSTRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_SupplierBill].[CGSTAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[BatchNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[DocNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_SupplierBill].[DocLine],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'IRNo' THEN [SPMT_SupplierBill].[IRNo] END,
     CASE @OrderBy WHEN 'IRNo DESC' THEN [SPMT_SupplierBill].[IRNo] END DESC,
     CASE @OrderBy WHEN 'TranTypeID' THEN [SPMT_SupplierBill].[TranTypeID] END,
     CASE @OrderBy WHEN 'TranTypeID DESC' THEN [SPMT_SupplierBill].[TranTypeID] END DESC,
     CASE @OrderBy WHEN 'BPID' THEN [SPMT_SupplierBill].[BPID] END,
     CASE @OrderBy WHEN 'BPID DESC' THEN [SPMT_SupplierBill].[BPID] END DESC,
     CASE @OrderBy WHEN 'BillNumber' THEN [SPMT_SupplierBill].[BillNumber] END,
     CASE @OrderBy WHEN 'BillNumber DESC' THEN [SPMT_SupplierBill].[BillNumber] END DESC,
     CASE @OrderBy WHEN 'BillDate' THEN [SPMT_SupplierBill].[BillDate] END,
     CASE @OrderBy WHEN 'BillDate DESC' THEN [SPMT_SupplierBill].[BillDate] END DESC,
     CASE @OrderBy WHEN 'BillAmount' THEN [SPMT_SupplierBill].[BillAmount] END,
     CASE @OrderBy WHEN 'BillAmount DESC' THEN [SPMT_SupplierBill].[BillAmount] END DESC,
     CASE @OrderBy WHEN 'Currency' THEN [SPMT_SupplierBill].[Currency] END,
     CASE @OrderBy WHEN 'Currency DESC' THEN [SPMT_SupplierBill].[Currency] END DESC,
     CASE @OrderBy WHEN 'BillRemarks' THEN [SPMT_SupplierBill].[BillRemarks] END,
     CASE @OrderBy WHEN 'BillRemarks DESC' THEN [SPMT_SupplierBill].[BillRemarks] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [SPMT_SupplierBill].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [SPMT_SupplierBill].[Quantity] END DESC,
     CASE @OrderBy WHEN 'UOM' THEN [SPMT_SupplierBill].[UOM] END,
     CASE @OrderBy WHEN 'UOM DESC' THEN [SPMT_SupplierBill].[UOM] END DESC,
     CASE @OrderBy WHEN 'SupplierGSTIN' THEN [SPMT_SupplierBill].[SupplierGSTIN] END,
     CASE @OrderBy WHEN 'SupplierGSTIN DESC' THEN [SPMT_SupplierBill].[SupplierGSTIN] END DESC,
     CASE @OrderBy WHEN 'IsgecGSTIN' THEN [SPMT_SupplierBill].[IsgecGSTIN] END,
     CASE @OrderBy WHEN 'IsgecGSTIN DESC' THEN [SPMT_SupplierBill].[IsgecGSTIN] END DESC,
     CASE @OrderBy WHEN 'DocLine' THEN [SPMT_SupplierBill].[DocLine] END,
     CASE @OrderBy WHEN 'DocLine DESC' THEN [SPMT_SupplierBill].[DocLine] END DESC,
     CASE @OrderBy WHEN 'ShipToState' THEN [SPMT_SupplierBill].[ShipToState] END,
     CASE @OrderBy WHEN 'ShipToState DESC' THEN [SPMT_SupplierBill].[ShipToState] END DESC,
     CASE @OrderBy WHEN 'HSNSACCode' THEN [SPMT_SupplierBill].[HSNSACCode] END,
     CASE @OrderBy WHEN 'HSNSACCode DESC' THEN [SPMT_SupplierBill].[HSNSACCode] END DESC,
     CASE @OrderBy WHEN 'BillType' THEN [SPMT_SupplierBill].[BillType] END,
     CASE @OrderBy WHEN 'BillType DESC' THEN [SPMT_SupplierBill].[BillType] END DESC,
     CASE @OrderBy WHEN 'ConversionFactorINR' THEN [SPMT_SupplierBill].[ConversionFactorINR] END,
     CASE @OrderBy WHEN 'ConversionFactorINR DESC' THEN [SPMT_SupplierBill].[ConversionFactorINR] END DESC,
     CASE @OrderBy WHEN 'TaxAmount' THEN [SPMT_SupplierBill].[TaxAmount] END,
     CASE @OrderBy WHEN 'TaxAmount DESC' THEN [SPMT_SupplierBill].[TaxAmount] END DESC,
     CASE @OrderBy WHEN 'TotalGST' THEN [SPMT_SupplierBill].[TotalGST] END,
     CASE @OrderBy WHEN 'TotalGST DESC' THEN [SPMT_SupplierBill].[TotalGST] END DESC,
     CASE @OrderBy WHEN 'CessAmount' THEN [SPMT_SupplierBill].[CessAmount] END,
     CASE @OrderBy WHEN 'CessAmount DESC' THEN [SPMT_SupplierBill].[CessAmount] END DESC,
     CASE @OrderBy WHEN 'TotalAmount' THEN [SPMT_SupplierBill].[TotalAmount] END,
     CASE @OrderBy WHEN 'TotalAmount DESC' THEN [SPMT_SupplierBill].[TotalAmount] END DESC,
     CASE @OrderBy WHEN 'IRReceivedOn' THEN [SPMT_SupplierBill].[IRReceivedOn] END,
     CASE @OrderBy WHEN 'IRReceivedOn DESC' THEN [SPMT_SupplierBill].[IRReceivedOn] END DESC,
     CASE @OrderBy WHEN 'RemarksGST' THEN [SPMT_SupplierBill].[RemarksGST] END,
     CASE @OrderBy WHEN 'RemarksGST DESC' THEN [SPMT_SupplierBill].[RemarksGST] END DESC,
     CASE @OrderBy WHEN 'TotalAmountINR' THEN [SPMT_SupplierBill].[TotalAmountINR] END,
     CASE @OrderBy WHEN 'TotalAmountINR DESC' THEN [SPMT_SupplierBill].[TotalAmountINR] END DESC,
     CASE @OrderBy WHEN 'CessRate' THEN [SPMT_SupplierBill].[CessRate] END,
     CASE @OrderBy WHEN 'CessRate DESC' THEN [SPMT_SupplierBill].[CessRate] END DESC,
     CASE @OrderBy WHEN 'IGSTAmount' THEN [SPMT_SupplierBill].[IGSTAmount] END,
     CASE @OrderBy WHEN 'IGSTAmount DESC' THEN [SPMT_SupplierBill].[IGSTAmount] END DESC,
     CASE @OrderBy WHEN 'IGSTRate' THEN [SPMT_SupplierBill].[IGSTRate] END,
     CASE @OrderBy WHEN 'IGSTRate DESC' THEN [SPMT_SupplierBill].[IGSTRate] END DESC,
     CASE @OrderBy WHEN 'AssessableValue' THEN [SPMT_SupplierBill].[AssessableValue] END,
     CASE @OrderBy WHEN 'AssessableValue DESC' THEN [SPMT_SupplierBill].[AssessableValue] END DESC,
     CASE @OrderBy WHEN 'CGSTRate' THEN [SPMT_SupplierBill].[CGSTRate] END,
     CASE @OrderBy WHEN 'CGSTRate DESC' THEN [SPMT_SupplierBill].[CGSTRate] END DESC,
     CASE @OrderBy WHEN 'SGSTAmount' THEN [SPMT_SupplierBill].[SGSTAmount] END,
     CASE @OrderBy WHEN 'SGSTAmount DESC' THEN [SPMT_SupplierBill].[SGSTAmount] END DESC,
     CASE @OrderBy WHEN 'SGSTRate' THEN [SPMT_SupplierBill].[SGSTRate] END,
     CASE @OrderBy WHEN 'SGSTRate DESC' THEN [SPMT_SupplierBill].[SGSTRate] END DESC,
     CASE @OrderBy WHEN 'CGSTAmount' THEN [SPMT_SupplierBill].[CGSTAmount] END,
     CASE @OrderBy WHEN 'CGSTAmount DESC' THEN [SPMT_SupplierBill].[CGSTAmount] END DESC,
     CASE @OrderBy WHEN 'ReturnedByAC' THEN [SPMT_SupplierBill].[ReturnedByAC] END,
     CASE @OrderBy WHEN 'ReturnedByAC DESC' THEN [SPMT_SupplierBill].[ReturnedByAC] END DESC,
     CASE @OrderBy WHEN 'RemarksAC' THEN [SPMT_SupplierBill].[RemarksAC] END,
     CASE @OrderBy WHEN 'RemarksAC DESC' THEN [SPMT_SupplierBill].[RemarksAC] END DESC,
     CASE @OrderBy WHEN 'PassedAmount' THEN [SPMT_SupplierBill].[PassedAmount] END,
     CASE @OrderBy WHEN 'PassedAmount DESC' THEN [SPMT_SupplierBill].[PassedAmount] END DESC,
     CASE @OrderBy WHEN 'ReasonID' THEN [SPMT_SupplierBill].[ReasonID] END,
     CASE @OrderBy WHEN 'ReasonID DESC' THEN [SPMT_SupplierBill].[ReasonID] END DESC,
     CASE @OrderBy WHEN 'CostCenter' THEN [SPMT_SupplierBill].[CostCenter] END,
     CASE @OrderBy WHEN 'CostCenter DESC' THEN [SPMT_SupplierBill].[CostCenter] END DESC,
     CASE @OrderBy WHEN 'ConcernedHOD' THEN [SPMT_SupplierBill].[ConcernedHOD] END,
     CASE @OrderBy WHEN 'ConcernedHOD DESC' THEN [SPMT_SupplierBill].[ConcernedHOD] END DESC,
     CASE @OrderBy WHEN 'AdviceNo' THEN [SPMT_SupplierBill].[AdviceNo] END,
     CASE @OrderBy WHEN 'AdviceNo DESC' THEN [SPMT_SupplierBill].[AdviceNo] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [SPMT_SupplierBill].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [SPMT_SupplierBill].[Remarks] END DESC,
     CASE @OrderBy WHEN 'BillStatusID' THEN [SPMT_SupplierBill].[BillStatusID] END,
     CASE @OrderBy WHEN 'BillStatusID DESC' THEN [SPMT_SupplierBill].[BillStatusID] END DESC,
     CASE @OrderBy WHEN 'VendorID' THEN [SPMT_SupplierBill].[VendorID] END,
     CASE @OrderBy WHEN 'VendorID DESC' THEN [SPMT_SupplierBill].[VendorID] END DESC,
     CASE @OrderBy WHEN 'PurchaseType' THEN [SPMT_SupplierBill].[PurchaseType] END,
     CASE @OrderBy WHEN 'PurchaseType DESC' THEN [SPMT_SupplierBill].[PurchaseType] END DESC,
     CASE @OrderBy WHEN 'BillStatusDate' THEN [SPMT_SupplierBill].[BillStatusDate] END,
     CASE @OrderBy WHEN 'BillStatusDate DESC' THEN [SPMT_SupplierBill].[BillStatusDate] END DESC,
     CASE @OrderBy WHEN 'ApprovedAmount' THEN [SPMT_SupplierBill].[ApprovedAmount] END,
     CASE @OrderBy WHEN 'ApprovedAmount DESC' THEN [SPMT_SupplierBill].[ApprovedAmount] END DESC,
     CASE @OrderBy WHEN 'LogisticLinked' THEN [SPMT_SupplierBill].[LogisticLinked] END,
     CASE @OrderBy WHEN 'LogisticLinked DESC' THEN [SPMT_SupplierBill].[LogisticLinked] END DESC,
     CASE @OrderBy WHEN 'BillStatusUser' THEN [SPMT_SupplierBill].[BillStatusUser] END,
     CASE @OrderBy WHEN 'BillStatusUser DESC' THEN [SPMT_SupplierBill].[BillStatusUser] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [SPMT_SupplierBill].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [SPMT_SupplierBill].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'Discount' THEN [SPMT_SupplierBill].[Discount] END,
     CASE @OrderBy WHEN 'Discount DESC' THEN [SPMT_SupplierBill].[Discount] END DESC,
     CASE @OrderBy WHEN 'BasicValue' THEN [SPMT_SupplierBill].[BasicValue] END,
     CASE @OrderBy WHEN 'BasicValue DESC' THEN [SPMT_SupplierBill].[BasicValue] END DESC,
     CASE @OrderBy WHEN 'BaaNLedger' THEN [SPMT_SupplierBill].[BaaNLedger] END,
     CASE @OrderBy WHEN 'BaaNLedger DESC' THEN [SPMT_SupplierBill].[BaaNLedger] END DESC,
     CASE @OrderBy WHEN 'ServiceCharge' THEN [SPMT_SupplierBill].[ServiceCharge] END,
     CASE @OrderBy WHEN 'ServiceCharge DESC' THEN [SPMT_SupplierBill].[ServiceCharge] END DESC,
     CASE @OrderBy WHEN 'DocNo' THEN [SPMT_SupplierBill].[DocNo] END,
     CASE @OrderBy WHEN 'DocNo DESC' THEN [SPMT_SupplierBill].[DocNo] END DESC,
     CASE @OrderBy WHEN 'BatchNo' THEN [SPMT_SupplierBill].[BatchNo] END,
     CASE @OrderBy WHEN 'BatchNo DESC' THEN [SPMT_SupplierBill].[BatchNo] END DESC,
     CASE @OrderBy WHEN 'TaxRate' THEN [SPMT_SupplierBill].[TaxRate] END,
     CASE @OrderBy WHEN 'TaxRate DESC' THEN [SPMT_SupplierBill].[TaxRate] END DESC,
     CASE @OrderBy WHEN 'BaaNCompany' THEN [SPMT_SupplierBill].[BaaNCompany] END,
     CASE @OrderBy WHEN 'BaaNCompany DESC' THEN [SPMT_SupplierBill].[BaaNCompany] END DESC,
     CASE @OrderBy WHEN 'DepartmentID' THEN [SPMT_SupplierBill].[DepartmentID] END,
     CASE @OrderBy WHEN 'DepartmentID DESC' THEN [SPMT_SupplierBill].[DepartmentID] END DESC,
     CASE @OrderBy WHEN 'EmployeeID' THEN [SPMT_SupplierBill].[EmployeeID] END,
     CASE @OrderBy WHEN 'EmployeeID DESC' THEN [SPMT_SupplierBill].[EmployeeID] END DESC,
     CASE @OrderBy WHEN 'ElementID' THEN [SPMT_SupplierBill].[ElementID] END,
     CASE @OrderBy WHEN 'ElementID DESC' THEN [SPMT_SupplierBill].[ElementID] END DESC,
     CASE @OrderBy WHEN 'CostCenterID' THEN [SPMT_SupplierBill].[CostCenterID] END,
     CASE @OrderBy WHEN 'CostCenterID DESC' THEN [SPMT_SupplierBill].[CostCenterID] END DESC,
     CASE @OrderBy WHEN 'DocumentLine' THEN [SPMT_SupplierBill].[DocumentLine] END,
     CASE @OrderBy WHEN 'DocumentLine DESC' THEN [SPMT_SupplierBill].[DocumentLine] END DESC,
     CASE @OrderBy WHEN 'DocumentNo' THEN [SPMT_SupplierBill].[DocumentNo] END,
     CASE @OrderBy WHEN 'DocumentNo DESC' THEN [SPMT_SupplierBill].[DocumentNo] END DESC,
     CASE @OrderBy WHEN 'VoucherNo' THEN [SPMT_SupplierBill].[VoucherNo] END,
     CASE @OrderBy WHEN 'VoucherNo DESC' THEN [SPMT_SupplierBill].[VoucherNo] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Departments4_Description' THEN [HRM_Departments4].[Description] END,
     CASE @OrderBy WHEN 'HRM_Departments4_Description DESC' THEN [HRM_Departments4].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects5_Description' THEN [IDM_Projects5].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects5_Description DESC' THEN [IDM_Projects5].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_WBS6_Description' THEN [IDM_WBS6].[Description] END,
     CASE @OrderBy WHEN 'IDM_WBS6_Description DESC' THEN [IDM_WBS6].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_BillStatus7_Description' THEN [SPMT_BillStatus7].[Description] END,
     CASE @OrderBy WHEN 'SPMT_BillStatus7_Description DESC' THEN [SPMT_BillStatus7].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_BillTypes8_Description' THEN [SPMT_BillTypes8].[Description] END,
     CASE @OrderBy WHEN 'SPMT_BillTypes8_Description DESC' THEN [SPMT_BillTypes8].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_CostCenters9_Description' THEN [SPMT_CostCenters9].[Description] END,
     CASE @OrderBy WHEN 'SPMT_CostCenters9_Description DESC' THEN [SPMT_CostCenters9].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_ERPStates10_Description' THEN [SPMT_ERPStates10].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ERPStates10_Description DESC' THEN [SPMT_ERPStates10].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_ERPUnits11_Description' THEN [SPMT_ERPUnits11].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ERPUnits11_Description DESC' THEN [SPMT_ERPUnits11].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_HSNSACCodes12_HSNSACCode' THEN [SPMT_HSNSACCodes12].[HSNSACCode] END,
     CASE @OrderBy WHEN 'SPMT_HSNSACCodes12_HSNSACCode DESC' THEN [SPMT_HSNSACCodes12].[HSNSACCode] END DESC,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN13_Description' THEN [SPMT_IsgecGSTIN13].[Description] END,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN13_Description DESC' THEN [SPMT_IsgecGSTIN13].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_PaymentAdvice14_BPID' THEN [SPMT_PaymentAdvice14].[BPID] END,
     CASE @OrderBy WHEN 'SPMT_PaymentAdvice14_BPID DESC' THEN [SPMT_PaymentAdvice14].[BPID] END DESC,
     CASE @OrderBy WHEN 'SPMT_ReturnReason15_Description' THEN [SPMT_ReturnReason15].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ReturnReason15_Description DESC' THEN [SPMT_ReturnReason15].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_TranTypes16_Description' THEN [SPMT_TranTypes16].[Description] END,
     CASE @OrderBy WHEN 'SPMT_TranTypes16_Description DESC' THEN [SPMT_TranTypes16].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BPGSTIN17_Description' THEN [VR_BPGSTIN17].[Description] END,
     CASE @OrderBy WHEN 'VR_BPGSTIN17_Description DESC' THEN [VR_BPGSTIN17].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner18_BPName' THEN [VR_BusinessPartner18].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner18_BPName DESC' THEN [VR_BusinessPartner18].[BPName] END DESC 

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
