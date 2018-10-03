USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchPrkUserApplications]
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
  INNER JOIN [PRK_Perks] AS [PRK_Perks1]
    ON [PRK_Applications].[PerkID] = [PRK_Perks1].[PerkID]
  INNER JOIN [PRK_Status] AS [PRK_Status2]
    ON [PRK_Applications].[StatusID] = [PRK_Status2].[StatusID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears3]
    ON [PRK_Applications].[FinYear] = [PRK_FinYears3].[FinYear]
  WHERE STR(ISNULL([PRK_Applications].[ApplicationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[EmployeeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[PerkID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[Value], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Applications].[UserRemark],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[VerifiedValue], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[VerifiedAmt], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Applications].[VerifierRemark],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[ApprovedValue], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[ApprovedAmt], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Applications].[ApproverRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Applications].[PaymentMethod],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[StatusID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[FinYear], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[PerkCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks1].[AdvanceMonths], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks1].[LockedMonths], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks1].[NoOfPayments], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[UOM],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[BaaNGL],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks1].[BaaNReference],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Status2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_FinYears3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_FinYears3].[Status],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [PRK_Applications].[ApplicationID] AS SearchCode, 
  STR(ISNULL([PRK_Applications].[EmployeeID],0)) 
  + ',' + STR(ISNULL([PRK_Applications].[PerkID],0)) 
  + ',' + STR(ISNULL([PRK_Applications].[Value],0)) 
  + ',' + ISNULL([PRK_Applications].[UserRemark],'') 
  + ',' + STR(ISNULL([PRK_Applications].[VerifiedValue],0)) 
  + ',' + STR(ISNULL([PRK_Applications].[VerifiedAmt],0)) 
  + ',' + ISNULL([PRK_Applications].[VerifierRemark],'') 
  + ',' + STR(ISNULL([PRK_Applications].[ApprovedValue],0)) 
  + ',' + STR(ISNULL([PRK_Applications].[ApprovedAmt],0)) 
  + ',' + ISNULL([PRK_Applications].[ApproverRemark],'') 
  + ',' + ISNULL([PRK_Applications].[PaymentMethod],'') 
  + ',' + STR(ISNULL([PRK_Applications].[StatusID],0)) 
  + ',' + STR(ISNULL([PRK_Applications].[FinYear],0)) 
  + ',' + ISNULL([PRK_Perks1].[PerkCode],'') 
  + ',' + ISNULL([PRK_Perks1].[Description],'') 
  + ',' + STR(ISNULL([PRK_Perks1].[AdvanceMonths],0)) 
  + ',' + STR(ISNULL([PRK_Perks1].[LockedMonths],0)) 
  + ',' + STR(ISNULL([PRK_Perks1].[NoOfPayments],0)) 
  + ',' + ISNULL([PRK_Perks1].[UOM],'') 
  + ',' + ISNULL([PRK_Perks1].[BaaNGL],'') 
  + ',' + ISNULL([PRK_Perks1].[BaaNReference],'') 
  + ',' + ISNULL([PRK_Status2].[Description],'') 
  + ',' + ISNULL([PRK_FinYears3].[Description],'') 
  + ',' + ISNULL([PRK_FinYears3].[Status],'') 
  AS SearchDescription 
  FROM [PRK_Applications] 
    	INNER JOIN #PageIndex
          ON [PRK_Applications].[ApplicationID] = #PageIndex.ApplicationID
  INNER JOIN [PRK_Perks] AS [PRK_Perks1]
    ON [PRK_Applications].[PerkID] = [PRK_Perks1].[PerkID]
  INNER JOIN [PRK_Status] AS [PRK_Status2]
    ON [PRK_Applications].[StatusID] = [PRK_Status2].[StatusID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears3]
    ON [PRK_Applications].[FinYear] = [PRK_FinYears3].[FinYear]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
