USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchPrkRules]
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
  RuleID Int NOT NULL
  )
  INSERT INTO #PageIndex (RuleID)
  SELECT [PRK_Rules].[RuleID] FROM [PRK_Rules]
  INNER JOIN [PRK_Perks] AS [PRK_Perks1]
    ON [PRK_Rules].[PerkID] = [PRK_Perks1].[PerkID]
  INNER JOIN [PRK_Categories] AS [PRK_Categories2]
    ON [PRK_Rules].[CategoryID] = [PRK_Categories2].[CategoryID]
  WHERE STR(ISNULL([PRK_Rules].[RuleID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Rules].[PerkID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Rules].[CategoryID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Rules].[Percentage], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Rules].[FixedValue], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Rules].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Rules].[VehicleType],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[PerkCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks1].[AdvanceMonths], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks1].[LockedMonths], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks1].[NoOfPayments], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[UOM],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[BaaNGL],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[BaaNReference],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Categories2].[CategoryCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Categories2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Categories2].[STDCategory],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [PRK_Rules].[RuleID] AS SearchCode, 
  STR(ISNULL([PRK_Rules].[PerkID],0)) 
  + ',' + STR(ISNULL([PRK_Rules].[CategoryID],0)) 
  + ',' + STR(ISNULL([PRK_Rules].[Percentage],0)) 
  + ',' + STR(ISNULL([PRK_Rules].[FixedValue],0)) 
  + ',' + ISNULL([PRK_Rules].[PostedAt],'') 
  + ',' + ISNULL([PRK_Rules].[VehicleType],'') 
  + ',' + ISNULL([PRK_Perks1].[PerkCode],'') 
  + ',' + ISNULL([PRK_Perks1].[Description],'') 
  + ',' + STR(ISNULL([PRK_Perks1].[AdvanceMonths],0)) 
  + ',' + STR(ISNULL([PRK_Perks1].[LockedMonths],0)) 
  + ',' + STR(ISNULL([PRK_Perks1].[NoOfPayments],0)) 
  + ',' + ISNULL([PRK_Perks1].[UOM],'') 
  + ',' + ISNULL([PRK_Perks1].[BaaNGL],'') 
  + ',' + ISNULL([PRK_Perks1].[BaaNReference],'') 
  + ',' + ISNULL([PRK_Categories2].[CategoryCode],'') 
  + ',' + ISNULL([PRK_Categories2].[Description],'') 
  + ',' + ISNULL([PRK_Categories2].[STDCategory],'') 
  AS SearchDescription 
  FROM [PRK_Rules] 
    	INNER JOIN #PageIndex
          ON [PRK_Rules].[RuleID] = #PageIndex.RuleID
  INNER JOIN [PRK_Perks] AS [PRK_Perks1]
    ON [PRK_Rules].[PerkID] = [PRK_Perks1].[PerkID]
  INNER JOIN [PRK_Categories] AS [PRK_Categories2]
    ON [PRK_Rules].[CategoryID] = [PRK_Categories2].[CategoryID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
