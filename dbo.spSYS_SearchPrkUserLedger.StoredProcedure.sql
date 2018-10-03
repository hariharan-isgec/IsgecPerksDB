USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchPrkUserLedger]
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
  DocumentID Int NOT NULL
  )
  INSERT INTO #PageIndex (DocumentID)
  SELECT [PRK_Ledger].[DocumentID] FROM [PRK_Ledger]
  INNER JOIN [PRK_Perks] AS [PRK_Perks1]
    ON [PRK_Ledger].[PerkID] = [PRK_Perks1].[PerkID]
  INNER JOIN [PRK_Employees] AS [PRK_Employees2]
    ON [PRK_Ledger].[CreatedBy] = [PRK_Employees2].[EmployeeID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears3]
    ON [PRK_Ledger].[FinYear] = [PRK_FinYears3].[FinYear]
  WHERE STR(ISNULL([PRK_Ledger].[DocumentID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[EmployeeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[PerkID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Ledger].[TranType],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[Value], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[Amount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Ledger].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[CreatedBy], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[FinYear], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[PerkCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks1].[AdvanceMonths], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks1].[LockedMonths], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks1].[NoOfPayments], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[UOM],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[BaaNGL],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[BaaNReference],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees2].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees2].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees2].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees2].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees2].[VehicleType],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees2].[Basic], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees2].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees2].[Company],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_FinYears3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_FinYears3].[Status],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [PRK_Ledger].[DocumentID] AS SearchCode, 
  STR(ISNULL([PRK_Ledger].[EmployeeID],0)) 
  + ',' + STR(ISNULL([PRK_Ledger].[PerkID],0)) 
  + ',' + ISNULL([PRK_Ledger].[TranType],'') 
  + ',' + STR(ISNULL([PRK_Ledger].[Value],0)) 
  + ',' + STR(ISNULL([PRK_Ledger].[Amount],0)) 
  + ',' + ISNULL([PRK_Ledger].[Remarks],'') 
  + ',' + STR(ISNULL([PRK_Ledger].[CreatedBy],0)) 
  + ',' + STR(ISNULL([PRK_Ledger].[FinYear],0)) 
  + ',' + ISNULL([PRK_Perks1].[PerkCode],'') 
  + ',' + ISNULL([PRK_Perks1].[Description],'') 
  + ',' + STR(ISNULL([PRK_Perks1].[AdvanceMonths],0)) 
  + ',' + STR(ISNULL([PRK_Perks1].[LockedMonths],0)) 
  + ',' + STR(ISNULL([PRK_Perks1].[NoOfPayments],0)) 
  + ',' + ISNULL([PRK_Perks1].[UOM],'') 
  + ',' + ISNULL([PRK_Perks1].[BaaNGL],'') 
  + ',' + ISNULL([PRK_Perks1].[BaaNReference],'') 
  + ',' + ISNULL([PRK_Employees2].[CardNo],'') 
  + ',' + ISNULL([PRK_Employees2].[EmployeeName],'') 
  + ',' + STR(ISNULL([PRK_Employees2].[CategoryID],0)) 
  + ',' + ISNULL([PRK_Employees2].[PostedAt],'') 
  + ',' + ISNULL([PRK_Employees2].[VehicleType],'') 
  + ',' + STR(ISNULL([PRK_Employees2].[Basic],0)) 
  + ',' + ISNULL([PRK_Employees2].[Department],'') 
  + ',' + ISNULL([PRK_Employees2].[Company],'') 
  + ',' + ISNULL([PRK_FinYears3].[Description],'') 
  + ',' + ISNULL([PRK_FinYears3].[Status],'') 
  AS SearchDescription 
  FROM [PRK_Ledger] 
    	INNER JOIN #PageIndex
          ON [PRK_Ledger].[DocumentID] = #PageIndex.DocumentID
  INNER JOIN [PRK_Perks] AS [PRK_Perks1]
    ON [PRK_Ledger].[PerkID] = [PRK_Perks1].[PerkID]
  INNER JOIN [PRK_Employees] AS [PRK_Employees2]
    ON [PRK_Ledger].[CreatedBy] = [PRK_Employees2].[EmployeeID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears3]
    ON [PRK_Ledger].[FinYear] = [PRK_FinYears3].[FinYear]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
