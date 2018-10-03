USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtVehicleUpdate]
  @Original_VehicleID NVarChar(30), 
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PMT_Vehicle] SET 
   [Description] = @Description
  WHERE
  [VehicleID] = @Original_VehicleID
  SET @RowCount = @@RowCount
GO
