USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmTransferDetailsSelectListFilteres]
  @Filter_TransferID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,TransferID Int NOT NULL
 ,MrnID Int NOT NULL
 ,AssetID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TransferID'  SET @LGSQL = @LGSQL + ', MrnID'  SET @LGSQL = @LGSQL + ', AssetID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ASM_TransferDetails].[TransferID]'  SET @LGSQL = @LGSQL + ', [ASM_TransferDetails].[MrnID]'  SET @LGSQL = @LGSQL + ', [ASM_TransferDetails].[AssetID]'  SET @LGSQL = @LGSQL + ' FROM [ASM_TransferDetails] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands1]'
  SET @LGSQL = @LGSQL + '    ON [ASM_TransferDetails].[BrandID] = [ASM_AstBrands1].[BrandID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ASM_AstTypes] AS [ASM_AstTypes9]'
  SET @LGSQL = @LGSQL + '    ON [ASM_TransferDetails].[AssetTypeID] = [ASM_AstTypes9].[AssetTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_Suppliers] AS [ASM_Suppliers10]'
  SET @LGSQL = @LGSQL + '    ON [ASM_TransferDetails].[SupplierID] = [ASM_Suppliers10].[SupplierID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees12]'
  SET @LGSQL = @LGSQL + '    ON [ASM_TransferDetails].[ModifiedBy] = [HRM_Employees12].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices15]'
  SET @LGSQL = @LGSQL + '    ON [ASM_TransferDetails].[ToOfficeID] = [HRM_Offices15].[OfficeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices16]'
  SET @LGSQL = @LGSQL + '    ON [ASM_TransferDetails].[FromOfficeID] = [HRM_Offices16].[OfficeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices17]'
  SET @LGSQL = @LGSQL + '    ON [ASM_TransferDetails].[RecievedAt] = [HRM_Offices17].[OfficeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_TransferID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ASM_TransferDetails].[TransferID] = ' + STR(@Filter_TransferID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TransferID' THEN '[ASM_TransferDetails].[TransferID]'
                        WHEN 'TransferID DESC' THEN '[ASM_TransferDetails].[TransferID] DESC'
                        WHEN 'MrnID' THEN '[ASM_TransferDetails].[MrnID]'
                        WHEN 'MrnID DESC' THEN '[ASM_TransferDetails].[MrnID] DESC'
                        WHEN 'AssetID' THEN '[ASM_TransferDetails].[AssetID]'
                        WHEN 'AssetID DESC' THEN '[ASM_TransferDetails].[AssetID] DESC'
                        WHEN 'AssetTypeID' THEN '[ASM_TransferDetails].[AssetTypeID]'
                        WHEN 'AssetTypeID DESC' THEN '[ASM_TransferDetails].[AssetTypeID] DESC'
                        WHEN 'MrnDate' THEN '[ASM_TransferDetails].[MrnDate]'
                        WHEN 'MrnDate DESC' THEN '[ASM_TransferDetails].[MrnDate] DESC'
                        WHEN 'SupplierID' THEN '[ASM_TransferDetails].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[ASM_TransferDetails].[SupplierID] DESC'
                        WHEN 'BrandID' THEN '[ASM_TransferDetails].[BrandID]'
                        WHEN 'BrandID DESC' THEN '[ASM_TransferDetails].[BrandID] DESC'
                        WHEN 'ModelNo' THEN '[ASM_TransferDetails].[ModelNo]'
                        WHEN 'ModelNo DESC' THEN '[ASM_TransferDetails].[ModelNo] DESC'
                        WHEN 'OtherSpecifications' THEN '[ASM_TransferDetails].[OtherSpecifications]'
                        WHEN 'OtherSpecifications DESC' THEN '[ASM_TransferDetails].[OtherSpecifications] DESC'
                        WHEN 'RecievedAt' THEN '[ASM_TransferDetails].[RecievedAt]'
                        WHEN 'RecievedAt DESC' THEN '[ASM_TransferDetails].[RecievedAt] DESC'
                        WHEN 'AssetNo' THEN '[ASM_TransferDetails].[AssetNo]'
                        WHEN 'AssetNo DESC' THEN '[ASM_TransferDetails].[AssetNo] DESC'
                        WHEN 'AssetSerialNo' THEN '[ASM_TransferDetails].[AssetSerialNo]'
                        WHEN 'AssetSerialNo DESC' THEN '[ASM_TransferDetails].[AssetSerialNo] DESC'
                        WHEN 'Issued' THEN '[ASM_TransferDetails].[Issued]'
                        WHEN 'Issued DESC' THEN '[ASM_TransferDetails].[Issued] DESC'
                        WHEN 'Returnable' THEN '[ASM_TransferDetails].[Returnable]'
                        WHEN 'Returnable DESC' THEN '[ASM_TransferDetails].[Returnable] DESC'
                        WHEN 'ExpectedDate' THEN '[ASM_TransferDetails].[ExpectedDate]'
                        WHEN 'ExpectedDate DESC' THEN '[ASM_TransferDetails].[ExpectedDate] DESC'
                        WHEN 'Transferred' THEN '[ASM_TransferDetails].[Transferred]'
                        WHEN 'Transferred DESC' THEN '[ASM_TransferDetails].[Transferred] DESC'
                        WHEN 'ToOfficeID' THEN '[ASM_TransferDetails].[ToOfficeID]'
                        WHEN 'ToOfficeID DESC' THEN '[ASM_TransferDetails].[ToOfficeID] DESC'
                        WHEN 'RecievedTransfered' THEN '[ASM_TransferDetails].[RecievedTransfered]'
                        WHEN 'RecievedTransfered DESC' THEN '[ASM_TransferDetails].[RecievedTransfered] DESC'
                        WHEN 'FromOfficeID' THEN '[ASM_TransferDetails].[FromOfficeID]'
                        WHEN 'FromOfficeID DESC' THEN '[ASM_TransferDetails].[FromOfficeID] DESC'
                        WHEN 'OnRepair' THEN '[ASM_TransferDetails].[OnRepair]'
                        WHEN 'OnRepair DESC' THEN '[ASM_TransferDetails].[OnRepair] DESC'
                        WHEN 'Discarded' THEN '[ASM_TransferDetails].[Discarded]'
                        WHEN 'Discarded DESC' THEN '[ASM_TransferDetails].[Discarded] DESC'
                        WHEN 'Modified' THEN '[ASM_TransferDetails].[Modified]'
                        WHEN 'Modified DESC' THEN '[ASM_TransferDetails].[Modified] DESC'
                        WHEN 'ModifiedOn' THEN '[ASM_TransferDetails].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[ASM_TransferDetails].[ModifiedOn] DESC'
                        WHEN 'ModifiedBy' THEN '[ASM_TransferDetails].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[ASM_TransferDetails].[ModifiedBy] DESC'
                        WHEN 'ModificationRemarks' THEN '[ASM_TransferDetails].[ModificationRemarks]'
                        WHEN 'ModificationRemarks DESC' THEN '[ASM_TransferDetails].[ModificationRemarks] DESC'
                        WHEN 'ASM_AstBrands1_BrandID' THEN '[ASM_AstBrands1].[BrandID]'
                        WHEN 'ASM_AstBrands1_BrandID DESC' THEN '[ASM_AstBrands1].[BrandID] DESC'
                        WHEN 'ASM_AstBrands1_Description' THEN '[ASM_AstBrands1].[Description]'
                        WHEN 'ASM_AstBrands1_Description DESC' THEN '[ASM_AstBrands1].[Description] DESC'
                        WHEN 'ASM_AstTypes9_AssetTypeID' THEN '[ASM_AstTypes9].[AssetTypeID]'
                        WHEN 'ASM_AstTypes9_AssetTypeID DESC' THEN '[ASM_AstTypes9].[AssetTypeID] DESC'
                        WHEN 'ASM_AstTypes9_Description' THEN '[ASM_AstTypes9].[Description]'
                        WHEN 'ASM_AstTypes9_Description DESC' THEN '[ASM_AstTypes9].[Description] DESC'
                        WHEN 'ASM_AstTypes9_IssueToLocation' THEN '[ASM_AstTypes9].[IssueToLocation]'
                        WHEN 'ASM_AstTypes9_IssueToLocation DESC' THEN '[ASM_AstTypes9].[IssueToLocation] DESC'
                        WHEN 'ASM_Suppliers10_SupplierID' THEN '[ASM_Suppliers10].[SupplierID]'
                        WHEN 'ASM_Suppliers10_SupplierID DESC' THEN '[ASM_Suppliers10].[SupplierID] DESC'
                        WHEN 'ASM_Suppliers10_Description' THEN '[ASM_Suppliers10].[Description]'
                        WHEN 'ASM_Suppliers10_Description DESC' THEN '[ASM_Suppliers10].[Description] DESC'
                        WHEN 'HRM_Employees12_CardNo' THEN '[HRM_Employees12].[CardNo]'
                        WHEN 'HRM_Employees12_CardNo DESC' THEN '[HRM_Employees12].[CardNo] DESC'
                        WHEN 'HRM_Employees12_EmployeeName' THEN '[HRM_Employees12].[EmployeeName]'
                        WHEN 'HRM_Employees12_EmployeeName DESC' THEN '[HRM_Employees12].[EmployeeName] DESC'
                        WHEN 'HRM_Employees12_C_OfficeID' THEN '[HRM_Employees12].[C_OfficeID]'
                        WHEN 'HRM_Employees12_C_OfficeID DESC' THEN '[HRM_Employees12].[C_OfficeID] DESC'
                        WHEN 'HRM_Offices15_OfficeID' THEN '[HRM_Offices15].[OfficeID]'
                        WHEN 'HRM_Offices15_OfficeID DESC' THEN '[HRM_Offices15].[OfficeID] DESC'
                        WHEN 'HRM_Offices15_Description' THEN '[HRM_Offices15].[Description]'
                        WHEN 'HRM_Offices15_Description DESC' THEN '[HRM_Offices15].[Description] DESC'
                        WHEN 'HRM_Offices16_OfficeID' THEN '[HRM_Offices16].[OfficeID]'
                        WHEN 'HRM_Offices16_OfficeID DESC' THEN '[HRM_Offices16].[OfficeID] DESC'
                        WHEN 'HRM_Offices16_Description' THEN '[HRM_Offices16].[Description]'
                        WHEN 'HRM_Offices16_Description DESC' THEN '[HRM_Offices16].[Description] DESC'
                        WHEN 'HRM_Offices17_OfficeID' THEN '[HRM_Offices17].[OfficeID]'
                        WHEN 'HRM_Offices17_OfficeID DESC' THEN '[HRM_Offices17].[OfficeID] DESC'
                        WHEN 'HRM_Offices17_Description' THEN '[HRM_Offices17].[Description]'
                        WHEN 'HRM_Offices17_Description DESC' THEN '[HRM_Offices17].[Description] DESC'
                        ELSE '[ASM_TransferDetails].[TransferID],[ASM_TransferDetails].[MrnID],[ASM_TransferDetails].[AssetID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ASM_TransferDetails].[TransferID],
		[ASM_TransferDetails].[MrnID],
		[ASM_TransferDetails].[AssetID],
		[ASM_TransferDetails].[AssetTypeID],
		[ASM_TransferDetails].[MrnDate],
		[ASM_TransferDetails].[SupplierID],
		[ASM_TransferDetails].[BrandID],
		[ASM_TransferDetails].[ModelNo],
		[ASM_TransferDetails].[OtherSpecifications],
		[ASM_TransferDetails].[RecievedAt],
		[ASM_TransferDetails].[AssetNo],
		[ASM_TransferDetails].[AssetSerialNo],
		[ASM_TransferDetails].[Issued],
		[ASM_TransferDetails].[Returnable],
		[ASM_TransferDetails].[ExpectedDate],
		[ASM_TransferDetails].[Transferred],
		[ASM_TransferDetails].[ToOfficeID],
		[ASM_TransferDetails].[RecievedTransfered],
		[ASM_TransferDetails].[FromOfficeID],
		[ASM_TransferDetails].[OnRepair],
		[ASM_TransferDetails].[Discarded],
		[ASM_TransferDetails].[Modified],
		[ASM_TransferDetails].[ModifiedOn],
		[ASM_TransferDetails].[ModifiedBy],
		[ASM_TransferDetails].[ModificationRemarks],
		[ASM_AstBrands1].[BrandID] AS ASM_AstBrands1_BrandID,
		[ASM_AstBrands1].[Description] AS ASM_AstBrands1_Description,
		[ASM_AstTypes9].[AssetTypeID] AS ASM_AstTypes9_AssetTypeID,
		[ASM_AstTypes9].[Description] AS ASM_AstTypes9_Description,
		[ASM_AstTypes9].[IssueToLocation] AS ASM_AstTypes9_IssueToLocation,
		[ASM_Suppliers10].[SupplierID] AS ASM_Suppliers10_SupplierID,
		[ASM_Suppliers10].[Description] AS ASM_Suppliers10_Description,
		[HRM_Employees12].[CardNo] AS HRM_Employees12_CardNo,
		[HRM_Employees12].[EmployeeName] AS HRM_Employees12_EmployeeName,
		[HRM_Employees12].[C_OfficeID] AS HRM_Employees12_C_OfficeID,
		[HRM_Offices15].[OfficeID] AS HRM_Offices15_OfficeID,
		[HRM_Offices15].[Description] AS HRM_Offices15_Description,
		[HRM_Offices16].[OfficeID] AS HRM_Offices16_OfficeID,
		[HRM_Offices16].[Description] AS HRM_Offices16_Description,
		[HRM_Offices17].[OfficeID] AS HRM_Offices17_OfficeID,
		[HRM_Offices17].[Description] AS HRM_Offices17_Description 
  FROM [ASM_TransferDetails] 
    	INNER JOIN #PageIndex
          ON [ASM_TransferDetails].[TransferID] = #PageIndex.TransferID
          AND [ASM_TransferDetails].[MrnID] = #PageIndex.MrnID
          AND [ASM_TransferDetails].[AssetID] = #PageIndex.AssetID
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands1]
    ON [ASM_TransferDetails].[BrandID] = [ASM_AstBrands1].[BrandID]
  INNER JOIN [ASM_AstTypes] AS [ASM_AstTypes9]
    ON [ASM_TransferDetails].[AssetTypeID] = [ASM_AstTypes9].[AssetTypeID]
  LEFT OUTER JOIN [ASM_Suppliers] AS [ASM_Suppliers10]
    ON [ASM_TransferDetails].[SupplierID] = [ASM_Suppliers10].[SupplierID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees12]
    ON [ASM_TransferDetails].[ModifiedBy] = [HRM_Employees12].[CardNo]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices15]
    ON [ASM_TransferDetails].[ToOfficeID] = [HRM_Offices15].[OfficeID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices16]
    ON [ASM_TransferDetails].[FromOfficeID] = [HRM_Offices16].[OfficeID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices17]
    ON [ASM_TransferDetails].[RecievedAt] = [HRM_Offices17].[OfficeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
