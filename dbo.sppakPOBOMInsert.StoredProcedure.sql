USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOBOMInsert]
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
  @Return_SerialNo Int = null OUTPUT, 
  @Return_BOMNo Int = null OUTPUT 
  AS
  INSERT [PAK_POBOM]
  (
   [ItemNo]
  ,[ItemDescription]
  ,[ElementID]
  ,[StatusID]
  ,[ISGECRemarks]
  ,[SupplierRemarks]
  ,[AcceptedBySupplier]
  ,[FreezedBySupplier]
  ,[Active]
  ,[Changed]
  ,[CreatedBySupplier]
  ,[ChangedBySupplier]
  ,[Root]
  ,[ItemLevel]
  ,[Prefix]
  ,[SerialNo]
  ,[Middle]
  ,[Bottom]
  ,[Free]
  ,[FreezedOn]
  ,[WeightPerUnit]
  ,[UOMWeight]
  ,[ParentItemNo]
  ,[DocumentNo]
  ,[Quantity]
  ,[SupplierItemCode]
  ,[ItemCode]
  ,[UOMQuantity]
  ,[DivisionID]
  ,[AcceptedOn]
  ,[AcceptedBy]
  ,[FreezedBy]
  ,[Freezed]
  ,[Accepted]
  ,[ISGECWeightPerUnit]
  ,[ISGECQuantity]
  ,[SupplierWeightPerUnit]
  ,[SupplierQuantity]
  ,[QualityClearedQty]
  )
  VALUES
  (
   @ItemNo
  ,@ItemDescription
  ,@ElementID
  ,@StatusID
  ,@ISGECRemarks
  ,@SupplierRemarks
  ,@AcceptedBySupplier
  ,@FreezedBySupplier
  ,@Active
  ,@Changed
  ,@CreatedBySupplier
  ,@ChangedBySupplier
  ,@Root
  ,@ItemLevel
  ,@Prefix
  ,@SerialNo
  ,@Middle
  ,@Bottom
  ,@Free
  ,@FreezedOn
  ,@WeightPerUnit
  ,@UOMWeight
  ,@ParentItemNo
  ,@DocumentNo
  ,@Quantity
  ,@SupplierItemCode
  ,@ItemCode
  ,@UOMQuantity
  ,@DivisionID
  ,@AcceptedOn
  ,@AcceptedBy
  ,@FreezedBy
  ,@Freezed
  ,@Accepted
  ,@ISGECWeightPerUnit
  ,@ISGECQuantity
  ,@SupplierWeightPerUnit
  ,@SupplierQuantity
  ,@QualityClearedQty
  )
  SET @Return_SerialNo = @SerialNo
  SET @Return_BOMNo = Scope_Identity()
GO
