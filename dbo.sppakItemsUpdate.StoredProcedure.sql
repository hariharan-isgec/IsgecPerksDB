USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakItemsUpdate]
  @Original_ItemNo Int, 
  @ItemCode NVarChar(50),
  @ItemDescription NVarChar(100),
  @ElementID NVarChar(8),
  @Active Bit,
  @Quantity Decimal(18,2),
  @UOMWeight Int,
  @Root Bit,
  @UOMQuantity Int,
  @ParentItemNo Int,
  @WeightPerUnit Decimal(18,2),
  @Bottom Bit,
  @Middle Bit,
  @RootItem Int,
  @DivisionID Int,
  @Free Bit,
  @ItemLevel Int,
  @Prefix NVarChar(1000),
  @DocumentNo Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_Items] SET 
   [ItemCode] = @ItemCode
  ,[ItemDescription] = @ItemDescription
  ,[ElementID] = @ElementID
  ,[Active] = @Active
  ,[Quantity] = @Quantity
  ,[UOMWeight] = @UOMWeight
  ,[Root] = @Root
  ,[UOMQuantity] = @UOMQuantity
  ,[ParentItemNo] = @ParentItemNo
  ,[WeightPerUnit] = @WeightPerUnit
  ,[Bottom] = @Bottom
  ,[Middle] = @Middle
  ,[RootItem] = @RootItem
  ,[DivisionID] = @DivisionID
  ,[Free] = @Free
  ,[ItemLevel] = @ItemLevel
  ,[Prefix] = @Prefix
  ,[DocumentNo] = @DocumentNo
  WHERE
  [ItemNo] = @Original_ItemNo
  SET @RowCount = @@RowCount
GO
