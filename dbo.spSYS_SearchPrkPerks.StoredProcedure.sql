USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchPrkPerks]
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
  PerkID Int NOT NULL
  )
  INSERT INTO #PageIndex (PerkID)
  SELECT [PRK_Perks].[PerkID] FROM [PRK_Perks]
  WHERE STR(ISNULL([PRK_Perks].[PerkID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks].[PerkCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks].[AdvanceMonths], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks].[LockedMonths], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks].[NoOfPayments], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks].[UOM],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks].[BaaNGL],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks].[BaaNReference],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [PRK_Perks].[PerkID] AS SearchCode, 
  ISNULL([PRK_Perks].[PerkCode],'') 
  + ',' + ISNULL([PRK_Perks].[Description],'') 
  + ',' + STR(ISNULL([PRK_Perks].[AdvanceMonths],0)) 
  + ',' + STR(ISNULL([PRK_Perks].[LockedMonths],0)) 
  + ',' + STR(ISNULL([PRK_Perks].[NoOfPayments],0)) 
  + ',' + ISNULL([PRK_Perks].[UOM],'') 
  + ',' + ISNULL([PRK_Perks].[BaaNGL],'') 
  + ',' + ISNULL([PRK_Perks].[BaaNReference],'') 
  AS SearchDescription 
  FROM [PRK_Perks] 
    	INNER JOIN #PageIndex
          ON [PRK_Perks].[PerkID] = #PageIndex.PerkID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
