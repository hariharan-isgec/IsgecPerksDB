USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostWorkOrderTypesDelete]
  @Original_WorkOrderTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_WorkOrderTypes]
  WHERE
  [COST_WorkOrderTypes].[WorkOrderTypeID] = @Original_WorkOrderTypeID
  SET @RowCount = @@RowCount
GO
