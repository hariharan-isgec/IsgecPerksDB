USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSitePkgDLocationUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_RecNo Int, 
  @Original_RecSrNo Int, 
  @Original_RecSrLNo Int, 
  @ItemNo Int,
  @SiteMarkNo NVarChar(30),
  @LocationID Int,
  @UOMQuantity Int,
  @Quantity Decimal(18,2),
  @Support Bit,
  @Remarks NVarChar(100),
  @RecSrNo Int,
  @RecNo Int,
  @ProjectID NVarChar(6),
  @BOMNo Int,
  @PkgNo Int,
  @SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_SitePkgDLocation] SET 
   [ItemNo] = @ItemNo
  ,[SiteMarkNo] = @SiteMarkNo
  ,[LocationID] = @LocationID
  ,[UOMQuantity] = @UOMQuantity
  ,[Quantity] = @Quantity
  ,[Support] = @Support
  ,[Remarks] = @Remarks
  ,[RecSrNo] = @RecSrNo
  ,[RecNo] = @RecNo
  ,[ProjectID] = @ProjectID
  ,[BOMNo] = @BOMNo
  ,[PkgNo] = @PkgNo
  ,[SerialNo] = @SerialNo
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [RecNo] = @Original_RecNo
  AND [RecSrNo] = @Original_RecSrNo
  AND [RecSrLNo] = @Original_RecSrLNo
  SET @RowCount = @@RowCount
GO
