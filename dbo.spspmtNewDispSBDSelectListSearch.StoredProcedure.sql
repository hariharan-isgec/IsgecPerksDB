USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtNewDispSBDSelectListSearch]
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
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (IRNo, SerialNo)
  SELECT [SPMT_newSBD].[IRNo], [SPMT_newSBD].[SerialNo] FROM [SPMT_newSBD]
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
   ( 
         STR(ISNULL([SPMT_newSBD].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBD].[ItemDescription],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBD].[UOM],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[Quantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[AssessableValue], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[TotalGSTINR], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[TotalAmountINR], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[BillType], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBD].[HSNSACCode],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[IGSTAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[ConversionFactorINR], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[IGSTRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[IRNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[SGSTRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[SGSTAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[CGSTRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[CGSTAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[CessRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[CessAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[TotalGST], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBD].[CostCenterID],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[Discount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBD].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBD].[DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[TotalAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBD].[ElementID],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[ServiceCharge], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBD].[Currency],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBD].[UploadBatchNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_newSBD].[EmployeeID],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_newSBD].[BasicValue], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'IRNo' THEN [SPMT_newSBD].[IRNo] END,
     CASE @OrderBy WHEN 'IRNo DESC' THEN [SPMT_newSBD].[IRNo] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [SPMT_newSBD].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [SPMT_newSBD].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'ItemDescription' THEN [SPMT_newSBD].[ItemDescription] END,
     CASE @OrderBy WHEN 'ItemDescription DESC' THEN [SPMT_newSBD].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'BillType' THEN [SPMT_newSBD].[BillType] END,
     CASE @OrderBy WHEN 'BillType DESC' THEN [SPMT_newSBD].[BillType] END DESC,
     CASE @OrderBy WHEN 'HSNSACCode' THEN [SPMT_newSBD].[HSNSACCode] END,
     CASE @OrderBy WHEN 'HSNSACCode DESC' THEN [SPMT_newSBD].[HSNSACCode] END DESC,
     CASE @OrderBy WHEN 'UOM' THEN [SPMT_newSBD].[UOM] END,
     CASE @OrderBy WHEN 'UOM DESC' THEN [SPMT_newSBD].[UOM] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [SPMT_newSBD].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [SPMT_newSBD].[Quantity] END DESC,
     CASE @OrderBy WHEN 'Currency' THEN [SPMT_newSBD].[Currency] END,
     CASE @OrderBy WHEN 'Currency DESC' THEN [SPMT_newSBD].[Currency] END DESC,
     CASE @OrderBy WHEN 'ConversionFactorINR' THEN [SPMT_newSBD].[ConversionFactorINR] END,
     CASE @OrderBy WHEN 'ConversionFactorINR DESC' THEN [SPMT_newSBD].[ConversionFactorINR] END DESC,
     CASE @OrderBy WHEN 'AssessableValue' THEN [SPMT_newSBD].[AssessableValue] END,
     CASE @OrderBy WHEN 'AssessableValue DESC' THEN [SPMT_newSBD].[AssessableValue] END DESC,
     CASE @OrderBy WHEN 'IGSTRate' THEN [SPMT_newSBD].[IGSTRate] END,
     CASE @OrderBy WHEN 'IGSTRate DESC' THEN [SPMT_newSBD].[IGSTRate] END DESC,
     CASE @OrderBy WHEN 'IGSTAmount' THEN [SPMT_newSBD].[IGSTAmount] END,
     CASE @OrderBy WHEN 'IGSTAmount DESC' THEN [SPMT_newSBD].[IGSTAmount] END DESC,
     CASE @OrderBy WHEN 'SGSTRate' THEN [SPMT_newSBD].[SGSTRate] END,
     CASE @OrderBy WHEN 'SGSTRate DESC' THEN [SPMT_newSBD].[SGSTRate] END DESC,
     CASE @OrderBy WHEN 'SGSTAmount' THEN [SPMT_newSBD].[SGSTAmount] END,
     CASE @OrderBy WHEN 'SGSTAmount DESC' THEN [SPMT_newSBD].[SGSTAmount] END DESC,
     CASE @OrderBy WHEN 'CGSTRate' THEN [SPMT_newSBD].[CGSTRate] END,
     CASE @OrderBy WHEN 'CGSTRate DESC' THEN [SPMT_newSBD].[CGSTRate] END DESC,
     CASE @OrderBy WHEN 'CGSTAmount' THEN [SPMT_newSBD].[CGSTAmount] END,
     CASE @OrderBy WHEN 'CGSTAmount DESC' THEN [SPMT_newSBD].[CGSTAmount] END DESC,
     CASE @OrderBy WHEN 'CessRate' THEN [SPMT_newSBD].[CessRate] END,
     CASE @OrderBy WHEN 'CessRate DESC' THEN [SPMT_newSBD].[CessRate] END DESC,
     CASE @OrderBy WHEN 'CessAmount' THEN [SPMT_newSBD].[CessAmount] END,
     CASE @OrderBy WHEN 'CessAmount DESC' THEN [SPMT_newSBD].[CessAmount] END DESC,
     CASE @OrderBy WHEN 'TotalGST' THEN [SPMT_newSBD].[TotalGST] END,
     CASE @OrderBy WHEN 'TotalGST DESC' THEN [SPMT_newSBD].[TotalGST] END DESC,
     CASE @OrderBy WHEN 'TotalAmount' THEN [SPMT_newSBD].[TotalAmount] END,
     CASE @OrderBy WHEN 'TotalAmount DESC' THEN [SPMT_newSBD].[TotalAmount] END DESC,
     CASE @OrderBy WHEN 'TotalGSTINR' THEN [SPMT_newSBD].[TotalGSTINR] END,
     CASE @OrderBy WHEN 'TotalGSTINR DESC' THEN [SPMT_newSBD].[TotalGSTINR] END DESC,
     CASE @OrderBy WHEN 'TotalAmountINR' THEN [SPMT_newSBD].[TotalAmountINR] END,
     CASE @OrderBy WHEN 'TotalAmountINR DESC' THEN [SPMT_newSBD].[TotalAmountINR] END DESC,
     CASE @OrderBy WHEN 'DepartmentID' THEN [SPMT_newSBD].[DepartmentID] END,
     CASE @OrderBy WHEN 'DepartmentID DESC' THEN [SPMT_newSBD].[DepartmentID] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [SPMT_newSBD].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [SPMT_newSBD].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'CostCenterID' THEN [SPMT_newSBD].[CostCenterID] END,
     CASE @OrderBy WHEN 'CostCenterID DESC' THEN [SPMT_newSBD].[CostCenterID] END DESC,
     CASE @OrderBy WHEN 'BasicValue' THEN [SPMT_newSBD].[BasicValue] END,
     CASE @OrderBy WHEN 'BasicValue DESC' THEN [SPMT_newSBD].[BasicValue] END DESC,
     CASE @OrderBy WHEN 'ElementID' THEN [SPMT_newSBD].[ElementID] END,
     CASE @OrderBy WHEN 'ElementID DESC' THEN [SPMT_newSBD].[ElementID] END DESC,
     CASE @OrderBy WHEN 'ServiceCharge' THEN [SPMT_newSBD].[ServiceCharge] END,
     CASE @OrderBy WHEN 'ServiceCharge DESC' THEN [SPMT_newSBD].[ServiceCharge] END DESC,
     CASE @OrderBy WHEN 'Discount' THEN [SPMT_newSBD].[Discount] END,
     CASE @OrderBy WHEN 'Discount DESC' THEN [SPMT_newSBD].[Discount] END DESC,
     CASE @OrderBy WHEN 'UploadBatchNo' THEN [SPMT_newSBD].[UploadBatchNo] END,
     CASE @OrderBy WHEN 'UploadBatchNo DESC' THEN [SPMT_newSBD].[UploadBatchNo] END DESC,
     CASE @OrderBy WHEN 'EmployeeID' THEN [SPMT_newSBD].[EmployeeID] END,
     CASE @OrderBy WHEN 'EmployeeID DESC' THEN [SPMT_newSBD].[EmployeeID] END DESC,
     CASE @OrderBy WHEN 'HRM_Departments1_Description' THEN [HRM_Departments1].[Description] END,
     CASE @OrderBy WHEN 'HRM_Departments1_Description DESC' THEN [HRM_Departments1].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects3_Description' THEN [IDM_Projects3].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects3_Description DESC' THEN [IDM_Projects3].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_WBS4_Description' THEN [IDM_WBS4].[Description] END,
     CASE @OrderBy WHEN 'IDM_WBS4_Description DESC' THEN [IDM_WBS4].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_BillTypes5_Description' THEN [SPMT_BillTypes5].[Description] END,
     CASE @OrderBy WHEN 'SPMT_BillTypes5_Description DESC' THEN [SPMT_BillTypes5].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_CostCenters6_Description' THEN [SPMT_CostCenters6].[Description] END,
     CASE @OrderBy WHEN 'SPMT_CostCenters6_Description DESC' THEN [SPMT_CostCenters6].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_ERPUnits7_Description' THEN [SPMT_ERPUnits7].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ERPUnits7_Description DESC' THEN [SPMT_ERPUnits7].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_HSNSACCodes8_HSNSACCode' THEN [SPMT_HSNSACCodes8].[HSNSACCode] END,
     CASE @OrderBy WHEN 'SPMT_HSNSACCodes8_HSNSACCode DESC' THEN [SPMT_HSNSACCodes8].[HSNSACCode] END DESC,
     CASE @OrderBy WHEN 'SPMT_newSBH9_BillNumber' THEN [SPMT_newSBH9].[BillNumber] END,
     CASE @OrderBy WHEN 'SPMT_newSBH9_BillNumber DESC' THEN [SPMT_newSBH9].[BillNumber] END DESC 

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
