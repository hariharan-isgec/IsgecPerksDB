USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetDelete]
  @Original_ProjectGroupID Int,
  @Original_FinYear Int,
  @Original_Quarter Int,
  @Original_Revision Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_CostSheet]
  WHERE
  [COST_CostSheet].[ProjectGroupID] = @Original_ProjectGroupID
  AND [COST_CostSheet].[FinYear] = @Original_FinYear
  AND [COST_CostSheet].[Quarter] = @Original_Quarter
  AND [COST_CostSheet].[Revision] = @Original_Revision
  SET @RowCount = @@RowCount
GO
