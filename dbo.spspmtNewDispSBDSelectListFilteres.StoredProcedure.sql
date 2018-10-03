USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtNewDispSBDSelectListFilteres]
  @Filter_IRNo Int,
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
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'IRNo'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_newSBD].[IRNo]'
  SET @LGSQL = @LGSQL + ', [SPMT_newSBD].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_newSBD] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBD].[DepartmentID] = [HRM_Departments1].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBD].[EmployeeID] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects3]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBD].[ProjectID] = [IDM_Projects3].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS4]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBD].[ElementID] = [IDM_WBS4].[WBSID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes5]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBD].[BillType] = [SPMT_BillTypes5].[BillType]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_CostCenters] AS [SPMT_CostCenters6]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBD].[CostCenterID] = [SPMT_CostCenters6].[CostCenterID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ERPUnits] AS [SPMT_ERPUnits7]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBD].[UOM] = [SPMT_ERPUnits7].[UOM]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_HSNSACCodes] AS [SPMT_HSNSACCodes8]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBD].[BillType] = [SPMT_HSNSACCodes8].[BillType]'
  SET @LGSQL = @LGSQL + '    AND [SPMT_newSBD].[HSNSACCode] = [SPMT_HSNSACCodes8].[HSNSACCode]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_newSBH] AS [SPMT_newSBH9]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newSBD].[IRNo] = [SPMT_newSBH9].[IRNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_IRNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [SPMT_newSBD].[IRNo] = ' + STR(@Filter_IRNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'IRNo' THEN '[SPMT_newSBD].[IRNo]'
                        WHEN 'IRNo DESC' THEN '[SPMT_newSBD].[IRNo] DESC'
                        WHEN 'SerialNo' THEN '[SPMT_newSBD].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[SPMT_newSBD].[SerialNo] DESC'
                        WHEN 'ItemDescription' THEN '[SPMT_newSBD].[ItemDescription]'
                        WHEN 'ItemDescription DESC' THEN '[SPMT_newSBD].[ItemDescription] DESC'
                        WHEN 'BillType' THEN '[SPMT_newSBD].[BillType]'
                        WHEN 'BillType DESC' THEN '[SPMT_newSBD].[BillType] DESC'
                        WHEN 'HSNSACCode' THEN '[SPMT_newSBD].[HSNSACCode]'
                        WHEN 'HSNSACCode DESC' THEN '[SPMT_newSBD].[HSNSACCode] DESC'
                        WHEN 'UOM' THEN '[SPMT_newSBD].[UOM]'
                        WHEN 'UOM DESC' THEN '[SPMT_newSBD].[UOM] DESC'
                        WHEN 'Quantity' THEN '[SPMT_newSBD].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[SPMT_newSBD].[Quantity] DESC'
                        WHEN 'Currency' THEN '[SPMT_newSBD].[Currency]'
                        WHEN 'Currency DESC' THEN '[SPMT_newSBD].[Currency] DESC'
                        WHEN 'ConversionFactorINR' THEN '[SPMT_newSBD].[ConversionFactorINR]'
                        WHEN 'ConversionFactorINR DESC' THEN '[SPMT_newSBD].[ConversionFactorINR] DESC'
                        WHEN 'AssessableValue' THEN '[SPMT_newSBD].[AssessableValue]'
                        WHEN 'AssessableValue DESC' THEN '[SPMT_newSBD].[AssessableValue] DESC'
                        WHEN 'IGSTRate' THEN '[SPMT_newSBD].[IGSTRate]'
                        WHEN 'IGSTRate DESC' THEN '[SPMT_newSBD].[IGSTRate] DESC'
                        WHEN 'IGSTAmount' THEN '[SPMT_newSBD].[IGSTAmount]'
                        WHEN 'IGSTAmount DESC' THEN '[SPMT_newSBD].[IGSTAmount] DESC'
                        WHEN 'SGSTRate' THEN '[SPMT_newSBD].[SGSTRate]'
                        WHEN 'SGSTRate DESC' THEN '[SPMT_newSBD].[SGSTRate] DESC'
                        WHEN 'SGSTAmount' THEN '[SPMT_newSBD].[SGSTAmount]'
                        WHEN 'SGSTAmount DESC' THEN '[SPMT_newSBD].[SGSTAmount] DESC'
                        WHEN 'CGSTRate' THEN '[SPMT_newSBD].[CGSTRate]'
                        WHEN 'CGSTRate DESC' THEN '[SPMT_newSBD].[CGSTRate] DESC'
                        WHEN 'CGSTAmount' THEN '[SPMT_newSBD].[CGSTAmount]'
                        WHEN 'CGSTAmount DESC' THEN '[SPMT_newSBD].[CGSTAmount] DESC'
                        WHEN 'CessRate' THEN '[SPMT_newSBD].[CessRate]'
                        WHEN 'CessRate DESC' THEN '[SPMT_newSBD].[CessRate] DESC'
                        WHEN 'CessAmount' THEN '[SPMT_newSBD].[CessAmount]'
                        WHEN 'CessAmount DESC' THEN '[SPMT_newSBD].[CessAmount] DESC'
                        WHEN 'TotalGST' THEN '[SPMT_newSBD].[TotalGST]'
                        WHEN 'TotalGST DESC' THEN '[SPMT_newSBD].[TotalGST] DESC'
                        WHEN 'TotalAmount' THEN '[SPMT_newSBD].[TotalAmount]'
                        WHEN 'TotalAmount DESC' THEN '[SPMT_newSBD].[TotalAmount] DESC'
                        WHEN 'TotalGSTINR' THEN '[SPMT_newSBD].[TotalGSTINR]'
                        WHEN 'TotalGSTINR DESC' THEN '[SPMT_newSBD].[TotalGSTINR] DESC'
                        WHEN 'TotalAmountINR' THEN '[SPMT_newSBD].[TotalAmountINR]'
                        WHEN 'TotalAmountINR DESC' THEN '[SPMT_newSBD].[TotalAmountINR] DESC'
                        WHEN 'DepartmentID' THEN '[SPMT_newSBD].[DepartmentID]'
                        WHEN 'DepartmentID DESC' THEN '[SPMT_newSBD].[DepartmentID] DESC'
                        WHEN 'ProjectID' THEN '[SPMT_newSBD].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[SPMT_newSBD].[ProjectID] DESC'
                        WHEN 'CostCenterID' THEN '[SPMT_newSBD].[CostCenterID]'
                        WHEN 'CostCenterID DESC' THEN '[SPMT_newSBD].[CostCenterID] DESC'
                        WHEN 'BasicValue' THEN '[SPMT_newSBD].[BasicValue]'
                        WHEN 'BasicValue DESC' THEN '[SPMT_newSBD].[BasicValue] DESC'
                        WHEN 'ElementID' THEN '[SPMT_newSBD].[ElementID]'
                        WHEN 'ElementID DESC' THEN '[SPMT_newSBD].[ElementID] DESC'
                        WHEN 'ServiceCharge' THEN '[SPMT_newSBD].[ServiceCharge]'
                        WHEN 'ServiceCharge DESC' THEN '[SPMT_newSBD].[ServiceCharge] DESC'
                        WHEN 'Discount' THEN '[SPMT_newSBD].[Discount]'
                        WHEN 'Discount DESC' THEN '[SPMT_newSBD].[Discount] DESC'
                        WHEN 'UploadBatchNo' THEN '[SPMT_newSBD].[UploadBatchNo]'
                        WHEN 'UploadBatchNo DESC' THEN '[SPMT_newSBD].[UploadBatchNo] DESC'
                        WHEN 'EmployeeID' THEN '[SPMT_newSBD].[EmployeeID]'
                        WHEN 'EmployeeID DESC' THEN '[SPMT_newSBD].[EmployeeID] DESC'
                        WHEN 'HRM_Departments1_Description' THEN '[HRM_Departments1].[Description]'
                        WHEN 'HRM_Departments1_Description DESC' THEN '[HRM_Departments1].[Description] DESC'
                        WHEN 'HRM_Employees2_EmployeeName' THEN '[HRM_Employees2].[EmployeeName]'
                        WHEN 'HRM_Employees2_EmployeeName DESC' THEN '[HRM_Employees2].[EmployeeName] DESC'
                        WHEN 'IDM_Projects3_Description' THEN '[IDM_Projects3].[Description]'
                        WHEN 'IDM_Projects3_Description DESC' THEN '[IDM_Projects3].[Description] DESC'
                        WHEN 'IDM_WBS4_Description' THEN '[IDM_WBS4].[Description]'
                        WHEN 'IDM_WBS4_Description DESC' THEN '[IDM_WBS4].[Description] DESC'
                        WHEN 'SPMT_BillTypes5_Description' THEN '[SPMT_BillTypes5].[Description]'
                        WHEN 'SPMT_BillTypes5_Description DESC' THEN '[SPMT_BillTypes5].[Description] DESC'
                        WHEN 'SPMT_CostCenters6_Description' THEN '[SPMT_CostCenters6].[Description]'
                        WHEN 'SPMT_CostCenters6_Description DESC' THEN '[SPMT_CostCenters6].[Description] DESC'
                        WHEN 'SPMT_ERPUnits7_Description' THEN '[SPMT_ERPUnits7].[Description]'
                        WHEN 'SPMT_ERPUnits7_Description DESC' THEN '[SPMT_ERPUnits7].[Description] DESC'
                        WHEN 'SPMT_HSNSACCodes8_HSNSACCode' THEN '[SPMT_HSNSACCodes8].[HSNSACCode]'
                        WHEN 'SPMT_HSNSACCodes8_HSNSACCode DESC' THEN '[SPMT_HSNSACCodes8].[HSNSACCode] DESC'
                        WHEN 'SPMT_newSBH9_BillNumber' THEN '[SPMT_newSBH9].[BillNumber]'
                        WHEN 'SPMT_newSBH9_BillNumber DESC' THEN '[SPMT_newSBH9].[BillNumber] DESC'
                        ELSE '[SPMT_newSBD].[IRNo],[SPMT_newSBD].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
      INNER JOIN #PageIndex
          ON [SPMT_newSBD].[IRNo] = #PageIndex.IRNo
          AND [SPMT_newSBD].[SerialNo] = #PageIndex.SerialNo
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
