USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectGroupProjectsSelectByProjectGroupID]
  @ProjectGroupID Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  ORDER BY
     CASE @OrderBy WHEN 'ProjectGroupID' THEN [COST_ProjectGroupProjects].[ProjectGroupID] END,
     CASE @OrderBy WHEN 'ProjectGroupID DESC' THEN [COST_ProjectGroupProjects].[ProjectGroupID] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [COST_ProjectGroupProjects].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [COST_ProjectGroupProjects].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'COST_ProjectGroups1_ProjectGroupDescription' THEN [COST_ProjectGroups1].[ProjectGroupDescription] END,
     CASE @OrderBy WHEN 'COST_ProjectGroups1_ProjectGroupDescription DESC' THEN [COST_ProjectGroups1].[ProjectGroupDescription] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects2_Description' THEN [IDM_Projects2].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects2_Description DESC' THEN [IDM_Projects2].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
