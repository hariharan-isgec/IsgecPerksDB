USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSitePkgDUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_RecNo Int, 
  @Original_RecSrNo Int, 
  @ItemNo Int,
  @SiteMarkNo NVarChar(30),
  @UOMQuantity Int,
  @Quantity Decimal(18,2),
  @PackTypeID Int,
  @OnlyPackageReceived Bit,
  @InventoryStatusID Int,
  @Remarks NVarChar(100),
  @DocumentReceived Bit,
  @PackHeight Decimal(18,2),
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
  @PackLength Decimal(18,2),
  @PackWidth Decimal(18,2),
  @PackingMark NVarChar(50),
  @DocumentRevision NVarChar(10),
  @ProjectID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_SitePkgD] SET 
   [ItemNo] = @ItemNo
  ,[SiteMarkNo] = @SiteMarkNo
  ,[UOMQuantity] = @UOMQuantity
  ,[Quantity] = @Quantity
  ,[PackTypeID] = @PackTypeID
  ,[OnlyPackageReceived] = @OnlyPackageReceived
  ,[InventoryStatusID] = @InventoryStatusID
  ,[Remarks] = @Remarks
  ,[DocumentReceived] = @DocumentReceived
  ,[PackHeight] = @PackHeight
  ,[UOMPack] = @UOMPack
  ,[InventoryUpdatedBy] = @InventoryUpdatedBy
  ,[InventoryUpdatedOn] = @InventoryUpdatedOn
  ,[NotFromPackingList] = @NotFromPackingList
  ,[MaterialStatusID] = @MaterialStatusID
  ,[BOMNo] = @BOMNo
  ,[DocumentNo] = @DocumentNo
  ,[PkgNo] = @PkgNo
  ,[RecNo] = @RecNo
  ,[SerialNo] = @SerialNo
  ,[PackLength] = @PackLength
  ,[PackWidth] = @PackWidth
  ,[PackingMark] = @PackingMark
  ,[DocumentRevision] = @DocumentRevision
  ,[ProjectID] = @ProjectID
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [RecNo] = @Original_RecNo
  AND [RecSrNo] = @Original_RecSrNo
  SET @RowCount = @@RowCount
GO
