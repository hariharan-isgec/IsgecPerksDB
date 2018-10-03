USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtVehicleDelete]
  @Original_VehicleID NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  DELETE [PMT_Vehicle]
  WHERE
  [PMT_Vehicle].[VehicleID] = @Original_VehicleID
  SET @RowCount = @@RowCount
GO
