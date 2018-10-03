USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogCarriersUpdate]
  @Original_CarrierID Int, 
  @ShipmentModeID Int,
  @Description NVarChar(100),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_Carriers] SET 
   [ShipmentModeID] = @ShipmentModeID
  ,[Description] = @Description
  WHERE
  [CarrierID] = @Original_CarrierID
  SET @RowCount = @@RowCount
GO
