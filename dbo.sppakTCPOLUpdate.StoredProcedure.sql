USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLUpdate]
  @Original_SerialNo Int, 
  @Original_ItemNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_POLine] SET 
   [ItemNo] = @ItemNo
  ,[ItemCode] = @ItemCode
  ,[ItemDescription] = @ItemDescription
  ,[ItemQuantity] = @ItemQuantity
  ,[ItemElement] = @ItemElement
  ,[ItemStatusID] = @ItemStatusID
  ,[SerialNo] = @SerialNo
  ,[ItemAmount] = @ItemAmount
  ,[ItemUnit] = @ItemUnit
  ,[ItemPrice] = @ItemPrice
  WHERE
  [SerialNo] = @Original_SerialNo
  AND [ItemNo] = @Original_ItemNo
  SET @RowCount = @@RowCount
GO
