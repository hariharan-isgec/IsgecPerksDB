USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkRulesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[PRK_Rules].[RuleID],
		[PRK_Rules].[PerkID],
		[PRK_Rules].[CategoryID],
		[PRK_Rules].[EffectiveDate],
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
  ORDER BY
     CASE @orderBy WHEN 'RuleID' THEN [PRK_Rules].[RuleID] END,
     CASE @orderBy WHEN 'RuleID DESC' THEN [PRK_Rules].[RuleID] END DESC,
     CASE @orderBy WHEN 'PerkID' THEN [PRK_Rules].[PerkID] END,
     CASE @orderBy WHEN 'PerkID DESC' THEN [PRK_Rules].[PerkID] END DESC,
     CASE @orderBy WHEN 'CategoryID' THEN [PRK_Rules].[CategoryID] END,
     CASE @orderBy WHEN 'CategoryID DESC' THEN [PRK_Rules].[CategoryID] END DESC,
     CASE @orderBy WHEN 'EffectiveDate' THEN [PRK_Rules].[EffectiveDate] END,
     CASE @orderBy WHEN 'EffectiveDate DESC' THEN [PRK_Rules].[EffectiveDate] END DESC,
     CASE @orderBy WHEN 'PercentageOfBasic' THEN [PRK_Rules].[PercentageOfBasic] END,
     CASE @orderBy WHEN 'PercentageOfBasic DESC' THEN [PRK_Rules].[PercentageOfBasic] END DESC,
     CASE @orderBy WHEN 'Percentage' THEN [PRK_Rules].[Percentage] END,
     CASE @orderBy WHEN 'Percentage DESC' THEN [PRK_Rules].[Percentage] END DESC,
     CASE @orderBy WHEN 'FixedValue' THEN [PRK_Rules].[FixedValue] END,
     CASE @orderBy WHEN 'FixedValue DESC' THEN [PRK_Rules].[FixedValue] END DESC,
     CASE @orderBy WHEN 'PostedAt' THEN [PRK_Rules].[PostedAt] END,
     CASE @orderBy WHEN 'PostedAt DESC' THEN [PRK_Rules].[PostedAt] END DESC,
     CASE @orderBy WHEN 'VehicleType' THEN [PRK_Rules].[VehicleType] END,
     CASE @orderBy WHEN 'VehicleType DESC' THEN [PRK_Rules].[VehicleType] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_PerkID' THEN [PRK_Perks1].[PerkID] END,
     CASE @orderBy WHEN 'PRK_Perks1_PerkID DESC' THEN [PRK_Perks1].[PerkID] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_PerkCode' THEN [PRK_Perks1].[PerkCode] END,
     CASE @orderBy WHEN 'PRK_Perks1_PerkCode DESC' THEN [PRK_Perks1].[PerkCode] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_Description' THEN [PRK_Perks1].[Description] END,
     CASE @orderBy WHEN 'PRK_Perks1_Description DESC' THEN [PRK_Perks1].[Description] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_AdvanceApplicable' THEN [PRK_Perks1].[AdvanceApplicable] END,
     CASE @orderBy WHEN 'PRK_Perks1_AdvanceApplicable DESC' THEN [PRK_Perks1].[AdvanceApplicable] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_AdvanceMonths' THEN [PRK_Perks1].[AdvanceMonths] END,
     CASE @orderBy WHEN 'PRK_Perks1_AdvanceMonths DESC' THEN [PRK_Perks1].[AdvanceMonths] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_LockedMonths' THEN [PRK_Perks1].[LockedMonths] END,
     CASE @orderBy WHEN 'PRK_Perks1_LockedMonths DESC' THEN [PRK_Perks1].[LockedMonths] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_NoOfPayments' THEN [PRK_Perks1].[NoOfPayments] END,
     CASE @orderBy WHEN 'PRK_Perks1_NoOfPayments DESC' THEN [PRK_Perks1].[NoOfPayments] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_CarryForward' THEN [PRK_Perks1].[CarryForward] END,
     CASE @orderBy WHEN 'PRK_Perks1_CarryForward DESC' THEN [PRK_Perks1].[CarryForward] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_UOM' THEN [PRK_Perks1].[UOM] END,
     CASE @orderBy WHEN 'PRK_Perks1_UOM DESC' THEN [PRK_Perks1].[UOM] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_Active' THEN [PRK_Perks1].[Active] END,
     CASE @orderBy WHEN 'PRK_Perks1_Active DESC' THEN [PRK_Perks1].[Active] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_BaaNGL' THEN [PRK_Perks1].[BaaNGL] END,
     CASE @orderBy WHEN 'PRK_Perks1_BaaNGL DESC' THEN [PRK_Perks1].[BaaNGL] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_BaaNReference' THEN [PRK_Perks1].[BaaNReference] END,
     CASE @orderBy WHEN 'PRK_Perks1_BaaNReference DESC' THEN [PRK_Perks1].[BaaNReference] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_cmba' THEN [PRK_Perks1].[cmba] END,
     CASE @orderBy WHEN 'PRK_Perks1_cmba DESC' THEN [PRK_Perks1].[cmba] END DESC,
     CASE @orderBy WHEN 'PRK_Categories2_CategoryID' THEN [PRK_Categories2].[CategoryID] END,
     CASE @orderBy WHEN 'PRK_Categories2_CategoryID DESC' THEN [PRK_Categories2].[CategoryID] END DESC,
     CASE @orderBy WHEN 'PRK_Categories2_CategoryCode' THEN [PRK_Categories2].[CategoryCode] END,
     CASE @orderBy WHEN 'PRK_Categories2_CategoryCode DESC' THEN [PRK_Categories2].[CategoryCode] END DESC,
     CASE @orderBy WHEN 'PRK_Categories2_Description' THEN [PRK_Categories2].[Description] END,
     CASE @orderBy WHEN 'PRK_Categories2_Description DESC' THEN [PRK_Categories2].[Description] END DESC,
     CASE @orderBy WHEN 'PRK_Categories2_Active' THEN [PRK_Categories2].[Active] END,
     CASE @orderBy WHEN 'PRK_Categories2_Active DESC' THEN [PRK_Categories2].[Active] END DESC,
     CASE @orderBy WHEN 'PRK_Categories2_STDCategory' THEN [PRK_Categories2].[STDCategory] END,
     CASE @orderBy WHEN 'PRK_Categories2_STDCategory DESC' THEN [PRK_Categories2].[STDCategory] END DESC,
     CASE @orderBy WHEN 'PRK_Categories2_cmba' THEN [PRK_Categories2].[cmba] END,
     CASE @orderBy WHEN 'PRK_Categories2_cmba DESC' THEN [PRK_Categories2].[cmba] END DESC 
  SET @RecordCount = @@RowCount
GO
