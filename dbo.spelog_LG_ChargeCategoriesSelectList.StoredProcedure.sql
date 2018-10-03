USE [IJTPerks]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelog_LG_ChargeCategoriesSelectList]
  @LoginID NVarChar(8),
  @ShipmentModeID Int,
  @LocationCountryID Int,
  @CargoTypeID Int,
  @StuffingTypeID Int,
  @StuffingPointID Int,
  @BreakbulkTypeID Int,
  @ChargeTypeID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
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
  WHERE [ELOG_ChargeCategories].[ShipmentModeID] = @ShipmentModeID
	AND [ELOG_ChargeCategories].[LocationCountryID] = @LocationCountryID
  	AND [ELOG_ChargeCategories].[CargoTypeID] = @CargoTypeID
  	AND [ELOG_ChargeCategories].[StuffingTypeID] = @StuffingTypeID
  	AND [ELOG_ChargeCategories].[StuffingPointID] = @StuffingPointID
  	AND [ELOG_ChargeCategories].[BreakbulkTypeID] is NULL 
  	AND [ELOG_ChargeCategories].[ChargeTypeID] = @ChargeTypeID
  ORDER BY [ELOG_ChargeCategories].[Description]
  SET @RecordCount = @@RowCount
GO
