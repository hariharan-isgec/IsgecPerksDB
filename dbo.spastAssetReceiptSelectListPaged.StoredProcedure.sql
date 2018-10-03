USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetReceiptSelectListPaged]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  MrnID Int NOT NULL
  )
  INSERT INTO #PageIndex (MrnID)
  SELECT [AST_MRNAsset].[MrnID] FROM [AST_MRNAsset]
  LEFT OUTER JOIN [AST_AssetTypes] AS [AST_AssetTypes1]
    ON [AST_MRNAsset].[AssetTypeID] = [AST_AssetTypes1].[AssetTypeID]
  INNER JOIN [AST_Suppliers] AS [AST_Suppliers2]
    ON [AST_MRNAsset].[SupplierID] = [AST_Suppliers2].[SupplierID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands3]
    ON [AST_MRNAsset].[BrandID] = [AST_Brands3].[BrandID]
  ORDER BY
     CASE @orderBy WHEN 'MrnID' THEN [AST_MRNAsset].[MrnID] END,
     CASE @orderBy WHEN 'MrnID DESC' THEN [AST_MRNAsset].[MrnID] END DESC,
     CASE @orderBy WHEN 'MrnDate' THEN [AST_MRNAsset].[MrnDate] END,
     CASE @orderBy WHEN 'MrnDate DESC' THEN [AST_MRNAsset].[MrnDate] END DESC,
     CASE @orderBy WHEN 'MrnDescription' THEN [AST_MRNAsset].[MrnDescription] END,
     CASE @orderBy WHEN 'MrnDescription DESC' THEN [AST_MRNAsset].[MrnDescription] END DESC,
     CASE @orderBy WHEN 'AssetTypeID' THEN [AST_MRNAsset].[AssetTypeID] END,
     CASE @orderBy WHEN 'AssetTypeID DESC' THEN [AST_MRNAsset].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'DateOfPurchase' THEN [AST_MRNAsset].[DateOfPurchase] END,
     CASE @orderBy WHEN 'DateOfPurchase DESC' THEN [AST_MRNAsset].[DateOfPurchase] END DESC,
     CASE @orderBy WHEN 'WarrantyTill' THEN [AST_MRNAsset].[WarrantyTill] END,
     CASE @orderBy WHEN 'WarrantyTill DESC' THEN [AST_MRNAsset].[WarrantyTill] END DESC,
     CASE @orderBy WHEN 'InsuranceTill' THEN [AST_MRNAsset].[InsuranceTill] END,
     CASE @orderBy WHEN 'InsuranceTill DESC' THEN [AST_MRNAsset].[InsuranceTill] END DESC,
     CASE @orderBy WHEN 'SupplierID' THEN [AST_MRNAsset].[SupplierID] END,
     CASE @orderBy WHEN 'SupplierID DESC' THEN [AST_MRNAsset].[SupplierID] END DESC,
     CASE @orderBy WHEN 'BrandID' THEN [AST_MRNAsset].[BrandID] END,
     CASE @orderBy WHEN 'BrandID DESC' THEN [AST_MRNAsset].[BrandID] END DESC,
     CASE @orderBy WHEN 'Model' THEN [AST_MRNAsset].[Model] END,
     CASE @orderBy WHEN 'Model DESC' THEN [AST_MRNAsset].[Model] END DESC,
     CASE @orderBy WHEN 'PurchasedQuantity' THEN [AST_MRNAsset].[PurchasedQuantity] END,
     CASE @orderBy WHEN 'PurchasedQuantity DESC' THEN [AST_MRNAsset].[PurchasedQuantity] END DESC,
     CASE @orderBy WHEN 'IssuedQuantity' THEN [AST_MRNAsset].[IssuedQuantity] END,
     CASE @orderBy WHEN 'IssuedQuantity DESC' THEN [AST_MRNAsset].[IssuedQuantity] END DESC,
     CASE @orderBy WHEN 'WriteoffQuantity' THEN [AST_MRNAsset].[WriteoffQuantity] END,
     CASE @orderBy WHEN 'WriteoffQuantity DESC' THEN [AST_MRNAsset].[WriteoffQuantity] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [AST_MRNAsset].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [AST_MRNAsset].[Remarks] END DESC,
     CASE @orderBy WHEN 'AST_AssetTypes1_AssetTypeID' THEN [AST_AssetTypes1].[AssetTypeID] END,
     CASE @orderBy WHEN 'AST_AssetTypes1_AssetTypeID DESC' THEN [AST_AssetTypes1].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'AST_AssetTypes1_Description' THEN [AST_AssetTypes1].[Description] END,
     CASE @orderBy WHEN 'AST_AssetTypes1_Description DESC' THEN [AST_AssetTypes1].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Suppliers2_SupplierID' THEN [AST_Suppliers2].[SupplierID] END,
     CASE @orderBy WHEN 'AST_Suppliers2_SupplierID DESC' THEN [AST_Suppliers2].[SupplierID] END DESC,
     CASE @orderBy WHEN 'AST_Suppliers2_Description' THEN [AST_Suppliers2].[Description] END,
     CASE @orderBy WHEN 'AST_Suppliers2_Description DESC' THEN [AST_Suppliers2].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Brands3_BrandID' THEN [AST_Brands3].[BrandID] END,
     CASE @orderBy WHEN 'AST_Brands3_BrandID DESC' THEN [AST_Brands3].[BrandID] END DESC,
     CASE @orderBy WHEN 'AST_Brands3_Description' THEN [AST_Brands3].[Description] END,
     CASE @orderBy WHEN 'AST_Brands3_Description DESC' THEN [AST_Brands3].[Description] END DESC 

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
GO
