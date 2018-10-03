USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostAdjustmentEntryDelete]
  @Original_ProjectGroupID Int,
  @Original_FinYear Int,
  @Original_Quarter Int,
  @Original_Revision Int,
  @Original_AdjustmentSerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_AdjustmentEntry]
  WHERE
  [COST_AdjustmentEntry].[ProjectGroupID] = @Original_ProjectGroupID
  AND [COST_AdjustmentEntry].[FinYear] = @Original_FinYear
  AND [COST_AdjustmentEntry].[Quarter] = @Original_Quarter
  AND [COST_AdjustmentEntry].[Revision] = @Original_Revision
  AND [COST_AdjustmentEntry].[AdjustmentSerialNo] = @Original_AdjustmentSerialNo
  SET @RowCount = @@RowCount
GO
