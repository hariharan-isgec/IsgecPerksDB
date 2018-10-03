USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrVehicleTypesDelete]
  @Original_VehicleTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_VehicleTypes]
  WHERE
  [VR_VehicleTypes].[VehicleTypeID] = @Original_VehicleTypeID
  SET @RowCount = @@RowCount
GO
