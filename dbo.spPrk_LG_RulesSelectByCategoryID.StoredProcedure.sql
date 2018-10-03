USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrk_LG_RulesSelectByCategoryID]
  @CategoryID Int
  AS
  SELECT
		[PRK_Rules].[PerkID],
		[PRK_Rules].[CategoryID],
	max([PRK_Rules].[EffectiveDate]),
		[PRK_Rules].[PercentageOfBasic],
		[PRK_Rules].[Percentage],
		[PRK_Rules].[FixedValue],
		[PRK_Rules].[PostedAt],
		[PRK_Rules].[VehicleType],
		[PRK_Rules].[InSalary],
		[PRK_Perks1].[PerkID] AS PRK_Perks1_PerkID,
		[PRK_Perks1].[PerkCode] AS PRK_Perks1_PerkCode,
		[PRK_Perks1].[Description] AS PRK_Perks1_Description,
		[PRK_Perks1].[AdvanceApplicable] AS PRK_Perks1_AdvanceApplicable,
		[PRK_Perks1].[AdvanceMonths] AS PRK_Perks1_AdvanceMonths,
		[PRK_Perks1].[LockedMonths] AS PRK_Perks1_LockedMonths,
		[PRK_Perks1].[NoOfPayments] AS PRK_Perks1_NoOfPayments,
		[PRK_Perks1].[CarryForward] AS PRK_Perks1_CarryForward,
		[PRK_Perks1].[UOM] AS PRK_Perks1_UOM,
		[PRK_Perks1].[Active] AS PRK_Perks1_Active,
		[PRK_Perks1].[BaaNGL] AS PRK_Perks1_BaaNGL,
		[PRK_Perks1].[BaaNReference] AS PRK_Perks1_BaaNReference,
		[PRK_Perks1].[cmba] AS PRK_Perks1_cmba,
		[PRK_Categories2].[CategoryID] AS PRK_Categories2_CategoryID,
		[PRK_Categories2].[CategoryCode] AS PRK_Categories2_CategoryCode,
		[PRK_Categories2].[Description] AS PRK_Categories2_Description,
		[PRK_Categories2].[Active] AS PRK_Categories2_Active,
		[PRK_Categories2].[STDCategory] AS PRK_Categories2_STDCategory,
		[PRK_Categories2].[cmba] AS PRK_Categories2_cmba 
  FROM [PRK_Rules] 
  INNER JOIN [PRK_Perks] AS [PRK_Perks1]
    ON [PRK_Rules].[PerkID] = [PRK_Perks1].[PerkID]
  INNER JOIN [PRK_Categories] AS [PRK_Categories2]
    ON [PRK_Rules].[CategoryID] = [PRK_Categories2].[CategoryID]
  WHERE
  [PRK_Rules].[CategoryID] = @CategoryID	
  GROUP BY
	[PRK_Rules].[PerkID],
	[PRK_Rules].[CategoryID],
	[PRK_Rules].[PercentageOfBasic],
	[PRK_Rules].[Percentage],
	[PRK_Rules].[FixedValue],
	[PRK_Rules].[PostedAt],
	[PRK_Rules].[VehicleType],
	[PRK_Rules].[InSalary],
	[PRK_Perks1].[PerkID],
	[PRK_Perks1].[PerkCode],
	[PRK_Perks1].[Description],
	[PRK_Perks1].[AdvanceApplicable],
	[PRK_Perks1].[AdvanceMonths],
	[PRK_Perks1].[LockedMonths],
	[PRK_Perks1].[NoOfPayments],
	[PRK_Perks1].[CarryForward],
	[PRK_Perks1].[UOM],
	[PRK_Perks1].[Active],
	[PRK_Perks1].[BaaNGL],
	[PRK_Perks1].[BaaNReference],
	[PRK_Perks1].[cmba],
	[PRK_Categories2].[CategoryID],
	[PRK_Categories2].[CategoryCode],
	[PRK_Categories2].[Description],
	[PRK_Categories2].[Active],
	[PRK_Categories2].[STDCategory],
	[PRK_Categories2].[cmba]
  ORDER BY
	[PRK_Rules].[PerkID]
GO
