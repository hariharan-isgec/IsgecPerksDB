USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostQProjectsSelectByID]
  @LoginID NVarChar(8),
  @ProjectID NVarChar(6),
  @FinYear Int,
  @Quarter Int 
  AS
  SELECT
    [COST_Projects].* ,
    [COST_Divisions1].[DivisionName] AS COST_Divisions1_DivisionName,
    [COST_FinYear2].[Descpription] AS COST_FinYear2_Descpription,
    [COST_ProjectTypes3].[ProjectTypeDescription] AS COST_ProjectTypes3_ProjectTypeDescription,
    [COST_Quarters4].[Description] AS COST_Quarters4_Description,
    [COST_WorkOrderTypes5].[WorkOrderTypeDescription] AS COST_WorkOrderTypes5_WorkOrderTypeDescription,
    [IDM_Projects6].[Description] AS IDM_Projects6_Description,
    [TA_Currencies7].[CurrencyName] AS TA_Currencies7_CurrencyName 
  FROM [COST_Projects] 
  LEFT OUTER JOIN [COST_Divisions] AS [COST_Divisions1]
    ON [COST_Projects].[DivisionID] = [COST_Divisions1].[DivisionID]
  INNER JOIN [COST_FinYear] AS [COST_FinYear2]
    ON [COST_Projects].[FinYear] = [COST_FinYear2].[FinYear]
  LEFT OUTER JOIN [COST_ProjectTypes] AS [COST_ProjectTypes3]
    ON [COST_Projects].[ProjectTypeID] = [COST_ProjectTypes3].[ProjectTypeID]
  INNER JOIN [COST_Quarters] AS [COST_Quarters4]
    ON [COST_Projects].[Quarter] = [COST_Quarters4].[Quarter]
  LEFT OUTER JOIN [COST_WorkOrderTypes] AS [COST_WorkOrderTypes5]
    ON [COST_Projects].[WorkOrderTypeID] = [COST_WorkOrderTypes5].[WorkOrderTypeID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects6]
    ON [COST_Projects].[ProjectID] = [IDM_Projects6].[ProjectID]
  LEFT OUTER JOIN [TA_Currencies] AS [TA_Currencies7]
    ON [COST_Projects].[CurrencyID] = [TA_Currencies7].[CurrencyID]
  WHERE
  [COST_Projects].[ProjectID] = @ProjectID
  AND [COST_Projects].[FinYear] = @FinYear
  AND [COST_Projects].[Quarter] = @Quarter
GO
