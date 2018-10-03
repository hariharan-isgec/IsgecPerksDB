USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkLedgerSelectByID]
  @LoginID NVarChar(8),
  @DocumentID Int 
  AS
  SELECT
    [PRK_Ledger].* ,
    [PRK_Employees1].[EmployeeName] AS PRK_Employees1_EmployeeName,
    [PRK_Employees2].[EmployeeName] AS PRK_Employees2_EmployeeName,
    [PRK_Employees3].[EmployeeName] AS PRK_Employees3_EmployeeName,
    [PRK_FinYears4].[Description] AS PRK_FinYears4_Description,
    [PRK_Perks5].[Description] AS PRK_Perks5_Description 
  FROM [PRK_Ledger] 
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Ledger].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Employees] AS [PRK_Employees2]
    ON [PRK_Ledger].[CreatedBy] = [PRK_Employees2].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees3]
    ON [PRK_Ledger].[PostedBy] = [PRK_Employees3].[EmployeeID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears4]
    ON [PRK_Ledger].[FinYear] = [PRK_FinYears4].[FinYear]
  INNER JOIN [PRK_Perks] AS [PRK_Perks5]
    ON [PRK_Ledger].[PerkID] = [PRK_Perks5].[PerkID]
  WHERE
  [PRK_Ledger].[DocumentID] = @DocumentID
GO
