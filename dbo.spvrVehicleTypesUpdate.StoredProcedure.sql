USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrVehicleTypesUpdate]
  @Original_VehicleTypeID Int, 
  @Description NVarChar(50),
  @DefineCapacity Bit,
  @CapacityInKG Decimal(18,2),
  @DefineDimention Bit,
  @HeightInFt Decimal(6,2),
  @WidthInFt Decimal(6,2),
  @LengthInFt Decimal(6,2),
  @EnforceMinimumCapacity Bit,
  @MinimumCapacity Decimal(18,2),
  @EnforceMaximumCapacity Bit,
  @MaximumCapacity Decimal(18,2),
  @EnforceMinimumDimention Bit,
  @MinimumHeight Decimal(6,2),
  @MinimumWidth Decimal(6,2),
  @MinimumLength Decimal(6,2),
  @EnforceMaximumDimention Bit,
  @MaximumHeight Decimal(6,2),
  @MaximumWidth Decimal(6,2),
  @MaximumLength Decimal(6,2),
  @DailyRunning Decimal(5),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_VehicleTypes] SET 
   [Description] = @Description
  ,[DefineCapacity] = @DefineCapacity
  ,[CapacityInKG] = @CapacityInKG
  ,[DefineDimention] = @DefineDimention
  ,[HeightInFt] = @HeightInFt
  ,[WidthInFt] = @WidthInFt
  ,[LengthInFt] = @LengthInFt
  ,[EnforceMinimumCapacity] = @EnforceMinimumCapacity
  ,[MinimumCapacity] = @MinimumCapacity
  ,[EnforceMaximumCapacity] = @EnforceMaximumCapacity
  ,[MaximumCapacity] = @MaximumCapacity
  ,[EnforceMinimumDimention] = @EnforceMinimumDimention
  ,[MinimumHeight] = @MinimumHeight
  ,[MinimumWidth] = @MinimumWidth
  ,[MinimumLength] = @MinimumLength
  ,[EnforceMaximumDimention] = @EnforceMaximumDimention
  ,[MaximumHeight] = @MaximumHeight
  ,[MaximumWidth] = @MaximumWidth
  ,[MaximumLength] = @MaximumLength
  ,[DailyRunning] = @DailyRunning
  WHERE
  [VehicleTypeID] = @Original_VehicleTypeID
  SET @RowCount = @@RowCount
GO
