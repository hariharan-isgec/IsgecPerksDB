USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchastAssetReceipt]
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
  WHERE STR(ISNULL([AST_MRNAsset].[MrnID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MRNAsset].[MrnDescription],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_MRNAsset].[AssetTypeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MRNAsset].[SupplierID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MRNAsset].[BrandID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MRNAsset].[Model],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_MRNAsset].[PurchasedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MRNAsset].[IssuedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MRNAsset].[WriteoffQuantity], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MRNAsset].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_AssetTypes1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Suppliers2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Brands3].[Description],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [AST_MRNAsset].[MrnID] AS SearchCode, 
  ISNULL([AST_MRNAsset].[MrnDescription],'') 
  + ',' + STR(ISNULL([AST_MRNAsset].[AssetTypeID],0)) 
  + ',' + STR(ISNULL([AST_MRNAsset].[SupplierID],0)) 
  + ',' + STR(ISNULL([AST_MRNAsset].[BrandID],0)) 
  + ',' + ISNULL([AST_MRNAsset].[Model],'') 
  + ',' + STR(ISNULL([AST_MRNAsset].[PurchasedQuantity],0)) 
  + ',' + STR(ISNULL([AST_MRNAsset].[IssuedQuantity],0)) 
  + ',' + STR(ISNULL([AST_MRNAsset].[WriteoffQuantity],0)) 
  + ',' + ISNULL([AST_MRNAsset].[Remarks],'') 
  + ',' + ISNULL([AST_AssetTypes1].[Description],'') 
  + ',' + ISNULL([AST_Suppliers2].[Description],'') 
  + ',' + ISNULL([AST_Brands3].[Description],'') 
  AS SearchDescription 
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
