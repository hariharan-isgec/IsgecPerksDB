USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkPerksSelectByID]
  @PerkID Int
  AS
  SELECT
		[PRK_Perks].[PerkID],
		[PRK_Perks].[PerkCode],
		[PRK_Perks].[Description],
		[PRK_Perks].[AdvanceApplicable],
		[PRK_Perks].[AdvanceMonths],
		[PRK_Perks].[LockedMonths],
		[PRK_Perks].[NoOfPayments],
		[PRK_Perks].[CarryForward],
		[PRK_Perks].[UOM],
		[PRK_Perks].[Active],
		[PRK_Perks].[BaaNGL],
		[PRK_Perks].[BaaNReference],
		[PRK_Perks].[cmba],
		[PRK_Perks].[CreditGLForCheque],
		[PRK_Perks].[CreditGLForCash24],
		[PRK_Perks].[CreditGLForImprest],
		[PRK_Perks].[CreditGLForCash63] 
  FROM [PRK_Perks] 
  WHERE
  [PRK_Perks].[PerkID] = @PerkID
GO
