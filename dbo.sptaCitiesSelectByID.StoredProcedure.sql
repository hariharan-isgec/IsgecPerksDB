USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCitiesSelectByID]
  @LoginID NVarChar(8),
  @CityID NVarChar(30) 
  AS
  SELECT
		[TA_Cities].[CityID] ,
		[TA_Cities].[CityName] ,
		[TA_Cities].[CityTypeForDA] ,
		[TA_Cities].[CityTypeForHotel] ,
		[TA_Cities].[CountryID] ,
		[TA_Cities].[RegionID] ,
		[TA_Cities].[CurrencyID] ,
		[TA_Cities].[RegionTypeID] ,
		[TA_CityTypes1].[CityTypeName] AS TA_CityTypes1_CityTypeName,
		[TA_CityTypes2].[CityTypeName] AS TA_CityTypes2_CityTypeName,
		[TA_Countries3].[CountryName] AS TA_Countries3_CountryName,
		[TA_Currencies4].[CurrencyName] AS TA_Currencies4_CurrencyName,
		[TA_Regions5].[RegionName] AS TA_Regions5_RegionName,
		[TA_RegionTypes6].[RegionTypeName] AS TA_RegionTypes6_RegionTypeName 
  FROM [TA_Cities] 
  LEFT OUTER JOIN [TA_CityTypes] AS [TA_CityTypes1]
    ON [TA_Cities].[CityTypeForDA] = [TA_CityTypes1].[CityTypeID]
  LEFT OUTER JOIN [TA_CityTypes] AS [TA_CityTypes2]
    ON [TA_Cities].[CityTypeForHotel] = [TA_CityTypes2].[CityTypeID]
  LEFT OUTER JOIN [TA_Countries] AS [TA_Countries3]
    ON [TA_Cities].[CountryID] = [TA_Countries3].[CountryID]
  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies4]
    ON [TA_Cities].[CurrencyID] = [TA_Currencies4].[CurrencyID]
  LEFT OUTER JOIN [TA_Regions] AS [TA_Regions5]
    ON [TA_Cities].[RegionID] = [TA_Regions5].[RegionID]
  LEFT OUTER JOIN [TA_RegionTypes] AS [TA_RegionTypes6]
    ON [TA_Cities].[RegionTypeID] = [TA_RegionTypes6].[RegionTypeID]
  WHERE
  [TA_Cities].[CityID] = @CityID
GO
