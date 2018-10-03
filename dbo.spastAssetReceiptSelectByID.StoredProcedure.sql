USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetReceiptSelectByID]
  @MrnID Int
  AS
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
  LEFT OUTER JOIN [AST_AssetTypes] AS [AST_AssetTypes1]
    ON [AST_MRNAsset].[AssetTypeID] = [AST_AssetTypes1].[AssetTypeID]
  INNER JOIN [AST_Suppliers] AS [AST_Suppliers2]
    ON [AST_MRNAsset].[SupplierID] = [AST_Suppliers2].[SupplierID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands3]
    ON [AST_MRNAsset].[BrandID] = [AST_Brands3].[BrandID]
  WHERE
  [AST_MRNAsset].[MrnID] = @MrnID
GO
