USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkPerksSelectListPaged]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  PerkID Int NOT NULL
  )
  INSERT INTO #PageIndex (PerkID)
  SELECT [PRK_Perks].[PerkID] FROM [PRK_Perks]
  ORDER BY
     CASE @orderBy WHEN 'PerkID' THEN [PRK_Perks].[PerkID] END,
     CASE @orderBy WHEN 'PerkID DESC' THEN [PRK_Perks].[PerkID] END DESC,
     CASE @orderBy WHEN 'PerkCode' THEN [PRK_Perks].[PerkCode] END,
     CASE @orderBy WHEN 'PerkCode DESC' THEN [PRK_Perks].[PerkCode] END DESC,
     CASE @orderBy WHEN 'Description' THEN [PRK_Perks].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [PRK_Perks].[Description] END DESC,
     CASE @orderBy WHEN 'AdvanceApplicable' THEN [PRK_Perks].[AdvanceApplicable] END,
     CASE @orderBy WHEN 'AdvanceApplicable DESC' THEN [PRK_Perks].[AdvanceApplicable] END DESC,
     CASE @orderBy WHEN 'AdvanceMonths' THEN [PRK_Perks].[AdvanceMonths] END,
     CASE @orderBy WHEN 'AdvanceMonths DESC' THEN [PRK_Perks].[AdvanceMonths] END DESC,
     CASE @orderBy WHEN 'LockedMonths' THEN [PRK_Perks].[LockedMonths] END,
     CASE @orderBy WHEN 'LockedMonths DESC' THEN [PRK_Perks].[LockedMonths] END DESC,
     CASE @orderBy WHEN 'NoOfPayments' THEN [PRK_Perks].[NoOfPayments] END,
     CASE @orderBy WHEN 'NoOfPayments DESC' THEN [PRK_Perks].[NoOfPayments] END DESC,
     CASE @orderBy WHEN 'CarryForward' THEN [PRK_Perks].[CarryForward] END,
     CASE @orderBy WHEN 'CarryForward DESC' THEN [PRK_Perks].[CarryForward] END DESC,
     CASE @orderBy WHEN 'UOM' THEN [PRK_Perks].[UOM] END,
     CASE @orderBy WHEN 'UOM DESC' THEN [PRK_Perks].[UOM] END DESC,
     CASE @orderBy WHEN 'Active' THEN [PRK_Perks].[Active] END,
     CASE @orderBy WHEN 'Active DESC' THEN [PRK_Perks].[Active] END DESC,
     CASE @orderBy WHEN 'BaaNGL' THEN [PRK_Perks].[BaaNGL] END,
     CASE @orderBy WHEN 'BaaNGL DESC' THEN [PRK_Perks].[BaaNGL] END DESC,
     CASE @orderBy WHEN 'BaaNReference' THEN [PRK_Perks].[BaaNReference] END,
     CASE @orderBy WHEN 'BaaNReference DESC' THEN [PRK_Perks].[BaaNReference] END DESC,
     CASE @orderBy WHEN 'cmba' THEN [PRK_Perks].[cmba] END,
     CASE @orderBy WHEN 'cmba DESC' THEN [PRK_Perks].[cmba] END DESC 

  SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [PRK_Perks].[PerkID] = #PageIndex.PerkID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
GO
