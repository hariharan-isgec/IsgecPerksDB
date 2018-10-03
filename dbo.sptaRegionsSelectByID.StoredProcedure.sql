USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaRegionsSelectByID]
  @LoginID NVarChar(8),
  @RegionID NVarChar(10) 
  AS
  SELECT
		[TA_Regions].[RegionID] ,
		[TA_Regions].[RegionName] ,
		[TA_Regions].[RegionTypeID] ,
		[TA_Regions].[CurrencyID] ,
		[TA_Currencies1].[CurrencyName] AS TA_Currencies1_CurrencyName,
		[TA_RegionTypes2].[RegionTypeName] AS TA_RegionTypes2_RegionTypeName 
  FROM [TA_Regions] 
  INNER JOIN [TA_Currencies] AS [TA_Currencies1]
    ON [TA_Regions].[CurrencyID] = [TA_Currencies1].[CurrencyID]
  INNER JOIN [TA_RegionTypes] AS [TA_RegionTypes2]
    ON [TA_Regions].[RegionTypeID] = [TA_RegionTypes2].[RegionTypeID]
  WHERE
  [TA_Regions].[RegionID] = @RegionID
GO
