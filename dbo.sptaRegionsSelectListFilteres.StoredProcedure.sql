USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaRegionsSelectListFilteres]
  @Filter_RegionTypeID NVarChar(10),
  @Filter_CurrencyID NVarChar(6),
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
 ,RegionID NVarChar(10) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RegionID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_Regions].[RegionID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_Regions] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_Currencies] AS [TA_Currencies1]'
  SET @LGSQL = @LGSQL + '    ON [TA_Regions].[CurrencyID] = [TA_Currencies1].[CurrencyID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_RegionTypes] AS [TA_RegionTypes2]'
  SET @LGSQL = @LGSQL + '    ON [TA_Regions].[RegionTypeID] = [TA_RegionTypes2].[RegionTypeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_RegionTypeID > '') 
    SET @LGSQL = @LGSQL + ' AND [TA_Regions].[RegionTypeID] = ''' + @Filter_RegionTypeID + ''''
  IF (@Filter_CurrencyID > '') 
    SET @LGSQL = @LGSQL + ' AND [TA_Regions].[CurrencyID] = ''' + @Filter_CurrencyID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RegionID' THEN '[TA_Regions].[RegionID]'
                        WHEN 'RegionID DESC' THEN '[TA_Regions].[RegionID] DESC'
                        WHEN 'RegionName' THEN '[TA_Regions].[RegionName]'
                        WHEN 'RegionName DESC' THEN '[TA_Regions].[RegionName] DESC'
                        WHEN 'RegionTypeID' THEN '[TA_Regions].[RegionTypeID]'
                        WHEN 'RegionTypeID DESC' THEN '[TA_Regions].[RegionTypeID] DESC'
                        WHEN 'CurrencyID' THEN '[TA_Regions].[CurrencyID]'
                        WHEN 'CurrencyID DESC' THEN '[TA_Regions].[CurrencyID] DESC'
                        WHEN 'TA_Currencies1_CurrencyName' THEN '[TA_Currencies1].[CurrencyName]'
                        WHEN 'TA_Currencies1_CurrencyName DESC' THEN '[TA_Currencies1].[CurrencyName] DESC'
                        WHEN 'TA_RegionTypes2_RegionTypeName' THEN '[TA_RegionTypes2].[RegionTypeName]'
                        WHEN 'TA_RegionTypes2_RegionTypeName DESC' THEN '[TA_RegionTypes2].[RegionTypeName] DESC'
                        ELSE '[TA_Regions].[RegionID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_Regions].[RegionID] ,
		[TA_Regions].[RegionName] ,
		[TA_Regions].[RegionTypeID] ,
		[TA_Regions].[CurrencyID] ,
		[TA_Currencies1].[CurrencyName] AS TA_Currencies1_CurrencyName,
		[TA_RegionTypes2].[RegionTypeName] AS TA_RegionTypes2_RegionTypeName 
  FROM [TA_Regions] 
      INNER JOIN #PageIndex
          ON [TA_Regions].[RegionID] = #PageIndex.RegionID
  INNER JOIN [TA_Currencies] AS [TA_Currencies1]
    ON [TA_Regions].[CurrencyID] = [TA_Currencies1].[CurrencyID]
  INNER JOIN [TA_RegionTypes] AS [TA_RegionTypes2]
    ON [TA_Regions].[RegionTypeID] = [TA_RegionTypes2].[RegionTypeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
