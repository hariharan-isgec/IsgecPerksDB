USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchPrkUserEntitlements]
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
  INNER JOIN [PRK_Perks] AS [PRK_Perks1]
    ON [PRK_Entitlements].[PerkID] = [PRK_Perks1].[PerkID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears2]
    ON [PRK_Entitlements].[FinYear] = [PRK_FinYears2].[FinYear]
  WHERE STR(ISNULL([PRK_Entitlements].[EntitlementID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Entitlements].[EmployeeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Entitlements].[PerkID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Entitlements].[Value], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Entitlements].[FinYear], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[PerkCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks1].[AdvanceMonths], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks1].[LockedMonths], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks1].[NoOfPayments], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[UOM],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[BaaNGL],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[BaaNReference],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_FinYears2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_FinYears2].[Status],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [PRK_Entitlements].[EntitlementID] AS SearchCode, 
  STR(ISNULL([PRK_Entitlements].[EmployeeID],0)) 
  + ',' + STR(ISNULL([PRK_Entitlements].[PerkID],0)) 
  + ',' + STR(ISNULL([PRK_Entitlements].[Value],0)) 
  + ',' + STR(ISNULL([PRK_Entitlements].[FinYear],0)) 
  + ',' + ISNULL([PRK_Perks1].[PerkCode],'') 
  + ',' + ISNULL([PRK_Perks1].[Description],'') 
  + ',' + STR(ISNULL([PRK_Perks1].[AdvanceMonths],0)) 
  + ',' + STR(ISNULL([PRK_Perks1].[LockedMonths],0)) 
  + ',' + STR(ISNULL([PRK_Perks1].[NoOfPayments],0)) 
  + ',' + ISNULL([PRK_Perks1].[UOM],'') 
  + ',' + ISNULL([PRK_Perks1].[BaaNGL],'') 
  + ',' + ISNULL([PRK_Perks1].[BaaNReference],'') 
  + ',' + ISNULL([PRK_FinYears2].[Description],'') 
  + ',' + ISNULL([PRK_FinYears2].[Status],'') 
  AS SearchDescription 
  FROM [PRK_Entitlements] 
    	INNER JOIN #PageIndex
          ON [PRK_Entitlements].[EntitlementID] = #PageIndex.EntitlementID
  INNER JOIN [PRK_Perks] AS [PRK_Perks1]
    ON [PRK_Entitlements].[PerkID] = [PRK_Perks1].[PerkID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears2]
    ON [PRK_Entitlements].[FinYear] = [PRK_FinYears2].[FinYear]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
