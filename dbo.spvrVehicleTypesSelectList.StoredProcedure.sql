USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrVehicleTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'VehicleTypeID' THEN [VR_VehicleTypes].[VehicleTypeID] END,
     CASE @OrderBy WHEN 'VehicleTypeID DESC' THEN [VR_VehicleTypes].[VehicleTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [VR_VehicleTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [VR_VehicleTypes].[Description] END DESC,
     CASE @OrderBy WHEN 'DefineCapacity' THEN [VR_VehicleTypes].[DefineCapacity] END,
     CASE @OrderBy WHEN 'DefineCapacity DESC' THEN [VR_VehicleTypes].[DefineCapacity] END DESC,
     CASE @OrderBy WHEN 'CapacityInKG' THEN [VR_VehicleTypes].[CapacityInKG] END,
     CASE @OrderBy WHEN 'CapacityInKG DESC' THEN [VR_VehicleTypes].[CapacityInKG] END DESC,
     CASE @OrderBy WHEN 'DefineDimention' THEN [VR_VehicleTypes].[DefineDimention] END,
     CASE @OrderBy WHEN 'DefineDimention DESC' THEN [VR_VehicleTypes].[DefineDimention] END DESC,
     CASE @OrderBy WHEN 'HeightInFt' THEN [VR_VehicleTypes].[HeightInFt] END,
     CASE @OrderBy WHEN 'HeightInFt DESC' THEN [VR_VehicleTypes].[HeightInFt] END DESC,
     CASE @OrderBy WHEN 'WidthInFt' THEN [VR_VehicleTypes].[WidthInFt] END,
     CASE @OrderBy WHEN 'WidthInFt DESC' THEN [VR_VehicleTypes].[WidthInFt] END DESC,
     CASE @OrderBy WHEN 'LengthInFt' THEN [VR_VehicleTypes].[LengthInFt] END,
     CASE @OrderBy WHEN 'LengthInFt DESC' THEN [VR_VehicleTypes].[LengthInFt] END DESC,
     CASE @OrderBy WHEN 'EnforceMinimumCapacity' THEN [VR_VehicleTypes].[EnforceMinimumCapacity] END,
     CASE @OrderBy WHEN 'EnforceMinimumCapacity DESC' THEN [VR_VehicleTypes].[EnforceMinimumCapacity] END DESC,
     CASE @OrderBy WHEN 'MinimumCapacity' THEN [VR_VehicleTypes].[MinimumCapacity] END,
     CASE @OrderBy WHEN 'MinimumCapacity DESC' THEN [VR_VehicleTypes].[MinimumCapacity] END DESC,
     CASE @OrderBy WHEN 'EnforceMaximumCapacity' THEN [VR_VehicleTypes].[EnforceMaximumCapacity] END,
     CASE @OrderBy WHEN 'EnforceMaximumCapacity DESC' THEN [VR_VehicleTypes].[EnforceMaximumCapacity] END DESC,
     CASE @OrderBy WHEN 'MaximumCapacity' THEN [VR_VehicleTypes].[MaximumCapacity] END,
     CASE @OrderBy WHEN 'MaximumCapacity DESC' THEN [VR_VehicleTypes].[MaximumCapacity] END DESC,
     CASE @OrderBy WHEN 'EnforceMinimumDimention' THEN [VR_VehicleTypes].[EnforceMinimumDimention] END,
     CASE @OrderBy WHEN 'EnforceMinimumDimention DESC' THEN [VR_VehicleTypes].[EnforceMinimumDimention] END DESC,
     CASE @OrderBy WHEN 'MinimumHeight' THEN [VR_VehicleTypes].[MinimumHeight] END,
     CASE @OrderBy WHEN 'MinimumHeight DESC' THEN [VR_VehicleTypes].[MinimumHeight] END DESC,
     CASE @OrderBy WHEN 'MinimumWidth' THEN [VR_VehicleTypes].[MinimumWidth] END,
     CASE @OrderBy WHEN 'MinimumWidth DESC' THEN [VR_VehicleTypes].[MinimumWidth] END DESC,
     CASE @OrderBy WHEN 'MinimumLength' THEN [VR_VehicleTypes].[MinimumLength] END,
     CASE @OrderBy WHEN 'MinimumLength DESC' THEN [VR_VehicleTypes].[MinimumLength] END DESC,
     CASE @OrderBy WHEN 'EnforceMaximumDimention' THEN [VR_VehicleTypes].[EnforceMaximumDimention] END,
     CASE @OrderBy WHEN 'EnforceMaximumDimention DESC' THEN [VR_VehicleTypes].[EnforceMaximumDimention] END DESC,
     CASE @OrderBy WHEN 'MaximumHeight' THEN [VR_VehicleTypes].[MaximumHeight] END,
     CASE @OrderBy WHEN 'MaximumHeight DESC' THEN [VR_VehicleTypes].[MaximumHeight] END DESC,
     CASE @OrderBy WHEN 'MaximumWidth' THEN [VR_VehicleTypes].[MaximumWidth] END,
     CASE @OrderBy WHEN 'MaximumWidth DESC' THEN [VR_VehicleTypes].[MaximumWidth] END DESC,
     CASE @OrderBy WHEN 'MaximumLength' THEN [VR_VehicleTypes].[MaximumLength] END,
     CASE @OrderBy WHEN 'MaximumLength DESC' THEN [VR_VehicleTypes].[MaximumLength] END DESC,
     CASE @OrderBy WHEN 'cmba' THEN [VR_VehicleTypes].[cmba] END,
     CASE @OrderBy WHEN 'cmba DESC' THEN [VR_VehicleTypes].[cmba] END DESC,
     CASE @OrderBy WHEN 'DailyRunning' THEN [VR_VehicleTypes].[DailyRunning] END,
     CASE @OrderBy WHEN 'DailyRunning DESC' THEN [VR_VehicleTypes].[DailyRunning] END DESC 
  SET @RecordCount = @@RowCount
GO
