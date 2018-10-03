USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeCategoriesSelectList]
  @LoginID NVarChar(8),
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
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ChargeCategoryID' THEN [ELOG_ChargeCategories].[ChargeCategoryID] END,
     CASE @OrderBy WHEN 'ChargeCategoryID DESC' THEN [ELOG_ChargeCategories].[ChargeCategoryID] END DESC,
     CASE @OrderBy WHEN 'ShipmentModeID' THEN [ELOG_ChargeCategories].[ShipmentModeID] END,
     CASE @OrderBy WHEN 'ShipmentModeID DESC' THEN [ELOG_ChargeCategories].[ShipmentModeID] END DESC,
     CASE @OrderBy WHEN 'LocationCountryID' THEN [ELOG_ChargeCategories].[LocationCountryID] END,
     CASE @OrderBy WHEN 'LocationCountryID DESC' THEN [ELOG_ChargeCategories].[LocationCountryID] END DESC,
     CASE @OrderBy WHEN 'CargoTypeID' THEN [ELOG_ChargeCategories].[CargoTypeID] END,
     CASE @OrderBy WHEN 'CargoTypeID DESC' THEN [ELOG_ChargeCategories].[CargoTypeID] END DESC,
     CASE @OrderBy WHEN 'StuffingTypeID' THEN [ELOG_ChargeCategories].[StuffingTypeID] END,
     CASE @OrderBy WHEN 'StuffingTypeID DESC' THEN [ELOG_ChargeCategories].[StuffingTypeID] END DESC,
     CASE @OrderBy WHEN 'StuffingPointID' THEN [ELOG_ChargeCategories].[StuffingPointID] END,
     CASE @OrderBy WHEN 'StuffingPointID DESC' THEN [ELOG_ChargeCategories].[StuffingPointID] END DESC,
     CASE @OrderBy WHEN 'BreakbulkTypeID' THEN [ELOG_ChargeCategories].[BreakbulkTypeID] END,
     CASE @OrderBy WHEN 'BreakbulkTypeID DESC' THEN [ELOG_ChargeCategories].[BreakbulkTypeID] END DESC,
     CASE @OrderBy WHEN 'ChargeTypeID' THEN [ELOG_ChargeCategories].[ChargeTypeID] END,
     CASE @OrderBy WHEN 'ChargeTypeID DESC' THEN [ELOG_ChargeCategories].[ChargeTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_ChargeCategories].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_ChargeCategories].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_BreakbulkTypes1_Description' THEN [ELOG_BreakbulkTypes1].[Description] END,
     CASE @OrderBy WHEN 'ELOG_BreakbulkTypes1_Description DESC' THEN [ELOG_BreakbulkTypes1].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_CargoTypes2_Description' THEN [ELOG_CargoTypes2].[Description] END,
     CASE @OrderBy WHEN 'ELOG_CargoTypes2_Description DESC' THEN [ELOG_CargoTypes2].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_ChargeTypes3_Description' THEN [ELOG_ChargeTypes3].[Description] END,
     CASE @OrderBy WHEN 'ELOG_ChargeTypes3_Description DESC' THEN [ELOG_ChargeTypes3].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_LocationCountries4_Description' THEN [ELOG_LocationCountries4].[Description] END,
     CASE @OrderBy WHEN 'ELOG_LocationCountries4_Description DESC' THEN [ELOG_LocationCountries4].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_ShipmentModes5_Description' THEN [ELOG_ShipmentModes5].[Description] END,
     CASE @OrderBy WHEN 'ELOG_ShipmentModes5_Description DESC' THEN [ELOG_ShipmentModes5].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_StuffingPoints6_Description' THEN [ELOG_StuffingPoints6].[Description] END,
     CASE @OrderBy WHEN 'ELOG_StuffingPoints6_Description DESC' THEN [ELOG_StuffingPoints6].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_StuffingTypes7_Description' THEN [ELOG_StuffingTypes7].[Description] END,
     CASE @OrderBy WHEN 'ELOG_StuffingTypes7_Description DESC' THEN [ELOG_StuffingTypes7].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
