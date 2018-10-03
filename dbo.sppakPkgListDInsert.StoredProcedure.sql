USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPkgListDInsert]
  @ItemNo Int,
  @UOMQuantity Int,
  @Quantity Decimal(18,4),
  @UOMWeight Int,
  @WeightPerUnit Decimal(18,4),
  @TotalWeight Decimal(18,4),
  @UOMPack Int,
  @PackHeight Decimal(18,2),
  @Remarks NVarChar(100),
  @TotalWeightReceived Decimal(18,4),
  @QuantityReceived Decimal(18,4),
  @TotalWeightBalance Decimal(18,4),
  @QuantityBalance Decimal(18,4),
  @BOMNo Int,
  @PkgNo Int,
  @SerialNo Int,
  @PackTypeID Int,
  @PackWidth Decimal(18,2),
  @PackLength Decimal(18,2),
  @PackingMark NVarChar(50),
  @DocumentNo NVarChar(50),
  @DocumentRevision NVarChar(10),
  @Return_SerialNo Int = null OUTPUT, 
  @Return_PkgNo Int = null OUTPUT, 
  @Return_BOMNo Int = null OUTPUT, 
  @Return_ItemNo Int = null OUTPUT 
  AS
  INSERT [PAK_PkgListD]
  (
   [ItemNo]
  ,[UOMQuantity]
  ,[Quantity]
  ,[UOMWeight]
  ,[WeightPerUnit]
  ,[TotalWeight]
  ,[UOMPack]
  ,[PackHeight]
  ,[Remarks]
  ,[TotalWeightReceived]
  ,[QuantityReceived]
  ,[TotalWeightBalance]
  ,[QuantityBalance]
  ,[BOMNo]
  ,[PkgNo]
  ,[SerialNo]
  ,[PackTypeID]
  ,[PackWidth]
  ,[PackLength]
  ,[PackingMark]
  ,[DocumentNo]
  ,[DocumentRevision]
  )
  VALUES
  (
   @ItemNo
  ,@UOMQuantity
  ,@Quantity
  ,@UOMWeight
  ,@WeightPerUnit
  ,@TotalWeight
  ,@UOMPack
  ,@PackHeight
  ,@Remarks
  ,@TotalWeightReceived
  ,@QuantityReceived
  ,@TotalWeightBalance
  ,@QuantityBalance
  ,@BOMNo
  ,@PkgNo
  ,@SerialNo
  ,@PackTypeID
  ,@PackWidth
  ,@PackLength
  ,@PackingMark
  ,@DocumentNo
  ,@DocumentRevision
  )
  SET @Return_SerialNo = @SerialNo
  SET @Return_PkgNo = @PkgNo
  SET @Return_BOMNo = @BOMNo
  SET @Return_ItemNo = @ItemNo
GO
