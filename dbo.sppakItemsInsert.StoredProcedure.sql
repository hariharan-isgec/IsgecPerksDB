USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakItemsInsert]
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
  @Return_ItemNo Int = null OUTPUT 
  AS
  INSERT [PAK_Items]
  (
   [ItemCode]
  ,[ItemDescription]
  ,[ElementID]
  ,[Active]
  ,[Quantity]
  ,[UOMWeight]
  ,[Root]
  ,[UOMQuantity]
  ,[ParentItemNo]
  ,[WeightPerUnit]
  ,[Bottom]
  ,[Middle]
  ,[RootItem]
  ,[DivisionID]
  ,[Free]
  ,[ItemLevel]
  ,[Prefix]
  ,[DocumentNo]
  )
  VALUES
  (
   @ItemCode
  ,@ItemDescription
  ,@ElementID
  ,@Active
  ,@Quantity
  ,@UOMWeight
  ,@Root
  ,@UOMQuantity
  ,@ParentItemNo
  ,@WeightPerUnit
  ,@Bottom
  ,@Middle
  ,@RootItem
  ,@DivisionID
  ,@Free
  ,@ItemLevel
  ,@Prefix
  ,@DocumentNo
  )
  SET @Return_ItemNo = Scope_Identity()
GO
