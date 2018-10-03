USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkRulesSelectListPagedByFilteres]
  @Filter_PerkID Int,
  @Filter_CategoryID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  RuleID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (RuleID) ' + 
               'SELECT [PRK_Rules].[RuleID] FROM [PRK_Rules] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Perks] AS [PRK_Perks1]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Rules].[PerkID] = [PRK_Perks1].[PerkID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Categories] AS [PRK_Categories2]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Rules].[CategoryID] = [PRK_Categories2].[CategoryID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_PerkID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Rules].[PerkID] = ' + STR(@Filter_PerkID)
  IF (@Filter_CategoryID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Rules].[CategoryID] = ' + STR(@Filter_CategoryID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RuleID' THEN '[PRK_Rules].[RuleID]'
                        WHEN 'RuleID DESC' THEN '[PRK_Rules].[RuleID] DESC'
                        WHEN 'PerkID' THEN '[PRK_Rules].[PerkID]'
                        WHEN 'PerkID DESC' THEN '[PRK_Rules].[PerkID] DESC'
                        WHEN 'CategoryID' THEN '[PRK_Rules].[CategoryID]'
                        WHEN 'CategoryID DESC' THEN '[PRK_Rules].[CategoryID] DESC'
                        WHEN 'EffectiveDate' THEN '[PRK_Rules].[EffectiveDate]'
                        WHEN 'EffectiveDate DESC' THEN '[PRK_Rules].[EffectiveDate] DESC'
                        WHEN 'PercentageOfBasic' THEN '[PRK_Rules].[PercentageOfBasic]'
                        WHEN 'PercentageOfBasic DESC' THEN '[PRK_Rules].[PercentageOfBasic] DESC'
                        WHEN 'Percentage' THEN '[PRK_Rules].[Percentage]'
                        WHEN 'Percentage DESC' THEN '[PRK_Rules].[Percentage] DESC'
                        WHEN 'FixedValue' THEN '[PRK_Rules].[FixedValue]'
                        WHEN 'FixedValue DESC' THEN '[PRK_Rules].[FixedValue] DESC'
                        WHEN 'PostedAt' THEN '[PRK_Rules].[PostedAt]'
                        WHEN 'PostedAt DESC' THEN '[PRK_Rules].[PostedAt] DESC'
                        WHEN 'VehicleType' THEN '[PRK_Rules].[VehicleType]'
                        WHEN 'VehicleType DESC' THEN '[PRK_Rules].[VehicleType] DESC'
                        WHEN 'PRK_Perks1_PerkID' THEN '[PRK_Perks1].[PerkID]'
                        WHEN 'PRK_Perks1_PerkID DESC' THEN '[PRK_Perks1].[PerkID] DESC'
                        WHEN 'PRK_Perks1_PerkCode' THEN '[PRK_Perks1].[PerkCode]'
                        WHEN 'PRK_Perks1_PerkCode DESC' THEN '[PRK_Perks1].[PerkCode] DESC'
                        WHEN 'PRK_Perks1_Description' THEN '[PRK_Perks1].[Description]'
                        WHEN 'PRK_Perks1_Description DESC' THEN '[PRK_Perks1].[Description] DESC'
                        WHEN 'PRK_Perks1_AdvanceApplicable' THEN '[PRK_Perks1].[AdvanceApplicable]'
                        WHEN 'PRK_Perks1_AdvanceApplicable DESC' THEN '[PRK_Perks1].[AdvanceApplicable] DESC'
                        WHEN 'PRK_Perks1_AdvanceMonths' THEN '[PRK_Perks1].[AdvanceMonths]'
                        WHEN 'PRK_Perks1_AdvanceMonths DESC' THEN '[PRK_Perks1].[AdvanceMonths] DESC'
                        WHEN 'PRK_Perks1_LockedMonths' THEN '[PRK_Perks1].[LockedMonths]'
                        WHEN 'PRK_Perks1_LockedMonths DESC' THEN '[PRK_Perks1].[LockedMonths] DESC'
                        WHEN 'PRK_Perks1_NoOfPayments' THEN '[PRK_Perks1].[NoOfPayments]'
                        WHEN 'PRK_Perks1_NoOfPayments DESC' THEN '[PRK_Perks1].[NoOfPayments] DESC'
                        WHEN 'PRK_Perks1_CarryForward' THEN '[PRK_Perks1].[CarryForward]'
                        WHEN 'PRK_Perks1_CarryForward DESC' THEN '[PRK_Perks1].[CarryForward] DESC'
                        WHEN 'PRK_Perks1_UOM' THEN '[PRK_Perks1].[UOM]'
                        WHEN 'PRK_Perks1_UOM DESC' THEN '[PRK_Perks1].[UOM] DESC'
                        WHEN 'PRK_Perks1_Active' THEN '[PRK_Perks1].[Active]'
                        WHEN 'PRK_Perks1_Active DESC' THEN '[PRK_Perks1].[Active] DESC'
                        WHEN 'PRK_Perks1_BaaNGL' THEN '[PRK_Perks1].[BaaNGL]'
                        WHEN 'PRK_Perks1_BaaNGL DESC' THEN '[PRK_Perks1].[BaaNGL] DESC'
                        WHEN 'PRK_Perks1_BaaNReference' THEN '[PRK_Perks1].[BaaNReference]'
                        WHEN 'PRK_Perks1_BaaNReference DESC' THEN '[PRK_Perks1].[BaaNReference] DESC'
                        WHEN 'PRK_Perks1_cmba' THEN '[PRK_Perks1].[cmba]'
                        WHEN 'PRK_Perks1_cmba DESC' THEN '[PRK_Perks1].[cmba] DESC'
                        WHEN 'PRK_Categories2_CategoryID' THEN '[PRK_Categories2].[CategoryID]'
                        WHEN 'PRK_Categories2_CategoryID DESC' THEN '[PRK_Categories2].[CategoryID] DESC'
                        WHEN 'PRK_Categories2_CategoryCode' THEN '[PRK_Categories2].[CategoryCode]'
                        WHEN 'PRK_Categories2_CategoryCode DESC' THEN '[PRK_Categories2].[CategoryCode] DESC'
                        WHEN 'PRK_Categories2_Description' THEN '[PRK_Categories2].[Description]'
                        WHEN 'PRK_Categories2_Description DESC' THEN '[PRK_Categories2].[Description] DESC'
                        WHEN 'PRK_Categories2_Active' THEN '[PRK_Categories2].[Active]'
                        WHEN 'PRK_Categories2_Active DESC' THEN '[PRK_Categories2].[Active] DESC'
                        WHEN 'PRK_Categories2_STDCategory' THEN '[PRK_Categories2].[STDCategory]'
                        WHEN 'PRK_Categories2_STDCategory DESC' THEN '[PRK_Categories2].[STDCategory] DESC'
                        WHEN 'PRK_Categories2_cmba' THEN '[PRK_Categories2].[cmba]'
                        WHEN 'PRK_Categories2_cmba DESC' THEN '[PRK_Categories2].[cmba] DESC'
                        ELSE '[PRK_Rules].[RuleID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [PRK_Rules].[RuleID] = #PageIndex.RuleID
  INNER JOIN [PRK_Perks] AS [PRK_Perks1]
    ON [PRK_Rules].[PerkID] = [PRK_Perks1].[PerkID]
  INNER JOIN [PRK_Categories] AS [PRK_Categories2]
    ON [PRK_Rules].[CategoryID] = [PRK_Categories2].[CategoryID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
