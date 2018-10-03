USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkPerksSelectListPagedByFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  PerkID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (PerkID) ' + 
               'SELECT [PRK_Perks].[PerkID] FROM [PRK_Perks] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'PerkID' THEN '[PRK_Perks].[PerkID]'
                        WHEN 'PerkID DESC' THEN '[PRK_Perks].[PerkID] DESC'
                        WHEN 'PerkCode' THEN '[PRK_Perks].[PerkCode]'
                        WHEN 'PerkCode DESC' THEN '[PRK_Perks].[PerkCode] DESC'
                        WHEN 'Description' THEN '[PRK_Perks].[Description]'
                        WHEN 'Description DESC' THEN '[PRK_Perks].[Description] DESC'
                        WHEN 'AdvanceApplicable' THEN '[PRK_Perks].[AdvanceApplicable]'
                        WHEN 'AdvanceApplicable DESC' THEN '[PRK_Perks].[AdvanceApplicable] DESC'
                        WHEN 'AdvanceMonths' THEN '[PRK_Perks].[AdvanceMonths]'
                        WHEN 'AdvanceMonths DESC' THEN '[PRK_Perks].[AdvanceMonths] DESC'
                        WHEN 'LockedMonths' THEN '[PRK_Perks].[LockedMonths]'
                        WHEN 'LockedMonths DESC' THEN '[PRK_Perks].[LockedMonths] DESC'
                        WHEN 'NoOfPayments' THEN '[PRK_Perks].[NoOfPayments]'
                        WHEN 'NoOfPayments DESC' THEN '[PRK_Perks].[NoOfPayments] DESC'
                        WHEN 'CarryForward' THEN '[PRK_Perks].[CarryForward]'
                        WHEN 'CarryForward DESC' THEN '[PRK_Perks].[CarryForward] DESC'
                        WHEN 'UOM' THEN '[PRK_Perks].[UOM]'
                        WHEN 'UOM DESC' THEN '[PRK_Perks].[UOM] DESC'
                        WHEN 'Active' THEN '[PRK_Perks].[Active]'
                        WHEN 'Active DESC' THEN '[PRK_Perks].[Active] DESC'
                        WHEN 'BaaNGL' THEN '[PRK_Perks].[BaaNGL]'
                        WHEN 'BaaNGL DESC' THEN '[PRK_Perks].[BaaNGL] DESC'
                        WHEN 'BaaNReference' THEN '[PRK_Perks].[BaaNReference]'
                        WHEN 'BaaNReference DESC' THEN '[PRK_Perks].[BaaNReference] DESC'
                        WHEN 'cmba' THEN '[PRK_Perks].[cmba]'
                        WHEN 'cmba DESC' THEN '[PRK_Perks].[cmba] DESC'
                        ELSE '[PRK_Perks].[PerkID]'
                    END
  EXEC (@LGSQL)

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
  END
GO
