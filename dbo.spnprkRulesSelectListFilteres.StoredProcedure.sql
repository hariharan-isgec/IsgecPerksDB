USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkRulesSelectListFilteres]
  @Filter_PerkID Int,
  @Filter_CategoryID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,RuleID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RuleID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PRK_Rules].[RuleID]'
  SET @LGSQL = @LGSQL + ' FROM [PRK_Rules] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Categories] AS [PRK_Categories1]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Rules].[CategoryID] = [PRK_Categories1].[CategoryID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Perks] AS [PRK_Perks2]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Rules].[PerkID] = [PRK_Perks2].[PerkID]'
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
                        WHEN 'InSalary' THEN '[PRK_Rules].[InSalary]'
                        WHEN 'InSalary DESC' THEN '[PRK_Rules].[InSalary] DESC'
                        WHEN 'PRK_Categories1_Description' THEN '[PRK_Categories1].[Description]'
                        WHEN 'PRK_Categories1_Description DESC' THEN '[PRK_Categories1].[Description] DESC'
                        WHEN 'PRK_Perks2_Description' THEN '[PRK_Perks2].[Description]'
                        WHEN 'PRK_Perks2_Description DESC' THEN '[PRK_Perks2].[Description] DESC'
                        ELSE '[PRK_Rules].[RuleID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PRK_Rules].* ,
    [PRK_Categories1].[Description] AS PRK_Categories1_Description,
    [PRK_Perks2].[Description] AS PRK_Perks2_Description 
  FROM [PRK_Rules] 
      INNER JOIN #PageIndex
          ON [PRK_Rules].[RuleID] = #PageIndex.RuleID
  INNER JOIN [PRK_Categories] AS [PRK_Categories1]
    ON [PRK_Rules].[CategoryID] = [PRK_Categories1].[CategoryID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Rules].[PerkID] = [PRK_Perks2].[PerkID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
