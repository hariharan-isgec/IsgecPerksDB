USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogShipmentModesUpdate]
  @Original_ShipmentModeID Int, 
  @Description NVarChar(100),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_ShipmentModes] SET 
   [Description] = @Description
  WHERE
  [ShipmentModeID] = @Original_ShipmentModeID
  SET @RowCount = @@RowCount
GO
