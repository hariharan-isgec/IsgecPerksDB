USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrVehicleTypesInsert]
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
  @Return_VehicleTypeID Int = null OUTPUT 
  AS
  INSERT [VR_VehicleTypes]
  (
   [Description]
  ,[DefineCapacity]
  ,[CapacityInKG]
  ,[DefineDimention]
  ,[HeightInFt]
  ,[WidthInFt]
  ,[LengthInFt]
  ,[EnforceMinimumCapacity]
  ,[MinimumCapacity]
  ,[EnforceMaximumCapacity]
  ,[MaximumCapacity]
  ,[EnforceMinimumDimention]
  ,[MinimumHeight]
  ,[MinimumWidth]
  ,[MinimumLength]
  ,[EnforceMaximumDimention]
  ,[MaximumHeight]
  ,[MaximumWidth]
  ,[MaximumLength]
  ,[DailyRunning]
  )
  VALUES
  (
   @Description
  ,@DefineCapacity
  ,@CapacityInKG
  ,@DefineDimention
  ,@HeightInFt
  ,@WidthInFt
  ,@LengthInFt
  ,@EnforceMinimumCapacity
  ,@MinimumCapacity
  ,@EnforceMaximumCapacity
  ,@MaximumCapacity
  ,@EnforceMinimumDimention
  ,@MinimumHeight
  ,@MinimumWidth
  ,@MinimumLength
  ,@EnforceMaximumDimention
  ,@MaximumHeight
  ,@MaximumWidth
  ,@MaximumLength
  ,@DailyRunning
  )
  SET @Return_VehicleTypeID = Scope_Identity()
GO
