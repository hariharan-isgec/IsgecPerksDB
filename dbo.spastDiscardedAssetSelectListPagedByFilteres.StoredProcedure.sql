USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastDiscardedAssetSelectListPagedByFilteres]
  @Filter_AssetTypeID Int,
  @Filter_BrandID Int,
  @Filter_LocationID Int,
  @Filter_UserID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @Discarded Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  AssetID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (AssetID) ' + 
               'SELECT [AST_AssetDetails].[AssetID] FROM [AST_AssetDetails] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_MRNAsset] AS [AST_MRNAsset1]'
  SET @LGSQL = @LGSQL + '    ON [AST_AssetDetails].[MrnID] = [AST_MRNAsset1].[MrnID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_AssetTypes] AS [AST_AssetTypes2]'
  SET @LGSQL = @LGSQL + '    ON [AST_AssetDetails].[AssetTypeID] = [AST_AssetTypes2].[AssetTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands3]'
  SET @LGSQL = @LGSQL + '    ON [AST_AssetDetails].[BrandID] = [AST_Brands3].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations4]'
  SET @LGSQL = @LGSQL + '    ON [AST_AssetDetails].[LocationID] = [AST_Locations4].[LocationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]'
  SET @LGSQL = @LGSQL + '    ON [AST_AssetDetails].[UserID] = [PRK_Employees5].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees6]'
  SET @LGSQL = @LGSQL + '    ON [AST_AssetDetails].[ModifiedBy] = [PRK_Employees6].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_AssetTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_AssetDetails].[AssetTypeID] = ' + STR(@Filter_AssetTypeID)
  IF (@Filter_BrandID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_AssetDetails].[BrandID] = ' + STR(@Filter_BrandID)
  IF (@Filter_LocationID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_AssetDetails].[LocationID] = ' + STR(@Filter_LocationID)
  IF (@Filter_UserID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_AssetDetails].[UserID] = ' + STR(@Filter_UserID)
  SET @LGSQL = @LGSQL + ' AND [AST_AssetDetails].[Discarded] = ''' + CONVERT(NVarChar(10), @Discarded) + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'AssetID' THEN '[AST_AssetDetails].[AssetID]'
                        WHEN 'AssetID DESC' THEN '[AST_AssetDetails].[AssetID] DESC'
                        WHEN 'MrnID' THEN '[AST_AssetDetails].[MrnID]'
                        WHEN 'MrnID DESC' THEN '[AST_AssetDetails].[MrnID] DESC'
                        WHEN 'AssetTypeID' THEN '[AST_AssetDetails].[AssetTypeID]'
                        WHEN 'AssetTypeID DESC' THEN '[AST_AssetDetails].[AssetTypeID] DESC'
                        WHEN 'BrandID' THEN '[AST_AssetDetails].[BrandID]'
                        WHEN 'BrandID DESC' THEN '[AST_AssetDetails].[BrandID] DESC'
                        WHEN 'Model' THEN '[AST_AssetDetails].[Model]'
                        WHEN 'Model DESC' THEN '[AST_AssetDetails].[Model] DESC'
                        WHEN 'Features' THEN '[AST_AssetDetails].[Features]'
                        WHEN 'Features DESC' THEN '[AST_AssetDetails].[Features] DESC'
                        WHEN 'SerialNo' THEN '[AST_AssetDetails].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[AST_AssetDetails].[SerialNo] DESC'
                        WHEN 'AssetNo' THEN '[AST_AssetDetails].[AssetNo]'
                        WHEN 'AssetNo DESC' THEN '[AST_AssetDetails].[AssetNo] DESC'
                        WHEN 'LocationID' THEN '[AST_AssetDetails].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[AST_AssetDetails].[LocationID] DESC'
                        WHEN 'UserID' THEN '[AST_AssetDetails].[UserID]'
                        WHEN 'UserID DESC' THEN '[AST_AssetDetails].[UserID] DESC'
                        WHEN 'Remarks' THEN '[AST_AssetDetails].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[AST_AssetDetails].[Remarks] DESC'
                        WHEN 'Discarded' THEN '[AST_AssetDetails].[Discarded]'
                        WHEN 'Discarded DESC' THEN '[AST_AssetDetails].[Discarded] DESC'
                        WHEN 'ModifiedBy' THEN '[AST_AssetDetails].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[AST_AssetDetails].[ModifiedBy] DESC'
                        WHEN 'ModifiedOn' THEN '[AST_AssetDetails].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[AST_AssetDetails].[ModifiedOn] DESC'
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
                        WHEN 'AST_AssetTypes2_AssetTypeID' THEN '[AST_AssetTypes2].[AssetTypeID]'
                        WHEN 'AST_AssetTypes2_AssetTypeID DESC' THEN '[AST_AssetTypes2].[AssetTypeID] DESC'
                        WHEN 'AST_AssetTypes2_Description' THEN '[AST_AssetTypes2].[Description]'
                        WHEN 'AST_AssetTypes2_Description DESC' THEN '[AST_AssetTypes2].[Description] DESC'
                        WHEN 'AST_Brands3_BrandID' THEN '[AST_Brands3].[BrandID]'
                        WHEN 'AST_Brands3_BrandID DESC' THEN '[AST_Brands3].[BrandID] DESC'
                        WHEN 'AST_Brands3_Description' THEN '[AST_Brands3].[Description]'
                        WHEN 'AST_Brands3_Description DESC' THEN '[AST_Brands3].[Description] DESC'
                        WHEN 'AST_Locations4_LocationID' THEN '[AST_Locations4].[LocationID]'
                        WHEN 'AST_Locations4_LocationID DESC' THEN '[AST_Locations4].[LocationID] DESC'
                        WHEN 'AST_Locations4_Descriptions' THEN '[AST_Locations4].[Descriptions]'
                        WHEN 'AST_Locations4_Descriptions DESC' THEN '[AST_Locations4].[Descriptions] DESC'
                        WHEN 'PRK_Employees5_EmployeeID' THEN '[PRK_Employees5].[EmployeeID]'
                        WHEN 'PRK_Employees5_EmployeeID DESC' THEN '[PRK_Employees5].[EmployeeID] DESC'
                        WHEN 'PRK_Employees5_CardNo' THEN '[PRK_Employees5].[CardNo]'
                        WHEN 'PRK_Employees5_CardNo DESC' THEN '[PRK_Employees5].[CardNo] DESC'
                        WHEN 'PRK_Employees5_EmployeeName' THEN '[PRK_Employees5].[EmployeeName]'
                        WHEN 'PRK_Employees5_EmployeeName DESC' THEN '[PRK_Employees5].[EmployeeName] DESC'
                        WHEN 'PRK_Employees5_PostedAt' THEN '[PRK_Employees5].[PostedAt]'
                        WHEN 'PRK_Employees5_PostedAt DESC' THEN '[PRK_Employees5].[PostedAt] DESC'
                        WHEN 'PRK_Employees5_Department' THEN '[PRK_Employees5].[Department]'
                        WHEN 'PRK_Employees5_Department DESC' THEN '[PRK_Employees5].[Department] DESC'
                        WHEN 'PRK_Employees5_Company' THEN '[PRK_Employees5].[Company]'
                        WHEN 'PRK_Employees5_Company DESC' THEN '[PRK_Employees5].[Company] DESC'
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
                        ELSE '[AST_AssetDetails].[AssetID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[AST_AssetDetails].[AssetID],
		[AST_AssetDetails].[MrnID],
		[AST_AssetDetails].[AssetTypeID],
		[AST_AssetDetails].[BrandID],
		[AST_AssetDetails].[Model],
		[AST_AssetDetails].[Features],
		[AST_AssetDetails].[SerialNo],
		[AST_AssetDetails].[AssetNo],
		[AST_AssetDetails].[LocationID],
		[AST_AssetDetails].[UserID],
		[AST_AssetDetails].[Remarks],
		[AST_AssetDetails].[Discarded],
		[AST_AssetDetails].[ModifiedBy],
		[AST_AssetDetails].[ModifiedOn],
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
		[AST_AssetTypes2].[AssetTypeID] AS AST_AssetTypes2_AssetTypeID,
		[AST_AssetTypes2].[Description] AS AST_AssetTypes2_Description,
		[AST_Brands3].[BrandID] AS AST_Brands3_BrandID,
		[AST_Brands3].[Description] AS AST_Brands3_Description,
		[AST_Locations4].[LocationID] AS AST_Locations4_LocationID,
		[AST_Locations4].[Descriptions] AS AST_Locations4_Descriptions,
		[PRK_Employees5].[EmployeeID] AS PRK_Employees5_EmployeeID,
		[PRK_Employees5].[CardNo] AS PRK_Employees5_CardNo,
		[PRK_Employees5].[EmployeeName] AS PRK_Employees5_EmployeeName,
		[PRK_Employees5].[PostedAt] AS PRK_Employees5_PostedAt,
		[PRK_Employees5].[Department] AS PRK_Employees5_Department,
		[PRK_Employees5].[Company] AS PRK_Employees5_Company,
		[PRK_Employees6].[EmployeeID] AS PRK_Employees6_EmployeeID,
		[PRK_Employees6].[CardNo] AS PRK_Employees6_CardNo,
		[PRK_Employees6].[EmployeeName] AS PRK_Employees6_EmployeeName,
		[PRK_Employees6].[PostedAt] AS PRK_Employees6_PostedAt,
		[PRK_Employees6].[Department] AS PRK_Employees6_Department,
		[PRK_Employees6].[Company] AS PRK_Employees6_Company 
  FROM [AST_AssetDetails] 
    	INNER JOIN #PageIndex
          ON [AST_AssetDetails].[AssetID] = #PageIndex.AssetID
  LEFT OUTER JOIN [AST_MRNAsset] AS [AST_MRNAsset1]
    ON [AST_AssetDetails].[MrnID] = [AST_MRNAsset1].[MrnID]
  LEFT OUTER JOIN [AST_AssetTypes] AS [AST_AssetTypes2]
    ON [AST_AssetDetails].[AssetTypeID] = [AST_AssetTypes2].[AssetTypeID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands3]
    ON [AST_AssetDetails].[BrandID] = [AST_Brands3].[BrandID]
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations4]
    ON [AST_AssetDetails].[LocationID] = [AST_Locations4].[LocationID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]
    ON [AST_AssetDetails].[UserID] = [PRK_Employees5].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees6]
    ON [AST_AssetDetails].[ModifiedBy] = [PRK_Employees6].[EmployeeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
