USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPkgListDUpdate]
  @Original_SerialNo Int, 
  @Original_PkgNo Int, 
  @Original_BOMNo Int, 
  @Original_ItemNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_PkgListD] SET 
   [ItemNo] = @ItemNo
  ,[UOMQuantity] = @UOMQuantity
  ,[Quantity] = @Quantity
  ,[UOMWeight] = @UOMWeight
  ,[WeightPerUnit] = @WeightPerUnit
  ,[TotalWeight] = @TotalWeight
  ,[UOMPack] = @UOMPack
  ,[PackHeight] = @PackHeight
  ,[Remarks] = @Remarks
  ,[TotalWeightReceived] = @TotalWeightReceived
  ,[QuantityReceived] = @QuantityReceived
  ,[TotalWeightBalance] = @TotalWeightBalance
  ,[QuantityBalance] = @QuantityBalance
  ,[BOMNo] = @BOMNo
  ,[PkgNo] = @PkgNo
  ,[SerialNo] = @SerialNo
  ,[PackTypeID] = @PackTypeID
  ,[PackWidth] = @PackWidth
  ,[PackLength] = @PackLength
  ,[PackingMark] = @PackingMark
  ,[DocumentNo] = @DocumentNo
  ,[DocumentRevision] = @DocumentRevision
  WHERE
  [SerialNo] = @Original_SerialNo
  AND [PkgNo] = @Original_PkgNo
  AND [BOMNo] = @Original_BOMNo
  AND [ItemNo] = @Original_ItemNo
  SET @RowCount = @@RowCount
GO
