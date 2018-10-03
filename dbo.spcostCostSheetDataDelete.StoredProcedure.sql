USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetDataDelete]
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
  DELETE [COST_CostSheetData]
  WHERE
  [COST_CostSheetData].[ProjectGroupID] = @Original_ProjectGroupID
  AND [COST_CostSheetData].[FinYear] = @Original_FinYear
  AND [COST_CostSheetData].[Quarter] = @Original_Quarter
  AND [COST_CostSheetData].[Revision] = @Original_Revision
  AND [COST_CostSheetData].[ProjectID] = @Original_ProjectID
  AND [COST_CostSheetData].[GLCode] = @Original_GLCode
  AND [COST_CostSheetData].[AdjustmentSerialNo] = @Original_AdjustmentSerialNo
  AND [COST_CostSheetData].[AdjustmentCredit] = @Original_AdjustmentCredit
  SET @RowCount = @@RowCount
GO
