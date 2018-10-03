USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchPrkEntitlements]
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
  EntitlementID Int NOT NULL
  )
  INSERT INTO #PageIndex (EntitlementID)
  SELECT [PRK_Entitlements].[EntitlementID] FROM [PRK_Entitlements]
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Entitlements].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Entitlements].[PerkID] = [PRK_Perks2].[PerkID]
  INNER JOIN [PRK_Categories] AS [PRK_Categories3]
    ON [PRK_Entitlements].[CategoryID] = [PRK_Categories3].[CategoryID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears4]
    ON [PRK_Entitlements].[FinYear] = [PRK_FinYears4].[FinYear]
  WHERE STR(ISNULL([PRK_Entitlements].[EntitlementID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Entitlements].[EmployeeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Entitlements].[PerkID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Entitlements].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Entitlements].[PostedAt],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Entitlements].[Value], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Entitlements].[VehicleType],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Entitlements].[Basic], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Entitlements].[UOM],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Entitlements].[FinYear], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees1].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees1].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees1].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees1].[VehicleType],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees1].[Basic], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees1].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees1].[Company],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks2].[PerkCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks2].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks2].[AdvanceMonths], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks2].[LockedMonths], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks2].[NoOfPayments], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks2].[UOM],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks2].[BaaNGL],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks2].[BaaNReference],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Categories3].[CategoryCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Categories3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Categories3].[STDCategory],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_FinYears4].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_FinYears4].[Status],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [PRK_Entitlements].[EntitlementID] AS SearchCode, 
  STR(ISNULL([PRK_Entitlements].[EmployeeID],0)) 
  + ',' + STR(ISNULL([PRK_Entitlements].[PerkID],0)) 
  + ',' + STR(ISNULL([PRK_Entitlements].[CategoryID],0)) 
  + ',' + ISNULL([PRK_Entitlements].[PostedAt],'') 
  + ',' + STR(ISNULL([PRK_Entitlements].[Value],0)) 
  + ',' + ISNULL([PRK_Entitlements].[VehicleType],'') 
  + ',' + STR(ISNULL([PRK_Entitlements].[Basic],0)) 
  + ',' + ISNULL([PRK_Entitlements].[UOM],'') 
  + ',' + STR(ISNULL([PRK_Entitlements].[FinYear],0)) 
  + ',' + ISNULL([PRK_Employees1].[CardNo],'') 
  + ',' + ISNULL([PRK_Employees1].[EmployeeName],'') 
  + ',' + STR(ISNULL([PRK_Employees1].[CategoryID],0)) 
  + ',' + ISNULL([PRK_Employees1].[PostedAt],'') 
  + ',' + ISNULL([PRK_Employees1].[VehicleType],'') 
  + ',' + STR(ISNULL([PRK_Employees1].[Basic],0)) 
  + ',' + ISNULL([PRK_Employees1].[Department],'') 
  + ',' + ISNULL([PRK_Employees1].[Company],'') 
  + ',' + ISNULL([PRK_Perks2].[PerkCode],'') 
  + ',' + ISNULL([PRK_Perks2].[Description],'') 
  + ',' + STR(ISNULL([PRK_Perks2].[AdvanceMonths],0)) 
  + ',' + STR(ISNULL([PRK_Perks2].[LockedMonths],0)) 
  + ',' + STR(ISNULL([PRK_Perks2].[NoOfPayments],0)) 
  + ',' + ISNULL([PRK_Perks2].[UOM],'') 
  + ',' + ISNULL([PRK_Perks2].[BaaNGL],'') 
  + ',' + ISNULL([PRK_Perks2].[BaaNReference],'') 
  + ',' + ISNULL([PRK_Categories3].[CategoryCode],'') 
  + ',' + ISNULL([PRK_Categories3].[Description],'') 
  + ',' + ISNULL([PRK_Categories3].[STDCategory],'') 
  + ',' + ISNULL([PRK_FinYears4].[Description],'') 
  + ',' + ISNULL([PRK_FinYears4].[Status],'') 
  AS SearchDescription 
  FROM [PRK_Entitlements] 
    	INNER JOIN #PageIndex
          ON [PRK_Entitlements].[EntitlementID] = #PageIndex.EntitlementID
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Entitlements].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Entitlements].[PerkID] = [PRK_Perks2].[PerkID]
  INNER JOIN [PRK_Categories] AS [PRK_Categories3]
    ON [PRK_Entitlements].[CategoryID] = [PRK_Categories3].[CategoryID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears4]
    ON [PRK_Entitlements].[FinYear] = [PRK_FinYears4].[FinYear]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
