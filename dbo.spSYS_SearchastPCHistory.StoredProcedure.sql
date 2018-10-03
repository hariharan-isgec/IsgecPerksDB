USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchastPCHistory]
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
  SELECT [AST_PCHistory].[HistoryID] FROM [AST_PCHistory]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands1]
    ON [AST_PCHistory].[pcBrandID] = [AST_Brands1].[BrandID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands2]
    ON [AST_PCHistory].[cpuBrandID] = [AST_Brands2].[BrandID]
  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams3]
    ON [AST_PCHistory].[RamID] = [AST_Rams3].[RamID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands4]
    ON [AST_PCHistory].[vduBrandID] = [AST_Brands4].[BrandID]
  LEFT OUTER JOIN [AST_Softwares] AS [AST_Softwares5]
    ON [AST_PCHistory].[pcOSID] = [AST_Softwares5].[SoftwareID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees6]
    ON [AST_PCHistory].[UserID] = [PRK_Employees6].[EmployeeID]
  LEFT OUTER JOIN [AST_MrnPC] AS [AST_MrnPC7]
    ON [AST_PCHistory].[MrnID] = [AST_MrnPC7].[MrnID]
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations8]
    ON [AST_PCHistory].[LocationID] = [AST_Locations8].[LocationID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees9]
    ON [AST_PCHistory].[ModifiedBy] = [PRK_Employees9].[EmployeeID]
  WHERE STR(ISNULL([AST_PCHistory].[HistoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCHistory].[HistoryType],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCHistory].[pcID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCHistory].[pcBrandID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCHistory].[ModelNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCHistory].[SerialNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCHistory].[NoOfCPUs], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCHistory].[cpuBrandID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCHistory].[CPUModel],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCHistory].[RamID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCHistory].[NoOfHDDs], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCHistory].[TotalHDDGB], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCHistory].[HDDDetails],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCHistory].[NoOfCDROMs], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCHistory].[CDRomDetails],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCHistory].[vduBrandID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCHistory].[vduSerialNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCHistory].[pcOSID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCHistory].[pcOSDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCHistory].[IPAddress],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCHistory].[HostName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCHistory].[DomainName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCHistory].[pcUser],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCHistory].[UserID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCHistory].[MrnID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCHistory].[AssetNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCHistory].[LocationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCHistory].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCHistory].[ModifiedBy], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Brands1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Brands2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Rams3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Brands4].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Softwares5].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees6].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees6].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees6].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees6].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees6].[Company],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MrnPC7].[MrnDescription],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC7].[SupplierID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC7].[PurchasedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC7].[IssuedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC7].[WriteoffQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC7].[pcBrandID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC7].[NoOfCPUs], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC7].[cpuBrandID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MrnPC7].[CPUModel],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC7].[RamID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC7].[NoOfHDDs], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC7].[TotalHDDGB], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MrnPC7].[HDDDetails],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC7].[NoOfCDROMs], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MrnPC7].[CDRomDetails],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC7].[vduBrandID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_MrnPC7].[pcOSID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MrnPC7].[pcOSDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_MrnPC7].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Locations8].[Descriptions],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees9].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees9].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees9].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees9].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees9].[Company],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [AST_PCHistory].[HistoryID] AS SearchCode, 
  ISNULL([AST_PCHistory].[HistoryType],'') 
  + ',' + STR(ISNULL([AST_PCHistory].[pcID],0)) 
  + ',' + STR(ISNULL([AST_PCHistory].[pcBrandID],0)) 
  + ',' + ISNULL([AST_PCHistory].[ModelNo],'') 
  + ',' + ISNULL([AST_PCHistory].[SerialNo],'') 
  + ',' + STR(ISNULL([AST_PCHistory].[NoOfCPUs],0)) 
  + ',' + STR(ISNULL([AST_PCHistory].[cpuBrandID],0)) 
  + ',' + ISNULL([AST_PCHistory].[CPUModel],'') 
  + ',' + STR(ISNULL([AST_PCHistory].[RamID],0)) 
  + ',' + STR(ISNULL([AST_PCHistory].[NoOfHDDs],0)) 
  + ',' + STR(ISNULL([AST_PCHistory].[TotalHDDGB],0)) 
  + ',' + ISNULL([AST_PCHistory].[HDDDetails],'') 
  + ',' + STR(ISNULL([AST_PCHistory].[NoOfCDROMs],0)) 
  + ',' + ISNULL([AST_PCHistory].[CDRomDetails],'') 
  + ',' + STR(ISNULL([AST_PCHistory].[vduBrandID],0)) 
  + ',' + ISNULL([AST_PCHistory].[vduSerialNo],'') 
  + ',' + STR(ISNULL([AST_PCHistory].[pcOSID],0)) 
  + ',' + ISNULL([AST_PCHistory].[pcOSDetails],'') 
  + ',' + ISNULL([AST_PCHistory].[IPAddress],'') 
  + ',' + ISNULL([AST_PCHistory].[HostName],'') 
  + ',' + ISNULL([AST_PCHistory].[DomainName],'') 
  + ',' + ISNULL([AST_PCHistory].[pcUser],'') 
  + ',' + STR(ISNULL([AST_PCHistory].[UserID],0)) 
  + ',' + STR(ISNULL([AST_PCHistory].[MrnID],0)) 
  + ',' + ISNULL([AST_PCHistory].[AssetNo],'') 
  + ',' + STR(ISNULL([AST_PCHistory].[LocationID],0)) 
  + ',' + ISNULL([AST_PCHistory].[Remarks],'') 
  + ',' + STR(ISNULL([AST_PCHistory].[ModifiedBy],0)) 
  + ',' + ISNULL([AST_Brands1].[Description],'') 
  + ',' + ISNULL([AST_Brands2].[Description],'') 
  + ',' + ISNULL([AST_Rams3].[Description],'') 
  + ',' + ISNULL([AST_Brands4].[Description],'') 
  + ',' + ISNULL([AST_Softwares5].[Description],'') 
  + ',' + ISNULL([PRK_Employees6].[CardNo],'') 
  + ',' + ISNULL([PRK_Employees6].[EmployeeName],'') 
  + ',' + ISNULL([PRK_Employees6].[PostedAt],'') 
  + ',' + ISNULL([PRK_Employees6].[Department],'') 
  + ',' + ISNULL([PRK_Employees6].[Company],'') 
  + ',' + ISNULL([AST_MrnPC7].[MrnDescription],'') 
  + ',' + STR(ISNULL([AST_MrnPC7].[SupplierID],0)) 
  + ',' + STR(ISNULL([AST_MrnPC7].[PurchasedQuantity],0)) 
  + ',' + STR(ISNULL([AST_MrnPC7].[IssuedQuantity],0)) 
  + ',' + STR(ISNULL([AST_MrnPC7].[WriteoffQuantity],0)) 
  + ',' + STR(ISNULL([AST_MrnPC7].[pcBrandID],0)) 
  + ',' + STR(ISNULL([AST_MrnPC7].[NoOfCPUs],0)) 
  + ',' + STR(ISNULL([AST_MrnPC7].[cpuBrandID],0)) 
  + ',' + ISNULL([AST_MrnPC7].[CPUModel],'') 
  + ',' + STR(ISNULL([AST_MrnPC7].[RamID],0)) 
  + ',' + STR(ISNULL([AST_MrnPC7].[NoOfHDDs],0)) 
  + ',' + STR(ISNULL([AST_MrnPC7].[TotalHDDGB],0)) 
  + ',' + ISNULL([AST_MrnPC7].[HDDDetails],'') 
  + ',' + STR(ISNULL([AST_MrnPC7].[NoOfCDROMs],0)) 
  + ',' + ISNULL([AST_MrnPC7].[CDRomDetails],'') 
  + ',' + STR(ISNULL([AST_MrnPC7].[vduBrandID],0)) 
  + ',' + STR(ISNULL([AST_MrnPC7].[pcOSID],0)) 
  + ',' + ISNULL([AST_MrnPC7].[pcOSDetails],'') 
  + ',' + ISNULL([AST_MrnPC7].[Remarks],'') 
  + ',' + ISNULL([AST_Locations8].[Descriptions],'') 
  + ',' + ISNULL([PRK_Employees9].[CardNo],'') 
  + ',' + ISNULL([PRK_Employees9].[EmployeeName],'') 
  + ',' + ISNULL([PRK_Employees9].[PostedAt],'') 
  + ',' + ISNULL([PRK_Employees9].[Department],'') 
  + ',' + ISNULL([PRK_Employees9].[Company],'') 
  AS SearchDescription 
  FROM [AST_PCHistory] 
    	INNER JOIN #PageIndex
          ON [AST_PCHistory].[HistoryID] = #PageIndex.HistoryID
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands1]
    ON [AST_PCHistory].[pcBrandID] = [AST_Brands1].[BrandID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands2]
    ON [AST_PCHistory].[cpuBrandID] = [AST_Brands2].[BrandID]
  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams3]
    ON [AST_PCHistory].[RamID] = [AST_Rams3].[RamID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands4]
    ON [AST_PCHistory].[vduBrandID] = [AST_Brands4].[BrandID]
  LEFT OUTER JOIN [AST_Softwares] AS [AST_Softwares5]
    ON [AST_PCHistory].[pcOSID] = [AST_Softwares5].[SoftwareID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees6]
    ON [AST_PCHistory].[UserID] = [PRK_Employees6].[EmployeeID]
  LEFT OUTER JOIN [AST_MrnPC] AS [AST_MrnPC7]
    ON [AST_PCHistory].[MrnID] = [AST_MrnPC7].[MrnID]
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations8]
    ON [AST_PCHistory].[LocationID] = [AST_Locations8].[LocationID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees9]
    ON [AST_PCHistory].[ModifiedBy] = [PRK_Employees9].[EmployeeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
