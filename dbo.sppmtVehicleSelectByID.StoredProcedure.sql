USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtVehicleSelectByID]
  @VehicleID NVarChar(30) 
  AS
  SELECT
		[PMT_Vehicle].[VehicleID],
		[PMT_Vehicle].[Description] 
  FROM [PMT_Vehicle] 
  WHERE
  [PMT_Vehicle].[VehicleID] = @VehicleID
GO
