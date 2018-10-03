USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCitiesSelectListSearch]
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
 ,CityID NVarChar(30) NOT NULL
  )
  INSERT INTO #PageIndex (CityID)
  SELECT [TA_Cities].[CityID] FROM [TA_Cities]
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
   ( 
         LOWER(ISNULL([TA_Cities].[CityID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_Cities].[CityName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_Cities].[CityTypeForDA],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_Cities].[CityTypeForHotel],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_Cities].[CountryID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_Cities].[RegionID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_Cities].[CurrencyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TA_Cities].[RegionTypeID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'CityID' THEN [TA_Cities].[CityID] END,
     CASE @OrderBy WHEN 'CityID DESC' THEN [TA_Cities].[CityID] END DESC,
     CASE @OrderBy WHEN 'CityName' THEN [TA_Cities].[CityName] END,
     CASE @OrderBy WHEN 'CityName DESC' THEN [TA_Cities].[CityName] END DESC,
     CASE @OrderBy WHEN 'CityTypeForDA' THEN [TA_Cities].[CityTypeForDA] END,
     CASE @OrderBy WHEN 'CityTypeForDA DESC' THEN [TA_Cities].[CityTypeForDA] END DESC,
     CASE @OrderBy WHEN 'CityTypeForHotel' THEN [TA_Cities].[CityTypeForHotel] END,
     CASE @OrderBy WHEN 'CityTypeForHotel DESC' THEN [TA_Cities].[CityTypeForHotel] END DESC,
     CASE @OrderBy WHEN 'CountryID' THEN [TA_Cities].[CountryID] END,
     CASE @OrderBy WHEN 'CountryID DESC' THEN [TA_Cities].[CountryID] END DESC,
     CASE @OrderBy WHEN 'RegionID' THEN [TA_Cities].[RegionID] END,
     CASE @OrderBy WHEN 'RegionID DESC' THEN [TA_Cities].[RegionID] END DESC,
     CASE @OrderBy WHEN 'CurrencyID' THEN [TA_Cities].[CurrencyID] END,
     CASE @OrderBy WHEN 'CurrencyID DESC' THEN [TA_Cities].[CurrencyID] END DESC,
     CASE @OrderBy WHEN 'RegionTypeID' THEN [TA_Cities].[RegionTypeID] END,
     CASE @OrderBy WHEN 'RegionTypeID DESC' THEN [TA_Cities].[RegionTypeID] END DESC,
     CASE @OrderBy WHEN 'TA_CityTypes1_CityTypeName' THEN [TA_CityTypes1].[CityTypeName] END,
     CASE @OrderBy WHEN 'TA_CityTypes1_CityTypeName DESC' THEN [TA_CityTypes1].[CityTypeName] END DESC,
     CASE @OrderBy WHEN 'TA_CityTypes2_CityTypeName' THEN [TA_CityTypes2].[CityTypeName] END,
     CASE @OrderBy WHEN 'TA_CityTypes2_CityTypeName DESC' THEN [TA_CityTypes2].[CityTypeName] END DESC,
     CASE @OrderBy WHEN 'TA_Countries3_CountryName' THEN [TA_Countries3].[CountryName] END,
     CASE @OrderBy WHEN 'TA_Countries3_CountryName DESC' THEN [TA_Countries3].[CountryName] END DESC,
     CASE @OrderBy WHEN 'TA_Currencies4_CurrencyName' THEN [TA_Currencies4].[CurrencyName] END,
     CASE @OrderBy WHEN 'TA_Currencies4_CurrencyName DESC' THEN [TA_Currencies4].[CurrencyName] END DESC,
     CASE @OrderBy WHEN 'TA_Regions5_RegionName' THEN [TA_Regions5].[RegionName] END,
     CASE @OrderBy WHEN 'TA_Regions5_RegionName DESC' THEN [TA_Regions5].[RegionName] END DESC,
     CASE @OrderBy WHEN 'TA_RegionTypes6_RegionTypeName' THEN [TA_RegionTypes6].[RegionTypeName] END,
     CASE @OrderBy WHEN 'TA_RegionTypes6_RegionTypeName DESC' THEN [TA_RegionTypes6].[RegionTypeName] END DESC 

    SET @RecordCount = @@RowCount

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
      INNER JOIN #PageIndex
          ON [TA_Cities].[CityID] = #PageIndex.CityID
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
