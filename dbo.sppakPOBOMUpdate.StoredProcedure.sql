USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOBOMUpdate]
  @Original_SerialNo Int, 
  @Original_BOMNo Int, 
  @ItemNo Int,
  @ItemDescription NVarChar(100),
  @ElementID NVarChar(8),
  @StatusID Int,
  @ISGECRemarks NVarChar(500),
  @SupplierRemarks NVarChar(500),
  @AcceptedBySupplier Bit,
  @FreezedBySupplier Bit,
  @Active Bit,
  @Changed Bit,
  @CreatedBySupplier Bit,
  @ChangedBySupplier Bit,
  @Root Bit,
  @ItemLevel Int,
  @Prefix NVarChar(1000),
  @SerialNo Int,
  @Middle Bit,
  @Bottom Bit,
  @Free Bit,
  @FreezedOn DateTime,
  @WeightPerUnit Decimal(18,4),
  @UOMWeight Int,
  @ParentItemNo Int,
  @DocumentNo Int,
  @Quantity Decimal(18,4),
  @SupplierItemCode NVarChar(50),
  @ItemCode NVarChar(50),
  @UOMQuantity Int,
  @DivisionID Int,
  @AcceptedOn DateTime,
  @AcceptedBy NVarChar(8),
  @FreezedBy NVarChar(8),
  @Freezed Bit,
  @Accepted Bit,
  @ISGECWeightPerUnit Decimal(18,4),
  @ISGECQuantity Decimal(18,4),
  @SupplierWeightPerUnit Decimal(18,4),
  @SupplierQuantity Decimal(18,4),
  @QualityClearedQty Decimal(18,4) = 0, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_POBOM] SET 
   [ItemNo] = @ItemNo
  ,[ItemDescription] = @ItemDescription
  ,[ElementID] = @ElementID
  ,[StatusID] = @StatusID
  ,[ISGECRemarks] = @ISGECRemarks
  ,[SupplierRemarks] = @SupplierRemarks
  ,[AcceptedBySupplier] = @AcceptedBySupplier
  ,[FreezedBySupplier] = @FreezedBySupplier
  ,[Active] = @Active
  ,[Changed] = @Changed
  ,[CreatedBySupplier] = @CreatedBySupplier
  ,[ChangedBySupplier] = @ChangedBySupplier
  ,[Root] = @Root
  ,[ItemLevel] = @ItemLevel
  ,[Prefix] = @Prefix
  ,[SerialNo] = @SerialNo
  ,[Middle] = @Middle
  ,[Bottom] = @Bottom
  ,[Free] = @Free
  ,[FreezedOn] = @FreezedOn
  ,[WeightPerUnit] = @WeightPerUnit
  ,[UOMWeight] = @UOMWeight
  ,[ParentItemNo] = @ParentItemNo
  ,[DocumentNo] = @DocumentNo
  ,[Quantity] = @Quantity
  ,[SupplierItemCode] = @SupplierItemCode
  ,[ItemCode] = @ItemCode
  ,[UOMQuantity] = @UOMQuantity
  ,[DivisionID] = @DivisionID
  ,[AcceptedOn] = @AcceptedOn
  ,[AcceptedBy] = @AcceptedBy
  ,[FreezedBy] = @FreezedBy
  ,[Freezed] = @Freezed
  ,[Accepted] = @Accepted
  ,[ISGECWeightPerUnit] = @ISGECWeightPerUnit
  ,[ISGECQuantity] = @ISGECQuantity
  ,[SupplierWeightPerUnit] = @SupplierWeightPerUnit
  ,[SupplierQuantity] = @SupplierQuantity
  ,[QualityClearedQty] = @QualityClearedQty 
  WHERE
  [SerialNo] = @Original_SerialNo
  AND [BOMNo] = @Original_BOMNo
  SET @RowCount = @@RowCount
GO
