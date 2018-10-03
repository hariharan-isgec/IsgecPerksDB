USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteItemMasterLocationDelete]
  @Original_ProjectID NVarChar(6),
  @Original_SiteMarkNo NVarChar(30),
  @Original_LocationID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_SiteItemMasterLocation]
  WHERE
  [PAK_SiteItemMasterLocation].[ProjectID] = @Original_ProjectID
  AND [PAK_SiteItemMasterLocation].[SiteMarkNo] = @Original_SiteMarkNo
  AND [PAK_SiteItemMasterLocation].[LocationID] = @Original_LocationID
  SET @RowCount = @@RowCount
GO
