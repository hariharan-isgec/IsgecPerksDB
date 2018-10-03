USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprk_LG_EntitlementsSelectAsOn]
  @EmployeeID Int,
  @PerkID Int,
  @EffectiveDate DateTime,
  @FinYear Int,
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[PRK_Entitlements].*,
		[PRK_Categories3].[CategoryID] AS PRK_Categories3_CategoryID,
		[PRK_Categories3].[CategoryCode] AS PRK_Categories3_CategoryCode,
		[PRK_Categories3].[Description] AS PRK_Categories3_Description,
		[PRK_Categories3].[Active] AS PRK_Categories3_Active,
		[PRK_Categories3].[STDCategory] AS PRK_Categories3_STDCategory,
		[PRK_Categories3].[cmba] AS PRK_Categories3_cmba
  FROM [PRK_Entitlements] 
  INNER JOIN [PRK_Categories] AS [PRK_Categories3]
    ON [PRK_Entitlements].[CategoryID] = [PRK_Categories3].[CategoryID]
  WHERE
  [PRK_Entitlements].[EmployeeID] = @EmployeeID 
  AND [PRK_Entitlements].[PerkID] = @PerkID
  AND [PRK_Entitlements].[FinYear] = @FinYear
  ORDER BY [PRK_Entitlements].[EffectiveDate]

  SET @RecordCount = @@RowCount



    --AND DATEDIFF(mm,@EffectiveDate, [PRK_Entitlements].[EffectiveDate]) <=0
GO
