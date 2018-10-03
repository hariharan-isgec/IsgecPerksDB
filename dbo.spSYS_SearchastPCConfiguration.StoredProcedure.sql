USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchastPCConfiguration]
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
  pcID Int NOT NULL
  )
  INSERT INTO #PageIndex (pcID)
  SELECT [AST_PCDetails].[pcID] FROM [AST_PCDetails]
  LEFT OUTER JOIN [AST_MrnPC] AS [AST_MrnPC1]
    ON [AST_PCDetails].[MrnID] = [AST_MrnPC1].[MrnID]
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations2]
    ON [AST_PCDetails].[LocationID] = [AST_Locations2].[LocationID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees3]
    ON [AST_PCDetails].[UserID] = [PRK_Employees3].[EmployeeID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands4]
    ON [AST_PCDetails].[pcBrandID] = [AST_Brands4].[BrandID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands5]
    ON [AST_PCDetails].[cpuBrandID] = [AST_Brands5].[BrandID]
  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams6]
    ON [AST_PCDetails].[RamID] = [AST_Rams6].[RamID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands7]
    ON [AST_PCDetails].[vduBrandID] = [AST_Brands7].[BrandID]
  LEFT OUTER JOIN [AST_Softwares] AS [AST_Softwares8]
    ON [AST_PCDetails].[pcOSID] = [AST_Softwares8].[SoftwareID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees9]
    ON [AST_PCDetails].[ModifiedBy] = [PRK_Employees9].[EmployeeID]
  WHERE STR(ISNULL([AST_PCDetails].[pcID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[MrnID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCDetails].[SerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCDetails].[AssetNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCDetails].[IPAddress],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[LocationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCDetails].[pcUser],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[UserID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[pcBrandID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCDetails].[ModelNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[NoOfCPUs], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[cpuBrandID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCDetails].[CPUModel],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[RamID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[NoOfHDDs], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[TotalHDDGB], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCDetails].[HDDDetails],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[NoOfCDROMs], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCDetails].[CDRomDetails],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[vduBrandID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCDetails].[vduSerialNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[pcOSID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCDetails].[pcOSDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCDetails].[HostName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCDetails].[DomainName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCDetails].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[ModifiedBy], 0)) LIKE @KeyWord1
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
     OR LOWER(ISNULL([AST_Locations2].[Descriptions],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees3].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees3].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees3].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees3].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees3].[Company],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Brands4].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Brands5].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Rams6].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Brands7].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Softwares8].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees9].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees9].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees9].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees9].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees9].[Company],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [AST_PCDetails].[pcID] AS SearchCode, 
  STR(ISNULL([AST_PCDetails].[MrnID],0)) 
  + ',' + ISNULL([AST_PCDetails].[SerialNo],'') 
  + ',' + ISNULL([AST_PCDetails].[AssetNo],'') 
  + ',' + ISNULL([AST_PCDetails].[IPAddress],'') 
  + ',' + STR(ISNULL([AST_PCDetails].[LocationID],0)) 
  + ',' + ISNULL([AST_PCDetails].[pcUser],'') 
  + ',' + STR(ISNULL([AST_PCDetails].[UserID],0)) 
  + ',' + STR(ISNULL([AST_PCDetails].[pcBrandID],0)) 
  + ',' + ISNULL([AST_PCDetails].[ModelNo],'') 
  + ',' + STR(ISNULL([AST_PCDetails].[NoOfCPUs],0)) 
  + ',' + STR(ISNULL([AST_PCDetails].[cpuBrandID],0)) 
  + ',' + ISNULL([AST_PCDetails].[CPUModel],'') 
  + ',' + STR(ISNULL([AST_PCDetails].[RamID],0)) 
  + ',' + STR(ISNULL([AST_PCDetails].[NoOfHDDs],0)) 
  + ',' + STR(ISNULL([AST_PCDetails].[TotalHDDGB],0)) 
  + ',' + ISNULL([AST_PCDetails].[HDDDetails],'') 
  + ',' + STR(ISNULL([AST_PCDetails].[NoOfCDROMs],0)) 
  + ',' + ISNULL([AST_PCDetails].[CDRomDetails],'') 
  + ',' + STR(ISNULL([AST_PCDetails].[vduBrandID],0)) 
  + ',' + ISNULL([AST_PCDetails].[vduSerialNo],'') 
  + ',' + STR(ISNULL([AST_PCDetails].[pcOSID],0)) 
  + ',' + ISNULL([AST_PCDetails].[pcOSDetails],'') 
  + ',' + ISNULL([AST_PCDetails].[HostName],'') 
  + ',' + ISNULL([AST_PCDetails].[DomainName],'') 
  + ',' + ISNULL([AST_PCDetails].[Remarks],'') 
  + ',' + STR(ISNULL([AST_PCDetails].[ModifiedBy],0)) 
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
  + ',' + ISNULL([AST_Locations2].[Descriptions],'') 
  + ',' + ISNULL([PRK_Employees3].[CardNo],'') 
  + ',' + ISNULL([PRK_Employees3].[EmployeeName],'') 
  + ',' + ISNULL([PRK_Employees3].[PostedAt],'') 
  + ',' + ISNULL([PRK_Employees3].[Department],'') 
  + ',' + ISNULL([PRK_Employees3].[Company],'') 
  + ',' + ISNULL([AST_Brands4].[Description],'') 
  + ',' + ISNULL([AST_Brands5].[Description],'') 
  + ',' + ISNULL([AST_Rams6].[Description],'') 
  + ',' + ISNULL([AST_Brands7].[Description],'') 
  + ',' + ISNULL([AST_Softwares8].[Description],'') 
  + ',' + ISNULL([PRK_Employees9].[CardNo],'') 
  + ',' + ISNULL([PRK_Employees9].[EmployeeName],'') 
  + ',' + ISNULL([PRK_Employees9].[PostedAt],'') 
  + ',' + ISNULL([PRK_Employees9].[Department],'') 
  + ',' + ISNULL([PRK_Employees9].[Company],'') 
  AS SearchDescription 
  FROM [AST_PCDetails] 
    	INNER JOIN #PageIndex
          ON [AST_PCDetails].[pcID] = #PageIndex.pcID
  LEFT OUTER JOIN [AST_MrnPC] AS [AST_MrnPC1]
    ON [AST_PCDetails].[MrnID] = [AST_MrnPC1].[MrnID]
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations2]
    ON [AST_PCDetails].[LocationID] = [AST_Locations2].[LocationID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees3]
    ON [AST_PCDetails].[UserID] = [PRK_Employees3].[EmployeeID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands4]
    ON [AST_PCDetails].[pcBrandID] = [AST_Brands4].[BrandID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands5]
    ON [AST_PCDetails].[cpuBrandID] = [AST_Brands5].[BrandID]
  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams6]
    ON [AST_PCDetails].[RamID] = [AST_Rams6].[RamID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands7]
    ON [AST_PCDetails].[vduBrandID] = [AST_Brands7].[BrandID]
  LEFT OUTER JOIN [AST_Softwares] AS [AST_Softwares8]
    ON [AST_PCDetails].[pcOSID] = [AST_Softwares8].[SoftwareID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees9]
    ON [AST_PCDetails].[ModifiedBy] = [PRK_Employees9].[EmployeeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
