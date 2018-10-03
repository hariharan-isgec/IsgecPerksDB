USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchPrkLedger]
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
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Ledger].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Ledger].[PerkID] = [PRK_Perks2].[PerkID]
  INNER JOIN [PRK_Employees] AS [PRK_Employees3]
    ON [PRK_Ledger].[CreatedBy] = [PRK_Employees3].[EmployeeID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears4]
    ON [PRK_Ledger].[FinYear] = [PRK_FinYears4].[FinYear]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]
    ON [PRK_Ledger].[PostedBy] = [PRK_Employees5].[EmployeeID]
  WHERE STR(ISNULL([PRK_Ledger].[DocumentID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[EmployeeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[PerkID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Ledger].[TranType],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[Value], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Ledger].[UOM],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[Amount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Ledger].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[CreatedBy], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[FinYear], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[ApplicationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Ledger].[PostedBy], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Ledger].[BatchNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Ledger].[VoucherNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Ledger].[VoucherLineNo],'')) LIKE @KeyWord1
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
     OR LOWER(ISNULL([PRK_Employees3].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees3].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees3].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees3].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees3].[VehicleType],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees3].[Basic], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees3].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees3].[Company],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_FinYears4].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_FinYears4].[Status],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees5].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees5].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees5].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees5].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees5].[VehicleType],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees5].[Basic], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees5].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees5].[Company],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [PRK_Ledger].[DocumentID] AS SearchCode, 
  STR(ISNULL([PRK_Ledger].[EmployeeID],0)) 
  + ',' + STR(ISNULL([PRK_Ledger].[PerkID],0)) 
  + ',' + ISNULL([PRK_Ledger].[TranType],'') 
  + ',' + STR(ISNULL([PRK_Ledger].[Value],0)) 
  + ',' + ISNULL([PRK_Ledger].[UOM],'') 
  + ',' + STR(ISNULL([PRK_Ledger].[Amount],0)) 
  + ',' + ISNULL([PRK_Ledger].[Remarks],'') 
  + ',' + STR(ISNULL([PRK_Ledger].[CreatedBy],0)) 
  + ',' + STR(ISNULL([PRK_Ledger].[FinYear],0)) 
  + ',' + STR(ISNULL([PRK_Ledger].[ApplicationID],0)) 
  + ',' + STR(ISNULL([PRK_Ledger].[PostedBy],0)) 
  + ',' + ISNULL([PRK_Ledger].[BatchNo],'') 
  + ',' + ISNULL([PRK_Ledger].[VoucherNo],'') 
  + ',' + ISNULL([PRK_Ledger].[VoucherLineNo],'') 
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
  + ',' + ISNULL([PRK_Employees3].[CardNo],'') 
  + ',' + ISNULL([PRK_Employees3].[EmployeeName],'') 
  + ',' + STR(ISNULL([PRK_Employees3].[CategoryID],0)) 
  + ',' + ISNULL([PRK_Employees3].[PostedAt],'') 
  + ',' + ISNULL([PRK_Employees3].[VehicleType],'') 
  + ',' + STR(ISNULL([PRK_Employees3].[Basic],0)) 
  + ',' + ISNULL([PRK_Employees3].[Department],'') 
  + ',' + ISNULL([PRK_Employees3].[Company],'') 
  + ',' + ISNULL([PRK_FinYears4].[Description],'') 
  + ',' + ISNULL([PRK_FinYears4].[Status],'') 
  + ',' + ISNULL([PRK_Employees5].[CardNo],'') 
  + ',' + ISNULL([PRK_Employees5].[EmployeeName],'') 
  + ',' + STR(ISNULL([PRK_Employees5].[CategoryID],0)) 
  + ',' + ISNULL([PRK_Employees5].[PostedAt],'') 
  + ',' + ISNULL([PRK_Employees5].[VehicleType],'') 
  + ',' + STR(ISNULL([PRK_Employees5].[Basic],0)) 
  + ',' + ISNULL([PRK_Employees5].[Department],'') 
  + ',' + ISNULL([PRK_Employees5].[Company],'') 
  AS SearchDescription 
  FROM [PRK_Ledger] 
    	INNER JOIN #PageIndex
          ON [PRK_Ledger].[DocumentID] = #PageIndex.DocumentID
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Ledger].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Ledger].[PerkID] = [PRK_Perks2].[PerkID]
  INNER JOIN [PRK_Employees] AS [PRK_Employees3]
    ON [PRK_Ledger].[CreatedBy] = [PRK_Employees3].[EmployeeID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears4]
    ON [PRK_Ledger].[FinYear] = [PRK_FinYears4].[FinYear]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]
    ON [PRK_Ledger].[PostedBy] = [PRK_Employees5].[EmployeeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
