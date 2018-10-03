USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteItemMasterDelete]
  @Original_ProjectID NVarChar(6),
  @Original_SiteMarkNo NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_SiteItemMaster]
  WHERE
  [PAK_SiteItemMaster].[ProjectID] = @Original_ProjectID
  AND [PAK_SiteItemMaster].[SiteMarkNo] = @Original_SiteMarkNo
  SET @RowCount = @@RowCount
GO
