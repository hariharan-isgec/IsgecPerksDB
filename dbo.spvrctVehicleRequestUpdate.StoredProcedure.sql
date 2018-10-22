USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrctVehicleRequestUpdate]
  @Original_VRRequestNo Int, 
  @Original_SerialNo Int, 
  @VRRequestNo Int,
  @SerialNo Int,
  @PONumber NVarChar(9),
  @ItemReference VarChar(200),
  @ActivityID VarChar(9),
  @ItemUnit VarChar(20),
  @Activity2Desc VarChar(150),
  @Activity3Desc VarChar(150),
  @Activity4Desc VarChar(150),
  @Handle VarChar(50),
  @ProgressPercent Decimal(18,4),
  @Quantity Decimal(18,4),
  @PercentOfQuantity Decimal(18,4),
  @PartialOrFull VarChar(10),
  @NotSelectedList VarChar(500),
  @SelectedList VarChar(500),
  @Product VarChar(9),
  @Project VarChar(9),
  @GridLineStatus Int,
  @IrefWeight Decimal(18,4),
  @ProgressWeight Decimal(18,4),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_CT_VehicleRequest] SET 
   [VRRequestNo] = @VRRequestNo
  ,[SerialNo] = @SerialNo
  ,[PONumber] = @PONumber
  ,[ItemReference] = @ItemReference
  ,[ActivityID] = @ActivityID
  ,[ItemUnit] = @ItemUnit
  ,[Activity2Desc] = @Activity2Desc
  ,[Activity3Desc] = @Activity3Desc
  ,[Activity4Desc] = @Activity4Desc
  ,[Handle] = @Handle
  ,[ProgressPercent] = @ProgressPercent
  ,[Quantity] = @Quantity
  ,[PercentOfQuantity] = @PercentOfQuantity
  ,[PartialOrFull] = @PartialOrFull
  ,[NotSelectedList] = @NotSelectedList
  ,[SelectedList] = @SelectedList
  ,[Product] = @Product
  ,[Project] = @Project
  ,[GridLineStatus] = @GridLineStatus
  ,[IrefWeight] = @IrefWeight
  ,[ProgressWeight] = @ProgressWeight
  WHERE
  [VRRequestNo] = @Original_VRRequestNo
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
