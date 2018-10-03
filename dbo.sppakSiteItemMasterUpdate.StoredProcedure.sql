USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteItemMasterUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_SiteMarkNo NVarChar(30), 
  @ProjectID NVarChar(6),
  @SiteMarkNo NVarChar(30),
  @ItemDescription NVarChar(100),
  @UOMQuantity Int,
  @Quantity Decimal(18,2),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_SiteItemMaster] SET 
   [ProjectID] = @ProjectID
  ,[SiteMarkNo] = @SiteMarkNo
  ,[ItemDescription] = @ItemDescription
  ,[UOMQuantity] = @UOMQuantity
  ,[Quantity] = @Quantity
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [SiteMarkNo] = @Original_SiteMarkNo
  SET @RowCount = @@RowCount
GO
