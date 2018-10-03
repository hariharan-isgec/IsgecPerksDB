USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCountriesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'CountryID' THEN [TA_Countries].[CountryID] END,
     CASE @OrderBy WHEN 'CountryID DESC' THEN [TA_Countries].[CountryID] END DESC,
     CASE @OrderBy WHEN 'CountryName' THEN [TA_Countries].[CountryName] END,
     CASE @OrderBy WHEN 'CountryName DESC' THEN [TA_Countries].[CountryName] END DESC,
     CASE @OrderBy WHEN 'RegionID' THEN [TA_Countries].[RegionID] END,
     CASE @OrderBy WHEN 'RegionID DESC' THEN [TA_Countries].[RegionID] END DESC,
     CASE @OrderBy WHEN 'CurrencyID' THEN [TA_Countries].[CurrencyID] END,
     CASE @OrderBy WHEN 'CurrencyID DESC' THEN [TA_Countries].[CurrencyID] END DESC,
     CASE @OrderBy WHEN 'RegionTypeID' THEN [TA_Countries].[RegionTypeID] END,
     CASE @OrderBy WHEN 'RegionTypeID DESC' THEN [TA_Countries].[RegionTypeID] END DESC,
     CASE @OrderBy WHEN 'ContingencyAmount' THEN [TA_Countries].[ContingencyAmount] END,
     CASE @OrderBy WHEN 'ContingencyAmount DESC' THEN [TA_Countries].[ContingencyAmount] END DESC,
     CASE @OrderBy WHEN 'TA_Currencies1_CurrencyName' THEN [TA_Currencies1].[CurrencyName] END,
     CASE @OrderBy WHEN 'TA_Currencies1_CurrencyName DESC' THEN [TA_Currencies1].[CurrencyName] END DESC,
     CASE @OrderBy WHEN 'TA_Regions2_RegionName' THEN [TA_Regions2].[RegionName] END,
     CASE @OrderBy WHEN 'TA_Regions2_RegionName DESC' THEN [TA_Regions2].[RegionName] END DESC,
     CASE @OrderBy WHEN 'TA_RegionTypes3_RegionTypeName' THEN [TA_RegionTypes3].[RegionTypeName] END,
     CASE @OrderBy WHEN 'TA_RegionTypes3_RegionTypeName DESC' THEN [TA_RegionTypes3].[RegionTypeName] END DESC 
  SET @RecordCount = @@RowCount
GO
