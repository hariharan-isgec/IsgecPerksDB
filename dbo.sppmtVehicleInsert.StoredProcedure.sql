USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtVehicleInsert]
  @VehicleID NVarChar(30),
  @Description NVarChar(30),
  @Return_VehicleID NVarChar(30) = null OUTPUT
  AS
  INSERT [PMT_Vehicle]
  (
   [VehicleID]
  ,[Description]
  )
  VALUES
  (
   UPPER(@VehicleID)
  ,@Description
  )
  SET @Return_VehicleID = @VehicleID
GO
