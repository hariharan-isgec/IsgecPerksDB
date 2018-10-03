USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakQCListDUpdate]
  @Original_SerialNo Int, 
  @Original_QCLNo Int, 
  @Original_BOMNo Int, 
  @Original_ItemNo Int, 
  @SerialNo Int,
  @QCLNo Int,
  @BOMNo Int,
  @ItemNo Int,
  @UOMQuantity Int,
  @Quantity Decimal(18,4),
  @UOMWeight Int,
  @WeightPerUnit Decimal(18,4),
  @TotalWeight Decimal(18,4),
  @QualityClearedWt Decimal(18,4),
  @QualityClearedQty Decimal(18,4),
  @Remarks NVarChar(500),
  @ClearedBy NVarChar(8),
  @ClearedOn DateTime,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_QCListD] SET 
   [SerialNo] = @SerialNo
  ,[QCLNo] = @QCLNo
  ,[BOMNo] = @BOMNo
  ,[ItemNo] = @ItemNo
  ,[UOMQuantity] = @UOMQuantity
  ,[Quantity] = @Quantity
  ,[UOMWeight] = @UOMWeight
  ,[WeightPerUnit] = @WeightPerUnit
  ,[QualityClearedQty] = @QualityClearedQty
  ,[Remarks] = @Remarks
  ,[ClearedBy] = @ClearedBy
  ,[ClearedOn] = @ClearedOn
  ,[TotalWeight]=@TotalWeight
  ,[QualityClearedWt]=@QualityClearedWt
  WHERE
  [SerialNo] = @Original_SerialNo
  AND [QCLNo] = @Original_QCLNo
  AND [BOMNo] = @Original_BOMNo
  AND [ItemNo] = @Original_ItemNo
  SET @RowCount = @@RowCount
GO
