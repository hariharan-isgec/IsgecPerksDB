USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spnprk_LG_GetBalanceMedicalForYear]
  @EmployeeID Int,
  @FinYear Int 
  AS
  SELECT
    [PRK_Entitlements].* ,
    [PRK_Categories1].[Description] AS PRK_Categories1_Description,
    [PRK_Employees2].[EmployeeName] AS PRK_Employees2_EmployeeName,
    [PRK_FinYears3].[Description] AS PRK_FinYears3_Description,
    [PRK_Perks4].[Description] AS PRK_Perks4_Description 
  FROM [PRK_Entitlements] 
  INNER JOIN [PRK_Categories] AS [PRK_Categories1]
    ON [PRK_Entitlements].[CategoryID] = [PRK_Categories1].[CategoryID]
  INNER JOIN [PRK_Employees] AS [PRK_Employees2]
    ON [PRK_Entitlements].[EmployeeID] = [PRK_Employees2].[EmployeeID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears3]
    ON [PRK_Entitlements].[FinYear] = [PRK_FinYears3].[FinYear]
  INNER JOIN [PRK_Perks] AS [PRK_Perks4]
    ON [PRK_Entitlements].[PerkID] = [PRK_Perks4].[PerkID]
  WHERE
  [PRK_Entitlements].[EmployeeID] = @EmployeeID
   AND [PRK_Entitlements].[FinYear] = @FinYear  
   AND [PRK_Entitlements].[PerkID] = 19

  --19 = Balance Medical
GO
