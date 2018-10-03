USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtNewSBHSelectListSearch]
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
  SELECT [SPMT_newSBH].[IRNo] FROM [SPMT_newSBH]
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
   ( 
         STR(ISNULL([SPMT_newSBH].[IRNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBH].[TranTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBH].[SupplierName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBH].[BillNumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBH].[CreatedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBH].[TotalBillAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBH].[AdviceNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBH].[IsgecGSTIN], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBH].[EmployeeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBH].[BillRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBH].[PurchaseType],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBH].[UploadBatchNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBH].[CostCenterID],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBH].[SupplierGSTIN], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBH].[SupplierGSTINNumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBH].[ShipToState],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBH].[BPID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBH].[DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBH].[ElementID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBH].[ProjectID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'IRNo' THEN [SPMT_newSBH].[IRNo] END,
     CASE @OrderBy WHEN 'IRNo DESC' THEN [SPMT_newSBH].[IRNo] END DESC,
     CASE @OrderBy WHEN 'PurchaseType' THEN [SPMT_newSBH].[PurchaseType] END,
     CASE @OrderBy WHEN 'PurchaseType DESC' THEN [SPMT_newSBH].[PurchaseType] END DESC,
     CASE @OrderBy WHEN 'TranTypeID' THEN [SPMT_newSBH].[TranTypeID] END,
     CASE @OrderBy WHEN 'TranTypeID DESC' THEN [SPMT_newSBH].[TranTypeID] END DESC,
     CASE @OrderBy WHEN 'IsgecGSTIN' THEN [SPMT_newSBH].[IsgecGSTIN] END,
     CASE @OrderBy WHEN 'IsgecGSTIN DESC' THEN [SPMT_newSBH].[IsgecGSTIN] END DESC,
     CASE @OrderBy WHEN 'BPID' THEN [SPMT_newSBH].[BPID] END,
     CASE @OrderBy WHEN 'BPID DESC' THEN [SPMT_newSBH].[BPID] END DESC,
     CASE @OrderBy WHEN 'SupplierGSTIN' THEN [SPMT_newSBH].[SupplierGSTIN] END,
     CASE @OrderBy WHEN 'SupplierGSTIN DESC' THEN [SPMT_newSBH].[SupplierGSTIN] END DESC,
     CASE @OrderBy WHEN 'SupplierName' THEN [SPMT_newSBH].[SupplierName] END,
     CASE @OrderBy WHEN 'SupplierName DESC' THEN [SPMT_newSBH].[SupplierName] END DESC,
     CASE @OrderBy WHEN 'SupplierGSTINNumber' THEN [SPMT_newSBH].[SupplierGSTINNumber] END,
     CASE @OrderBy WHEN 'SupplierGSTINNumber DESC' THEN [SPMT_newSBH].[SupplierGSTINNumber] END DESC,
     CASE @OrderBy WHEN 'ShipToState' THEN [SPMT_newSBH].[ShipToState] END,
     CASE @OrderBy WHEN 'ShipToState DESC' THEN [SPMT_newSBH].[ShipToState] END DESC,
     CASE @OrderBy WHEN 'BillNumber' THEN [SPMT_newSBH].[BillNumber] END,
     CASE @OrderBy WHEN 'BillNumber DESC' THEN [SPMT_newSBH].[BillNumber] END DESC,
     CASE @OrderBy WHEN 'BillDate' THEN [SPMT_newSBH].[BillDate] END,
     CASE @OrderBy WHEN 'BillDate DESC' THEN [SPMT_newSBH].[BillDate] END DESC,
     CASE @OrderBy WHEN 'BillRemarks' THEN [SPMT_newSBH].[BillRemarks] END,
     CASE @OrderBy WHEN 'BillRemarks DESC' THEN [SPMT_newSBH].[BillRemarks] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [SPMT_newSBH].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [SPMT_newSBH].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'ElementID' THEN [SPMT_newSBH].[ElementID] END,
     CASE @OrderBy WHEN 'ElementID DESC' THEN [SPMT_newSBH].[ElementID] END DESC,
     CASE @OrderBy WHEN 'DepartmentID' THEN [SPMT_newSBH].[DepartmentID] END,
     CASE @OrderBy WHEN 'DepartmentID DESC' THEN [SPMT_newSBH].[DepartmentID] END DESC,
     CASE @OrderBy WHEN 'CostCenterID' THEN [SPMT_newSBH].[CostCenterID] END,
     CASE @OrderBy WHEN 'CostCenterID DESC' THEN [SPMT_newSBH].[CostCenterID] END DESC,
     CASE @OrderBy WHEN 'EmployeeID' THEN [SPMT_newSBH].[EmployeeID] END,
     CASE @OrderBy WHEN 'EmployeeID DESC' THEN [SPMT_newSBH].[EmployeeID] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [SPMT_newSBH].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [SPMT_newSBH].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [SPMT_newSBH].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [SPMT_newSBH].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'IRReceivedOn' THEN [SPMT_newSBH].[IRReceivedOn] END,
     CASE @OrderBy WHEN 'IRReceivedOn DESC' THEN [SPMT_newSBH].[IRReceivedOn] END DESC,
     CASE @OrderBy WHEN 'UploadBatchNo' THEN [SPMT_newSBH].[UploadBatchNo] END,
     CASE @OrderBy WHEN 'UploadBatchNo DESC' THEN [SPMT_newSBH].[UploadBatchNo] END DESC,
     CASE @OrderBy WHEN 'TotalBillAmount' THEN [SPMT_newSBH].[TotalBillAmount] END,
     CASE @OrderBy WHEN 'TotalBillAmount DESC' THEN [SPMT_newSBH].[TotalBillAmount] END DESC,
     CASE @OrderBy WHEN 'AdviceNo' THEN [SPMT_newSBH].[AdviceNo] END,
     CASE @OrderBy WHEN 'AdviceNo DESC' THEN [SPMT_newSBH].[AdviceNo] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Departments2_Description' THEN [HRM_Departments2].[Description] END,
     CASE @OrderBy WHEN 'HRM_Departments2_Description DESC' THEN [HRM_Departments2].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees3_EmployeeName' THEN [HRM_Employees3].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees3_EmployeeName DESC' THEN [HRM_Employees3].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects4_Description' THEN [IDM_Projects4].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects4_Description DESC' THEN [IDM_Projects4].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_WBS5_Description' THEN [IDM_WBS5].[Description] END,
     CASE @OrderBy WHEN 'IDM_WBS5_Description DESC' THEN [IDM_WBS5].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_CostCenters6_Description' THEN [SPMT_CostCenters6].[Description] END,
     CASE @OrderBy WHEN 'SPMT_CostCenters6_Description DESC' THEN [SPMT_CostCenters6].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_ERPStates7_Description' THEN [SPMT_ERPStates7].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ERPStates7_Description DESC' THEN [SPMT_ERPStates7].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN8_Description' THEN [SPMT_IsgecGSTIN8].[Description] END,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN8_Description DESC' THEN [SPMT_IsgecGSTIN8].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_newPA9_BPID' THEN [SPMT_newPA9].[BPID] END,
     CASE @OrderBy WHEN 'SPMT_newPA9_BPID DESC' THEN [SPMT_newPA9].[BPID] END DESC,
     CASE @OrderBy WHEN 'SPMT_TranTypes10_Description' THEN [SPMT_TranTypes10].[Description] END,
     CASE @OrderBy WHEN 'SPMT_TranTypes10_Description DESC' THEN [SPMT_TranTypes10].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BPGSTIN11_Description' THEN [VR_BPGSTIN11].[Description] END,
     CASE @OrderBy WHEN 'VR_BPGSTIN11_Description DESC' THEN [VR_BPGSTIN11].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner12_BPName' THEN [VR_BusinessPartner12].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner12_BPName DESC' THEN [VR_BusinessPartner12].[BPName] END DESC 

    SET @RecordCount = @@RowCount

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
      INNER JOIN #PageIndex
          ON [SPMT_newSBH].[IRNo] = #PageIndex.IRNo
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
