USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakQCListDInsert]
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
  @Return_SerialNo Int = null OUTPUT, 
  @Return_QCLNo Int = null OUTPUT, 
  @Return_BOMNo Int = null OUTPUT, 
  @Return_ItemNo Int = null OUTPUT 
  AS
  INSERT [PAK_QCListD]
  (
   [SerialNo]
  ,[TotalWeight]
  ,[QualityClearedWt]
  ,[InspectionStageID]
  ,[QCLNo]
  ,[BOMNo]
  ,[ItemNo]
  ,[UOMQuantity]
  ,[Quantity]
  ,[ClearedOn]
  ,[WeightPerUnit]
  ,[QualityClearedQty]
  ,[UOMWeight]
  ,[ClearedBy]
  ,[Remarks]
  )
  VALUES
  (
   @SerialNo
  ,@TotalWeight
  ,@QualityClearedWt
  ,@InspectionStageID
  ,@QCLNo
  ,@BOMNo
  ,@ItemNo
  ,@UOMQuantity
  ,@Quantity
  ,@ClearedOn
  ,@WeightPerUnit
  ,@QualityClearedQty
  ,@UOMWeight
  ,@ClearedBy
  ,@Remarks
  )
  SET @Return_SerialNo = @SerialNo
  SET @Return_QCLNo = @QCLNo
  SET @Return_BOMNo = @BOMNo
  SET @Return_ItemNo = @ItemNo
GO
