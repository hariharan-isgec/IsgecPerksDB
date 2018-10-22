USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOBItemsUpdate]
  @Original_SerialNo Int, 
  @Original_BOMNo Int, 
  @Original_ItemNo Int, 
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
  @ItemReference NVarChar(200),
  @SubItem NVarChar(9),
  @SubItem2 NvarChar(150),
  @SubItem3 NvarChar(150),
  @SubItem4 NvarChar(150),
  @QuantityDespatchedToPort Decimal(18,4),
  @TotalWeightDespatchedToPort Decimal(18,4),
  @QuantityReceivedAtPort Decimal(18,4) = 0, 
  @TotalWeightReceivedAtPort Decimal(18,4) = 0, 
  @QuantityDespatchedFromPort Decimal(18,4) = 0, 
  @TotalWeightDespatchedfromPort Decimal(18,4) = 0, 
  @QualityClearedQtyStage Decimal(18,4) = 0, 
  @TotalWeight Decimal(18,4) = 0, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_POBItems] SET 
   [ItemNo] = @ItemNo
  ,[ItemCode] = @ItemCode
  ,[ItemDescription] = @ItemDescription
  ,[ElementID] = @ElementID
  ,[Quantity] = @Quantity
  ,[WeightPerUnit] = @WeightPerUnit
  ,[StatusID] = @StatusID
  ,[Bottom] = @Bottom
  ,[Free] = @Free
  ,[Middle] = @Middle
  ,[Root] = @Root
  ,[ChangedBySupplier] = @ChangedBySupplier
  ,[CreatedBySupplier] = @CreatedBySupplier
  ,[Changed] = @Changed
  ,[Active] = @Active
  ,[FreezedBySupplier] = @FreezedBySupplier
  ,[AcceptedBySupplier] = @AcceptedBySupplier
  ,[QuantityDespatched] = @QuantityDespatched
  ,[TotalWeightToDespatch] = @TotalWeightToDespatch
  ,[TotalWeightDespatched] = @TotalWeightDespatched
  ,[TotalWeightReceived] = @TotalWeightReceived
  ,[QuantityReceived] = @QuantityReceived
  ,[Prefix] = @Prefix
  ,[ItemLevel] = @ItemLevel
  ,[QuantityToPack] = @QuantityToPack
  ,[QuantityToDespatch] = @QuantityToDespatch
  ,[TotalWeightToPack] = @TotalWeightToPack
  ,[DocumentNo] = @DocumentNo
  ,[UOMWeight] = @UOMWeight
  ,[ParentItemNo] = @ParentItemNo
  ,[SupplierRemarks] = @SupplierRemarks
  ,[ISGECRemarks] = @ISGECRemarks
  ,[BOMNo] = @BOMNo
  ,[SerialNo] = @SerialNo
  ,[SupplierItemCode] = @SupplierItemCode
  ,[UOMQuantity] = @UOMQuantity
  ,[DivisionID] = @DivisionID
  ,[AcceptedOn] = @AcceptedOn
  ,[AcceptedBy] = @AcceptedBy
  ,[Freezed] = @Freezed
  ,[FreezedOn] = @FreezedOn
  ,[FreezedBy] = @FreezedBy
  ,[ISGECWeightPerUnit] = @ISGECWeightPerUnit
  ,[ISGECQuantity] = @ISGECQuantity
  ,[SupplierQuantity] = @SupplierQuantity
  ,[Accepted] = @Accepted
  ,[SupplierWeightPerUnit] = @SupplierWeightPerUnit
  ,[QualityClearedQty] = @QualityClearedQty 
  ,[ItemReference] = @ItemReference
  ,[SubItem]=@SubItem
  ,[SubItem2]=@SubItem2
  ,[SubItem3]=@SubItem3
  ,[SubItem4] = @SubItem4 
  ,[QuantityReceivedAtPort] = @QuantityReceivedAtPort
  ,[TotalWeightReceivedAtPort] = @TotalWeightReceivedAtPort
  ,[QuantityDespatchedFromPort] = @QuantityDespatchedFromPort
  ,[TotalWeightDespatchedfromPort] = @TotalWeightDespatchedfromPort
  ,[QuantityDespatchedToPort] = @QuantityDespatchedtoPort
  ,[TotalWeightDespatchedToPort] = @TotalWeightDespatchedToPort 
  ,[QualityClearedQtyStage] = @QualityClearedQtyStage
  ,[TotalWeight] = @TotalWeight
  WHERE
  [SerialNo] = @Original_SerialNo
  AND [BOMNo] = @Original_BOMNo
  AND [ItemNo] = @Original_ItemNo
  SET @RowCount = @@RowCount
GO
