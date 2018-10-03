USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteItemMasterLocationSelectByID]
  @LoginID NVarChar(8),
  @ProjectID NVarChar(6),
  @SiteMarkNo NVarChar(30),
  @LocationID Int 
  AS
  SELECT
    [PAK_SiteItemMasterLocation].* ,
    [IDM_Projects1].[Description] AS IDM_Projects1_Description,
    [PAK_SiteItemMaster2].[ItemDescription] AS PAK_SiteItemMaster2_ItemDescription,
    [PAK_SiteLocations3].[Description] AS PAK_SiteLocations3_Description,
    [PAK_Units4].[Description] AS PAK_Units4_Description 
  FROM [PAK_SiteItemMasterLocation] 
  INNER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [PAK_SiteItemMasterLocation].[ProjectID] = [IDM_Projects1].[ProjectID]
  INNER JOIN [PAK_SiteItemMaster] AS [PAK_SiteItemMaster2]
    ON [PAK_SiteItemMasterLocation].[ProjectID] = [PAK_SiteItemMaster2].[ProjectID]
    AND [PAK_SiteItemMasterLocation].[SiteMarkNo] = [PAK_SiteItemMaster2].[SiteMarkNo]
  INNER JOIN [PAK_SiteLocations] AS [PAK_SiteLocations3]
    ON [PAK_SiteItemMasterLocation].[LocationID] = [PAK_SiteLocations3].[LocationID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units4]
    ON [PAK_SiteItemMasterLocation].[UOMQuantity] = [PAK_Units4].[UnitID]
  WHERE
  [PAK_SiteItemMasterLocation].[ProjectID] = @ProjectID
  AND [PAK_SiteItemMasterLocation].[SiteMarkNo] = @SiteMarkNo
  AND [PAK_SiteItemMasterLocation].[LocationID] = @LocationID
GO
