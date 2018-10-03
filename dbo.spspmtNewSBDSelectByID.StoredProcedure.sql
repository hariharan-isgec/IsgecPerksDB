USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtNewSBDSelectByID]
  @LoginID NVarChar(8),
  @IRNo Int,
  @SerialNo Int 
  AS
  SELECT
    [SPMT_newSBD].* ,
    [HRM_Departments1].[Description] AS HRM_Departments1_Description,
    [HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
    [IDM_Projects3].[Description] AS IDM_Projects3_Description,
    [IDM_WBS4].[Description] AS IDM_WBS4_Description,
    [SPMT_BillTypes5].[Description] AS SPMT_BillTypes5_Description,
    [SPMT_CostCenters6].[Description] AS SPMT_CostCenters6_Description,
    [SPMT_ERPUnits7].[Description] AS SPMT_ERPUnits7_Description,
    [SPMT_HSNSACCodes8].[HSNSACCode] AS SPMT_HSNSACCodes8_HSNSACCode,
    [SPMT_newSBH9].[BillNumber] AS SPMT_newSBH9_BillNumber 
  FROM [SPMT_newSBD] 
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments1]
    ON [SPMT_newSBD].[DepartmentID] = [HRM_Departments1].[DepartmentID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [SPMT_newSBD].[EmployeeID] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects3]
    ON [SPMT_newSBD].[ProjectID] = [IDM_Projects3].[ProjectID]
  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS4]
    ON [SPMT_newSBD].[ElementID] = [IDM_WBS4].[WBSID]
  LEFT OUTER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes5]
    ON [SPMT_newSBD].[BillType] = [SPMT_BillTypes5].[BillType]
  LEFT OUTER JOIN [SPMT_CostCenters] AS [SPMT_CostCenters6]
    ON [SPMT_newSBD].[CostCenterID] = [SPMT_CostCenters6].[CostCenterID]
  LEFT OUTER JOIN [SPMT_ERPUnits] AS [SPMT_ERPUnits7]
    ON [SPMT_newSBD].[UOM] = [SPMT_ERPUnits7].[UOM]
  LEFT OUTER JOIN [SPMT_HSNSACCodes] AS [SPMT_HSNSACCodes8]
    ON [SPMT_newSBD].[BillType] = [SPMT_HSNSACCodes8].[BillType]
    AND [SPMT_newSBD].[HSNSACCode] = [SPMT_HSNSACCodes8].[HSNSACCode]
  INNER JOIN [SPMT_newSBH] AS [SPMT_newSBH9]
    ON [SPMT_newSBD].[IRNo] = [SPMT_newSBH9].[IRNo]
  WHERE
  [SPMT_newSBD].[IRNo] = @IRNo
  AND [SPMT_newSBD].[SerialNo] = @SerialNo
GO
