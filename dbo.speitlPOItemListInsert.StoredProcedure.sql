USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOItemListInsert]
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
  @Return_SerialNo Int = null OUTPUT, 
  @Return_ItemLineNo Int = null OUTPUT 
  AS
  INSERT [EITL_POItemList]
  (
   [SerialNo]
  ,[ItemCode]
  ,[Description]
  ,[UOM]
  ,[Quantity]
  ,[WeightInKG]
  ,[DocumentLineNo]
  ,[ReadyToDespatch]
  ,[Despatched]
  ,[VR_ExecutionNo]
  ,[DespatchDate]
  ,[QuantityReceipt]
  ,[WeightInKGReceipt]
  ,[MaterialStateID]
  ,[ReceivedBy]
  ,[ReceivedOn]
  ,[ItemStatusID]
  )
  VALUES
  (
   @SerialNo
  ,@ItemCode
  ,@Description
  ,@UOM
  ,@Quantity
  ,@WeightInKG
  ,@DocumentLineNo
  ,@ReadyToDespatch
  ,@Despatched
  ,@VR_ExecutionNo
  ,@DespatchDate
  ,@QuantityReceipt
  ,@WeightInKGReceipt
  ,@MaterialStateID
  ,@ReceivedBy
  ,@ReceivedOn
  ,@ItemStatusID
  )
  SET @Return_SerialNo = @SerialNo
  SET @Return_ItemLineNo = Scope_Identity()
GO
