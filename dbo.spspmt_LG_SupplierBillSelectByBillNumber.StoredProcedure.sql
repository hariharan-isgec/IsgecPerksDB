USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmt_LG_SupplierBillSelectByBillNumber]
  @BillNumber NVarChar(50)  
  AS
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
     LOWER([SPMT_SupplierBill].[BillNumber]) = LOWER(@BillNumber)
GO
