USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLGroupsSelectByID]
  @LoginID NVarChar(8),
  @GLGroupID Int 
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
  WHERE
  [COST_GLGroups].[GLGroupID] = @GLGroupID
GO
