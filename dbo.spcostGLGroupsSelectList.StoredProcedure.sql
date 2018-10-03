USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLGroupsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [COST_GLGroups].* ,
    [COST_GLNatures1].[GLNatureDescription] AS COST_GLNatures1_GLNatureDescription,
    [COST_vGLGroups2].[GLGroupDescriptions] AS COST_vGLGroups2_GLGroupDescriptions 
  FROM [COST_GLGroups] 
  LEFT OUTER JOIN [COST_GLNatures] AS [COST_GLNatures1]
    ON [COST_GLGroups].[GLNatureID] = [COST_GLNatures1].[GLNatureID]
  LEFT OUTER JOIN [COST_vGLGroups] AS [COST_vGLGroups2]
    ON [COST_GLGroups].[CostGLGroupID] = [COST_vGLGroups2].[GLGroupID]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'GLGroupID' THEN [COST_GLGroups].[GLGroupID] END,
     CASE @OrderBy WHEN 'GLGroupID DESC' THEN [COST_GLGroups].[GLGroupID] END DESC,
     CASE @OrderBy WHEN 'GLNatureID' THEN [COST_GLGroups].[GLNatureID] END,
     CASE @OrderBy WHEN 'GLNatureID DESC' THEN [COST_GLGroups].[GLNatureID] END DESC,
     CASE @OrderBy WHEN 'GLGroupDescriptions' THEN [COST_GLGroups].[GLGroupDescriptions] END,
     CASE @OrderBy WHEN 'GLGroupDescriptions DESC' THEN [COST_GLGroups].[GLGroupDescriptions] END DESC,
     CASE @OrderBy WHEN 'CostGLGroupID' THEN [COST_GLGroups].[CostGLGroupID] END,
     CASE @OrderBy WHEN 'CostGLGroupID DESC' THEN [COST_GLGroups].[CostGLGroupID] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [COST_GLGroups].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [COST_GLGroups].[Sequence] END DESC,
     CASE @OrderBy WHEN 'COST_GLNatures1_GLNatureDescription' THEN [COST_GLNatures1].[GLNatureDescription] END,
     CASE @OrderBy WHEN 'COST_GLNatures1_GLNatureDescription DESC' THEN [COST_GLNatures1].[GLNatureDescription] END DESC,
     CASE @OrderBy WHEN 'COST_vGLGroups2_GLGroupDescriptions' THEN [COST_vGLGroups2].[GLGroupDescriptions] END,
     CASE @OrderBy WHEN 'COST_vGLGroups2_GLGroupDescriptions DESC' THEN [COST_vGLGroups2].[GLGroupDescriptions] END DESC 
  SET @RecordCount = @@RowCount
GO
