USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetLiabilitySelectByID]
  @LoginID NVarChar(8),
  @ProjectGroupID Int,
  @FinYear Int,
  @Quarter Int,
  @Revision Int,
  @ProjectID NVarChar(6),
  @GLCode NVarChar(7),
  @AdjustmentSerialNo Int,
  @AdjustmentCredit Bit 
  AS
  SELECT
    [COST_CostSheetLiability].* ,
    [COST_CostSheet1].[Remarks] AS COST_CostSheet1_Remarks,
    [COST_ERPGLCodes2].[GLDescription] AS COST_ERPGLCodes2_GLDescription,
    [COST_FinYear3].[Descpription] AS COST_FinYear3_Descpription,
    [COST_ProjectGroups4].[ProjectGroupDescription] AS COST_ProjectGroups4_ProjectGroupDescription,
    [COST_Quarters5].[Description] AS COST_Quarters5_Description,
    [IDM_Projects6].[Description] AS IDM_Projects6_Description 
  FROM [COST_CostSheetLiability] 
  INNER JOIN [COST_CostSheet] AS [COST_CostSheet1]
    ON [COST_CostSheetLiability].[ProjectGroupID] = [COST_CostSheet1].[ProjectGroupID]
    AND [COST_CostSheetLiability].[FinYear] = [COST_CostSheet1].[FinYear]
    AND [COST_CostSheetLiability].[Quarter] = [COST_CostSheet1].[Quarter]
    AND [COST_CostSheetLiability].[Revision] = [COST_CostSheet1].[Revision]
  INNER JOIN [COST_ERPGLCodes] AS [COST_ERPGLCodes2]
    ON [COST_CostSheetLiability].[GLCode] = [COST_ERPGLCodes2].[GLCode]
  INNER JOIN [COST_FinYear] AS [COST_FinYear3]
    ON [COST_CostSheetLiability].[FinYear] = [COST_FinYear3].[FinYear]
  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups4]
    ON [COST_CostSheetLiability].[ProjectGroupID] = [COST_ProjectGroups4].[ProjectGroupID]
  INNER JOIN [COST_Quarters] AS [COST_Quarters5]
    ON [COST_CostSheetLiability].[Quarter] = [COST_Quarters5].[Quarter]
  INNER JOIN [IDM_Projects] AS [IDM_Projects6]
    ON [COST_CostSheetLiability].[ProjectID] = [IDM_Projects6].[ProjectID]
  WHERE
  [COST_CostSheetLiability].[ProjectGroupID] = @ProjectGroupID
  AND [COST_CostSheetLiability].[FinYear] = @FinYear
  AND [COST_CostSheetLiability].[Quarter] = @Quarter
  AND [COST_CostSheetLiability].[Revision] = @Revision
  AND [COST_CostSheetLiability].[ProjectID] = @ProjectID
  AND [COST_CostSheetLiability].[GLCode] = @GLCode
  AND [COST_CostSheetLiability].[AdjustmentSerialNo] = @AdjustmentSerialNo
  AND [COST_CostSheetLiability].[AdjustmentCredit] = @AdjustmentCredit
GO
