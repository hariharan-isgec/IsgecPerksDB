USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrVehicleRequestPOsInsert]
  @RequestNo Int,
  @PoNumber VarChar(9),
  @PoLine Int,
  @Item VarChar(47),
  @ItemDescription VarChar(100),
  @ItemQuantity Decimal(18,4),
  @QuantityUnit Int,
  @ItemWeight Decimal(18,4),
  @WeightUnit Int,
  @RequestedWeight Decimal(18,4),
  @RequestedWeightUnit Int,
  @PoLineMode NVarChar(1),
  @Return_RequestNo Int = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [VR_VehicleRequestPOs]
  (
   [RequestNo]
  ,[PoNumber]
  ,[PoLine]
  ,[Item]
  ,[ItemDescription]
  ,[ItemQuantity]
  ,[QuantityUnit]
  ,[ItemWeight]
  ,[WeightUnit]
  ,[RequestedWeight]
  ,[RequestedWeightUnit]
  ,[PoLineMode]
  )
  VALUES
  (
   @RequestNo
  ,@PoNumber
  ,@PoLine
  ,@Item
  ,@ItemDescription
  ,@ItemQuantity
  ,@QuantityUnit
  ,@ItemWeight
  ,@WeightUnit
  ,@RequestedWeight
  ,@RequestedWeightUnit
  ,@PoLineMode
  )
  SET @Return_RequestNo = @RequestNo
  SET @Return_SerialNo = Scope_Identity()
GO
