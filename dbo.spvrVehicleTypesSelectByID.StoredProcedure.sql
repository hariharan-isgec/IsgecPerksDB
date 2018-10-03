USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrVehicleTypesSelectByID]
  @LoginID NVarChar(8),
  @VehicleTypeID Int 
  AS
  SELECT
		[VR_VehicleTypes].[VehicleTypeID] ,
		[VR_VehicleTypes].[Description] ,
		[VR_VehicleTypes].[DefineCapacity] ,
		[VR_VehicleTypes].[CapacityInKG] ,
		[VR_VehicleTypes].[DefineDimention] ,
		[VR_VehicleTypes].[HeightInFt] ,
		[VR_VehicleTypes].[WidthInFt] ,
		[VR_VehicleTypes].[LengthInFt] ,
		[VR_VehicleTypes].[EnforceMinimumCapacity] ,
		[VR_VehicleTypes].[MinimumCapacity] ,
		[VR_VehicleTypes].[EnforceMaximumCapacity] ,
		[VR_VehicleTypes].[MaximumCapacity] ,
		[VR_VehicleTypes].[EnforceMinimumDimention] ,
		[VR_VehicleTypes].[MinimumHeight] ,
		[VR_VehicleTypes].[MinimumWidth] ,
		[VR_VehicleTypes].[MinimumLength] ,
		[VR_VehicleTypes].[EnforceMaximumDimention] ,
		[VR_VehicleTypes].[MaximumHeight] ,
		[VR_VehicleTypes].[MaximumWidth] ,
		[VR_VehicleTypes].[MaximumLength] ,
		[VR_VehicleTypes].[cmba] ,
		[VR_VehicleTypes].[DailyRunning]  
  FROM [VR_VehicleTypes] 
  WHERE
  [VR_VehicleTypes].[VehicleTypeID] = @VehicleTypeID
GO
