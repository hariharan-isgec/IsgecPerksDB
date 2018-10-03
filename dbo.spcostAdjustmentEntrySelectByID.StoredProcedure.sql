USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostAdjustmentEntrySelectByID]
  @LoginID NVarChar(8),
  @ProjectGroupID Int,
  @FinYear Int,
  @Quarter Int,
  @Revision Int,
  @AdjustmentSerialNo Int 
  AS
  SELECT
    [COST_AdjustmentEntry].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [COST_CostSheet2].[Remarks] AS COST_CostSheet2_Remarks,
    [COST_ERPGLCodes3].[GLDescription] AS COST_ERPGLCodes3_GLDescription,
    [COST_ERPGLCodes4].[GLDescription] AS COST_ERPGLCodes4_GLDescription,
    [COST_FinYear5].[Descpription] AS COST_FinYear5_Descpription,
    [COST_ProjectGroups6].[ProjectGroupDescription] AS COST_ProjectGroups6_ProjectGroupDescription,
    [COST_Quarters7].[Description] AS COST_Quarters7_Description,
    [IDM_Projects8].[Description] AS IDM_Projects8_Description 
  FROM [COST_AdjustmentEntry] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [COST_AdjustmentEntry].[CreatedBy] = [aspnet_users1].[LoginID]
  INNER JOIN [COST_CostSheet] AS [COST_CostSheet2]
    ON [COST_AdjustmentEntry].[ProjectGroupID] = [COST_CostSheet2].[ProjectGroupID]
    AND [COST_AdjustmentEntry].[FinYear] = [COST_CostSheet2].[FinYear]
    AND [COST_AdjustmentEntry].[Quarter] = [COST_CostSheet2].[Quarter]
    AND [COST_AdjustmentEntry].[Revision] = [COST_CostSheet2].[Revision]
  LEFT OUTER JOIN [COST_ERPGLCodes] AS [COST_ERPGLCodes3]
    ON [COST_AdjustmentEntry].[CrGLCode] = [COST_ERPGLCodes3].[GLCode]
  LEFT OUTER JOIN [COST_ERPGLCodes] AS [COST_ERPGLCodes4]
    ON [COST_AdjustmentEntry].[DrGLCode] = [COST_ERPGLCodes4].[GLCode]
  INNER JOIN [COST_FinYear] AS [COST_FinYear5]
    ON [COST_AdjustmentEntry].[FinYear] = [COST_FinYear5].[FinYear]
  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups6]
    ON [COST_AdjustmentEntry].[ProjectGroupID] = [COST_ProjectGroups6].[ProjectGroupID]
  INNER JOIN [COST_Quarters] AS [COST_Quarters7]
    ON [COST_AdjustmentEntry].[Quarter] = [COST_Quarters7].[Quarter]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects8]
    ON [COST_AdjustmentEntry].[ProjectID] = [IDM_Projects8].[ProjectID]
  WHERE
  [COST_AdjustmentEntry].[ProjectGroupID] = @ProjectGroupID
  AND [COST_AdjustmentEntry].[FinYear] = @FinYear
  AND [COST_AdjustmentEntry].[Quarter] = @Quarter
  AND [COST_AdjustmentEntry].[Revision] = @Revision
  AND [COST_AdjustmentEntry].[AdjustmentSerialNo] = @AdjustmentSerialNo
GO
