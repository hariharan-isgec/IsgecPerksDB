USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrVehicleRequestDelete]
  @Original_RequestNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_VehicleRequest]
  WHERE
  [VR_VehicleRequest].[RequestNo] = @Original_RequestNo
  SET @RowCount = @@RowCount
GO
