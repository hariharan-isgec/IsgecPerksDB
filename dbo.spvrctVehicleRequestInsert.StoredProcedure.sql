USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrctVehicleRequestInsert]
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
  @Return_VRRequestNo Int = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [VR_CT_VehicleRequest]
  (
   [VRRequestNo]
  ,[SerialNo]
  ,[PONumber]
  ,[ItemReference]
  ,[ActivityID]
  ,[ItemUnit]
  ,[Activity2Desc]
  ,[Activity3Desc]
  ,[Activity4Desc]
  ,[Handle]
  ,[ProgressPercent]
  ,[Quantity]
  ,[PercentOfQuantity]
  ,[PartialOrFull]
  ,[NotSelectedList]
  ,[SelectedList]
  ,[Product]
  ,[Project]
  ,[GridLineStatus]
  ,[IrefWeight]
  ,[ProgressWeight]
  )
  VALUES
  (
   @VRRequestNo
  ,@SerialNo
  ,@PONumber
  ,@ItemReference
  ,@ActivityID
  ,@ItemUnit
  ,@Activity2Desc
  ,@Activity3Desc
  ,@Activity4Desc
  ,@Handle
  ,@ProgressPercent
  ,@Quantity
  ,@PercentOfQuantity
  ,@PartialOrFull
  ,@NotSelectedList
  ,@SelectedList
  ,@Product
  ,@Project
  ,@GridLineStatus
  ,@IrefWeight
  ,@ProgressWeight
  )
  SET @Return_VRRequestNo = @VRRequestNo
  SET @Return_SerialNo = @SerialNo
GO
