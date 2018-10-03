USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCountriesSelectByID]
  @LoginID NVarChar(8),
  @CountryID NVarChar(30) 
  AS
  SELECT
		[TA_Countries].[CountryID] ,
		[TA_Countries].[CountryName] ,
		[TA_Countries].[RegionID] ,
		[TA_Countries].[CurrencyID] ,
		[TA_Countries].[RegionTypeID] ,
		[TA_Countries].[ContingencyAmount] ,
		[TA_Currencies1].[CurrencyName] AS TA_Currencies1_CurrencyName,
		[TA_Regions2].[RegionName] AS TA_Regions2_RegionName,
		[TA_RegionTypes3].[RegionTypeName] AS TA_RegionTypes3_RegionTypeName 
  FROM [TA_Countries] 
  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies1]
    ON [TA_Countries].[CurrencyID] = [TA_Currencies1].[CurrencyID]
  LEFT OUTER JOIN [TA_Regions] AS [TA_Regions2]
    ON [TA_Countries].[RegionID] = [TA_Regions2].[RegionID]
  LEFT OUTER JOIN [TA_RegionTypes] AS [TA_RegionTypes3]
    ON [TA_Countries].[RegionTypeID] = [TA_RegionTypes3].[RegionTypeID]
  WHERE
  [TA_Countries].[CountryID] = @CountryID
GO
