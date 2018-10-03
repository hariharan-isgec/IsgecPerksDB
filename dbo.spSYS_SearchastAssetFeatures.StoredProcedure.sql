USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchastAssetFeatures]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
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
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees4]
    ON [AST_AssetDetails].[UserID] = [PRK_Employees4].[EmployeeID]
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations5]
    ON [AST_AssetDetails].[LocationID] = [AST_Locations5].[LocationID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees6]
    ON [AST_AssetDetails].[ModifiedBy] = [PRK_Employees6].[EmployeeID]
  WHERE STR(ISNULL([AST_AssetDetails].[AssetID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetDetails].[MrnID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetDetails].[AssetTypeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetDetails].[BrandID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetDetails].[UserID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetDetails].[LocationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_AssetDetails].[Model],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_AssetDetails].[Features],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_AssetDetails].[SerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_AssetDetails].[AssetNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetDetails].[ModifiedBy], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MRNAsset1].[MrnDescription],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_MRNAsset1].[AssetTypeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MRNAsset1].[SupplierID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MRNAsset1].[BrandID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MRNAsset1].[Model],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_MRNAsset1].[PurchasedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MRNAsset1].[IssuedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MRNAsset1].[WriteoffQuantity], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MRNAsset1].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_AssetTypes2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Brands3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees4].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees4].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees4].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees4].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees4].[Company],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Locations5].[Descriptions],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees6].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees6].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees6].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees6].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees6].[Company],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [AST_AssetDetails].[AssetID] AS SearchCode, 
  STR(ISNULL([AST_AssetDetails].[MrnID],0)) 
  + ',' + STR(ISNULL([AST_AssetDetails].[AssetTypeID],0)) 
  + ',' + STR(ISNULL([AST_AssetDetails].[BrandID],0)) 
  + ',' + STR(ISNULL([AST_AssetDetails].[UserID],0)) 
  + ',' + STR(ISNULL([AST_AssetDetails].[LocationID],0)) 
  + ',' + ISNULL([AST_AssetDetails].[Model],'') 
  + ',' + ISNULL([AST_AssetDetails].[Features],'') 
  + ',' + ISNULL([AST_AssetDetails].[SerialNo],'') 
  + ',' + ISNULL([AST_AssetDetails].[AssetNo],'') 
  + ',' + STR(ISNULL([AST_AssetDetails].[ModifiedBy],0)) 
  + ',' + ISNULL([AST_MRNAsset1].[MrnDescription],'') 
  + ',' + STR(ISNULL([AST_MRNAsset1].[AssetTypeID],0)) 
  + ',' + STR(ISNULL([AST_MRNAsset1].[SupplierID],0)) 
  + ',' + STR(ISNULL([AST_MRNAsset1].[BrandID],0)) 
  + ',' + ISNULL([AST_MRNAsset1].[Model],'') 
  + ',' + STR(ISNULL([AST_MRNAsset1].[PurchasedQuantity],0)) 
  + ',' + STR(ISNULL([AST_MRNAsset1].[IssuedQuantity],0)) 
  + ',' + STR(ISNULL([AST_MRNAsset1].[WriteoffQuantity],0)) 
  + ',' + ISNULL([AST_MRNAsset1].[Remarks],'') 
  + ',' + ISNULL([AST_AssetTypes2].[Description],'') 
  + ',' + ISNULL([AST_Brands3].[Description],'') 
  + ',' + ISNULL([PRK_Employees4].[CardNo],'') 
  + ',' + ISNULL([PRK_Employees4].[EmployeeName],'') 
  + ',' + ISNULL([PRK_Employees4].[PostedAt],'') 
  + ',' + ISNULL([PRK_Employees4].[Department],'') 
  + ',' + ISNULL([PRK_Employees4].[Company],'') 
  + ',' + ISNULL([AST_Locations5].[Descriptions],'') 
  + ',' + ISNULL([PRK_Employees6].[CardNo],'') 
  + ',' + ISNULL([PRK_Employees6].[EmployeeName],'') 
  + ',' + ISNULL([PRK_Employees6].[PostedAt],'') 
  + ',' + ISNULL([PRK_Employees6].[Department],'') 
  + ',' + ISNULL([PRK_Employees6].[Company],'') 
  AS SearchDescription 
  FROM [AST_AssetDetails] 
    	INNER JOIN #PageIndex
          ON [AST_AssetDetails].[AssetID] = #PageIndex.AssetID
  LEFT OUTER JOIN [AST_MRNAsset] AS [AST_MRNAsset1]
    ON [AST_AssetDetails].[MrnID] = [AST_MRNAsset1].[MrnID]
  LEFT OUTER JOIN [AST_AssetTypes] AS [AST_AssetTypes2]
    ON [AST_AssetDetails].[AssetTypeID] = [AST_AssetTypes2].[AssetTypeID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands3]
    ON [AST_AssetDetails].[BrandID] = [AST_Brands3].[BrandID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees4]
    ON [AST_AssetDetails].[UserID] = [PRK_Employees4].[EmployeeID]
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations5]
    ON [AST_AssetDetails].[LocationID] = [AST_Locations5].[LocationID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees6]
    ON [AST_AssetDetails].[ModifiedBy] = [PRK_Employees6].[EmployeeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
