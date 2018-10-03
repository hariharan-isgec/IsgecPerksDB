USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCSDataWOnGLGroupSelectByID]
  @LoginID NVarChar(8),
  @ProjectGroupID Int,
  @FinYear Int,
  @Quarter Int,
  @Revision Int,
  @WorkOrderTypeID Int,
  @GLGroupID Int 
  AS
  SELECT
    [COST_CSDataWOnGLGroup].* ,
    [COST_CostSheet1].[Remarks] AS COST_CostSheet1_Remarks,
    [COST_FinYear2].[Descpription] AS COST_FinYear2_Descpription,
    [COST_GLGroups3].[GLGroupDescriptions] AS COST_GLGroups3_GLGroupDescriptions,
    [COST_ProjectGroups4].[ProjectGroupDescription] AS COST_ProjectGroups4_ProjectGroupDescription,
    [COST_Quarters5].[Description] AS COST_Quarters5_Description,
    [COST_WorkOrderTypes6].[WorkOrderTypeDescription] AS COST_WorkOrderTypes6_WorkOrderTypeDescription 
  FROM [COST_CSDataWOnGLGroup] 
  INNER JOIN [COST_CostSheet] AS [COST_CostSheet1]
    ON [COST_CSDataWOnGLGroup].[ProjectGroupID] = [COST_CostSheet1].[ProjectGroupID]
    AND [COST_CSDataWOnGLGroup].[FinYear] = [COST_CostSheet1].[FinYear]
    AND [COST_CSDataWOnGLGroup].[Quarter] = [COST_CostSheet1].[Quarter]
    AND [COST_CSDataWOnGLGroup].[Revision] = [COST_CostSheet1].[Revision]
  INNER JOIN [COST_FinYear] AS [COST_FinYear2]
    ON [COST_CSDataWOnGLGroup].[FinYear] = [COST_FinYear2].[FinYear]
  INNER JOIN [COST_GLGroups] AS [COST_GLGroups3]
    ON [COST_CSDataWOnGLGroup].[GLGroupID] = [COST_GLGroups3].[GLGroupID]
  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups4]
    ON [COST_CSDataWOnGLGroup].[ProjectGroupID] = [COST_ProjectGroups4].[ProjectGroupID]
  INNER JOIN [COST_Quarters] AS [COST_Quarters5]
    ON [COST_CSDataWOnGLGroup].[Quarter] = [COST_Quarters5].[Quarter]
  INNER JOIN [COST_WorkOrderTypes] AS [COST_WorkOrderTypes6]
    ON [COST_CSDataWOnGLGroup].[WorkOrderTypeID] = [COST_WorkOrderTypes6].[WorkOrderTypeID]
  WHERE
  [COST_CSDataWOnGLGroup].[ProjectGroupID] = @ProjectGroupID
  AND [COST_CSDataWOnGLGroup].[FinYear] = @FinYear
  AND [COST_CSDataWOnGLGroup].[Quarter] = @Quarter
  AND [COST_CSDataWOnGLGroup].[Revision] = @Revision
  AND [COST_CSDataWOnGLGroup].[WorkOrderTypeID] = @WorkOrderTypeID
  AND [COST_CSDataWOnGLGroup].[GLGroupID] = @GLGroupID
GO
