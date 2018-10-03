USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetStatesDelete]
  @Original_StatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_CostSheetStates]
  WHERE
  [COST_CostSheetStates].[StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
