USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrVehicleRequestPOsDelete]
  @Original_RequestNo Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_VehicleRequestPOs]
  WHERE
  [VR_VehicleRequestPOs].[RequestNo] = @Original_RequestNo
  AND [VR_VehicleRequestPOs].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
