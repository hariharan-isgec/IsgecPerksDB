USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCitiesSelectListFilteres]
  @Filter_CountryID NVarChar(30),
  @Filter_RegionID NVarChar(10),
  @Filter_CurrencyID NVarChar(6),
  @Filter_RegionTypeID NVarChar(10),
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
 ,CityID NVarChar(30) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CityID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_Cities].[CityID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_Cities] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_CityTypes] AS [TA_CityTypes1]'
  SET @LGSQL = @LGSQL + '    ON [TA_Cities].[CityTypeForDA] = [TA_CityTypes1].[CityTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_CityTypes] AS [TA_CityTypes2]'
  SET @LGSQL = @LGSQL + '    ON [TA_Cities].[CityTypeForHotel] = [TA_CityTypes2].[CityTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Countries] AS [TA_Countries3]'
  SET @LGSQL = @LGSQL + '    ON [TA_Cities].[CountryID] = [TA_Countries3].[CountryID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies4]'
  SET @LGSQL = @LGSQL + '    ON [TA_Cities].[CurrencyID] = [TA_Currencies4].[CurrencyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Regions] AS [TA_Regions5]'
  SET @LGSQL = @LGSQL + '    ON [TA_Cities].[RegionID] = [TA_Regions5].[RegionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_RegionTypes] AS [TA_RegionTypes6]'
  SET @LGSQL = @LGSQL + '    ON [TA_Cities].[RegionTypeID] = [TA_RegionTypes6].[RegionTypeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CountryID > '') 
    SET @LGSQL = @LGSQL + ' AND [TA_Cities].[CountryID] = ''' + @Filter_CountryID + ''''
  IF (@Filter_RegionID > '') 
    SET @LGSQL = @LGSQL + ' AND [TA_Cities].[RegionID] = ''' + @Filter_RegionID + ''''
  IF (@Filter_CurrencyID > '') 
    SET @LGSQL = @LGSQL + ' AND [TA_Cities].[CurrencyID] = ''' + @Filter_CurrencyID + ''''
  IF (@Filter_RegionTypeID > '') 
    SET @LGSQL = @LGSQL + ' AND [TA_Cities].[RegionTypeID] = ''' + @Filter_RegionTypeID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CityID' THEN '[TA_Cities].[CityID]'
                        WHEN 'CityID DESC' THEN '[TA_Cities].[CityID] DESC'
                        WHEN 'CityName' THEN '[TA_Cities].[CityName]'
                        WHEN 'CityName DESC' THEN '[TA_Cities].[CityName] DESC'
                        WHEN 'CityTypeForDA' THEN '[TA_Cities].[CityTypeForDA]'
                        WHEN 'CityTypeForDA DESC' THEN '[TA_Cities].[CityTypeForDA] DESC'
                        WHEN 'CityTypeForHotel' THEN '[TA_Cities].[CityTypeForHotel]'
                        WHEN 'CityTypeForHotel DESC' THEN '[TA_Cities].[CityTypeForHotel] DESC'
                        WHEN 'CountryID' THEN '[TA_Cities].[CountryID]'
                        WHEN 'CountryID DESC' THEN '[TA_Cities].[CountryID] DESC'
                        WHEN 'RegionID' THEN '[TA_Cities].[RegionID]'
                        WHEN 'RegionID DESC' THEN '[TA_Cities].[RegionID] DESC'
                        WHEN 'CurrencyID' THEN '[TA_Cities].[CurrencyID]'
                        WHEN 'CurrencyID DESC' THEN '[TA_Cities].[CurrencyID] DESC'
                        WHEN 'RegionTypeID' THEN '[TA_Cities].[RegionTypeID]'
                        WHEN 'RegionTypeID DESC' THEN '[TA_Cities].[RegionTypeID] DESC'
                        WHEN 'TA_CityTypes1_CityTypeName' THEN '[TA_CityTypes1].[CityTypeName]'
                        WHEN 'TA_CityTypes1_CityTypeName DESC' THEN '[TA_CityTypes1].[CityTypeName] DESC'
                        WHEN 'TA_CityTypes2_CityTypeName' THEN '[TA_CityTypes2].[CityTypeName]'
                        WHEN 'TA_CityTypes2_CityTypeName DESC' THEN '[TA_CityTypes2].[CityTypeName] DESC'
                        WHEN 'TA_Countries3_CountryName' THEN '[TA_Countries3].[CountryName]'
                        WHEN 'TA_Countries3_CountryName DESC' THEN '[TA_Countries3].[CountryName] DESC'
                        WHEN 'TA_Currencies4_CurrencyName' THEN '[TA_Currencies4].[CurrencyName]'
                        WHEN 'TA_Currencies4_CurrencyName DESC' THEN '[TA_Currencies4].[CurrencyName] DESC'
                        WHEN 'TA_Regions5_RegionName' THEN '[TA_Regions5].[RegionName]'
                        WHEN 'TA_Regions5_RegionName DESC' THEN '[TA_Regions5].[RegionName] DESC'
                        WHEN 'TA_RegionTypes6_RegionTypeName' THEN '[TA_RegionTypes6].[RegionTypeName]'
                        WHEN 'TA_RegionTypes6_RegionTypeName DESC' THEN '[TA_RegionTypes6].[RegionTypeName] DESC'
                        ELSE '[TA_Cities].[CityID]'
                    END
  EXEC (@LGSQL)

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
