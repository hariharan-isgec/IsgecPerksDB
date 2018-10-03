USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteItemMasterLocationUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_SiteMarkNo NVarChar(30), 
  @Original_LocationID Int, 
  @ProjectID NVarChar(6),
  @SiteMarkNo NVarChar(30),
  @LocationID Int,
  @UOMQuantity Int,
  @Quantity Decimal(18,2),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_SiteItemMasterLocation] SET 
   [ProjectID] = @ProjectID
  ,[SiteMarkNo] = @SiteMarkNo
  ,[LocationID] = @LocationID
  ,[UOMQuantity] = @UOMQuantity
  ,[Quantity] = @Quantity
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [SiteMarkNo] = @Original_SiteMarkNo
  AND [LocationID] = @Original_LocationID
  SET @RowCount = @@RowCount
GO
