USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetIssueSelectByID]
  @AssetID Int
  AS
  SELECT
		[AST_AssetDetails].[AssetID],
		[AST_AssetDetails].[MrnID],
		[AST_AssetDetails].[AssetTypeID],
		[AST_AssetDetails].[BrandID],
		[AST_AssetDetails].[Model],
		[AST_AssetDetails].[Features],
		[AST_AssetDetails].[SerialNo],
		[AST_AssetDetails].[AssetNo],
		[AST_AssetDetails].[Remarks],
		[AST_AssetDetails].[LocationID],
		[AST_AssetDetails].[UserID],
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
  [AST_AssetDetails].[AssetID] = @AssetID
GO
