USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkRulesSelectByID]
  @LoginID NVarChar(8),
  @RuleID Int 
  AS
  SELECT
    [PRK_Rules].* ,
    [PRK_Categories1].[Description] AS PRK_Categories1_Description,
    [PRK_Perks2].[Description] AS PRK_Perks2_Description 
  FROM [PRK_Rules] 
  INNER JOIN [PRK_Categories] AS [PRK_Categories1]
    ON [PRK_Rules].[CategoryID] = [PRK_Categories1].[CategoryID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Rules].[PerkID] = [PRK_Perks2].[PerkID]
  WHERE
  [PRK_Rules].[RuleID] = @RuleID
GO
