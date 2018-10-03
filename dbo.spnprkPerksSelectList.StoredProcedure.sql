USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkPerksSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PRK_Perks].*  
  FROM [PRK_Perks] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'PerkID' THEN [PRK_Perks].[PerkID] END,
     CASE @OrderBy WHEN 'PerkID DESC' THEN [PRK_Perks].[PerkID] END DESC,
     CASE @OrderBy WHEN 'PerkCode' THEN [PRK_Perks].[PerkCode] END,
     CASE @OrderBy WHEN 'PerkCode DESC' THEN [PRK_Perks].[PerkCode] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PRK_Perks].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PRK_Perks].[Description] END DESC,
     CASE @OrderBy WHEN 'AdvanceApplicable' THEN [PRK_Perks].[AdvanceApplicable] END,
     CASE @OrderBy WHEN 'AdvanceApplicable DESC' THEN [PRK_Perks].[AdvanceApplicable] END DESC,
     CASE @OrderBy WHEN 'AdvanceMonths' THEN [PRK_Perks].[AdvanceMonths] END,
     CASE @OrderBy WHEN 'AdvanceMonths DESC' THEN [PRK_Perks].[AdvanceMonths] END DESC,
     CASE @OrderBy WHEN 'LockedMonths' THEN [PRK_Perks].[LockedMonths] END,
     CASE @OrderBy WHEN 'LockedMonths DESC' THEN [PRK_Perks].[LockedMonths] END DESC,
     CASE @OrderBy WHEN 'NoOfPayments' THEN [PRK_Perks].[NoOfPayments] END,
     CASE @OrderBy WHEN 'NoOfPayments DESC' THEN [PRK_Perks].[NoOfPayments] END DESC,
     CASE @OrderBy WHEN 'CarryForward' THEN [PRK_Perks].[CarryForward] END,
     CASE @OrderBy WHEN 'CarryForward DESC' THEN [PRK_Perks].[CarryForward] END DESC,
     CASE @OrderBy WHEN 'UOM' THEN [PRK_Perks].[UOM] END,
     CASE @OrderBy WHEN 'UOM DESC' THEN [PRK_Perks].[UOM] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [PRK_Perks].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [PRK_Perks].[Active] END DESC,
     CASE @OrderBy WHEN 'BaaNGL' THEN [PRK_Perks].[BaaNGL] END,
     CASE @OrderBy WHEN 'BaaNGL DESC' THEN [PRK_Perks].[BaaNGL] END DESC,
     CASE @OrderBy WHEN 'BaaNReference' THEN [PRK_Perks].[BaaNReference] END,
     CASE @OrderBy WHEN 'BaaNReference DESC' THEN [PRK_Perks].[BaaNReference] END DESC,
     CASE @OrderBy WHEN 'CreditGLForCheque' THEN [PRK_Perks].[CreditGLForCheque] END,
     CASE @OrderBy WHEN 'CreditGLForCheque DESC' THEN [PRK_Perks].[CreditGLForCheque] END DESC,
     CASE @OrderBy WHEN 'CreditGLForCash24' THEN [PRK_Perks].[CreditGLForCash24] END,
     CASE @OrderBy WHEN 'CreditGLForCash24 DESC' THEN [PRK_Perks].[CreditGLForCash24] END DESC,
     CASE @OrderBy WHEN 'CreditGLForImprest' THEN [PRK_Perks].[CreditGLForImprest] END,
     CASE @OrderBy WHEN 'CreditGLForImprest DESC' THEN [PRK_Perks].[CreditGLForImprest] END DESC,
     CASE @OrderBy WHEN 'CreditGLForCash63' THEN [PRK_Perks].[CreditGLForCash63] END,
     CASE @OrderBy WHEN 'CreditGLForCash63 DESC' THEN [PRK_Perks].[CreditGLForCash63] END DESC,
     CASE @OrderBy WHEN 'cmba' THEN [PRK_Perks].[cmba] END,
     CASE @OrderBy WHEN 'cmba DESC' THEN [PRK_Perks].[cmba] END DESC 
  SET @RecordCount = @@RowCount
GO
