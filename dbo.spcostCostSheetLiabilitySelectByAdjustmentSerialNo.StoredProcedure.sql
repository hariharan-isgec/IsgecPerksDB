USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetLiabilitySelectByAdjustmentSerialNo]
  @AdjustmentSerialNo Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  [COST_CostSheetLiability].[AdjustmentSerialNo] = @AdjustmentSerialNo
  ORDER BY
     CASE @OrderBy WHEN 'ProjectGroupID' THEN [COST_CostSheetLiability].[ProjectGroupID] END,
     CASE @OrderBy WHEN 'ProjectGroupID DESC' THEN [COST_CostSheetLiability].[ProjectGroupID] END DESC,
     CASE @OrderBy WHEN 'FinYear' THEN [COST_CostSheetLiability].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [COST_CostSheetLiability].[FinYear] END DESC,
     CASE @OrderBy WHEN 'Quarter' THEN [COST_CostSheetLiability].[Quarter] END,
     CASE @OrderBy WHEN 'Quarter DESC' THEN [COST_CostSheetLiability].[Quarter] END DESC,
     CASE @OrderBy WHEN 'Revision' THEN [COST_CostSheetLiability].[Revision] END,
     CASE @OrderBy WHEN 'Revision DESC' THEN [COST_CostSheetLiability].[Revision] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [COST_CostSheetLiability].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [COST_CostSheetLiability].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'GLCode' THEN [COST_CostSheetLiability].[GLCode] END,
     CASE @OrderBy WHEN 'GLCode DESC' THEN [COST_CostSheetLiability].[GLCode] END DESC,
     CASE @OrderBy WHEN 'AdjustmentSerialNo' THEN [COST_CostSheetLiability].[AdjustmentSerialNo] END,
     CASE @OrderBy WHEN 'AdjustmentSerialNo DESC' THEN [COST_CostSheetLiability].[AdjustmentSerialNo] END DESC,
     CASE @OrderBy WHEN 'AdjustmentCredit' THEN [COST_CostSheetLiability].[AdjustmentCredit] END,
     CASE @OrderBy WHEN 'AdjustmentCredit DESC' THEN [COST_CostSheetLiability].[AdjustmentCredit] END DESC,
     CASE @OrderBy WHEN 'CrAmount' THEN [COST_CostSheetLiability].[CrAmount] END,
     CASE @OrderBy WHEN 'CrAmount DESC' THEN [COST_CostSheetLiability].[CrAmount] END DESC,
     CASE @OrderBy WHEN 'DrAmount' THEN [COST_CostSheetLiability].[DrAmount] END,
     CASE @OrderBy WHEN 'DrAmount DESC' THEN [COST_CostSheetLiability].[DrAmount] END DESC,
     CASE @OrderBy WHEN 'Amount' THEN [COST_CostSheetLiability].[Amount] END,
     CASE @OrderBy WHEN 'Amount DESC' THEN [COST_CostSheetLiability].[Amount] END DESC,
     CASE @OrderBy WHEN 'AdjustmentEntry' THEN [COST_CostSheetLiability].[AdjustmentEntry] END,
     CASE @OrderBy WHEN 'AdjustmentEntry DESC' THEN [COST_CostSheetLiability].[AdjustmentEntry] END DESC,
     CASE @OrderBy WHEN 'CrFC' THEN [COST_CostSheetLiability].[CrFC] END,
     CASE @OrderBy WHEN 'CrFC DESC' THEN [COST_CostSheetLiability].[CrFC] END DESC,
     CASE @OrderBy WHEN 'DrFC' THEN [COST_CostSheetLiability].[DrFC] END,
     CASE @OrderBy WHEN 'DrFC DESC' THEN [COST_CostSheetLiability].[DrFC] END DESC,
     CASE @OrderBy WHEN 'NetFC' THEN [COST_CostSheetLiability].[NetFC] END,
     CASE @OrderBy WHEN 'NetFC DESC' THEN [COST_CostSheetLiability].[NetFC] END DESC,
     CASE @OrderBy WHEN 'FC' THEN [COST_CostSheetLiability].[FC] END,
     CASE @OrderBy WHEN 'FC DESC' THEN [COST_CostSheetLiability].[FC] END DESC,
     CASE @OrderBy WHEN 'COST_CostSheet1_Remarks' THEN [COST_CostSheet1].[Remarks] END,
     CASE @OrderBy WHEN 'COST_CostSheet1_Remarks DESC' THEN [COST_CostSheet1].[Remarks] END DESC,
     CASE @OrderBy WHEN 'COST_ERPGLCodes2_GLDescription' THEN [COST_ERPGLCodes2].[GLDescription] END,
     CASE @OrderBy WHEN 'COST_ERPGLCodes2_GLDescription DESC' THEN [COST_ERPGLCodes2].[GLDescription] END DESC,
     CASE @OrderBy WHEN 'COST_FinYear3_Descpription' THEN [COST_FinYear3].[Descpription] END,
     CASE @OrderBy WHEN 'COST_FinYear3_Descpription DESC' THEN [COST_FinYear3].[Descpription] END DESC,
     CASE @OrderBy WHEN 'COST_ProjectGroups4_ProjectGroupDescription' THEN [COST_ProjectGroups4].[ProjectGroupDescription] END,
     CASE @OrderBy WHEN 'COST_ProjectGroups4_ProjectGroupDescription DESC' THEN [COST_ProjectGroups4].[ProjectGroupDescription] END DESC,
     CASE @OrderBy WHEN 'COST_Quarters5_Description' THEN [COST_Quarters5].[Description] END,
     CASE @OrderBy WHEN 'COST_Quarters5_Description DESC' THEN [COST_Quarters5].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects6_Description' THEN [IDM_Projects6].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects6_Description DESC' THEN [IDM_Projects6].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
