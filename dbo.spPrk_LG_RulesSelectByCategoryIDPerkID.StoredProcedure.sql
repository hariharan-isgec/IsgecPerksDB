USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrk_LG_RulesSelectByCategoryIDPerkID]
  @CategoryID Int,
  @PerkID Int,
  @StartDate DateTime 
  AS
  SELECT
		[AA].[PerkID],
		[AA].[CategoryID],
	  [AA].[EffectiveDate],
		[AA].[PercentageOfBasic],
		[AA].[Percentage],
		[AA].[FixedValue],
		[AA].[PostedAt],
		[AA].[VehicleType], 
		[AA].[InSalary]     
  FROM [PRK_Rules] AA
  WHERE [AA].[CategoryID] = @CategoryID	
	  AND [AA].[PerkID] = @PerkID 
    AND [AA].[EffectiveDate] = (SELECT MAX(EffectiveDate) 
																			FROM PRK_Rules BB 
																			WHERE CategoryID = @CategoryID 
																			AND PerkID = @PerkID 
																			AND EffectiveDate <= @StartDate
                                      AND BB.PostedAt = AA.PostedAt
                                      AND BB.VehicleType = AA.VehicleType
                                      AND BB.InSalary    = AA.InSalary   
																		 )
GO
