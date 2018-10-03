USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrVehicleRequestPOsUpdate]
  @Original_RequestNo Int, 
  @Original_SerialNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_VehicleRequestPOs] SET 
   [RequestNo] = @RequestNo
  ,[PoNumber] = @PoNumber
  ,[PoLine] = @PoLine
  ,[Item] = @Item
  ,[ItemDescription] = @ItemDescription
  ,[ItemQuantity] = @ItemQuantity
  ,[QuantityUnit] = @QuantityUnit
  ,[ItemWeight] = @ItemWeight
  ,[WeightUnit] = @WeightUnit
  ,[RequestedWeight] = @RequestedWeight
  ,[RequestedWeightUnit] = @RequestedWeightUnit
  ,[PoLineMode] = @PoLineMode
  WHERE
  [RequestNo] = @Original_RequestNo
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
