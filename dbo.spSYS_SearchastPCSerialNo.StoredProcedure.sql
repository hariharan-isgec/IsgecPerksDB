USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchastPCSerialNo]
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
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands2]
    ON [AST_PCDetails].[pcBrandID] = [AST_Brands2].[BrandID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands3]
    ON [AST_PCDetails].[cpuBrandID] = [AST_Brands3].[BrandID]
  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams4]
    ON [AST_PCDetails].[RamID] = [AST_Rams4].[RamID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]
    ON [AST_PCDetails].[UserID] = [PRK_Employees5].[EmployeeID]
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations6]
    ON [AST_PCDetails].[LocationID] = [AST_Locations6].[LocationID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees7]
    ON [AST_PCDetails].[ModifiedBy] = [PRK_Employees7].[EmployeeID]
  WHERE STR(ISNULL([AST_PCDetails].[pcID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[MrnID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[pcBrandID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCDetails].[ModelNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[cpuBrandID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[RamID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[UserID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([AST_PCDetails].[LocationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCDetails].[IPAddress],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCDetails].[SerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_PCDetails].[AssetNo],'')) LIKE @KeyWord1
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
     OR LOWER(ISNULL([AST_Brands2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Brands3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Rams4].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees5].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees5].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees5].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees5].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees5].[Company],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Locations6].[Descriptions],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees7].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees7].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees7].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees7].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees7].[Company],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [AST_PCDetails].[pcID] AS SearchCode, 
  STR(ISNULL([AST_PCDetails].[MrnID],0)) 
  + ',' + STR(ISNULL([AST_PCDetails].[pcBrandID],0)) 
  + ',' + ISNULL([AST_PCDetails].[ModelNo],'') 
  + ',' + STR(ISNULL([AST_PCDetails].[cpuBrandID],0)) 
  + ',' + STR(ISNULL([AST_PCDetails].[RamID],0)) 
  + ',' + STR(ISNULL([AST_PCDetails].[UserID],0)) 
  + ',' + STR(ISNULL([AST_PCDetails].[LocationID],0)) 
  + ',' + ISNULL([AST_PCDetails].[IPAddress],'') 
  + ',' + ISNULL([AST_PCDetails].[SerialNo],'') 
  + ',' + ISNULL([AST_PCDetails].[AssetNo],'') 
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
  + ',' + ISNULL([AST_Brands2].[Description],'') 
  + ',' + ISNULL([AST_Brands3].[Description],'') 
  + ',' + ISNULL([AST_Rams4].[Description],'') 
  + ',' + ISNULL([PRK_Employees5].[CardNo],'') 
  + ',' + ISNULL([PRK_Employees5].[EmployeeName],'') 
  + ',' + ISNULL([PRK_Employees5].[PostedAt],'') 
  + ',' + ISNULL([PRK_Employees5].[Department],'') 
  + ',' + ISNULL([PRK_Employees5].[Company],'') 
  + ',' + ISNULL([AST_Locations6].[Descriptions],'') 
  + ',' + ISNULL([PRK_Employees7].[CardNo],'') 
  + ',' + ISNULL([PRK_Employees7].[EmployeeName],'') 
  + ',' + ISNULL([PRK_Employees7].[PostedAt],'') 
  + ',' + ISNULL([PRK_Employees7].[Department],'') 
  + ',' + ISNULL([PRK_Employees7].[Company],'') 
  AS SearchDescription 
  FROM [AST_PCDetails] 
    	INNER JOIN #PageIndex
          ON [AST_PCDetails].[pcID] = #PageIndex.pcID
  LEFT OUTER JOIN [AST_MrnPC] AS [AST_MrnPC1]
    ON [AST_PCDetails].[MrnID] = [AST_MrnPC1].[MrnID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands2]
    ON [AST_PCDetails].[pcBrandID] = [AST_Brands2].[BrandID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands3]
    ON [AST_PCDetails].[cpuBrandID] = [AST_Brands3].[BrandID]
  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams4]
    ON [AST_PCDetails].[RamID] = [AST_Rams4].[RamID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]
    ON [AST_PCDetails].[UserID] = [PRK_Employees5].[EmployeeID]
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations6]
    ON [AST_PCDetails].[LocationID] = [AST_Locations6].[LocationID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees7]
    ON [AST_PCDetails].[ModifiedBy] = [PRK_Employees7].[EmployeeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
