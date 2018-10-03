USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [IDM_Projects].* ,
    [COST_Divisions1].[DivisionName] AS COST_Divisions1_DivisionName,
    [COST_ProjectTypes2].[ProjectTypeDescription] AS COST_ProjectTypes2_ProjectTypeDescription,
    [COST_WorkOrderTypes3].[WorkOrderTypeDescription] AS COST_WorkOrderTypes3_WorkOrderTypeDescription,
    [TA_Currencies6].[CurrencyName] AS TA_Currencies6_CurrencyName 
  FROM [IDM_Projects] 
  LEFT OUTER JOIN [COST_Divisions] AS [COST_Divisions1]
    ON [IDM_Projects].[DivisionID] = [COST_Divisions1].[DivisionID]
  LEFT OUTER JOIN [COST_ProjectTypes] AS [COST_ProjectTypes2]
    ON [IDM_Projects].[ProjectTypeID] = [COST_ProjectTypes2].[ProjectTypeID]
  LEFT OUTER JOIN [COST_WorkOrderTypes] AS [COST_WorkOrderTypes3]
    ON [IDM_Projects].[WorkOrderTypeID] = [COST_WorkOrderTypes3].[WorkOrderTypeID]
  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies6]
    ON [IDM_Projects].[CurrencyID] = [TA_Currencies6].[CurrencyID]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ProjectCost' THEN [IDM_Projects].[ProjectCost] END,
     CASE @OrderBy WHEN 'ProjectCost DESC' THEN [IDM_Projects].[ProjectCost] END DESC,
     CASE @OrderBy WHEN 'ProjectCostINR' THEN [IDM_Projects].[ProjectCostINR] END,
     CASE @OrderBy WHEN 'ProjectCostINR DESC' THEN [IDM_Projects].[ProjectCostINR] END DESC,
     CASE @OrderBy WHEN 'MarginCurrentYear' THEN [IDM_Projects].[MarginCurrentYear] END,
     CASE @OrderBy WHEN 'MarginCurrentYear DESC' THEN [IDM_Projects].[MarginCurrentYear] END DESC,
     CASE @OrderBy WHEN 'MarginCurrentYearINR' THEN [IDM_Projects].[MarginCurrentYearINR] END,
     CASE @OrderBy WHEN 'MarginCurrentYearINR DESC' THEN [IDM_Projects].[MarginCurrentYearINR] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [IDM_Projects].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [IDM_Projects].[Description] END DESC,
     CASE @OrderBy WHEN 'ProjectTypeID' THEN [IDM_Projects].[ProjectTypeID] END,
     CASE @OrderBy WHEN 'ProjectTypeID DESC' THEN [IDM_Projects].[ProjectTypeID] END DESC,
     CASE @OrderBy WHEN 'ProjectOrderValue' THEN [IDM_Projects].[ProjectOrderValue] END,
     CASE @OrderBy WHEN 'ProjectOrderValue DESC' THEN [IDM_Projects].[ProjectOrderValue] END DESC,
     CASE @OrderBy WHEN 'DivisionID' THEN [IDM_Projects].[DivisionID] END,
     CASE @OrderBy WHEN 'DivisionID DESC' THEN [IDM_Projects].[DivisionID] END DESC,
     CASE @OrderBy WHEN 'CurrencyID' THEN [IDM_Projects].[CurrencyID] END,
     CASE @OrderBy WHEN 'CurrencyID DESC' THEN [IDM_Projects].[CurrencyID] END DESC,
     CASE @OrderBy WHEN 'WarrantyPercentage' THEN [IDM_Projects].[WarrantyPercentage] END,
     CASE @OrderBy WHEN 'WarrantyPercentage DESC' THEN [IDM_Projects].[WarrantyPercentage] END DESC,
     CASE @OrderBy WHEN 'CFforPOV' THEN [IDM_Projects].[CFforPOV] END,
     CASE @OrderBy WHEN 'CFforPOV DESC' THEN [IDM_Projects].[CFforPOV] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [IDM_Projects].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [IDM_Projects].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'WorkOrderTypeID' THEN [IDM_Projects].[WorkOrderTypeID] END,
     CASE @OrderBy WHEN 'WorkOrderTypeID DESC' THEN [IDM_Projects].[WorkOrderTypeID] END DESC,
     CASE @OrderBy WHEN 'ProjectOrderValueINR' THEN [IDM_Projects].[ProjectOrderValueINR] END,
     CASE @OrderBy WHEN 'ProjectOrderValueINR DESC' THEN [IDM_Projects].[ProjectOrderValueINR] END DESC,
     CASE @OrderBy WHEN 'COST_Divisions1_DivisionName' THEN [COST_Divisions1].[DivisionName] END,
     CASE @OrderBy WHEN 'COST_Divisions1_DivisionName DESC' THEN [COST_Divisions1].[DivisionName] END DESC,
     CASE @OrderBy WHEN 'COST_ProjectTypes2_ProjectTypeDescription' THEN [COST_ProjectTypes2].[ProjectTypeDescription] END,
     CASE @OrderBy WHEN 'COST_ProjectTypes2_ProjectTypeDescription DESC' THEN [COST_ProjectTypes2].[ProjectTypeDescription] END DESC,
     CASE @OrderBy WHEN 'COST_WorkOrderTypes3_WorkOrderTypeDescription' THEN [COST_WorkOrderTypes3].[WorkOrderTypeDescription] END,
     CASE @OrderBy WHEN 'COST_WorkOrderTypes3_WorkOrderTypeDescription DESC' THEN [COST_WorkOrderTypes3].[WorkOrderTypeDescription] END DESC,
     CASE @OrderBy WHEN 'TA_Currencies6_CurrencyName' THEN [TA_Currencies6].[CurrencyName] END,
     CASE @OrderBy WHEN 'TA_Currencies6_CurrencyName DESC' THEN [TA_Currencies6].[CurrencyName] END DESC 
  SET @RecordCount = @@RowCount
GO
