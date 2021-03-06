USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetDetailsSelectListPaged]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  AssetID Int NOT NULL
  )
  INSERT INTO #PageIndex (AssetID)
  SELECT [AST_AssetDetails].[AssetID] FROM [AST_AssetDetails]
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
  ORDER BY
     CASE @orderBy WHEN 'AssetID' THEN [AST_AssetDetails].[AssetID] END,
     CASE @orderBy WHEN 'AssetID DESC' THEN [AST_AssetDetails].[AssetID] END DESC,
     CASE @orderBy WHEN 'MrnID' THEN [AST_AssetDetails].[MrnID] END,
     CASE @orderBy WHEN 'MrnID DESC' THEN [AST_AssetDetails].[MrnID] END DESC,
     CASE @orderBy WHEN 'AssetTypeID' THEN [AST_AssetDetails].[AssetTypeID] END,
     CASE @orderBy WHEN 'AssetTypeID DESC' THEN [AST_AssetDetails].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'BrandID' THEN [AST_AssetDetails].[BrandID] END,
     CASE @orderBy WHEN 'BrandID DESC' THEN [AST_AssetDetails].[BrandID] END DESC,
     CASE @orderBy WHEN 'Model' THEN [AST_AssetDetails].[Model] END,
     CASE @orderBy WHEN 'Model DESC' THEN [AST_AssetDetails].[Model] END DESC,
     CASE @orderBy WHEN 'Features' THEN [AST_AssetDetails].[Features] END,
     CASE @orderBy WHEN 'Features DESC' THEN [AST_AssetDetails].[Features] END DESC,
     CASE @orderBy WHEN 'AssetNo' THEN [AST_AssetDetails].[AssetNo] END,
     CASE @orderBy WHEN 'AssetNo DESC' THEN [AST_AssetDetails].[AssetNo] END DESC,
     CASE @orderBy WHEN 'SerialNo' THEN [AST_AssetDetails].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [AST_AssetDetails].[SerialNo] END DESC,
     CASE @orderBy WHEN 'LocationID' THEN [AST_AssetDetails].[LocationID] END,
     CASE @orderBy WHEN 'LocationID DESC' THEN [AST_AssetDetails].[LocationID] END DESC,
     CASE @orderBy WHEN 'UserID' THEN [AST_AssetDetails].[UserID] END,
     CASE @orderBy WHEN 'UserID DESC' THEN [AST_AssetDetails].[UserID] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [AST_AssetDetails].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [AST_AssetDetails].[Remarks] END DESC,
     CASE @orderBy WHEN 'Discarded' THEN [AST_AssetDetails].[Discarded] END,
     CASE @orderBy WHEN 'Discarded DESC' THEN [AST_AssetDetails].[Discarded] END DESC,
     CASE @orderBy WHEN 'ModifiedBy' THEN [AST_AssetDetails].[ModifiedBy] END,
     CASE @orderBy WHEN 'ModifiedBy DESC' THEN [AST_AssetDetails].[ModifiedBy] END DESC,
     CASE @orderBy WHEN 'ModifiedOn' THEN [AST_AssetDetails].[ModifiedOn] END,
     CASE @orderBy WHEN 'ModifiedOn DESC' THEN [AST_AssetDetails].[ModifiedOn] END DESC,
     CASE @orderBy WHEN 'AST_MRNAsset1_MrnID' THEN [AST_MRNAsset1].[MrnID] END,
     CASE @orderBy WHEN 'AST_MRNAsset1_MrnID DESC' THEN [AST_MRNAsset1].[MrnID] END DESC,
     CASE @orderBy WHEN 'AST_MRNAsset1_MrnDate' THEN [AST_MRNAsset1].[MrnDate] END,
     CASE @orderBy WHEN 'AST_MRNAsset1_MrnDate DESC' THEN [AST_MRNAsset1].[MrnDate] END DESC,
     CASE @orderBy WHEN 'AST_MRNAsset1_MrnDescription' THEN [AST_MRNAsset1].[MrnDescription] END,
     CASE @orderBy WHEN 'AST_MRNAsset1_MrnDescription DESC' THEN [AST_MRNAsset1].[MrnDescription] END DESC,
     CASE @orderBy WHEN 'AST_MRNAsset1_AssetTypeID' THEN [AST_MRNAsset1].[AssetTypeID] END,
     CASE @orderBy WHEN 'AST_MRNAsset1_AssetTypeID DESC' THEN [AST_MRNAsset1].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'AST_MRNAsset1_DateOfPurchase' THEN [AST_MRNAsset1].[DateOfPurchase] END,
     CASE @orderBy WHEN 'AST_MRNAsset1_DateOfPurchase DESC' THEN [AST_MRNAsset1].[DateOfPurchase] END DESC,
     CASE @orderBy WHEN 'AST_MRNAsset1_WarrantyTill' THEN [AST_MRNAsset1].[WarrantyTill] END,
     CASE @orderBy WHEN 'AST_MRNAsset1_WarrantyTill DESC' THEN [AST_MRNAsset1].[WarrantyTill] END DESC,
     CASE @orderBy WHEN 'AST_MRNAsset1_InsuranceTill' THEN [AST_MRNAsset1].[InsuranceTill] END,
     CASE @orderBy WHEN 'AST_MRNAsset1_InsuranceTill DESC' THEN [AST_MRNAsset1].[InsuranceTill] END DESC,
     CASE @orderBy WHEN 'AST_MRNAsset1_SupplierID' THEN [AST_MRNAsset1].[SupplierID] END,
     CASE @orderBy WHEN 'AST_MRNAsset1_SupplierID DESC' THEN [AST_MRNAsset1].[SupplierID] END DESC,
     CASE @orderBy WHEN 'AST_MRNAsset1_BrandID' THEN [AST_MRNAsset1].[BrandID] END,
     CASE @orderBy WHEN 'AST_MRNAsset1_BrandID DESC' THEN [AST_MRNAsset1].[BrandID] END DESC,
     CASE @orderBy WHEN 'AST_MRNAsset1_Model' THEN [AST_MRNAsset1].[Model] END,
     CASE @orderBy WHEN 'AST_MRNAsset1_Model DESC' THEN [AST_MRNAsset1].[Model] END DESC,
     CASE @orderBy WHEN 'AST_MRNAsset1_PurchasedQuantity' THEN [AST_MRNAsset1].[PurchasedQuantity] END,
     CASE @orderBy WHEN 'AST_MRNAsset1_PurchasedQuantity DESC' THEN [AST_MRNAsset1].[PurchasedQuantity] END DESC,
     CASE @orderBy WHEN 'AST_MRNAsset1_IssuedQuantity' THEN [AST_MRNAsset1].[IssuedQuantity] END,
     CASE @orderBy WHEN 'AST_MRNAsset1_IssuedQuantity DESC' THEN [AST_MRNAsset1].[IssuedQuantity] END DESC,
     CASE @orderBy WHEN 'AST_MRNAsset1_WriteoffQuantity' THEN [AST_MRNAsset1].[WriteoffQuantity] END,
     CASE @orderBy WHEN 'AST_MRNAsset1_WriteoffQuantity DESC' THEN [AST_MRNAsset1].[WriteoffQuantity] END DESC,
     CASE @orderBy WHEN 'AST_MRNAsset1_Remarks' THEN [AST_MRNAsset1].[Remarks] END,
     CASE @orderBy WHEN 'AST_MRNAsset1_Remarks DESC' THEN [AST_MRNAsset1].[Remarks] END DESC,
     CASE @orderBy WHEN 'AST_AssetTypes2_AssetTypeID' THEN [AST_AssetTypes2].[AssetTypeID] END,
     CASE @orderBy WHEN 'AST_AssetTypes2_AssetTypeID DESC' THEN [AST_AssetTypes2].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'AST_AssetTypes2_Description' THEN [AST_AssetTypes2].[Description] END,
     CASE @orderBy WHEN 'AST_AssetTypes2_Description DESC' THEN [AST_AssetTypes2].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Brands3_BrandID' THEN [AST_Brands3].[BrandID] END,
     CASE @orderBy WHEN 'AST_Brands3_BrandID DESC' THEN [AST_Brands3].[BrandID] END DESC,
     CASE @orderBy WHEN 'AST_Brands3_Description' THEN [AST_Brands3].[Description] END,
     CASE @orderBy WHEN 'AST_Brands3_Description DESC' THEN [AST_Brands3].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Locations4_LocationID' THEN [AST_Locations4].[LocationID] END,
     CASE @orderBy WHEN 'AST_Locations4_LocationID DESC' THEN [AST_Locations4].[LocationID] END DESC,
     CASE @orderBy WHEN 'AST_Locations4_Descriptions' THEN [AST_Locations4].[Descriptions] END,
     CASE @orderBy WHEN 'AST_Locations4_Descriptions DESC' THEN [AST_Locations4].[Descriptions] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_EmployeeID' THEN [PRK_Employees5].[EmployeeID] END,
     CASE @orderBy WHEN 'PRK_Employees5_EmployeeID DESC' THEN [PRK_Employees5].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_CardNo' THEN [PRK_Employees5].[CardNo] END,
     CASE @orderBy WHEN 'PRK_Employees5_CardNo DESC' THEN [PRK_Employees5].[CardNo] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_EmployeeName' THEN [PRK_Employees5].[EmployeeName] END,
     CASE @orderBy WHEN 'PRK_Employees5_EmployeeName DESC' THEN [PRK_Employees5].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_PostedAt' THEN [PRK_Employees5].[PostedAt] END,
     CASE @orderBy WHEN 'PRK_Employees5_PostedAt DESC' THEN [PRK_Employees5].[PostedAt] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_Department' THEN [PRK_Employees5].[Department] END,
     CASE @orderBy WHEN 'PRK_Employees5_Department DESC' THEN [PRK_Employees5].[Department] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_Company' THEN [PRK_Employees5].[Company] END,
     CASE @orderBy WHEN 'PRK_Employees5_Company DESC' THEN [PRK_Employees5].[Company] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_EmployeeID' THEN [PRK_Employees6].[EmployeeID] END,
     CASE @orderBy WHEN 'PRK_Employees6_EmployeeID DESC' THEN [PRK_Employees6].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_CardNo' THEN [PRK_Employees6].[CardNo] END,
     CASE @orderBy WHEN 'PRK_Employees6_CardNo DESC' THEN [PRK_Employees6].[CardNo] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_EmployeeName' THEN [PRK_Employees6].[EmployeeName] END,
     CASE @orderBy WHEN 'PRK_Employees6_EmployeeName DESC' THEN [PRK_Employees6].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_PostedAt' THEN [PRK_Employees6].[PostedAt] END,
     CASE @orderBy WHEN 'PRK_Employees6_PostedAt DESC' THEN [PRK_Employees6].[PostedAt] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_Department' THEN [PRK_Employees6].[Department] END,
     CASE @orderBy WHEN 'PRK_Employees6_Department DESC' THEN [PRK_Employees6].[Department] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_Company' THEN [PRK_Employees6].[Company] END,
     CASE @orderBy WHEN 'PRK_Employees6_Company DESC' THEN [PRK_Employees6].[Company] END DESC 

  SET @RecordCount = @@RowCount

  SELECT
		[AST_AssetDetails].[AssetID],
		[AST_AssetDetails].[MrnID],
		[AST_AssetDetails].[AssetTypeID],
		[AST_AssetDetails].[BrandID],
		[AST_AssetDetails].[Model],
		[AST_AssetDetails].[Features],
		[AST_AssetDetails].[AssetNo],
		[AST_AssetDetails].[SerialNo],
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
GO
