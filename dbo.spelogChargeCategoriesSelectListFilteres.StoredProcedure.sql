USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeCategoriesSelectListFilteres]
  @Filter_ShipmentModeID Int,
  @Filter_LocationCountryID Int,
  @Filter_CargoTypeID Int,
  @Filter_StuffingTypeID Int,
  @Filter_StuffingPointID Int,
  @Filter_BreakbulkTypeID Int,
  @Filter_ChargeTypeID Int,
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
 ,ChargeCategoryID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ChargeCategoryID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ELOG_ChargeCategories].[ChargeCategoryID]'
  SET @LGSQL = @LGSQL + ' FROM [ELOG_ChargeCategories] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_BreakbulkTypes] AS [ELOG_BreakbulkTypes1]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_ChargeCategories].[BreakbulkTypeID] = [ELOG_BreakbulkTypes1].[BreakbulkTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_CargoTypes] AS [ELOG_CargoTypes2]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_ChargeCategories].[CargoTypeID] = [ELOG_CargoTypes2].[CargoTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_ChargeTypes] AS [ELOG_ChargeTypes3]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_ChargeCategories].[ChargeTypeID] = [ELOG_ChargeTypes3].[ChargeTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_LocationCountries] AS [ELOG_LocationCountries4]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_ChargeCategories].[LocationCountryID] = [ELOG_LocationCountries4].[LocationCountryID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_ShipmentModes] AS [ELOG_ShipmentModes5]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_ChargeCategories].[ShipmentModeID] = [ELOG_ShipmentModes5].[ShipmentModeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_StuffingPoints] AS [ELOG_StuffingPoints6]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_ChargeCategories].[StuffingPointID] = [ELOG_StuffingPoints6].[StuffingPointID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_StuffingTypes] AS [ELOG_StuffingTypes7]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_ChargeCategories].[StuffingTypeID] = [ELOG_StuffingTypes7].[StuffingTypeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ShipmentModeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ELOG_ChargeCategories].[ShipmentModeID] = ' + STR(@Filter_ShipmentModeID)
  IF (@Filter_LocationCountryID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ELOG_ChargeCategories].[LocationCountryID] = ' + STR(@Filter_LocationCountryID)
  IF (@Filter_CargoTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ELOG_ChargeCategories].[CargoTypeID] = ' + STR(@Filter_CargoTypeID)
  IF (@Filter_StuffingTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ELOG_ChargeCategories].[StuffingTypeID] = ' + STR(@Filter_StuffingTypeID)
  IF (@Filter_StuffingPointID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ELOG_ChargeCategories].[StuffingPointID] = ' + STR(@Filter_StuffingPointID)
  IF (@Filter_BreakbulkTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ELOG_ChargeCategories].[BreakbulkTypeID] = ' + STR(@Filter_BreakbulkTypeID)
  IF (@Filter_ChargeTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ELOG_ChargeCategories].[ChargeTypeID] = ' + STR(@Filter_ChargeTypeID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ChargeCategoryID' THEN '[ELOG_ChargeCategories].[ChargeCategoryID]'
                        WHEN 'ChargeCategoryID DESC' THEN '[ELOG_ChargeCategories].[ChargeCategoryID] DESC'
                        WHEN 'ShipmentModeID' THEN '[ELOG_ChargeCategories].[ShipmentModeID]'
                        WHEN 'ShipmentModeID DESC' THEN '[ELOG_ChargeCategories].[ShipmentModeID] DESC'
                        WHEN 'LocationCountryID' THEN '[ELOG_ChargeCategories].[LocationCountryID]'
                        WHEN 'LocationCountryID DESC' THEN '[ELOG_ChargeCategories].[LocationCountryID] DESC'
                        WHEN 'CargoTypeID' THEN '[ELOG_ChargeCategories].[CargoTypeID]'
                        WHEN 'CargoTypeID DESC' THEN '[ELOG_ChargeCategories].[CargoTypeID] DESC'
                        WHEN 'StuffingTypeID' THEN '[ELOG_ChargeCategories].[StuffingTypeID]'
                        WHEN 'StuffingTypeID DESC' THEN '[ELOG_ChargeCategories].[StuffingTypeID] DESC'
                        WHEN 'StuffingPointID' THEN '[ELOG_ChargeCategories].[StuffingPointID]'
                        WHEN 'StuffingPointID DESC' THEN '[ELOG_ChargeCategories].[StuffingPointID] DESC'
                        WHEN 'BreakbulkTypeID' THEN '[ELOG_ChargeCategories].[BreakbulkTypeID]'
                        WHEN 'BreakbulkTypeID DESC' THEN '[ELOG_ChargeCategories].[BreakbulkTypeID] DESC'
                        WHEN 'ChargeTypeID' THEN '[ELOG_ChargeCategories].[ChargeTypeID]'
                        WHEN 'ChargeTypeID DESC' THEN '[ELOG_ChargeCategories].[ChargeTypeID] DESC'
                        WHEN 'Description' THEN '[ELOG_ChargeCategories].[Description]'
                        WHEN 'Description DESC' THEN '[ELOG_ChargeCategories].[Description] DESC'
                        WHEN 'ELOG_BreakbulkTypes1_Description' THEN '[ELOG_BreakbulkTypes1].[Description]'
                        WHEN 'ELOG_BreakbulkTypes1_Description DESC' THEN '[ELOG_BreakbulkTypes1].[Description] DESC'
                        WHEN 'ELOG_CargoTypes2_Description' THEN '[ELOG_CargoTypes2].[Description]'
                        WHEN 'ELOG_CargoTypes2_Description DESC' THEN '[ELOG_CargoTypes2].[Description] DESC'
                        WHEN 'ELOG_ChargeTypes3_Description' THEN '[ELOG_ChargeTypes3].[Description]'
                        WHEN 'ELOG_ChargeTypes3_Description DESC' THEN '[ELOG_ChargeTypes3].[Description] DESC'
                        WHEN 'ELOG_LocationCountries4_Description' THEN '[ELOG_LocationCountries4].[Description]'
                        WHEN 'ELOG_LocationCountries4_Description DESC' THEN '[ELOG_LocationCountries4].[Description] DESC'
                        WHEN 'ELOG_ShipmentModes5_Description' THEN '[ELOG_ShipmentModes5].[Description]'
                        WHEN 'ELOG_ShipmentModes5_Description DESC' THEN '[ELOG_ShipmentModes5].[Description] DESC'
                        WHEN 'ELOG_StuffingPoints6_Description' THEN '[ELOG_StuffingPoints6].[Description]'
                        WHEN 'ELOG_StuffingPoints6_Description DESC' THEN '[ELOG_StuffingPoints6].[Description] DESC'
                        WHEN 'ELOG_StuffingTypes7_Description' THEN '[ELOG_StuffingTypes7].[Description]'
                        WHEN 'ELOG_StuffingTypes7_Description DESC' THEN '[ELOG_StuffingTypes7].[Description] DESC'
                        ELSE '[ELOG_ChargeCategories].[ChargeCategoryID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ELOG_ChargeCategories].* ,
    [ELOG_BreakbulkTypes1].[Description] AS ELOG_BreakbulkTypes1_Description,
    [ELOG_CargoTypes2].[Description] AS ELOG_CargoTypes2_Description,
    [ELOG_ChargeTypes3].[Description] AS ELOG_ChargeTypes3_Description,
    [ELOG_LocationCountries4].[Description] AS ELOG_LocationCountries4_Description,
    [ELOG_ShipmentModes5].[Description] AS ELOG_ShipmentModes5_Description,
    [ELOG_StuffingPoints6].[Description] AS ELOG_StuffingPoints6_Description,
    [ELOG_StuffingTypes7].[Description] AS ELOG_StuffingTypes7_Description 
  FROM [ELOG_ChargeCategories] 
      INNER JOIN #PageIndex
          ON [ELOG_ChargeCategories].[ChargeCategoryID] = #PageIndex.ChargeCategoryID
  LEFT OUTER JOIN [ELOG_BreakbulkTypes] AS [ELOG_BreakbulkTypes1]
    ON [ELOG_ChargeCategories].[BreakbulkTypeID] = [ELOG_BreakbulkTypes1].[BreakbulkTypeID]
  LEFT OUTER JOIN [ELOG_CargoTypes] AS [ELOG_CargoTypes2]
    ON [ELOG_ChargeCategories].[CargoTypeID] = [ELOG_CargoTypes2].[CargoTypeID]
  LEFT OUTER JOIN [ELOG_ChargeTypes] AS [ELOG_ChargeTypes3]
    ON [ELOG_ChargeCategories].[ChargeTypeID] = [ELOG_ChargeTypes3].[ChargeTypeID]
  LEFT OUTER JOIN [ELOG_LocationCountries] AS [ELOG_LocationCountries4]
    ON [ELOG_ChargeCategories].[LocationCountryID] = [ELOG_LocationCountries4].[LocationCountryID]
  LEFT OUTER JOIN [ELOG_ShipmentModes] AS [ELOG_ShipmentModes5]
    ON [ELOG_ChargeCategories].[ShipmentModeID] = [ELOG_ShipmentModes5].[ShipmentModeID]
  LEFT OUTER JOIN [ELOG_StuffingPoints] AS [ELOG_StuffingPoints6]
    ON [ELOG_ChargeCategories].[StuffingPointID] = [ELOG_StuffingPoints6].[StuffingPointID]
  LEFT OUTER JOIN [ELOG_StuffingTypes] AS [ELOG_StuffingTypes7]
    ON [ELOG_ChargeCategories].[StuffingTypeID] = [ELOG_StuffingTypes7].[StuffingTypeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
