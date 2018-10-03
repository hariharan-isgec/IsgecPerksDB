USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtCostCentersDelete]
  @Original_CostCenterID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_CostCenters]
  WHERE
  [SPMT_CostCenters].[CostCenterID] = @Original_CostCenterID
  SET @RowCount = @@RowCount
GO
