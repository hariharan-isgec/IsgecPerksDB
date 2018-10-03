USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostFinYearProjectsSelectByID]
  @LoginID NVarChar(8),
  @FinYear Int,
  @Quarter Int,
  @ProjectID NVarChar(6) 
  AS
  SELECT
    [COST_FinYearProjects].* ,
    [COST_FinYear1].[Descpription] AS COST_FinYear1_Descpription,
    [COST_Quarters2].[Description] AS COST_Quarters2_Description,
    [IDM_Projects3].[Description] AS IDM_Projects3_Description,
    [COST_ProjectGroupProjects4].[ProjectID] AS COST_ProjectGroupProjects4_ProjectID,
    [COST_ProjectGroupProjects5].[ProjectID] AS COST_ProjectGroupProjects5_ProjectID,
    [COST_ProjectGroups6].[ProjectGroupDescription] AS COST_ProjectGroups6_ProjectGroupDescription,
    [COST_ProjectGroups7].[ProjectGroupDescription] AS COST_ProjectGroups7_ProjectGroupDescription 
  FROM [COST_FinYearProjects] 
  INNER JOIN [COST_FinYear] AS [COST_FinYear1]
    ON [COST_FinYearProjects].[FinYear] = [COST_FinYear1].[FinYear]
  INNER JOIN [COST_Quarters] AS [COST_Quarters2]
    ON [COST_FinYearProjects].[Quarter] = [COST_Quarters2].[Quarter]
  INNER JOIN [IDM_Projects] AS [IDM_Projects3]
    ON [COST_FinYearProjects].[ProjectID] = [IDM_Projects3].[ProjectID]
  LEFT OUTER JOIN [COST_ProjectGroupProjects] AS [COST_ProjectGroupProjects4]
    ON [COST_FinYearProjects].[IndividualGroupID] = [COST_ProjectGroupProjects4].[ProjectGroupID]
    AND [COST_FinYearProjects].[ProjectID] = [COST_ProjectGroupProjects4].[ProjectID]
  LEFT OUTER JOIN [COST_ProjectGroupProjects] AS [COST_ProjectGroupProjects5]
    ON [COST_FinYearProjects].[CombinedGroupID] = [COST_ProjectGroupProjects5].[ProjectGroupID]
    AND [COST_FinYearProjects].[ProjectID] = [COST_ProjectGroupProjects5].[ProjectID]
  LEFT OUTER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups6]
    ON [COST_FinYearProjects].[CombinedGroupID] = [COST_ProjectGroups6].[ProjectGroupID]
  LEFT OUTER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups7]
    ON [COST_FinYearProjects].[IndividualGroupID] = [COST_ProjectGroups7].[ProjectGroupID]
  WHERE
  [COST_FinYearProjects].[FinYear] = @FinYear
  AND [COST_FinYearProjects].[Quarter] = @Quarter
  AND [COST_FinYearProjects].[ProjectID] = @ProjectID
GO
