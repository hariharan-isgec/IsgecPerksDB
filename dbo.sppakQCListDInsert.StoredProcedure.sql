USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakQCListDInsert]
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
  @Return_SerialNo Int = null OUTPUT, 
  @Return_QCLNo Int = null OUTPUT, 
  @Return_BOMNo Int = null OUTPUT, 
  @Return_ItemNo Int = null OUTPUT 
  AS
  INSERT [PAK_QCListD]
  (
   [SerialNo]
  ,[QCLNo]
  ,[BOMNo]
  ,[ItemNo]
  ,[UOMQuantity]
  ,[Quantity]
  ,[UOMWeight]
  ,[WeightPerUnit]
  ,[QualityClearedQty]
  ,[Remarks]
  ,[ClearedBy]
  ,[ClearedOn]
  ,[TotalWeight]
  ,[QualityClearedWt]
  )
  VALUES
  (
   @SerialNo
  ,@QCLNo
  ,@BOMNo
  ,@ItemNo
  ,@UOMQuantity
  ,@Quantity
  ,@UOMWeight
  ,@WeightPerUnit
  ,@QualityClearedQty
  ,@Remarks
  ,@ClearedBy
  ,@ClearedOn
  ,@TotalWeight
  ,@QualityClearedWt
  )
  SET @Return_SerialNo = @SerialNo
  SET @Return_QCLNo = @QCLNo
  SET @Return_BOMNo = @BOMNo
  SET @Return_ItemNo = @ItemNo
GO
