USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtNewSBHSelectByID]
  @LoginID NVarChar(8),
  @IRNo Int 
  AS
  SELECT
    [SPMT_newSBH].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [HRM_Departments2].[Description] AS HRM_Departments2_Description,
    [HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName,
    [IDM_Projects4].[Description] AS IDM_Projects4_Description,
    [IDM_WBS5].[Description] AS IDM_WBS5_Description,
    [SPMT_CostCenters6].[Description] AS SPMT_CostCenters6_Description,
    [SPMT_ERPStates7].[Description] AS SPMT_ERPStates7_Description,
    [SPMT_IsgecGSTIN8].[Description] AS SPMT_IsgecGSTIN8_Description,
    [SPMT_newPA9].[BPID] AS SPMT_newPA9_BPID,
    [SPMT_TranTypes10].[Description] AS SPMT_TranTypes10_Description,
    [VR_BPGSTIN11].[Description] AS VR_BPGSTIN11_Description,
    [VR_BusinessPartner12].[BPName] AS VR_BusinessPartner12_BPName 
  FROM [SPMT_newSBH] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [SPMT_newSBH].[CreatedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments2]
    ON [SPMT_newSBH].[DepartmentID] = [HRM_Departments2].[DepartmentID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [SPMT_newSBH].[EmployeeID] = [HRM_Employees3].[CardNo]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]
    ON [SPMT_newSBH].[ProjectID] = [IDM_Projects4].[ProjectID]
  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS5]
    ON [SPMT_newSBH].[ElementID] = [IDM_WBS5].[WBSID]
  LEFT OUTER JOIN [SPMT_CostCenters] AS [SPMT_CostCenters6]
    ON [SPMT_newSBH].[CostCenterID] = [SPMT_CostCenters6].[CostCenterID]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates7]
    ON [SPMT_newSBH].[ShipToState] = [SPMT_ERPStates7].[StateID]
  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN8]
    ON [SPMT_newSBH].[IsgecGSTIN] = [SPMT_IsgecGSTIN8].[GSTID]
  LEFT OUTER JOIN [SPMT_newPA] AS [SPMT_newPA9]
    ON [SPMT_newSBH].[AdviceNo] = [SPMT_newPA9].[AdviceNo]
  LEFT OUTER JOIN [SPMT_TranTypes] AS [SPMT_TranTypes10]
    ON [SPMT_newSBH].[TranTypeID] = [SPMT_TranTypes10].[TranTypeID]
  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN11]
    ON [SPMT_newSBH].[BPID] = [VR_BPGSTIN11].[BPID]
    AND [SPMT_newSBH].[SupplierGSTIN] = [VR_BPGSTIN11].[GSTIN]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner12]
    ON [SPMT_newSBH].[BPID] = [VR_BusinessPartner12].[BPID]
  WHERE
  [SPMT_newSBH].[IRNo] = @IRNo
GO
