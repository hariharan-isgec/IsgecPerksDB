USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSitePkgDInsert]
  @ItemNo Int,
  @SiteMarkNo NVarChar(30),
  @UOMQuantity Int,
  @Quantity Decimal(18,4),
  @PackTypeID Int,
  @OnlyPackageReceived Bit,
  @InventoryStatusID Int,
  @Remarks NVarChar(100),
  @DocumentReceived Bit,
  @PackHeight Decimal(18,4),
  @UOMPack Int,
  @InventoryUpdatedBy NVarChar(8),
  @InventoryUpdatedOn DateTime,
  @NotFromPackingList Bit,
  @MaterialStatusID Int,
  @BOMNo Int,
  @DocumentNo Int,
  @PkgNo Int,
  @RecNo Int,
  @SerialNo Int,
  @PackLength Decimal(18,4),
  @PackWidth Decimal(18,4),
  @PackingMark NVarChar(50),
  @DocumentRevision NVarChar(10),
  @ProjectID NVarChar(6),
  @TotalWeight Decimal(18,4),
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_RecNo Int = null OUTPUT, 
  @Return_RecSrNo Int = null OUTPUT 
  AS
  INSERT [PAK_SitePkgD]
  (
   [ItemNo]
  ,[SiteMarkNo]
  ,[UOMQuantity]
  ,[Quantity]
  ,[PackTypeID]
  ,[OnlyPackageReceived]
  ,[InventoryStatusID]
  ,[Remarks]
  ,[DocumentReceived]
  ,[PackHeight]
  ,[UOMPack]
  ,[InventoryUpdatedBy]
  ,[InventoryUpdatedOn]
  ,[NotFromPackingList]
  ,[MaterialStatusID]
  ,[BOMNo]
  ,[DocumentNo]
  ,[PkgNo]
  ,[RecNo]
  ,[SerialNo]
  ,[PackLength]
  ,[PackWidth]
  ,[PackingMark]
  ,[DocumentRevision]
  ,[ProjectID]
  ,[TotalWeight]
  )
  VALUES
  (
   @ItemNo
  ,@SiteMarkNo
  ,@UOMQuantity
  ,@Quantity
  ,@PackTypeID
  ,@OnlyPackageReceived
  ,@InventoryStatusID
  ,@Remarks
  ,@DocumentReceived
  ,@PackHeight
  ,@UOMPack
  ,@InventoryUpdatedBy
  ,@InventoryUpdatedOn
  ,@NotFromPackingList
  ,@MaterialStatusID
  ,@BOMNo
  ,@DocumentNo
  ,@PkgNo
  ,@RecNo
  ,@SerialNo
  ,@PackLength
  ,@PackWidth
  ,@PackingMark
  ,@DocumentRevision
  ,UPPER(@ProjectID)
  ,@TotalWeight
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_RecNo = @RecNo
  SET @Return_RecSrNo = Scope_Identity()
GO
