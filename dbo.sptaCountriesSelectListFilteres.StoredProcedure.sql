USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCountriesSelectListFilteres]
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
 ,CountryID NVarChar(30) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CountryID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_Countries].[CountryID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_Countries] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies1]'
  SET @LGSQL = @LGSQL + '    ON [TA_Countries].[CurrencyID] = [TA_Currencies1].[CurrencyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Regions] AS [TA_Regions2]'
  SET @LGSQL = @LGSQL + '    ON [TA_Countries].[RegionID] = [TA_Regions2].[RegionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_RegionTypes] AS [TA_RegionTypes3]'
  SET @LGSQL = @LGSQL + '    ON [TA_Countries].[RegionTypeID] = [TA_RegionTypes3].[RegionTypeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CountryID' THEN '[TA_Countries].[CountryID]'
                        WHEN 'CountryID DESC' THEN '[TA_Countries].[CountryID] DESC'
                        WHEN 'CountryName' THEN '[TA_Countries].[CountryName]'
                        WHEN 'CountryName DESC' THEN '[TA_Countries].[CountryName] DESC'
                        WHEN 'RegionID' THEN '[TA_Countries].[RegionID]'
                        WHEN 'RegionID DESC' THEN '[TA_Countries].[RegionID] DESC'
                        WHEN 'CurrencyID' THEN '[TA_Countries].[CurrencyID]'
                        WHEN 'CurrencyID DESC' THEN '[TA_Countries].[CurrencyID] DESC'
                        WHEN 'RegionTypeID' THEN '[TA_Countries].[RegionTypeID]'
                        WHEN 'RegionTypeID DESC' THEN '[TA_Countries].[RegionTypeID] DESC'
                        WHEN 'ContingencyAmount' THEN '[TA_Countries].[ContingencyAmount]'
                        WHEN 'ContingencyAmount DESC' THEN '[TA_Countries].[ContingencyAmount] DESC'
                        WHEN 'TA_Currencies1_CurrencyName' THEN '[TA_Currencies1].[CurrencyName]'
                        WHEN 'TA_Currencies1_CurrencyName DESC' THEN '[TA_Currencies1].[CurrencyName] DESC'
                        WHEN 'TA_Regions2_RegionName' THEN '[TA_Regions2].[RegionName]'
                        WHEN 'TA_Regions2_RegionName DESC' THEN '[TA_Regions2].[RegionName] DESC'
                        WHEN 'TA_RegionTypes3_RegionTypeName' THEN '[TA_RegionTypes3].[RegionTypeName]'
                        WHEN 'TA_RegionTypes3_RegionTypeName DESC' THEN '[TA_RegionTypes3].[RegionTypeName] DESC'
                        ELSE '[TA_Countries].[CountryID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
      INNER JOIN #PageIndex
          ON [TA_Countries].[CountryID] = #PageIndex.CountryID
  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies1]
    ON [TA_Countries].[CurrencyID] = [TA_Currencies1].[CurrencyID]
  LEFT OUTER JOIN [TA_Regions] AS [TA_Regions2]
    ON [TA_Countries].[RegionID] = [TA_Regions2].[RegionID]
  LEFT OUTER JOIN [TA_RegionTypes] AS [TA_RegionTypes3]
    ON [TA_Countries].[RegionTypeID] = [TA_RegionTypes3].[RegionTypeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
