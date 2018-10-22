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
  @TotalWeight Decimal(18,4),
  @QualityClearedWt Decimal(18,4),
  @InspectionStageID Int,
  @QCLNo Int,
  @BOMNo Int,
  @ItemNo Int,
  @UOMQuantity Int,
  @Quantity Decimal(18,4),
  @ClearedOn DateTime,
  @WeightPerUnit Decimal(18,4),
  @QualityClearedQty Decimal(18,4),
  @UOMWeight Int,
  @ClearedBy NVarChar(8),
  @Remarks NVarChar(500),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_QCListD] SET 
   [SerialNo] = @SerialNo
  ,[TotalWeight] = @TotalWeight
  ,[QualityClearedWt] = @QualityClearedWt
  ,[InspectionStageID] = @InspectionStageID
  ,[QCLNo] = @QCLNo
  ,[BOMNo] = @BOMNo
  ,[ItemNo] = @ItemNo
  ,[UOMQuantity] = @UOMQuantity
  ,[Quantity] = @Quantity
  ,[ClearedOn] = @ClearedOn
  ,[WeightPerUnit] = @WeightPerUnit
  ,[QualityClearedQty] = @QualityClearedQty
  ,[UOMWeight] = @UOMWeight
  ,[ClearedBy] = @ClearedBy
  ,[Remarks] = @Remarks
  WHERE
  [SerialNo] = @Original_SerialNo
  AND [QCLNo] = @Original_QCLNo
  AND [BOMNo] = @Original_BOMNo
  AND [ItemNo] = @Original_ItemNo
  SET @RowCount = @@RowCount
GO
