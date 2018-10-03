USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetHistorySelectByID]
  @HistoryID Int
  AS
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
  [AST_AssetHistory].[HistoryID] = @HistoryID
GO
