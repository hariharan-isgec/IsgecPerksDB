USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchastPCReceipts]
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
  SELECT [AST_MrnPC].[MrnID] FROM [AST_MrnPC]
  INNER JOIN [AST_MrnPC] AS [AST_MrnPC1]
    ON [AST_MrnPC].[MrnID] = [AST_MrnPC1].[MrnID]
  INNER JOIN [AST_Suppliers] AS [AST_Suppliers2]
    ON [AST_MrnPC].[SupplierID] = [AST_Suppliers2].[SupplierID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands3]
    ON [AST_MrnPC].[pcBrandID] = [AST_Brands3].[BrandID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands4]
    ON [AST_MrnPC].[cpuBrandID] = [AST_Brands4].[BrandID]
  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams5]
    ON [AST_MrnPC].[RamID] = [AST_Rams5].[RamID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands6]
    ON [AST_MrnPC].[vduBrandID] = [AST_Brands6].[BrandID]
  LEFT OUTER JOIN [AST_Softwares] AS [AST_Softwares7]
    ON [AST_MrnPC].[pcOSID] = [AST_Softwares7].[SoftwareID]
  WHERE STR(ISNULL([AST_MrnPC].[MrnID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MrnPC].[MrnDescription],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC].[SupplierID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC].[PurchasedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC].[IssuedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC].[WriteoffQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC].[pcBrandID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC].[NoOfCPUs], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC].[cpuBrandID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MrnPC].[CPUModel],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC].[RamID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC].[NoOfHDDs], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC].[TotalHDDGB], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MrnPC].[HDDDetails],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC].[NoOfCDROMs], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MrnPC].[CDRomDetails],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC].[vduBrandID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC].[pcOSID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MrnPC].[pcOSDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MrnPC].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MrnPC1].[MrnDescription],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC1].[SupplierID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC1].[PurchasedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC1].[IssuedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC1].[WriteoffQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC1].[pcBrandID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC1].[NoOfCPUs], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC1].[cpuBrandID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MrnPC1].[CPUModel],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC1].[RamID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC1].[NoOfHDDs], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC1].[TotalHDDGB], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MrnPC1].[HDDDetails],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC1].[NoOfCDROMs], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MrnPC1].[CDRomDetails],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC1].[vduBrandID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC1].[pcOSID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MrnPC1].[pcOSDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MrnPC1].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Suppliers2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Brands3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Brands4].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Rams5].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Brands6].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Softwares7].[Description],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [AST_MrnPC].[MrnID] AS SearchCode, 
  ISNULL([AST_MrnPC].[MrnDescription],'') 
  + ',' + STR(ISNULL([AST_MrnPC].[SupplierID],0)) 
  + ',' + STR(ISNULL([AST_MrnPC].[PurchasedQuantity],0)) 
  + ',' + STR(ISNULL([AST_MrnPC].[IssuedQuantity],0)) 
  + ',' + STR(ISNULL([AST_MrnPC].[WriteoffQuantity],0)) 
  + ',' + STR(ISNULL([AST_MrnPC].[pcBrandID],0)) 
  + ',' + STR(ISNULL([AST_MrnPC].[NoOfCPUs],0)) 
  + ',' + STR(ISNULL([AST_MrnPC].[cpuBrandID],0)) 
  + ',' + ISNULL([AST_MrnPC].[CPUModel],'') 
  + ',' + STR(ISNULL([AST_MrnPC].[RamID],0)) 
  + ',' + STR(ISNULL([AST_MrnPC].[NoOfHDDs],0)) 
  + ',' + STR(ISNULL([AST_MrnPC].[TotalHDDGB],0)) 
  + ',' + ISNULL([AST_MrnPC].[HDDDetails],'') 
  + ',' + STR(ISNULL([AST_MrnPC].[NoOfCDROMs],0)) 
  + ',' + ISNULL([AST_MrnPC].[CDRomDetails],'') 
  + ',' + STR(ISNULL([AST_MrnPC].[vduBrandID],0)) 
  + ',' + STR(ISNULL([AST_MrnPC].[pcOSID],0)) 
  + ',' + ISNULL([AST_MrnPC].[pcOSDetails],'') 
  + ',' + ISNULL([AST_MrnPC].[Remarks],'') 
  + ',' + ISNULL([AST_MrnPC1].[MrnDescription],'') 
  + ',' + STR(ISNULL([AST_MrnPC1].[SupplierID],0)) 
  + ',' + STR(ISNULL([AST_MrnPC1].[PurchasedQuantity],0)) 
  + ',' + STR(ISNULL([AST_MrnPC1].[IssuedQuantity],0)) 
  + ',' + STR(ISNULL([AST_MrnPC1].[WriteoffQuantity],0)) 
  + ',' + STR(ISNULL([AST_MrnPC1].[pcBrandID],0)) 
  + ',' + STR(ISNULL([AST_MrnPC1].[NoOfCPUs],0)) 
  + ',' + STR(ISNULL([AST_MrnPC1].[cpuBrandID],0)) 
  + ',' + ISNULL([AST_MrnPC1].[CPUModel],'') 
  + ',' + STR(ISNULL([AST_MrnPC1].[RamID],0)) 
  + ',' + STR(ISNULL([AST_MrnPC1].[NoOfHDDs],0)) 
  + ',' + STR(ISNULL([AST_MrnPC1].[TotalHDDGB],0)) 
  + ',' + ISNULL([AST_MrnPC1].[HDDDetails],'') 
  + ',' + STR(ISNULL([AST_MrnPC1].[NoOfCDROMs],0)) 
  + ',' + ISNULL([AST_MrnPC1].[CDRomDetails],'') 
  + ',' + STR(ISNULL([AST_MrnPC1].[vduBrandID],0)) 
  + ',' + STR(ISNULL([AST_MrnPC1].[pcOSID],0)) 
  + ',' + ISNULL([AST_MrnPC1].[pcOSDetails],'') 
  + ',' + ISNULL([AST_MrnPC1].[Remarks],'') 
  + ',' + ISNULL([AST_Suppliers2].[Description],'') 
  + ',' + ISNULL([AST_Brands3].[Description],'') 
  + ',' + ISNULL([AST_Brands4].[Description],'') 
  + ',' + ISNULL([AST_Rams5].[Description],'') 
  + ',' + ISNULL([AST_Brands6].[Description],'') 
  + ',' + ISNULL([AST_Softwares7].[Description],'') 
  AS SearchDescription 
  FROM [AST_MrnPC] 
    	INNER JOIN #PageIndex
          ON [AST_MrnPC].[MrnID] = #PageIndex.MrnID
  INNER JOIN [AST_MrnPC] AS [AST_MrnPC1]
    ON [AST_MrnPC].[MrnID] = [AST_MrnPC1].[MrnID]
  INNER JOIN [AST_Suppliers] AS [AST_Suppliers2]
    ON [AST_MrnPC].[SupplierID] = [AST_Suppliers2].[SupplierID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands3]
    ON [AST_MrnPC].[pcBrandID] = [AST_Brands3].[BrandID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands4]
    ON [AST_MrnPC].[cpuBrandID] = [AST_Brands4].[BrandID]
  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams5]
    ON [AST_MrnPC].[RamID] = [AST_Rams5].[RamID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands6]
    ON [AST_MrnPC].[vduBrandID] = [AST_Brands6].[BrandID]
  LEFT OUTER JOIN [AST_Softwares] AS [AST_Softwares7]
    ON [AST_MrnPC].[pcOSID] = [AST_Softwares7].[SoftwareID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
