USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkApplicationsSelectByID]
  @LoginID NVarChar(8),
  @ApplicationID Int,
  @ClaimID Int 
  AS
  SELECT
    [PRK_Applications].* ,
    [PRK_Employees1].[EmployeeName] AS PRK_Employees1_EmployeeName,
    [PRK_Employees2].[EmployeeName] AS PRK_Employees2_EmployeeName,
    [PRK_Employees3].[EmployeeName] AS PRK_Employees3_EmployeeName,
    [PRK_Employees4].[EmployeeName] AS PRK_Employees4_EmployeeName,
    [PRK_Employees5].[EmployeeName] AS PRK_Employees5_EmployeeName,
    [PRK_FinYears6].[Description] AS PRK_FinYears6_Description,
    [PRK_Perks7].[Description] AS PRK_Perks7_Description,
    [PRK_Status8].[Description] AS PRK_Status8_Description,
    [PRK_UserClaims9].[Description] AS PRK_UserClaims9_Description 
  FROM [PRK_Applications] 
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Applications].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees2]
    ON [PRK_Applications].[ApprovedBy] = [PRK_Employees2].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees3]
    ON [PRK_Applications].[VerifiedBy] = [PRK_Employees3].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees4]
    ON [PRK_Applications].[UpdatedBy] = [PRK_Employees4].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]
    ON [PRK_Applications].[PostedBy] = [PRK_Employees5].[EmployeeID]
  LEFT OUTER JOIN [PRK_FinYears] AS [PRK_FinYears6]
    ON [PRK_Applications].[FinYear] = [PRK_FinYears6].[FinYear]
  INNER JOIN [PRK_Perks] AS [PRK_Perks7]
    ON [PRK_Applications].[PerkID] = [PRK_Perks7].[PerkID]
  INNER JOIN [PRK_Status] AS [PRK_Status8]
    ON [PRK_Applications].[StatusID] = [PRK_Status8].[StatusID]
  INNER JOIN [PRK_UserClaims] AS [PRK_UserClaims9]
    ON [PRK_Applications].[ClaimID] = [PRK_UserClaims9].[ClaimID]
  WHERE
  [PRK_Applications].[ApplicationID] = @ApplicationID
  AND [PRK_Applications].[ClaimID] = @ClaimID
GO
