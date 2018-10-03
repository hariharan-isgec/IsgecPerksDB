USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtNewSBHSelectListFilteres]
  @Filter_TranTypeID NVarChar(3),
  @Filter_IsgecGSTIN Int,
  @Filter_PurchaseType NVarChar(50),
  @Filter_BPID NVarChar(9),
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
  SET @LGSQL = @LGSQL + '[SPMT_newSBH].[IRNo]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_newSBH] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBH].[CreatedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments2]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBH].[DepartmentID] = [HRM_Departments2].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBH].[EmployeeID] = [HRM_Employees3].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBH].[ProjectID] = [IDM_Projects4].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS5]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBH].[ElementID] = [IDM_WBS5].[WBSID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_CostCenters] AS [SPMT_CostCenters6]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBH].[CostCenterID] = [SPMT_CostCenters6].[CostCenterID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates7]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBH].[ShipToState] = [SPMT_ERPStates7].[StateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN8]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBH].[IsgecGSTIN] = [SPMT_IsgecGSTIN8].[GSTID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_newPA] AS [SPMT_newPA9]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBH].[AdviceNo] = [SPMT_newPA9].[AdviceNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_TranTypes] AS [SPMT_TranTypes10]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBH].[TranTypeID] = [SPMT_TranTypes10].[TranTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN11]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBH].[BPID] = [VR_BPGSTIN11].[BPID]'
  SET @LGSQL = @LGSQL + '    AND [SPMT_newSBH].[SupplierGSTIN] = [VR_BPGSTIN11].[GSTIN]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner12]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBH].[BPID] = [VR_BusinessPartner12].[BPID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_TranTypeID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_newSBH].[TranTypeID] = ''' + @Filter_TranTypeID + ''''
  IF (@Filter_IsgecGSTIN > 0) 
    SET @LGSQL = @LGSQL + ' AND [SPMT_newSBH].[IsgecGSTIN] = ' + STR(@Filter_IsgecGSTIN)
  IF (@Filter_PurchaseType > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_newSBH].[PurchaseType] = ''' + @Filter_PurchaseType + ''''
  IF (@Filter_BPID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_newSBH].[BPID] = ''' + @Filter_BPID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'IRNo' THEN '[SPMT_newSBH].[IRNo]'
                        WHEN 'IRNo DESC' THEN '[SPMT_newSBH].[IRNo] DESC'
                        WHEN 'PurchaseType' THEN '[SPMT_newSBH].[PurchaseType]'
                        WHEN 'PurchaseType DESC' THEN '[SPMT_newSBH].[PurchaseType] DESC'
                        WHEN 'TranTypeID' THEN '[SPMT_newSBH].[TranTypeID]'
                        WHEN 'TranTypeID DESC' THEN '[SPMT_newSBH].[TranTypeID] DESC'
                        WHEN 'IsgecGSTIN' THEN '[SPMT_newSBH].[IsgecGSTIN]'
                        WHEN 'IsgecGSTIN DESC' THEN '[SPMT_newSBH].[IsgecGSTIN] DESC'
                        WHEN 'BPID' THEN '[SPMT_newSBH].[BPID]'
                        WHEN 'BPID DESC' THEN '[SPMT_newSBH].[BPID] DESC'
                        WHEN 'SupplierGSTIN' THEN '[SPMT_newSBH].[SupplierGSTIN]'
                        WHEN 'SupplierGSTIN DESC' THEN '[SPMT_newSBH].[SupplierGSTIN] DESC'
                        WHEN 'SupplierName' THEN '[SPMT_newSBH].[SupplierName]'
                        WHEN 'SupplierName DESC' THEN '[SPMT_newSBH].[SupplierName] DESC'
                        WHEN 'SupplierGSTINNumber' THEN '[SPMT_newSBH].[SupplierGSTINNumber]'
                        WHEN 'SupplierGSTINNumber DESC' THEN '[SPMT_newSBH].[SupplierGSTINNumber] DESC'
                        WHEN 'ShipToState' THEN '[SPMT_newSBH].[ShipToState]'
                        WHEN 'ShipToState DESC' THEN '[SPMT_newSBH].[ShipToState] DESC'
                        WHEN 'BillNumber' THEN '[SPMT_newSBH].[BillNumber]'
                        WHEN 'BillNumber DESC' THEN '[SPMT_newSBH].[BillNumber] DESC'
                        WHEN 'BillDate' THEN '[SPMT_newSBH].[BillDate]'
                        WHEN 'BillDate DESC' THEN '[SPMT_newSBH].[BillDate] DESC'
                        WHEN 'BillRemarks' THEN '[SPMT_newSBH].[BillRemarks]'
                        WHEN 'BillRemarks DESC' THEN '[SPMT_newSBH].[BillRemarks] DESC'
                        WHEN 'ProjectID' THEN '[SPMT_newSBH].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[SPMT_newSBH].[ProjectID] DESC'
                        WHEN 'ElementID' THEN '[SPMT_newSBH].[ElementID]'
                        WHEN 'ElementID DESC' THEN '[SPMT_newSBH].[ElementID] DESC'
                        WHEN 'DepartmentID' THEN '[SPMT_newSBH].[DepartmentID]'
                        WHEN 'DepartmentID DESC' THEN '[SPMT_newSBH].[DepartmentID] DESC'
                        WHEN 'CostCenterID' THEN '[SPMT_newSBH].[CostCenterID]'
                        WHEN 'CostCenterID DESC' THEN '[SPMT_newSBH].[CostCenterID] DESC'
                        WHEN 'EmployeeID' THEN '[SPMT_newSBH].[EmployeeID]'
                        WHEN 'EmployeeID DESC' THEN '[SPMT_newSBH].[EmployeeID] DESC'
                        WHEN 'CreatedOn' THEN '[SPMT_newSBH].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[SPMT_newSBH].[CreatedOn] DESC'
                        WHEN 'CreatedBy' THEN '[SPMT_newSBH].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[SPMT_newSBH].[CreatedBy] DESC'
                        WHEN 'IRReceivedOn' THEN '[SPMT_newSBH].[IRReceivedOn]'
                        WHEN 'IRReceivedOn DESC' THEN '[SPMT_newSBH].[IRReceivedOn] DESC'
                        WHEN 'UploadBatchNo' THEN '[SPMT_newSBH].[UploadBatchNo]'
                        WHEN 'UploadBatchNo DESC' THEN '[SPMT_newSBH].[UploadBatchNo] DESC'
                        WHEN 'TotalBillAmount' THEN '[SPMT_newSBH].[TotalBillAmount]'
                        WHEN 'TotalBillAmount DESC' THEN '[SPMT_newSBH].[TotalBillAmount] DESC'
                        WHEN 'AdviceNo' THEN '[SPMT_newSBH].[AdviceNo]'
                        WHEN 'AdviceNo DESC' THEN '[SPMT_newSBH].[AdviceNo] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'HRM_Departments2_Description' THEN '[HRM_Departments2].[Description]'
                        WHEN 'HRM_Departments2_Description DESC' THEN '[HRM_Departments2].[Description] DESC'
                        WHEN 'HRM_Employees3_EmployeeName' THEN '[HRM_Employees3].[EmployeeName]'
                        WHEN 'HRM_Employees3_EmployeeName DESC' THEN '[HRM_Employees3].[EmployeeName] DESC'
                        WHEN 'IDM_Projects4_Description' THEN '[IDM_Projects4].[Description]'
                        WHEN 'IDM_Projects4_Description DESC' THEN '[IDM_Projects4].[Description] DESC'
                        WHEN 'IDM_WBS5_Description' THEN '[IDM_WBS5].[Description]'
                        WHEN 'IDM_WBS5_Description DESC' THEN '[IDM_WBS5].[Description] DESC'
                        WHEN 'SPMT_CostCenters6_Description' THEN '[SPMT_CostCenters6].[Description]'
                        WHEN 'SPMT_CostCenters6_Description DESC' THEN '[SPMT_CostCenters6].[Description] DESC'
                        WHEN 'SPMT_ERPStates7_Description' THEN '[SPMT_ERPStates7].[Description]'
                        WHEN 'SPMT_ERPStates7_Description DESC' THEN '[SPMT_ERPStates7].[Description] DESC'
                        WHEN 'SPMT_IsgecGSTIN8_Description' THEN '[SPMT_IsgecGSTIN8].[Description]'
                        WHEN 'SPMT_IsgecGSTIN8_Description DESC' THEN '[SPMT_IsgecGSTIN8].[Description] DESC'
                        WHEN 'SPMT_newPA9_BPID' THEN '[SPMT_newPA9].[BPID]'
                        WHEN 'SPMT_newPA9_BPID DESC' THEN '[SPMT_newPA9].[BPID] DESC'
                        WHEN 'SPMT_TranTypes10_Description' THEN '[SPMT_TranTypes10].[Description]'
                        WHEN 'SPMT_TranTypes10_Description DESC' THEN '[SPMT_TranTypes10].[Description] DESC'
                        WHEN 'VR_BPGSTIN11_Description' THEN '[VR_BPGSTIN11].[Description]'
                        WHEN 'VR_BPGSTIN11_Description DESC' THEN '[VR_BPGSTIN11].[Description] DESC'
                        WHEN 'VR_BusinessPartner12_BPName' THEN '[VR_BusinessPartner12].[BPName]'
                        WHEN 'VR_BusinessPartner12_BPName DESC' THEN '[VR_BusinessPartner12].[BPName] DESC'
                        ELSE '[SPMT_newSBH].[IRNo]'
                    END
  EXEC (@LGSQL)

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
