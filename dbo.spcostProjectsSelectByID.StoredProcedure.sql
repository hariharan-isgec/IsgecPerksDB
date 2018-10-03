USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectsSelectByID]
  @LoginID NVarChar(8),
  @ProjectID NVarChar(6) 
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
  WHERE
  [IDM_Projects].[ProjectID] = @ProjectID
GO
