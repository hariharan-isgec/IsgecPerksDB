USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetHistorySelectListPagedByFilteres]
  @Filter_AssetTypeID Int,
  @Filter_BrandID Int,
  @Filter_LocationID Int,
  @Filter_UserID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  HistoryID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (HistoryID) ' + 
               'SELECT [AST_AssetHistory].[HistoryID] FROM [AST_AssetHistory] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_MRNAsset] AS [AST_MRNAsset1]'
  SET @LGSQL = @LGSQL + '    ON [AST_AssetHistory].[MrnID] = [AST_MRNAsset1].[MrnID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [AST_AssetDetails] AS [AST_AssetDetails2]'
  SET @LGSQL = @LGSQL + '    ON [AST_AssetHistory].[AssetID] = [AST_AssetDetails2].[AssetID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_AssetTypes] AS [AST_AssetTypes3]'
  SET @LGSQL = @LGSQL + '    ON [AST_AssetHistory].[AssetTypeID] = [AST_AssetTypes3].[AssetTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands4]'
  SET @LGSQL = @LGSQL + '    ON [AST_AssetHistory].[BrandID] = [AST_Brands4].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations5]'
  SET @LGSQL = @LGSQL + '    ON [AST_AssetHistory].[LocationID] = [AST_Locations5].[LocationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees6]'
  SET @LGSQL = @LGSQL + '    ON [AST_AssetHistory].[UserID] = [PRK_Employees6].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees7]'
  SET @LGSQL = @LGSQL + '    ON [AST_AssetHistory].[ModifiedBy] = [PRK_Employees7].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_AssetTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_AssetHistory].[AssetTypeID] = ' + STR(@Filter_AssetTypeID)
  IF (@Filter_BrandID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_AssetHistory].[BrandID] = ' + STR(@Filter_BrandID)
  IF (@Filter_LocationID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_AssetHistory].[LocationID] = ' + STR(@Filter_LocationID)
  IF (@Filter_UserID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_AssetHistory].[UserID] = ' + STR(@Filter_UserID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'HistoryID' THEN '[AST_AssetHistory].[HistoryID]'
                        WHEN 'HistoryID DESC' THEN '[AST_AssetHistory].[HistoryID] DESC'
                        WHEN 'HistoryType' THEN '[AST_AssetHistory].[HistoryType]'
                        WHEN 'HistoryType DESC' THEN '[AST_AssetHistory].[HistoryType] DESC'
                        WHEN 'MrnID' THEN '[AST_AssetHistory].[MrnID]'
                        WHEN 'MrnID DESC' THEN '[AST_AssetHistory].[MrnID] DESC'
                        WHEN 'AssetID' THEN '[AST_AssetHistory].[AssetID]'
                        WHEN 'AssetID DESC' THEN '[AST_AssetHistory].[AssetID] DESC'
                        WHEN 'AssetTypeID' THEN '[AST_AssetHistory].[AssetTypeID]'
                        WHEN 'AssetTypeID DESC' THEN '[AST_AssetHistory].[AssetTypeID] DESC'
                        WHEN 'BrandID' THEN '[AST_AssetHistory].[BrandID]'
                        WHEN 'BrandID DESC' THEN '[AST_AssetHistory].[BrandID] DESC'
                        WHEN 'Model' THEN '[AST_AssetHistory].[Model]'
                        WHEN 'Model DESC' THEN '[AST_AssetHistory].[Model] DESC'
                        WHEN 'Features' THEN '[AST_AssetHistory].[Features]'
                        WHEN 'Features DESC' THEN '[AST_AssetHistory].[Features] DESC'
                        WHEN 'AssetNo' THEN '[AST_AssetHistory].[AssetNo]'
                        WHEN 'AssetNo DESC' THEN '[AST_AssetHistory].[AssetNo] DESC'
                        WHEN 'SerialNo' THEN '[AST_AssetHistory].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[AST_AssetHistory].[SerialNo] DESC'
                        WHEN 'LocationID' THEN '[AST_AssetHistory].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[AST_AssetHistory].[LocationID] DESC'
                        WHEN 'UserID' THEN '[AST_AssetHistory].[UserID]'
                        WHEN 'UserID DESC' THEN '[AST_AssetHistory].[UserID] DESC'
                        WHEN 'Remarks' THEN '[AST_AssetHistory].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[AST_AssetHistory].[Remarks] DESC'
                        WHEN 'Discarded' THEN '[AST_AssetHistory].[Discarded]'
                        WHEN 'Discarded DESC' THEN '[AST_AssetHistory].[Discarded] DESC'
                        WHEN 'ModifiedOn' THEN '[AST_AssetHistory].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[AST_AssetHistory].[ModifiedOn] DESC'
                        WHEN 'ModifiedBy' THEN '[AST_AssetHistory].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[AST_AssetHistory].[ModifiedBy] DESC'
                        WHEN 'AST_MRNAsset1_MrnID' THEN '[AST_MRNAsset1].[MrnID]'
                        WHEN 'AST_MRNAsset1_MrnID DESC' THEN '[AST_MRNAsset1].[MrnID] DESC'
                        WHEN 'AST_MRNAsset1_MrnDate' THEN '[AST_MRNAsset1].[MrnDate]'
                        WHEN 'AST_MRNAsset1_MrnDate DESC' THEN '[AST_MRNAsset1].[MrnDate] DESC'
                        WHEN 'AST_MRNAsset1_MrnDescription' THEN '[AST_MRNAsset1].[MrnDescription]'
                        WHEN 'AST_MRNAsset1_MrnDescription DESC' THEN '[AST_MRNAsset1].[MrnDescription] DESC'
                        WHEN 'AST_MRNAsset1_AssetTypeID' THEN '[AST_MRNAsset1].[AssetTypeID]'
                        WHEN 'AST_MRNAsset1_AssetTypeID DESC' THEN '[AST_MRNAsset1].[AssetTypeID] DESC'
                        WHEN 'AST_MRNAsset1_DateOfPurchase' THEN '[AST_MRNAsset1].[DateOfPurchase]'
                        WHEN 'AST_MRNAsset1_DateOfPurchase DESC' THEN '[AST_MRNAsset1].[DateOfPurchase] DESC'
                        WHEN 'AST_MRNAsset1_WarrantyTill' THEN '[AST_MRNAsset1].[WarrantyTill]'
                        WHEN 'AST_MRNAsset1_WarrantyTill DESC' THEN '[AST_MRNAsset1].[WarrantyTill] DESC'
                        WHEN 'AST_MRNAsset1_InsuranceTill' THEN '[AST_MRNAsset1].[InsuranceTill]'
                        WHEN 'AST_MRNAsset1_InsuranceTill DESC' THEN '[AST_MRNAsset1].[InsuranceTill] DESC'
                        WHEN 'AST_MRNAsset1_SupplierID' THEN '[AST_MRNAsset1].[SupplierID]'
                        WHEN 'AST_MRNAsset1_SupplierID DESC' THEN '[AST_MRNAsset1].[SupplierID] DESC'
                        WHEN 'AST_MRNAsset1_BrandID' THEN '[AST_MRNAsset1].[BrandID]'
                        WHEN 'AST_MRNAsset1_BrandID DESC' THEN '[AST_MRNAsset1].[BrandID] DESC'
                        WHEN 'AST_MRNAsset1_Model' THEN '[AST_MRNAsset1].[Model]'
                        WHEN 'AST_MRNAsset1_Model DESC' THEN '[AST_MRNAsset1].[Model] DESC'
                        WHEN 'AST_MRNAsset1_PurchasedQuantity' THEN '[AST_MRNAsset1].[PurchasedQuantity]'
                        WHEN 'AST_MRNAsset1_PurchasedQuantity DESC' THEN '[AST_MRNAsset1].[PurchasedQuantity] DESC'
                        WHEN 'AST_MRNAsset1_IssuedQuantity' THEN '[AST_MRNAsset1].[IssuedQuantity]'
                        WHEN 'AST_MRNAsset1_IssuedQuantity DESC' THEN '[AST_MRNAsset1].[IssuedQuantity] DESC'
                        WHEN 'AST_MRNAsset1_WriteoffQuantity' THEN '[AST_MRNAsset1].[WriteoffQuantity]'
                        WHEN 'AST_MRNAsset1_WriteoffQuantity DESC' THEN '[AST_MRNAsset1].[WriteoffQuantity] DESC'
                        WHEN 'AST_MRNAsset1_Remarks' THEN '[AST_MRNAsset1].[Remarks]'
                        WHEN 'AST_MRNAsset1_Remarks DESC' THEN '[AST_MRNAsset1].[Remarks] DESC'
                        WHEN 'AST_AssetDetails2_AssetID' THEN '[AST_AssetDetails2].[AssetID]'
                        WHEN 'AST_AssetDetails2_AssetID DESC' THEN '[AST_AssetDetails2].[AssetID] DESC'
                        WHEN 'AST_AssetDetails2_MrnID' THEN '[AST_AssetDetails2].[MrnID]'
                        WHEN 'AST_AssetDetails2_MrnID DESC' THEN '[AST_AssetDetails2].[MrnID] DESC'
                        WHEN 'AST_AssetDetails2_AssetTypeID' THEN '[AST_AssetDetails2].[AssetTypeID]'
                        WHEN 'AST_AssetDetails2_AssetTypeID DESC' THEN '[AST_AssetDetails2].[AssetTypeID] DESC'
                        WHEN 'AST_AssetDetails2_BrandID' THEN '[AST_AssetDetails2].[BrandID]'
                        WHEN 'AST_AssetDetails2_BrandID DESC' THEN '[AST_AssetDetails2].[BrandID] DESC'
                        WHEN 'AST_AssetDetails2_UserID' THEN '[AST_AssetDetails2].[UserID]'
                        WHEN 'AST_AssetDetails2_UserID DESC' THEN '[AST_AssetDetails2].[UserID] DESC'
                        WHEN 'AST_AssetDetails2_LocationID' THEN '[AST_AssetDetails2].[LocationID]'
                        WHEN 'AST_AssetDetails2_LocationID DESC' THEN '[AST_AssetDetails2].[LocationID] DESC'
                        WHEN 'AST_AssetDetails2_Model' THEN '[AST_AssetDetails2].[Model]'
                        WHEN 'AST_AssetDetails2_Model DESC' THEN '[AST_AssetDetails2].[Model] DESC'
                        WHEN 'AST_AssetDetails2_Features' THEN '[AST_AssetDetails2].[Features]'
                        WHEN 'AST_AssetDetails2_Features DESC' THEN '[AST_AssetDetails2].[Features] DESC'
                        WHEN 'AST_AssetDetails2_SerialNo' THEN '[AST_AssetDetails2].[SerialNo]'
                        WHEN 'AST_AssetDetails2_SerialNo DESC' THEN '[AST_AssetDetails2].[SerialNo] DESC'
                        WHEN 'AST_AssetDetails2_AssetNo' THEN '[AST_AssetDetails2].[AssetNo]'
                        WHEN 'AST_AssetDetails2_AssetNo DESC' THEN '[AST_AssetDetails2].[AssetNo] DESC'
                        WHEN 'AST_AssetDetails2_Discarded' THEN '[AST_AssetDetails2].[Discarded]'
                        WHEN 'AST_AssetDetails2_Discarded DESC' THEN '[AST_AssetDetails2].[Discarded] DESC'
                        WHEN 'AST_AssetDetails2_ModifiedBy' THEN '[AST_AssetDetails2].[ModifiedBy]'
                        WHEN 'AST_AssetDetails2_ModifiedBy DESC' THEN '[AST_AssetDetails2].[ModifiedBy] DESC'
                        WHEN 'AST_AssetDetails2_ModifiedOn' THEN '[AST_AssetDetails2].[ModifiedOn]'
                        WHEN 'AST_AssetDetails2_ModifiedOn DESC' THEN '[AST_AssetDetails2].[ModifiedOn] DESC'
                        WHEN 'AST_AssetTypes3_AssetTypeID' THEN '[AST_AssetTypes3].[AssetTypeID]'
                        WHEN 'AST_AssetTypes3_AssetTypeID DESC' THEN '[AST_AssetTypes3].[AssetTypeID] DESC'
                        WHEN 'AST_AssetTypes3_Description' THEN '[AST_AssetTypes3].[Description]'
                        WHEN 'AST_AssetTypes3_Description DESC' THEN '[AST_AssetTypes3].[Description] DESC'
                        WHEN 'AST_Brands4_BrandID' THEN '[AST_Brands4].[BrandID]'
                        WHEN 'AST_Brands4_BrandID DESC' THEN '[AST_Brands4].[BrandID] DESC'
                        WHEN 'AST_Brands4_Description' THEN '[AST_Brands4].[Description]'
                        WHEN 'AST_Brands4_Description DESC' THEN '[AST_Brands4].[Description] DESC'
                        WHEN 'AST_Locations5_LocationID' THEN '[AST_Locations5].[LocationID]'
                        WHEN 'AST_Locations5_LocationID DESC' THEN '[AST_Locations5].[LocationID] DESC'
                        WHEN 'AST_Locations5_Descriptions' THEN '[AST_Locations5].[Descriptions]'
                        WHEN 'AST_Locations5_Descriptions DESC' THEN '[AST_Locations5].[Descriptions] DESC'
                        WHEN 'PRK_Employees6_EmployeeID' THEN '[PRK_Employees6].[EmployeeID]'
                        WHEN 'PRK_Employees6_EmployeeID DESC' THEN '[PRK_Employees6].[EmployeeID] DESC'
                        WHEN 'PRK_Employees6_CardNo' THEN '[PRK_Employees6].[CardNo]'
                        WHEN 'PRK_Employees6_CardNo DESC' THEN '[PRK_Employees6].[CardNo] DESC'
                        WHEN 'PRK_Employees6_EmployeeName' THEN '[PRK_Employees6].[EmployeeName]'
                        WHEN 'PRK_Employees6_EmployeeName DESC' THEN '[PRK_Employees6].[EmployeeName] DESC'
                        WHEN 'PRK_Employees6_PostedAt' THEN '[PRK_Employees6].[PostedAt]'
                        WHEN 'PRK_Employees6_PostedAt DESC' THEN '[PRK_Employees6].[PostedAt] DESC'
                        WHEN 'PRK_Employees6_Department' THEN '[PRK_Employees6].[Department]'
                        WHEN 'PRK_Employees6_Department DESC' THEN '[PRK_Employees6].[Department] DESC'
                        WHEN 'PRK_Employees6_Company' THEN '[PRK_Employees6].[Company]'
                        WHEN 'PRK_Employees6_Company DESC' THEN '[PRK_Employees6].[Company] DESC'
                        WHEN 'PRK_Employees7_EmployeeID' THEN '[PRK_Employees7].[EmployeeID]'
                        WHEN 'PRK_Employees7_EmployeeID DESC' THEN '[PRK_Employees7].[EmployeeID] DESC'
                        WHEN 'PRK_Employees7_CardNo' THEN '[PRK_Employees7].[CardNo]'
                        WHEN 'PRK_Employees7_CardNo DESC' THEN '[PRK_Employees7].[CardNo] DESC'
                        WHEN 'PRK_Employees7_EmployeeName' THEN '[PRK_Employees7].[EmployeeName]'
                        WHEN 'PRK_Employees7_EmployeeName DESC' THEN '[PRK_Employees7].[EmployeeName] DESC'
                        WHEN 'PRK_Employees7_PostedAt' THEN '[PRK_Employees7].[PostedAt]'
                        WHEN 'PRK_Employees7_PostedAt DESC' THEN '[PRK_Employees7].[PostedAt] DESC'
                        WHEN 'PRK_Employees7_Department' THEN '[PRK_Employees7].[Department]'
                        WHEN 'PRK_Employees7_Department DESC' THEN '[PRK_Employees7].[Department] DESC'
                        WHEN 'PRK_Employees7_Company' THEN '[PRK_Employees7].[Company]'
                        WHEN 'PRK_Employees7_Company DESC' THEN '[PRK_Employees7].[Company] DESC'
                        ELSE '[AST_AssetHistory].[HistoryID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[AST_AssetHistory].[HistoryID],
		[AST_AssetHistory].[HistoryType],
		[AST_AssetHistory].[MrnID],
		[AST_AssetHistory].[AssetID],
		[AST_AssetHistory].[AssetTypeID],
		[AST_AssetHistory].[BrandID],
		[AST_AssetHistory].[Model],
		[AST_AssetHistory].[Features],
		[AST_AssetHistory].[AssetNo],
		[AST_AssetHistory].[SerialNo],
		[AST_AssetHistory].[LocationID],
		[AST_AssetHistory].[UserID],
		[AST_AssetHistory].[Remarks],
		[AST_AssetHistory].[Discarded],
		[AST_AssetHistory].[ModifiedOn],
		[AST_AssetHistory].[ModifiedBy],
		[AST_MRNAsset1].[MrnID] AS AST_MRNAsset1_MrnID,
		[AST_MRNAsset1].[MrnDate] AS AST_MRNAsset1_MrnDate,
		[AST_MRNAsset1].[MrnDescription] AS AST_MRNAsset1_MrnDescription,
		[AST_MRNAsset1].[AssetTypeID] AS AST_MRNAsset1_AssetTypeID,
		[AST_MRNAsset1].[DateOfPurchase] AS AST_MRNAsset1_DateOfPurchase,
		[AST_MRNAsset1].[WarrantyTill] AS AST_MRNAsset1_WarrantyTill,
		[AST_MRNAsset1].[InsuranceTill] AS AST_MRNAsset1_InsuranceTill,
		[AST_MRNAsset1].[SupplierID] AS AST_MRNAsset1_SupplierID,
		[AST_MRNAsset1].[BrandID] AS AST_MRNAsset1_BrandID,
		[AST_MRNAsset1].[Model] AS AST_MRNAsset1_Model,
		[AST_MRNAsset1].[PurchasedQuantity] AS AST_MRNAsset1_PurchasedQuantity,
		[AST_MRNAsset1].[IssuedQuantity] AS AST_MRNAsset1_IssuedQuantity,
		[AST_MRNAsset1].[WriteoffQuantity] AS AST_MRNAsset1_WriteoffQuantity,
		[AST_MRNAsset1].[Remarks] AS AST_MRNAsset1_Remarks,
		[AST_AssetDetails2].[AssetID] AS AST_AssetDetails2_AssetID,
		[AST_AssetDetails2].[MrnID] AS AST_AssetDetails2_MrnID,
		[AST_AssetDetails2].[AssetTypeID] AS AST_AssetDetails2_AssetTypeID,
		[AST_AssetDetails2].[BrandID] AS AST_AssetDetails2_BrandID,
		[AST_AssetDetails2].[UserID] AS AST_AssetDetails2_UserID,
		[AST_AssetDetails2].[LocationID] AS AST_AssetDetails2_LocationID,
		[AST_AssetDetails2].[Model] AS AST_AssetDetails2_Model,
		[AST_AssetDetails2].[Features] AS AST_AssetDetails2_Features,
		[AST_AssetDetails2].[SerialNo] AS AST_AssetDetails2_SerialNo,
		[AST_AssetDetails2].[AssetNo] AS AST_AssetDetails2_AssetNo,
		[AST_AssetDetails2].[Discarded] AS AST_AssetDetails2_Discarded,
		[AST_AssetDetails2].[ModifiedBy] AS AST_AssetDetails2_ModifiedBy,
		[AST_AssetDetails2].[ModifiedOn] AS AST_AssetDetails2_ModifiedOn,
		[AST_AssetTypes3].[AssetTypeID] AS AST_AssetTypes3_AssetTypeID,
		[AST_AssetTypes3].[Description] AS AST_AssetTypes3_Description,
		[AST_Brands4].[BrandID] AS AST_Brands4_BrandID,
		[AST_Brands4].[Description] AS AST_Brands4_Description,
		[AST_Locations5].[LocationID] AS AST_Locations5_LocationID,
		[AST_Locations5].[Descriptions] AS AST_Locations5_Descriptions,
		[PRK_Employees6].[EmployeeID] AS PRK_Employees6_EmployeeID,
		[PRK_Employees6].[CardNo] AS PRK_Employees6_CardNo,
		[PRK_Employees6].[EmployeeName] AS PRK_Employees6_EmployeeName,
		[PRK_Employees6].[PostedAt] AS PRK_Employees6_PostedAt,
		[PRK_Employees6].[Department] AS PRK_Employees6_Department,
		[PRK_Employees6].[Company] AS PRK_Employees6_Company,
		[PRK_Employees7].[EmployeeID] AS PRK_Employees7_EmployeeID,
		[PRK_Employees7].[CardNo] AS PRK_Employees7_CardNo,
		[PRK_Employees7].[EmployeeName] AS PRK_Employees7_EmployeeName,
		[PRK_Employees7].[PostedAt] AS PRK_Employees7_PostedAt,
		[PRK_Employees7].[Department] AS PRK_Employees7_Department,
		[PRK_Employees7].[Company] AS PRK_Employees7_Company 
  FROM [AST_AssetHistory] 
    	INNER JOIN #PageIndex
          ON [AST_AssetHistory].[HistoryID] = #PageIndex.HistoryID
  LEFT OUTER JOIN [AST_MRNAsset] AS [AST_MRNAsset1]
    ON [AST_AssetHistory].[MrnID] = [AST_MRNAsset1].[MrnID]
  INNER JOIN [AST_AssetDetails] AS [AST_AssetDetails2]
    ON [AST_AssetHistory].[AssetID] = [AST_AssetDetails2].[AssetID]
  LEFT OUTER JOIN [AST_AssetTypes] AS [AST_AssetTypes3]
    ON [AST_AssetHistory].[AssetTypeID] = [AST_AssetTypes3].[AssetTypeID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands4]
    ON [AST_AssetHistory].[BrandID] = [AST_Brands4].[BrandID]
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations5]
    ON [AST_AssetHistory].[LocationID] = [AST_Locations5].[LocationID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees6]
    ON [AST_AssetHistory].[UserID] = [PRK_Employees6].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees7]
    ON [AST_AssetHistory].[ModifiedBy] = [PRK_Employees7].[EmployeeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
