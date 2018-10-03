USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetHistorySelectListPaged]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  HistoryID Int NOT NULL
  )
  INSERT INTO #PageIndex (HistoryID)
  SELECT [AST_AssetHistory].[HistoryID] FROM [AST_AssetHistory]
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
  ORDER BY
     CASE @orderBy WHEN 'HistoryID' THEN [AST_AssetHistory].[HistoryID] END,
     CASE @orderBy WHEN 'HistoryID DESC' THEN [AST_AssetHistory].[HistoryID] END DESC,
     CASE @orderBy WHEN 'HistoryType' THEN [AST_AssetHistory].[HistoryType] END,
     CASE @orderBy WHEN 'HistoryType DESC' THEN [AST_AssetHistory].[HistoryType] END DESC,
     CASE @orderBy WHEN 'MrnID' THEN [AST_AssetHistory].[MrnID] END,
     CASE @orderBy WHEN 'MrnID DESC' THEN [AST_AssetHistory].[MrnID] END DESC,
     CASE @orderBy WHEN 'AssetID' THEN [AST_AssetHistory].[AssetID] END,
     CASE @orderBy WHEN 'AssetID DESC' THEN [AST_AssetHistory].[AssetID] END DESC,
     CASE @orderBy WHEN 'AssetTypeID' THEN [AST_AssetHistory].[AssetTypeID] END,
     CASE @orderBy WHEN 'AssetTypeID DESC' THEN [AST_AssetHistory].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'BrandID' THEN [AST_AssetHistory].[BrandID] END,
     CASE @orderBy WHEN 'BrandID DESC' THEN [AST_AssetHistory].[BrandID] END DESC,
     CASE @orderBy WHEN 'Model' THEN [AST_AssetHistory].[Model] END,
     CASE @orderBy WHEN 'Model DESC' THEN [AST_AssetHistory].[Model] END DESC,
     CASE @orderBy WHEN 'Features' THEN [AST_AssetHistory].[Features] END,
     CASE @orderBy WHEN 'Features DESC' THEN [AST_AssetHistory].[Features] END DESC,
     CASE @orderBy WHEN 'AssetNo' THEN [AST_AssetHistory].[AssetNo] END,
     CASE @orderBy WHEN 'AssetNo DESC' THEN [AST_AssetHistory].[AssetNo] END DESC,
     CASE @orderBy WHEN 'SerialNo' THEN [AST_AssetHistory].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [AST_AssetHistory].[SerialNo] END DESC,
     CASE @orderBy WHEN 'LocationID' THEN [AST_AssetHistory].[LocationID] END,
     CASE @orderBy WHEN 'LocationID DESC' THEN [AST_AssetHistory].[LocationID] END DESC,
     CASE @orderBy WHEN 'UserID' THEN [AST_AssetHistory].[UserID] END,
     CASE @orderBy WHEN 'UserID DESC' THEN [AST_AssetHistory].[UserID] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [AST_AssetHistory].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [AST_AssetHistory].[Remarks] END DESC,
     CASE @orderBy WHEN 'Discarded' THEN [AST_AssetHistory].[Discarded] END,
     CASE @orderBy WHEN 'Discarded DESC' THEN [AST_AssetHistory].[Discarded] END DESC,
     CASE @orderBy WHEN 'ModifiedOn' THEN [AST_AssetHistory].[ModifiedOn] END,
     CASE @orderBy WHEN 'ModifiedOn DESC' THEN [AST_AssetHistory].[ModifiedOn] END DESC,
     CASE @orderBy WHEN 'ModifiedBy' THEN [AST_AssetHistory].[ModifiedBy] END,
     CASE @orderBy WHEN 'ModifiedBy DESC' THEN [AST_AssetHistory].[ModifiedBy] END DESC,
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
     CASE @orderBy WHEN 'AST_AssetDetails2_AssetID' THEN [AST_AssetDetails2].[AssetID] END,
     CASE @orderBy WHEN 'AST_AssetDetails2_AssetID DESC' THEN [AST_AssetDetails2].[AssetID] END DESC,
     CASE @orderBy WHEN 'AST_AssetDetails2_MrnID' THEN [AST_AssetDetails2].[MrnID] END,
     CASE @orderBy WHEN 'AST_AssetDetails2_MrnID DESC' THEN [AST_AssetDetails2].[MrnID] END DESC,
     CASE @orderBy WHEN 'AST_AssetDetails2_AssetTypeID' THEN [AST_AssetDetails2].[AssetTypeID] END,
     CASE @orderBy WHEN 'AST_AssetDetails2_AssetTypeID DESC' THEN [AST_AssetDetails2].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'AST_AssetDetails2_BrandID' THEN [AST_AssetDetails2].[BrandID] END,
     CASE @orderBy WHEN 'AST_AssetDetails2_BrandID DESC' THEN [AST_AssetDetails2].[BrandID] END DESC,
     CASE @orderBy WHEN 'AST_AssetDetails2_UserID' THEN [AST_AssetDetails2].[UserID] END,
     CASE @orderBy WHEN 'AST_AssetDetails2_UserID DESC' THEN [AST_AssetDetails2].[UserID] END DESC,
     CASE @orderBy WHEN 'AST_AssetDetails2_LocationID' THEN [AST_AssetDetails2].[LocationID] END,
     CASE @orderBy WHEN 'AST_AssetDetails2_LocationID DESC' THEN [AST_AssetDetails2].[LocationID] END DESC,
     CASE @orderBy WHEN 'AST_AssetDetails2_Model' THEN [AST_AssetDetails2].[Model] END,
     CASE @orderBy WHEN 'AST_AssetDetails2_Model DESC' THEN [AST_AssetDetails2].[Model] END DESC,
     CASE @orderBy WHEN 'AST_AssetDetails2_Features' THEN [AST_AssetDetails2].[Features] END,
     CASE @orderBy WHEN 'AST_AssetDetails2_Features DESC' THEN [AST_AssetDetails2].[Features] END DESC,
     CASE @orderBy WHEN 'AST_AssetDetails2_SerialNo' THEN [AST_AssetDetails2].[SerialNo] END,
     CASE @orderBy WHEN 'AST_AssetDetails2_SerialNo DESC' THEN [AST_AssetDetails2].[SerialNo] END DESC,
     CASE @orderBy WHEN 'AST_AssetDetails2_AssetNo' THEN [AST_AssetDetails2].[AssetNo] END,
     CASE @orderBy WHEN 'AST_AssetDetails2_AssetNo DESC' THEN [AST_AssetDetails2].[AssetNo] END DESC,
     CASE @orderBy WHEN 'AST_AssetDetails2_Discarded' THEN [AST_AssetDetails2].[Discarded] END,
     CASE @orderBy WHEN 'AST_AssetDetails2_Discarded DESC' THEN [AST_AssetDetails2].[Discarded] END DESC,
     CASE @orderBy WHEN 'AST_AssetDetails2_ModifiedBy' THEN [AST_AssetDetails2].[ModifiedBy] END,
     CASE @orderBy WHEN 'AST_AssetDetails2_ModifiedBy DESC' THEN [AST_AssetDetails2].[ModifiedBy] END DESC,
     CASE @orderBy WHEN 'AST_AssetDetails2_ModifiedOn' THEN [AST_AssetDetails2].[ModifiedOn] END,
     CASE @orderBy WHEN 'AST_AssetDetails2_ModifiedOn DESC' THEN [AST_AssetDetails2].[ModifiedOn] END DESC,
     CASE @orderBy WHEN 'AST_AssetTypes3_AssetTypeID' THEN [AST_AssetTypes3].[AssetTypeID] END,
     CASE @orderBy WHEN 'AST_AssetTypes3_AssetTypeID DESC' THEN [AST_AssetTypes3].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'AST_AssetTypes3_Description' THEN [AST_AssetTypes3].[Description] END,
     CASE @orderBy WHEN 'AST_AssetTypes3_Description DESC' THEN [AST_AssetTypes3].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Brands4_BrandID' THEN [AST_Brands4].[BrandID] END,
     CASE @orderBy WHEN 'AST_Brands4_BrandID DESC' THEN [AST_Brands4].[BrandID] END DESC,
     CASE @orderBy WHEN 'AST_Brands4_Description' THEN [AST_Brands4].[Description] END,
     CASE @orderBy WHEN 'AST_Brands4_Description DESC' THEN [AST_Brands4].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Locations5_LocationID' THEN [AST_Locations5].[LocationID] END,
     CASE @orderBy WHEN 'AST_Locations5_LocationID DESC' THEN [AST_Locations5].[LocationID] END DESC,
     CASE @orderBy WHEN 'AST_Locations5_Descriptions' THEN [AST_Locations5].[Descriptions] END,
     CASE @orderBy WHEN 'AST_Locations5_Descriptions DESC' THEN [AST_Locations5].[Descriptions] END DESC,
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
     CASE @orderBy WHEN 'PRK_Employees6_Company DESC' THEN [PRK_Employees6].[Company] END DESC,
     CASE @orderBy WHEN 'PRK_Employees7_EmployeeID' THEN [PRK_Employees7].[EmployeeID] END,
     CASE @orderBy WHEN 'PRK_Employees7_EmployeeID DESC' THEN [PRK_Employees7].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees7_CardNo' THEN [PRK_Employees7].[CardNo] END,
     CASE @orderBy WHEN 'PRK_Employees7_CardNo DESC' THEN [PRK_Employees7].[CardNo] END DESC,
     CASE @orderBy WHEN 'PRK_Employees7_EmployeeName' THEN [PRK_Employees7].[EmployeeName] END,
     CASE @orderBy WHEN 'PRK_Employees7_EmployeeName DESC' THEN [PRK_Employees7].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'PRK_Employees7_PostedAt' THEN [PRK_Employees7].[PostedAt] END,
     CASE @orderBy WHEN 'PRK_Employees7_PostedAt DESC' THEN [PRK_Employees7].[PostedAt] END DESC,
     CASE @orderBy WHEN 'PRK_Employees7_Department' THEN [PRK_Employees7].[Department] END,
     CASE @orderBy WHEN 'PRK_Employees7_Department DESC' THEN [PRK_Employees7].[Department] END DESC,
     CASE @orderBy WHEN 'PRK_Employees7_Company' THEN [PRK_Employees7].[Company] END,
     CASE @orderBy WHEN 'PRK_Employees7_Company DESC' THEN [PRK_Employees7].[Company] END DESC 

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
GO
