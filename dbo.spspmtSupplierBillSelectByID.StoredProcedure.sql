USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtSupplierBillSelectByID]
  @LoginID NVarChar(8),
  @IRNo Int 
  AS
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
  [SPMT_SupplierBill].[IRNo] = @IRNo
GO
