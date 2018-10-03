USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOItemListUpdate]
  @Original_SerialNo Int, 
  @Original_ItemLineNo Int, 
  @SerialNo Int,
  @ItemCode NVarChar(50),
  @Description NVarChar(200),
  @UOM NVarChar(3),
  @Quantity Int,
  @WeightInKG Decimal(18,2),
  @DocumentLineNo Int,
  @ReadyToDespatch Bit,
  @Despatched Bit,
  @VR_ExecutionNo Int,
  @DespatchDate DateTime,
  @QuantityReceipt Int,
  @WeightInKGReceipt Decimal(18,2),
  @MaterialStateID Int,
  @ReceivedBy NVarChar(8),
  @ReceivedOn DateTime,
  @ItemStatusID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [EITL_POItemList] SET 
   [SerialNo] = @SerialNo
  ,[ItemCode] = @ItemCode
  ,[Description] = @Description
  ,[UOM] = @UOM
  ,[Quantity] = @Quantity
  ,[WeightInKG] = @WeightInKG
  ,[DocumentLineNo] = @DocumentLineNo
  ,[ReadyToDespatch] = @ReadyToDespatch
  ,[Despatched] = @Despatched
  ,[VR_ExecutionNo] = @VR_ExecutionNo
  ,[DespatchDate] = @DespatchDate
  ,[QuantityReceipt] = @QuantityReceipt
  ,[WeightInKGReceipt] = @WeightInKGReceipt
  ,[MaterialStateID] = @MaterialStateID
  ,[ReceivedBy] = @ReceivedBy
  ,[ReceivedOn] = @ReceivedOn
  ,[ItemStatusID] = @ItemStatusID
  WHERE
  [SerialNo] = @Original_SerialNo
  AND [ItemLineNo] = @Original_ItemLineNo
  SET @RowCount = @@RowCount
GO
