USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkEntitlementsSelectByID]
  @EntitlementID Int
  AS
  SELECT
		[PRK_Entitlements].[EntitlementID],
		[PRK_Entitlements].[EmployeeID],
		[PRK_Entitlements].[PerkID],
		[PRK_Entitlements].[CategoryID],
		[PRK_Entitlements].[EffectiveDate],
		[PRK_Entitlements].[PostedAt],
		[PRK_Entitlements].[Value],
		[PRK_Entitlements].[VehicleType],
		[PRK_Entitlements].[Basic],
		[PRK_Entitlements].[UOM],
		[PRK_Entitlements].[ESI],
		[PRK_Entitlements].[FinYear],
		[PRK_Employees1].[EmployeeID] AS PRK_Employees1_EmployeeID,
		[PRK_Employees1].[CardNo] AS PRK_Employees1_CardNo,
		[PRK_Employees1].[EmployeeName] AS PRK_Employees1_EmployeeName,
		[PRK_Employees1].[CategoryID] AS PRK_Employees1_CategoryID,
		[PRK_Employees1].[PostedAt] AS PRK_Employees1_PostedAt,
		[PRK_Employees1].[VehicleType] AS PRK_Employees1_VehicleType,
		[PRK_Employees1].[Basic] AS PRK_Employees1_Basic,
		[PRK_Employees1].[ESI] AS PRK_Employees1_ESI,
		[PRK_Employees1].[DOJ] AS PRK_Employees1_DOJ,
		[PRK_Employees1].[DOR] AS PRK_Employees1_DOR,
		[PRK_Employees1].[Department] AS PRK_Employees1_Department,
		[PRK_Employees1].[Company] AS PRK_Employees1_Company,
		[PRK_Perks2].[PerkID] AS PRK_Perks2_PerkID,
		[PRK_Perks2].[PerkCode] AS PRK_Perks2_PerkCode,
		[PRK_Perks2].[Description] AS PRK_Perks2_Description,
		[PRK_Perks2].[AdvanceApplicable] AS PRK_Perks2_AdvanceApplicable,
		[PRK_Perks2].[AdvanceMonths] AS PRK_Perks2_AdvanceMonths,
		[PRK_Perks2].[LockedMonths] AS PRK_Perks2_LockedMonths,
		[PRK_Perks2].[NoOfPayments] AS PRK_Perks2_NoOfPayments,
		[PRK_Perks2].[CarryForward] AS PRK_Perks2_CarryForward,
		[PRK_Perks2].[UOM] AS PRK_Perks2_UOM,
		[PRK_Perks2].[Active] AS PRK_Perks2_Active,
		[PRK_Perks2].[BaaNGL] AS PRK_Perks2_BaaNGL,
		[PRK_Perks2].[BaaNReference] AS PRK_Perks2_BaaNReference,
		[PRK_Perks2].[cmba] AS PRK_Perks2_cmba,
		[PRK_Categories3].[CategoryID] AS PRK_Categories3_CategoryID,
		[PRK_Categories3].[CategoryCode] AS PRK_Categories3_CategoryCode,
		[PRK_Categories3].[Description] AS PRK_Categories3_Description,
		[PRK_Categories3].[Active] AS PRK_Categories3_Active,
		[PRK_Categories3].[STDCategory] AS PRK_Categories3_STDCategory,
		[PRK_Categories3].[cmba] AS PRK_Categories3_cmba,
		[PRK_FinYears4].[FinYear] AS PRK_FinYears4_FinYear,
		[PRK_FinYears4].[Description] AS PRK_FinYears4_Description,
		[PRK_FinYears4].[StartDate] AS PRK_FinYears4_StartDate,
		[PRK_FinYears4].[EndDate] AS PRK_FinYears4_EndDate,
		[PRK_FinYears4].[Status] AS PRK_FinYears4_Status 
  FROM [PRK_Entitlements] 
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Entitlements].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Entitlements].[PerkID] = [PRK_Perks2].[PerkID]
  INNER JOIN [PRK_Categories] AS [PRK_Categories3]
    ON [PRK_Entitlements].[CategoryID] = [PRK_Categories3].[CategoryID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears4]
    ON [PRK_Entitlements].[FinYear] = [PRK_FinYears4].[FinYear]
  WHERE
  [PRK_Entitlements].[EntitlementID] = @EntitlementID
GO
