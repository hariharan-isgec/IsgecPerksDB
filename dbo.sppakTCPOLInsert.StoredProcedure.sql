USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLInsert]
  @ItemNo Int,
  @ItemCode NVarChar(47),
  @ItemDescription NVarChar(100),
  @ItemQuantity Decimal(14,6),
  @ItemElement NVarChar(8),
  @ItemStatusID Int,
  @SerialNo Int,
  @ItemAmount Decimal(15,6),
  @ItemUnit NVarChar(3),
  @ItemPrice Decimal(15,6),
  @Return_SerialNo Int = null OUTPUT, 
  @Return_ItemNo Int = null OUTPUT 
  AS
  INSERT [PAK_POLine]
  (
   [ItemNo]
  ,[ItemCode]
  ,[ItemDescription]
  ,[ItemQuantity]
  ,[ItemElement]
  ,[ItemStatusID]
  ,[SerialNo]
  ,[ItemAmount]
  ,[ItemUnit]
  ,[ItemPrice]
  )
  VALUES
  (
   @ItemNo
  ,@ItemCode
  ,@ItemDescription
  ,@ItemQuantity
  ,@ItemElement
  ,@ItemStatusID
  ,@SerialNo
  ,@ItemAmount
  ,@ItemUnit
  ,@ItemPrice
  )
  SET @Return_SerialNo = @SerialNo
  SET @Return_ItemNo = @ItemNo
GO
