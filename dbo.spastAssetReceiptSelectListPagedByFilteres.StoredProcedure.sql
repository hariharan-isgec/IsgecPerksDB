USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetReceiptSelectListPagedByFilteres]
  @Filter_AssetTypeID Int,
  @Filter_SupplierID Int,
  @Filter_BrandID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  MrnID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (MrnID) ' + 
               'SELECT [AST_MRNAsset].[MrnID] FROM [AST_MRNAsset] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_AssetTypes] AS [AST_AssetTypes1]'
  SET @LGSQL = @LGSQL + '    ON [AST_MRNAsset].[AssetTypeID] = [AST_AssetTypes1].[AssetTypeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [AST_Suppliers] AS [AST_Suppliers2]'
  SET @LGSQL = @LGSQL + '    ON [AST_MRNAsset].[SupplierID] = [AST_Suppliers2].[SupplierID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands3]'
  SET @LGSQL = @LGSQL + '    ON [AST_MRNAsset].[BrandID] = [AST_Brands3].[BrandID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_AssetTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_MRNAsset].[AssetTypeID] = ' + STR(@Filter_AssetTypeID)
  IF (@Filter_SupplierID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_MRNAsset].[SupplierID] = ' + STR(@Filter_SupplierID)
  IF (@Filter_BrandID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_MRNAsset].[BrandID] = ' + STR(@Filter_BrandID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'MrnID' THEN '[AST_MRNAsset].[MrnID]'
                        WHEN 'MrnID DESC' THEN '[AST_MRNAsset].[MrnID] DESC'
                        WHEN 'MrnDate' THEN '[AST_MRNAsset].[MrnDate]'
                        WHEN 'MrnDate DESC' THEN '[AST_MRNAsset].[MrnDate] DESC'
                        WHEN 'MrnDescription' THEN '[AST_MRNAsset].[MrnDescription]'
                        WHEN 'MrnDescription DESC' THEN '[AST_MRNAsset].[MrnDescription] DESC'
                        WHEN 'AssetTypeID' THEN '[AST_MRNAsset].[AssetTypeID]'
                        WHEN 'AssetTypeID DESC' THEN '[AST_MRNAsset].[AssetTypeID] DESC'
                        WHEN 'DateOfPurchase' THEN '[AST_MRNAsset].[DateOfPurchase]'
                        WHEN 'DateOfPurchase DESC' THEN '[AST_MRNAsset].[DateOfPurchase] DESC'
                        WHEN 'WarrantyTill' THEN '[AST_MRNAsset].[WarrantyTill]'
                        WHEN 'WarrantyTill DESC' THEN '[AST_MRNAsset].[WarrantyTill] DESC'
                        WHEN 'InsuranceTill' THEN '[AST_MRNAsset].[InsuranceTill]'
                        WHEN 'InsuranceTill DESC' THEN '[AST_MRNAsset].[InsuranceTill] DESC'
                        WHEN 'SupplierID' THEN '[AST_MRNAsset].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[AST_MRNAsset].[SupplierID] DESC'
                        WHEN 'BrandID' THEN '[AST_MRNAsset].[BrandID]'
                        WHEN 'BrandID DESC' THEN '[AST_MRNAsset].[BrandID] DESC'
                        WHEN 'Model' THEN '[AST_MRNAsset].[Model]'
                        WHEN 'Model DESC' THEN '[AST_MRNAsset].[Model] DESC'
                        WHEN 'PurchasedQuantity' THEN '[AST_MRNAsset].[PurchasedQuantity]'
                        WHEN 'PurchasedQuantity DESC' THEN '[AST_MRNAsset].[PurchasedQuantity] DESC'
                        WHEN 'IssuedQuantity' THEN '[AST_MRNAsset].[IssuedQuantity]'
                        WHEN 'IssuedQuantity DESC' THEN '[AST_MRNAsset].[IssuedQuantity] DESC'
                        WHEN 'WriteoffQuantity' THEN '[AST_MRNAsset].[WriteoffQuantity]'
                        WHEN 'WriteoffQuantity DESC' THEN '[AST_MRNAsset].[WriteoffQuantity] DESC'
                        WHEN 'Remarks' THEN '[AST_MRNAsset].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[AST_MRNAsset].[Remarks] DESC'
                        WHEN 'AST_AssetTypes1_AssetTypeID' THEN '[AST_AssetTypes1].[AssetTypeID]'
                        WHEN 'AST_AssetTypes1_AssetTypeID DESC' THEN '[AST_AssetTypes1].[AssetTypeID] DESC'
                        WHEN 'AST_AssetTypes1_Description' THEN '[AST_AssetTypes1].[Description]'
                        WHEN 'AST_AssetTypes1_Description DESC' THEN '[AST_AssetTypes1].[Description] DESC'
                        WHEN 'AST_Suppliers2_SupplierID' THEN '[AST_Suppliers2].[SupplierID]'
                        WHEN 'AST_Suppliers2_SupplierID DESC' THEN '[AST_Suppliers2].[SupplierID] DESC'
                        WHEN 'AST_Suppliers2_Description' THEN '[AST_Suppliers2].[Description]'
                        WHEN 'AST_Suppliers2_Description DESC' THEN '[AST_Suppliers2].[Description] DESC'
                        WHEN 'AST_Brands3_BrandID' THEN '[AST_Brands3].[BrandID]'
                        WHEN 'AST_Brands3_BrandID DESC' THEN '[AST_Brands3].[BrandID] DESC'
                        WHEN 'AST_Brands3_Description' THEN '[AST_Brands3].[Description]'
                        WHEN 'AST_Brands3_Description DESC' THEN '[AST_Brands3].[Description] DESC'
                        ELSE '[AST_MRNAsset].[MrnID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[AST_MRNAsset].[MrnID],
		[AST_MRNAsset].[MrnDate],
		[AST_MRNAsset].[MrnDescription],
		[AST_MRNAsset].[AssetTypeID],
		[AST_MRNAsset].[DateOfPurchase],
		[AST_MRNAsset].[WarrantyTill],
		[AST_MRNAsset].[InsuranceTill],
		[AST_MRNAsset].[SupplierID],
		[AST_MRNAsset].[BrandID],
		[AST_MRNAsset].[Model],
		[AST_MRNAsset].[PurchasedQuantity],
		[AST_MRNAsset].[IssuedQuantity],
		[AST_MRNAsset].[WriteoffQuantity],
		[AST_MRNAsset].[Remarks],
		[AST_AssetTypes1].[AssetTypeID] AS AST_AssetTypes1_AssetTypeID,
		[AST_AssetTypes1].[Description] AS AST_AssetTypes1_Description,
		[AST_Suppliers2].[SupplierID] AS AST_Suppliers2_SupplierID,
		[AST_Suppliers2].[Description] AS AST_Suppliers2_Description,
		[AST_Brands3].[BrandID] AS AST_Brands3_BrandID,
		[AST_Brands3].[Description] AS AST_Brands3_Description 
  FROM [AST_MRNAsset] 
    	INNER JOIN #PageIndex
          ON [AST_MRNAsset].[MrnID] = #PageIndex.MrnID
  LEFT OUTER JOIN [AST_AssetTypes] AS [AST_AssetTypes1]
    ON [AST_MRNAsset].[AssetTypeID] = [AST_AssetTypes1].[AssetTypeID]
  INNER JOIN [AST_Suppliers] AS [AST_Suppliers2]
    ON [AST_MRNAsset].[SupplierID] = [AST_Suppliers2].[SupplierID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands3]
    ON [AST_MRNAsset].[BrandID] = [AST_Brands3].[BrandID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
