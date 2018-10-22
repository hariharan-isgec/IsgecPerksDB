USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrctVehicleRequestDelete]
  @Original_VRRequestNo Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_CT_VehicleRequest]
  WHERE
  [VR_CT_VehicleRequest].[VRRequestNo] = @Original_VRRequestNo
  AND [VR_CT_VehicleRequest].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
