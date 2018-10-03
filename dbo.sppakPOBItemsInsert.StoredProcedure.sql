USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOBItemsInsert]
  @ItemNo Int,
  @ItemCode NVarChar(50),
  @ItemDescription NVarChar(100),
  @ElementID NVarChar(8),
  @Quantity Decimal(18,4),
  @WeightPerUnit Decimal(18,4),
  @StatusID Int,
  @Bottom Bit,
  @Free Bit,
  @Middle Bit,
  @Root Bit,
  @ChangedBySupplier Bit,
  @CreatedBySupplier Bit,
  @Changed Bit,
  @Active Bit,
  @FreezedBySupplier Bit,
  @AcceptedBySupplier Bit,
  @QuantityDespatched Decimal(18,4),
  @TotalWeightToDespatch Decimal(18,4),
  @TotalWeightDespatched Decimal(18,4),
  @TotalWeightReceived Decimal(18,4),
  @QuantityReceived Decimal(18,4),
  @Prefix NVarChar(1000),
  @ItemLevel Int,
  @QuantityToPack Decimal(18,4),
  @QuantityToDespatch Decimal(18,4),
  @TotalWeightToPack Decimal(18,4),
  @DocumentNo Int,
  @UOMWeight Int,
  @ParentItemNo Int,
  @SupplierRemarks NVarChar(500),
  @ISGECRemarks NVarChar(500),
  @BOMNo Int,
  @SerialNo Int,
  @SupplierItemCode NVarChar(50),
  @UOMQuantity Int,
  @DivisionID Int,
  @AcceptedOn DateTime,
  @AcceptedBy NVarChar(8),
  @Freezed Bit,
  @FreezedOn DateTime,
  @FreezedBy NVarChar(8),
  @ISGECWeightPerUnit Decimal(18,4),
  @ISGECQuantity Decimal(18,4),
  @SupplierQuantity Decimal(18,4),
  @Accepted Bit,
  @SupplierWeightPerUnit Decimal(18,4),
  @QualityClearedQty Decimal(18,4) = 0, 
  @Return_SerialNo Int = null OUTPUT, 
  @Return_BOMNo Int = null OUTPUT, 
  @Return_ItemNo Int = null OUTPUT 
  AS
  INSERT [PAK_POBItems]
  (
   [ItemNo]
  ,[ItemCode]
  ,[ItemDescription]
  ,[ElementID]
  ,[Quantity]
  ,[WeightPerUnit]
  ,[StatusID]
  ,[Bottom]
  ,[Free]
  ,[Middle]
  ,[Root]
  ,[ChangedBySupplier]
  ,[CreatedBySupplier]
  ,[Changed]
  ,[Active]
  ,[FreezedBySupplier]
  ,[AcceptedBySupplier]
  ,[QuantityDespatched]
  ,[TotalWeightToDespatch]
  ,[TotalWeightDespatched]
  ,[TotalWeightReceived]
  ,[QuantityReceived]
  ,[Prefix]
  ,[ItemLevel]
  ,[QuantityToPack]
  ,[QuantityToDespatch]
  ,[TotalWeightToPack]
  ,[DocumentNo]
  ,[UOMWeight]
  ,[ParentItemNo]
  ,[SupplierRemarks]
  ,[ISGECRemarks]
  ,[BOMNo]
  ,[SerialNo]
  ,[SupplierItemCode]
  ,[UOMQuantity]
  ,[DivisionID]
  ,[AcceptedOn]
  ,[AcceptedBy]
  ,[Freezed]
  ,[FreezedOn]
  ,[FreezedBy]
  ,[ISGECWeightPerUnit]
  ,[ISGECQuantity]
  ,[SupplierQuantity]
  ,[Accepted]
  ,[SupplierWeightPerUnit]
  ,[QualityClearedQty]
  )
  VALUES
  (
   @ItemNo
  ,@ItemCode
  ,@ItemDescription
  ,@ElementID
  ,@Quantity
  ,@WeightPerUnit
  ,@StatusID
  ,@Bottom
  ,@Free
  ,@Middle
  ,@Root
  ,@ChangedBySupplier
  ,@CreatedBySupplier
  ,@Changed
  ,@Active
  ,@FreezedBySupplier
  ,@AcceptedBySupplier
  ,@QuantityDespatched
  ,@TotalWeightToDespatch
  ,@TotalWeightDespatched
  ,@TotalWeightReceived
  ,@QuantityReceived
  ,@Prefix
  ,@ItemLevel
  ,@QuantityToPack
  ,@QuantityToDespatch
  ,@TotalWeightToPack
  ,@DocumentNo
  ,@UOMWeight
  ,@ParentItemNo
  ,@SupplierRemarks
  ,@ISGECRemarks
  ,@BOMNo
  ,@SerialNo
  ,@SupplierItemCode
  ,@UOMQuantity
  ,@DivisionID
  ,@AcceptedOn
  ,@AcceptedBy
  ,@Freezed
  ,@FreezedOn
  ,@FreezedBy
  ,@ISGECWeightPerUnit
  ,@ISGECQuantity
  ,@SupplierQuantity
  ,@Accepted
  ,@SupplierWeightPerUnit
  ,@QualityClearedQty
  )
  SET @Return_SerialNo = @SerialNo
  SET @Return_BOMNo = @BOMNo
  SET @Return_ItemNo = @ItemNo
GO
