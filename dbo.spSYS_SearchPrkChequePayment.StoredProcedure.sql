USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchPrkChequePayment]
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
  ApplicationID Int NOT NULL
  )
  INSERT INTO #PageIndex (ApplicationID)
  SELECT [PRK_Applications].[ApplicationID] FROM [PRK_Applications]
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Applications].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Applications].[PerkID] = [PRK_Perks2].[PerkID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees3]
    ON [PRK_Applications].[VerifiedBy] = [PRK_Employees3].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees4]
    ON [PRK_Applications].[ApprovedBy] = [PRK_Employees4].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]
    ON [PRK_Applications].[UpdatedBy] = [PRK_Employees5].[EmployeeID]
  INNER JOIN [PRK_Status] AS [PRK_Status6]
    ON [PRK_Applications].[StatusID] = [PRK_Status6].[StatusID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears7]
    ON [PRK_Applications].[FinYear] = [PRK_FinYears7].[FinYear]
  WHERE STR(ISNULL([PRK_Applications].[ApplicationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[EmployeeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[PerkID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[VerifiedValue], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[VerifiedAmt], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[VerifiedBy], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Applications].[VerifierRemark],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[ApprovedValue], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[ApprovedAmt], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[ApprovedBy], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Applications].[ApproverRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Applications].[PaymentMethod],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[UpdatedBy], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[StatusID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[FinYear], 0)) LIKE @KeyWord1
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
     OR LOWER(ISNULL([PRK_Employees4].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees4].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees4].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees4].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees4].[VehicleType],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees4].[Basic], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees4].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees4].[Company],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees5].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees5].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees5].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees5].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees5].[VehicleType],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees5].[Basic], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees5].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees5].[Company],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Status6].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_FinYears7].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_FinYears7].[Status],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [PRK_Applications].[ApplicationID] AS SearchCode, 
  STR(ISNULL([PRK_Applications].[EmployeeID],0)) 
  + ',' + STR(ISNULL([PRK_Applications].[PerkID],0)) 
  + ',' + STR(ISNULL([PRK_Applications].[VerifiedValue],0)) 
  + ',' + STR(ISNULL([PRK_Applications].[VerifiedAmt],0)) 
  + ',' + STR(ISNULL([PRK_Applications].[VerifiedBy],0)) 
  + ',' + ISNULL([PRK_Applications].[VerifierRemark],'') 
  + ',' + STR(ISNULL([PRK_Applications].[ApprovedValue],0)) 
  + ',' + STR(ISNULL([PRK_Applications].[ApprovedAmt],0)) 
  + ',' + STR(ISNULL([PRK_Applications].[ApprovedBy],0)) 
  + ',' + ISNULL([PRK_Applications].[ApproverRemark],'') 
  + ',' + ISNULL([PRK_Applications].[PaymentMethod],'') 
  + ',' + STR(ISNULL([PRK_Applications].[UpdatedBy],0)) 
  + ',' + STR(ISNULL([PRK_Applications].[StatusID],0)) 
  + ',' + STR(ISNULL([PRK_Applications].[FinYear],0)) 
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
  + ',' + ISNULL([PRK_Employees4].[CardNo],'') 
  + ',' + ISNULL([PRK_Employees4].[EmployeeName],'') 
  + ',' + STR(ISNULL([PRK_Employees4].[CategoryID],0)) 
  + ',' + ISNULL([PRK_Employees4].[PostedAt],'') 
  + ',' + ISNULL([PRK_Employees4].[VehicleType],'') 
  + ',' + STR(ISNULL([PRK_Employees4].[Basic],0)) 
  + ',' + ISNULL([PRK_Employees4].[Department],'') 
  + ',' + ISNULL([PRK_Employees4].[Company],'') 
  + ',' + ISNULL([PRK_Employees5].[CardNo],'') 
  + ',' + ISNULL([PRK_Employees5].[EmployeeName],'') 
  + ',' + STR(ISNULL([PRK_Employees5].[CategoryID],0)) 
  + ',' + ISNULL([PRK_Employees5].[PostedAt],'') 
  + ',' + ISNULL([PRK_Employees5].[VehicleType],'') 
  + ',' + STR(ISNULL([PRK_Employees5].[Basic],0)) 
  + ',' + ISNULL([PRK_Employees5].[Department],'') 
  + ',' + ISNULL([PRK_Employees5].[Company],'') 
  + ',' + ISNULL([PRK_Status6].[Description],'') 
  + ',' + ISNULL([PRK_FinYears7].[Description],'') 
  + ',' + ISNULL([PRK_FinYears7].[Status],'') 
  AS SearchDescription 
  FROM [PRK_Applications] 
    	INNER JOIN #PageIndex
          ON [PRK_Applications].[ApplicationID] = #PageIndex.ApplicationID
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Applications].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Applications].[PerkID] = [PRK_Perks2].[PerkID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees3]
    ON [PRK_Applications].[VerifiedBy] = [PRK_Employees3].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees4]
    ON [PRK_Applications].[ApprovedBy] = [PRK_Employees4].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]
    ON [PRK_Applications].[UpdatedBy] = [PRK_Employees5].[EmployeeID]
  INNER JOIN [PRK_Status] AS [PRK_Status6]
    ON [PRK_Applications].[StatusID] = [PRK_Status6].[StatusID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears7]
    ON [PRK_Applications].[FinYear] = [PRK_FinYears7].[FinYear]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
