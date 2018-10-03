USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogShipmentModesDelete]
  @Original_ShipmentModeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_ShipmentModes]
  WHERE
  [ELOG_ShipmentModes].[ShipmentModeID] = @Original_ShipmentModeID
  SET @RowCount = @@RowCount
GO
