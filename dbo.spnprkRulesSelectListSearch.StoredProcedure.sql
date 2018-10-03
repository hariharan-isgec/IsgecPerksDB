USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkRulesSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,RuleID Int NOT NULL
  )
  INSERT INTO #PageIndex (RuleID)
  SELECT [PRK_Rules].[RuleID] FROM [PRK_Rules]
  INNER JOIN [PRK_Categories] AS [PRK_Categories1]
    ON [PRK_Rules].[CategoryID] = [PRK_Categories1].[CategoryID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Rules].[PerkID] = [PRK_Perks2].[PerkID]
 WHERE  
   ( 
         STR(ISNULL([PRK_Rules].[RuleID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Rules].[PerkID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Rules].[CategoryID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Rules].[Percentage], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Rules].[FixedValue], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Rules].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Rules].[VehicleType],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RuleID' THEN [PRK_Rules].[RuleID] END,
     CASE @OrderBy WHEN 'RuleID DESC' THEN [PRK_Rules].[RuleID] END DESC,
     CASE @OrderBy WHEN 'PerkID' THEN [PRK_Rules].[PerkID] END,
     CASE @OrderBy WHEN 'PerkID DESC' THEN [PRK_Rules].[PerkID] END DESC,
     CASE @OrderBy WHEN 'CategoryID' THEN [PRK_Rules].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [PRK_Rules].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'EffectiveDate' THEN [PRK_Rules].[EffectiveDate] END,
     CASE @OrderBy WHEN 'EffectiveDate DESC' THEN [PRK_Rules].[EffectiveDate] END DESC,
     CASE @OrderBy WHEN 'PercentageOfBasic' THEN [PRK_Rules].[PercentageOfBasic] END,
     CASE @OrderBy WHEN 'PercentageOfBasic DESC' THEN [PRK_Rules].[PercentageOfBasic] END DESC,
     CASE @OrderBy WHEN 'Percentage' THEN [PRK_Rules].[Percentage] END,
     CASE @OrderBy WHEN 'Percentage DESC' THEN [PRK_Rules].[Percentage] END DESC,
     CASE @OrderBy WHEN 'FixedValue' THEN [PRK_Rules].[FixedValue] END,
     CASE @OrderBy WHEN 'FixedValue DESC' THEN [PRK_Rules].[FixedValue] END DESC,
     CASE @OrderBy WHEN 'PostedAt' THEN [PRK_Rules].[PostedAt] END,
     CASE @OrderBy WHEN 'PostedAt DESC' THEN [PRK_Rules].[PostedAt] END DESC,
     CASE @OrderBy WHEN 'VehicleType' THEN [PRK_Rules].[VehicleType] END,
     CASE @OrderBy WHEN 'VehicleType DESC' THEN [PRK_Rules].[VehicleType] END DESC,
     CASE @OrderBy WHEN 'InSalary' THEN [PRK_Rules].[InSalary] END,
     CASE @OrderBy WHEN 'InSalary DESC' THEN [PRK_Rules].[InSalary] END DESC,
     CASE @OrderBy WHEN 'PRK_Categories1_Description' THEN [PRK_Categories1].[Description] END,
     CASE @OrderBy WHEN 'PRK_Categories1_Description DESC' THEN [PRK_Categories1].[Description] END DESC,
     CASE @OrderBy WHEN 'PRK_Perks2_Description' THEN [PRK_Perks2].[Description] END,
     CASE @OrderBy WHEN 'PRK_Perks2_Description DESC' THEN [PRK_Perks2].[Description] END DESC 

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
