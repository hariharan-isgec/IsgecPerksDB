USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectGroupProjectsSelectByID]
  @LoginID NVarChar(8),
  @ProjectGroupID Int,
  @ProjectID NVarChar(6) 
  AS
  SELECT
    [COST_ProjectGroupProjects].* ,
    [COST_ProjectGroups1].[ProjectGroupDescription] AS COST_ProjectGroups1_ProjectGroupDescription,
    [IDM_Projects2].[Description] AS IDM_Projects2_Description 
  FROM [COST_ProjectGroupProjects] 
  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups1]
    ON [COST_ProjectGroupProjects].[ProjectGroupID] = [COST_ProjectGroups1].[ProjectGroupID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [COST_ProjectGroupProjects].[ProjectID] = [IDM_Projects2].[ProjectID]
  WHERE
  [COST_ProjectGroupProjects].[ProjectGroupID] = @ProjectGroupID
  AND [COST_ProjectGroupProjects].[ProjectID] = @ProjectID
GO
