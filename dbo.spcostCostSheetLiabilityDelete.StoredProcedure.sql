USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetLiabilityDelete]
  @Original_ProjectGroupID Int,
  @Original_FinYear Int,
  @Original_Quarter Int,
  @Original_Revision Int,
  @Original_ProjectID NVarChar(6),
  @Original_GLCode NVarChar(7),
  @Original_AdjustmentSerialNo Int,
  @Original_AdjustmentCredit Bit,
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_CostSheetLiability]
  WHERE
  [COST_CostSheetLiability].[ProjectGroupID] = @Original_ProjectGroupID
  AND [COST_CostSheetLiability].[FinYear] = @Original_FinYear
  AND [COST_CostSheetLiability].[Quarter] = @Original_Quarter
  AND [COST_CostSheetLiability].[Revision] = @Original_Revision
  AND [COST_CostSheetLiability].[ProjectID] = @Original_ProjectID
  AND [COST_CostSheetLiability].[GLCode] = @Original_GLCode
  AND [COST_CostSheetLiability].[AdjustmentSerialNo] = @Original_AdjustmentSerialNo
  AND [COST_CostSheetLiability].[AdjustmentCredit] = @Original_AdjustmentCredit
  SET @RowCount = @@RowCount
GO
