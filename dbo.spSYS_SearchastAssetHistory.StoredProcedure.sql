USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchastAssetHistory]
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
  WHERE STR(ISNULL([AST_AssetHistory].[HistoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_AssetHistory].[HistoryType],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetHistory].[MrnID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetHistory].[AssetID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetHistory].[AssetTypeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetHistory].[BrandID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_AssetHistory].[Model],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_AssetHistory].[Features],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_AssetHistory].[AssetNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_AssetHistory].[SerialNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetHistory].[LocationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetHistory].[UserID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_AssetHistory].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetHistory].[ModifiedBy], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MRNAsset1].[MrnDescription],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_MRNAsset1].[AssetTypeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MRNAsset1].[SupplierID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MRNAsset1].[BrandID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MRNAsset1].[Model],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_MRNAsset1].[PurchasedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MRNAsset1].[IssuedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MRNAsset1].[WriteoffQuantity], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MRNAsset1].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetDetails2].[MrnID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetDetails2].[AssetTypeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetDetails2].[BrandID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetDetails2].[UserID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetDetails2].[LocationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_AssetDetails2].[Model],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_AssetDetails2].[Features],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_AssetDetails2].[SerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_AssetDetails2].[AssetNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_AssetDetails2].[ModifiedBy], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_AssetTypes3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Brands4].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Locations5].[Descriptions],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees6].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees6].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees6].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees6].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees6].[Company],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees7].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees7].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees7].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees7].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees7].[Company],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [AST_AssetHistory].[HistoryID] AS SearchCode, 
  ISNULL([AST_AssetHistory].[HistoryType],'') 
  + ',' + STR(ISNULL([AST_AssetHistory].[MrnID],0)) 
  + ',' + STR(ISNULL([AST_AssetHistory].[AssetID],0)) 
  + ',' + STR(ISNULL([AST_AssetHistory].[AssetTypeID],0)) 
  + ',' + STR(ISNULL([AST_AssetHistory].[BrandID],0)) 
  + ',' + ISNULL([AST_AssetHistory].[Model],'') 
  + ',' + ISNULL([AST_AssetHistory].[Features],'') 
  + ',' + ISNULL([AST_AssetHistory].[AssetNo],'') 
  + ',' + ISNULL([AST_AssetHistory].[SerialNo],'') 
  + ',' + STR(ISNULL([AST_AssetHistory].[LocationID],0)) 
  + ',' + STR(ISNULL([AST_AssetHistory].[UserID],0)) 
  + ',' + ISNULL([AST_AssetHistory].[Remarks],'') 
  + ',' + STR(ISNULL([AST_AssetHistory].[ModifiedBy],0)) 
  + ',' + ISNULL([AST_MRNAsset1].[MrnDescription],'') 
  + ',' + STR(ISNULL([AST_MRNAsset1].[AssetTypeID],0)) 
  + ',' + STR(ISNULL([AST_MRNAsset1].[SupplierID],0)) 
  + ',' + STR(ISNULL([AST_MRNAsset1].[BrandID],0)) 
  + ',' + ISNULL([AST_MRNAsset1].[Model],'') 
  + ',' + STR(ISNULL([AST_MRNAsset1].[PurchasedQuantity],0)) 
  + ',' + STR(ISNULL([AST_MRNAsset1].[IssuedQuantity],0)) 
  + ',' + STR(ISNULL([AST_MRNAsset1].[WriteoffQuantity],0)) 
  + ',' + ISNULL([AST_MRNAsset1].[Remarks],'') 
  + ',' + STR(ISNULL([AST_AssetDetails2].[MrnID],0)) 
  + ',' + STR(ISNULL([AST_AssetDetails2].[AssetTypeID],0)) 
  + ',' + STR(ISNULL([AST_AssetDetails2].[BrandID],0)) 
  + ',' + STR(ISNULL([AST_AssetDetails2].[UserID],0)) 
  + ',' + STR(ISNULL([AST_AssetDetails2].[LocationID],0)) 
  + ',' + ISNULL([AST_AssetDetails2].[Model],'') 
  + ',' + ISNULL([AST_AssetDetails2].[Features],'') 
  + ',' + ISNULL([AST_AssetDetails2].[SerialNo],'') 
  + ',' + ISNULL([AST_AssetDetails2].[AssetNo],'') 
  + ',' + STR(ISNULL([AST_AssetDetails2].[ModifiedBy],0)) 
  + ',' + ISNULL([AST_AssetTypes3].[Description],'') 
  + ',' + ISNULL([AST_Brands4].[Description],'') 
  + ',' + ISNULL([AST_Locations5].[Descriptions],'') 
  + ',' + ISNULL([PRK_Employees6].[CardNo],'') 
  + ',' + ISNULL([PRK_Employees6].[EmployeeName],'') 
  + ',' + ISNULL([PRK_Employees6].[PostedAt],'') 
  + ',' + ISNULL([PRK_Employees6].[Department],'') 
  + ',' + ISNULL([PRK_Employees6].[Company],'') 
  + ',' + ISNULL([PRK_Employees7].[CardNo],'') 
  + ',' + ISNULL([PRK_Employees7].[EmployeeName],'') 
  + ',' + ISNULL([PRK_Employees7].[PostedAt],'') 
  + ',' + ISNULL([PRK_Employees7].[Department],'') 
  + ',' + ISNULL([PRK_Employees7].[Company],'') 
  AS SearchDescription 
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
