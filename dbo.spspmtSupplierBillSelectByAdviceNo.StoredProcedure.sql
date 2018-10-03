USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtSupplierBillSelectByAdviceNo]
  @AdviceNo Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
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
  [SPMT_SupplierBill].[AdviceNo] = @AdviceNo
  ORDER BY
     CASE @OrderBy WHEN 'IRNo' THEN [SPMT_SupplierBill].[IRNo] END,
     CASE @OrderBy WHEN 'IRNo DESC' THEN [SPMT_SupplierBill].[IRNo] END DESC,
     CASE @OrderBy WHEN 'TranTypeID' THEN [SPMT_SupplierBill].[TranTypeID] END,
     CASE @OrderBy WHEN 'TranTypeID DESC' THEN [SPMT_SupplierBill].[TranTypeID] END DESC,
     CASE @OrderBy WHEN 'IRReceivedOn' THEN [SPMT_SupplierBill].[IRReceivedOn] END,
     CASE @OrderBy WHEN 'IRReceivedOn DESC' THEN [SPMT_SupplierBill].[IRReceivedOn] END DESC,
     CASE @OrderBy WHEN 'IsgecGSTIN' THEN [SPMT_SupplierBill].[IsgecGSTIN] END,
     CASE @OrderBy WHEN 'IsgecGSTIN DESC' THEN [SPMT_SupplierBill].[IsgecGSTIN] END DESC,
     CASE @OrderBy WHEN 'BPID' THEN [SPMT_SupplierBill].[BPID] END,
     CASE @OrderBy WHEN 'BPID DESC' THEN [SPMT_SupplierBill].[BPID] END DESC,
     CASE @OrderBy WHEN 'SupplierGSTIN' THEN [SPMT_SupplierBill].[SupplierGSTIN] END,
     CASE @OrderBy WHEN 'SupplierGSTIN DESC' THEN [SPMT_SupplierBill].[SupplierGSTIN] END DESC,
     CASE @OrderBy WHEN 'BillType' THEN [SPMT_SupplierBill].[BillType] END,
     CASE @OrderBy WHEN 'BillType DESC' THEN [SPMT_SupplierBill].[BillType] END DESC,
     CASE @OrderBy WHEN 'HSNSACCode' THEN [SPMT_SupplierBill].[HSNSACCode] END,
     CASE @OrderBy WHEN 'HSNSACCode DESC' THEN [SPMT_SupplierBill].[HSNSACCode] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [SPMT_SupplierBill].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [SPMT_SupplierBill].[Remarks] END DESC,
     CASE @OrderBy WHEN 'ShipToState' THEN [SPMT_SupplierBill].[ShipToState] END,
     CASE @OrderBy WHEN 'ShipToState DESC' THEN [SPMT_SupplierBill].[ShipToState] END DESC,
     CASE @OrderBy WHEN 'BillNumber' THEN [SPMT_SupplierBill].[BillNumber] END,
     CASE @OrderBy WHEN 'BillNumber DESC' THEN [SPMT_SupplierBill].[BillNumber] END DESC,
     CASE @OrderBy WHEN 'BillDate' THEN [SPMT_SupplierBill].[BillDate] END,
     CASE @OrderBy WHEN 'BillDate DESC' THEN [SPMT_SupplierBill].[BillDate] END DESC,
     CASE @OrderBy WHEN 'UOM' THEN [SPMT_SupplierBill].[UOM] END,
     CASE @OrderBy WHEN 'UOM DESC' THEN [SPMT_SupplierBill].[UOM] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [SPMT_SupplierBill].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [SPMT_SupplierBill].[Quantity] END DESC,
     CASE @OrderBy WHEN 'BasicValue' THEN [SPMT_SupplierBill].[BasicValue] END,
     CASE @OrderBy WHEN 'BasicValue DESC' THEN [SPMT_SupplierBill].[BasicValue] END DESC,
     CASE @OrderBy WHEN 'Discount' THEN [SPMT_SupplierBill].[Discount] END,
     CASE @OrderBy WHEN 'Discount DESC' THEN [SPMT_SupplierBill].[Discount] END DESC,
     CASE @OrderBy WHEN 'ServiceCharge' THEN [SPMT_SupplierBill].[ServiceCharge] END,
     CASE @OrderBy WHEN 'ServiceCharge DESC' THEN [SPMT_SupplierBill].[ServiceCharge] END DESC,
     CASE @OrderBy WHEN 'AssessableValue' THEN [SPMT_SupplierBill].[AssessableValue] END,
     CASE @OrderBy WHEN 'AssessableValue DESC' THEN [SPMT_SupplierBill].[AssessableValue] END DESC,
     CASE @OrderBy WHEN 'TaxRate' THEN [SPMT_SupplierBill].[TaxRate] END,
     CASE @OrderBy WHEN 'TaxRate DESC' THEN [SPMT_SupplierBill].[TaxRate] END DESC,
     CASE @OrderBy WHEN 'TaxAmount' THEN [SPMT_SupplierBill].[TaxAmount] END,
     CASE @OrderBy WHEN 'TaxAmount DESC' THEN [SPMT_SupplierBill].[TaxAmount] END DESC,
     CASE @OrderBy WHEN 'CessRate' THEN [SPMT_SupplierBill].[CessRate] END,
     CASE @OrderBy WHEN 'CessRate DESC' THEN [SPMT_SupplierBill].[CessRate] END DESC,
     CASE @OrderBy WHEN 'CessAmount' THEN [SPMT_SupplierBill].[CessAmount] END,
     CASE @OrderBy WHEN 'CessAmount DESC' THEN [SPMT_SupplierBill].[CessAmount] END DESC,
     CASE @OrderBy WHEN 'TotalGST' THEN [SPMT_SupplierBill].[TotalGST] END,
     CASE @OrderBy WHEN 'TotalGST DESC' THEN [SPMT_SupplierBill].[TotalGST] END DESC,
     CASE @OrderBy WHEN 'TotalAmount' THEN [SPMT_SupplierBill].[TotalAmount] END,
     CASE @OrderBy WHEN 'TotalAmount DESC' THEN [SPMT_SupplierBill].[TotalAmount] END DESC,
     CASE @OrderBy WHEN 'RemarksGST' THEN [SPMT_SupplierBill].[RemarksGST] END,
     CASE @OrderBy WHEN 'RemarksGST DESC' THEN [SPMT_SupplierBill].[RemarksGST] END DESC,
     CASE @OrderBy WHEN 'BillStatusID' THEN [SPMT_SupplierBill].[BillStatusID] END,
     CASE @OrderBy WHEN 'BillStatusID DESC' THEN [SPMT_SupplierBill].[BillStatusID] END DESC,
     CASE @OrderBy WHEN 'BillStatusDate' THEN [SPMT_SupplierBill].[BillStatusDate] END,
     CASE @OrderBy WHEN 'BillStatusDate DESC' THEN [SPMT_SupplierBill].[BillStatusDate] END DESC,
     CASE @OrderBy WHEN 'BillStatusUser' THEN [SPMT_SupplierBill].[BillStatusUser] END,
     CASE @OrderBy WHEN 'BillStatusUser DESC' THEN [SPMT_SupplierBill].[BillStatusUser] END DESC,
     CASE @OrderBy WHEN 'LogisticLinked' THEN [SPMT_SupplierBill].[LogisticLinked] END,
     CASE @OrderBy WHEN 'LogisticLinked DESC' THEN [SPMT_SupplierBill].[LogisticLinked] END DESC,
     CASE @OrderBy WHEN 'ApprovedAmount' THEN [SPMT_SupplierBill].[ApprovedAmount] END,
     CASE @OrderBy WHEN 'ApprovedAmount DESC' THEN [SPMT_SupplierBill].[ApprovedAmount] END DESC,
     CASE @OrderBy WHEN 'BillRemarks' THEN [SPMT_SupplierBill].[BillRemarks] END,
     CASE @OrderBy WHEN 'BillRemarks DESC' THEN [SPMT_SupplierBill].[BillRemarks] END DESC,
     CASE @OrderBy WHEN 'PassedAmount' THEN [SPMT_SupplierBill].[PassedAmount] END,
     CASE @OrderBy WHEN 'PassedAmount DESC' THEN [SPMT_SupplierBill].[PassedAmount] END DESC,
     CASE @OrderBy WHEN 'VendorID' THEN [SPMT_SupplierBill].[VendorID] END,
     CASE @OrderBy WHEN 'VendorID DESC' THEN [SPMT_SupplierBill].[VendorID] END DESC,
     CASE @OrderBy WHEN 'RemarksAC' THEN [SPMT_SupplierBill].[RemarksAC] END,
     CASE @OrderBy WHEN 'RemarksAC DESC' THEN [SPMT_SupplierBill].[RemarksAC] END DESC,
     CASE @OrderBy WHEN 'ReturnedByAC' THEN [SPMT_SupplierBill].[ReturnedByAC] END,
     CASE @OrderBy WHEN 'ReturnedByAC DESC' THEN [SPMT_SupplierBill].[ReturnedByAC] END DESC,
     CASE @OrderBy WHEN 'ReasonID' THEN [SPMT_SupplierBill].[ReasonID] END,
     CASE @OrderBy WHEN 'ReasonID DESC' THEN [SPMT_SupplierBill].[ReasonID] END DESC,
     CASE @OrderBy WHEN 'AdviceNo' THEN [SPMT_SupplierBill].[AdviceNo] END,
     CASE @OrderBy WHEN 'AdviceNo DESC' THEN [SPMT_SupplierBill].[AdviceNo] END DESC,
     CASE @OrderBy WHEN 'ConcernedHOD' THEN [SPMT_SupplierBill].[ConcernedHOD] END,
     CASE @OrderBy WHEN 'ConcernedHOD DESC' THEN [SPMT_SupplierBill].[ConcernedHOD] END DESC,
     CASE @OrderBy WHEN 'CostCenter' THEN [SPMT_SupplierBill].[CostCenter] END,
     CASE @OrderBy WHEN 'CostCenter DESC' THEN [SPMT_SupplierBill].[CostCenter] END DESC,
     CASE @OrderBy WHEN 'CostCenterID' THEN [SPMT_SupplierBill].[CostCenterID] END,
     CASE @OrderBy WHEN 'CostCenterID DESC' THEN [SPMT_SupplierBill].[CostCenterID] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [SPMT_SupplierBill].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [SPMT_SupplierBill].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'ElementID' THEN [SPMT_SupplierBill].[ElementID] END,
     CASE @OrderBy WHEN 'ElementID DESC' THEN [SPMT_SupplierBill].[ElementID] END DESC,
     CASE @OrderBy WHEN 'DepartmentID' THEN [SPMT_SupplierBill].[DepartmentID] END,
     CASE @OrderBy WHEN 'DepartmentID DESC' THEN [SPMT_SupplierBill].[DepartmentID] END DESC,
     CASE @OrderBy WHEN 'EmployeeID' THEN [SPMT_SupplierBill].[EmployeeID] END,
     CASE @OrderBy WHEN 'EmployeeID DESC' THEN [SPMT_SupplierBill].[EmployeeID] END DESC,
     CASE @OrderBy WHEN 'VoucherNo' THEN [SPMT_SupplierBill].[VoucherNo] END,
     CASE @OrderBy WHEN 'VoucherNo DESC' THEN [SPMT_SupplierBill].[VoucherNo] END DESC,
     CASE @OrderBy WHEN 'DocumentNo' THEN [SPMT_SupplierBill].[DocumentNo] END,
     CASE @OrderBy WHEN 'DocumentNo DESC' THEN [SPMT_SupplierBill].[DocumentNo] END DESC,
     CASE @OrderBy WHEN 'DocumentLine' THEN [SPMT_SupplierBill].[DocumentLine] END,
     CASE @OrderBy WHEN 'DocumentLine DESC' THEN [SPMT_SupplierBill].[DocumentLine] END DESC,
     CASE @OrderBy WHEN 'BaaNCompany' THEN [SPMT_SupplierBill].[BaaNCompany] END,
     CASE @OrderBy WHEN 'BaaNCompany DESC' THEN [SPMT_SupplierBill].[BaaNCompany] END DESC,
     CASE @OrderBy WHEN 'BaaNLedger' THEN [SPMT_SupplierBill].[BaaNLedger] END,
     CASE @OrderBy WHEN 'BaaNLedger DESC' THEN [SPMT_SupplierBill].[BaaNLedger] END DESC,
     CASE @OrderBy WHEN 'BillAmount' THEN [SPMT_SupplierBill].[BillAmount] END,
     CASE @OrderBy WHEN 'BillAmount DESC' THEN [SPMT_SupplierBill].[BillAmount] END DESC,
     CASE @OrderBy WHEN 'Currency' THEN [SPMT_SupplierBill].[Currency] END,
     CASE @OrderBy WHEN 'Currency DESC' THEN [SPMT_SupplierBill].[Currency] END DESC,
     CASE @OrderBy WHEN 'ConversionFactorINR' THEN [SPMT_SupplierBill].[ConversionFactorINR] END,
     CASE @OrderBy WHEN 'ConversionFactorINR DESC' THEN [SPMT_SupplierBill].[ConversionFactorINR] END DESC,
     CASE @OrderBy WHEN 'TotalAmountINR' THEN [SPMT_SupplierBill].[TotalAmountINR] END,
     CASE @OrderBy WHEN 'TotalAmountINR DESC' THEN [SPMT_SupplierBill].[TotalAmountINR] END DESC,
     CASE @OrderBy WHEN 'PurchaseType' THEN [SPMT_SupplierBill].[PurchaseType] END,
     CASE @OrderBy WHEN 'PurchaseType DESC' THEN [SPMT_SupplierBill].[PurchaseType] END DESC,
     CASE @OrderBy WHEN 'IGSTRate' THEN [SPMT_SupplierBill].[IGSTRate] END,
     CASE @OrderBy WHEN 'IGSTRate DESC' THEN [SPMT_SupplierBill].[IGSTRate] END DESC,
     CASE @OrderBy WHEN 'IGSTAmount' THEN [SPMT_SupplierBill].[IGSTAmount] END,
     CASE @OrderBy WHEN 'IGSTAmount DESC' THEN [SPMT_SupplierBill].[IGSTAmount] END DESC,
     CASE @OrderBy WHEN 'SGSTRate' THEN [SPMT_SupplierBill].[SGSTRate] END,
     CASE @OrderBy WHEN 'SGSTRate DESC' THEN [SPMT_SupplierBill].[SGSTRate] END DESC,
     CASE @OrderBy WHEN 'SGSTAmount' THEN [SPMT_SupplierBill].[SGSTAmount] END,
     CASE @OrderBy WHEN 'SGSTAmount DESC' THEN [SPMT_SupplierBill].[SGSTAmount] END DESC,
     CASE @OrderBy WHEN 'CGSTRate' THEN [SPMT_SupplierBill].[CGSTRate] END,
     CASE @OrderBy WHEN 'CGSTRate DESC' THEN [SPMT_SupplierBill].[CGSTRate] END DESC,
     CASE @OrderBy WHEN 'CGSTAmount' THEN [SPMT_SupplierBill].[CGSTAmount] END,
     CASE @OrderBy WHEN 'CGSTAmount DESC' THEN [SPMT_SupplierBill].[CGSTAmount] END DESC,
     CASE @OrderBy WHEN 'BatchNo' THEN [SPMT_SupplierBill].[BatchNo] END,
     CASE @OrderBy WHEN 'BatchNo DESC' THEN [SPMT_SupplierBill].[BatchNo] END DESC,
     CASE @OrderBy WHEN 'DocNo' THEN [SPMT_SupplierBill].[DocNo] END,
     CASE @OrderBy WHEN 'DocNo DESC' THEN [SPMT_SupplierBill].[DocNo] END DESC,
     CASE @OrderBy WHEN 'DocLine' THEN [SPMT_SupplierBill].[DocLine] END,
     CASE @OrderBy WHEN 'DocLine DESC' THEN [SPMT_SupplierBill].[DocLine] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'SPMT_BillStatus2_Description' THEN [SPMT_BillStatus2].[Description] END,
     CASE @OrderBy WHEN 'SPMT_BillStatus2_Description DESC' THEN [SPMT_BillStatus2].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_TranTypes3_Description' THEN [SPMT_TranTypes3].[Description] END,
     CASE @OrderBy WHEN 'SPMT_TranTypes3_Description DESC' THEN [SPMT_TranTypes3].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_Vendors4_Description' THEN [SPMT_Vendors4].[Description] END,
     CASE @OrderBy WHEN 'SPMT_Vendors4_Description DESC' THEN [SPMT_Vendors4].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_ReturnReason6_Description' THEN [SPMT_ReturnReason6].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ReturnReason6_Description DESC' THEN [SPMT_ReturnReason6].[Description] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users7_UserFullName' THEN [aspnet_Users7].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users7_UserFullName DESC' THEN [aspnet_Users7].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users8_UserFullName' THEN [aspnet_Users8].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users8_UserFullName DESC' THEN [aspnet_Users8].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Departments9_Description' THEN [HRM_Departments9].[Description] END,
     CASE @OrderBy WHEN 'HRM_Departments9_Description DESC' THEN [HRM_Departments9].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects10_Description' THEN [IDM_Projects10].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects10_Description DESC' THEN [IDM_Projects10].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_WBS11_Description' THEN [IDM_WBS11].[Description] END,
     CASE @OrderBy WHEN 'IDM_WBS11_Description DESC' THEN [IDM_WBS11].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_CostCenters13_Description' THEN [SPMT_CostCenters13].[Description] END,
     CASE @OrderBy WHEN 'SPMT_CostCenters13_Description DESC' THEN [SPMT_CostCenters13].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_BillTypes14_Description' THEN [SPMT_BillTypes14].[Description] END,
     CASE @OrderBy WHEN 'SPMT_BillTypes14_Description DESC' THEN [SPMT_BillTypes14].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_ERPStates15_Description' THEN [SPMT_ERPStates15].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ERPStates15_Description DESC' THEN [SPMT_ERPStates15].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_ERPUnits16_Description' THEN [SPMT_ERPUnits16].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ERPUnits16_Description DESC' THEN [SPMT_ERPUnits16].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_HSNSACCodes17_HSNSACCode' THEN [SPMT_HSNSACCodes17].[HSNSACCode] END,
     CASE @OrderBy WHEN 'SPMT_HSNSACCodes17_HSNSACCode DESC' THEN [SPMT_HSNSACCodes17].[HSNSACCode] END DESC,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN18_Description' THEN [SPMT_IsgecGSTIN18].[Description] END,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN18_Description DESC' THEN [SPMT_IsgecGSTIN18].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BPGSTIN19_Description' THEN [VR_BPGSTIN19].[Description] END,
     CASE @OrderBy WHEN 'VR_BPGSTIN19_Description DESC' THEN [VR_BPGSTIN19].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner20_BPName' THEN [VR_BusinessPartner20].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner20_BPName DESC' THEN [VR_BusinessPartner20].[BPName] END DESC 
  SET @RecordCount = @@RowCount
GO
