USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSitePkgDLocationSelectByID]
  @LoginID NVarChar(8),
  @ProjectID NVarChar(6),
  @RecNo Int,
  @RecSrNo Int,
  @RecSrLNo Int 
  AS
  SELECT
    [PAK_SitePkgDLocation].* ,
    [IDM_Projects1].[Description] AS IDM_Projects1_Description,
    [PAK_PkgListD2].[PackingMark] AS PAK_PkgListD2_PackingMark,
    [PAK_PkgListH3].[SupplierRefNo] AS PAK_PkgListH3_SupplierRefNo,
    [PAK_PO4].[PODescription] AS PAK_PO4_PODescription,
    [PAK_SiteItemMaster5].[ItemDescription] AS PAK_SiteItemMaster5_ItemDescription,
    [PAK_SiteLocations6].[Description] AS PAK_SiteLocations6_Description,
    [PAK_SitePkgD7].[SiteMarkNo] AS PAK_SitePkgD7_SiteMarkNo,
    [PAK_SitePkgH8].[SupplierRefNo] AS PAK_SitePkgH8_SupplierRefNo,
    [PAK_Units9].[Description] AS PAK_Units9_Description 
  FROM [PAK_SitePkgDLocation] 
  INNER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [PAK_SitePkgDLocation].[ProjectID] = [IDM_Projects1].[ProjectID]
  INNER JOIN [PAK_PkgListD] AS [PAK_PkgListD2]
    ON [PAK_SitePkgDLocation].[SerialNo] = [PAK_PkgListD2].[SerialNo]
    AND [PAK_SitePkgDLocation].[PkgNo] = [PAK_PkgListD2].[PkgNo]
    AND [PAK_SitePkgDLocation].[BOMNo] = [PAK_PkgListD2].[BOMNo]
    AND [PAK_SitePkgDLocation].[ItemNo] = [PAK_PkgListD2].[ItemNo]
  INNER JOIN [PAK_PkgListH] AS [PAK_PkgListH3]
    ON [PAK_SitePkgDLocation].[SerialNo] = [PAK_PkgListH3].[SerialNo]
    AND [PAK_SitePkgDLocation].[PkgNo] = [PAK_PkgListH3].[PkgNo]
  INNER JOIN [PAK_PO] AS [PAK_PO4]
    ON [PAK_SitePkgDLocation].[SerialNo] = [PAK_PO4].[SerialNo]
  LEFT OUTER JOIN [PAK_SiteItemMaster] AS [PAK_SiteItemMaster5]
    ON [PAK_SitePkgDLocation].[ProjectID] = [PAK_SiteItemMaster5].[ProjectID]
    AND [PAK_SitePkgDLocation].[SiteMarkNo] = [PAK_SiteItemMaster5].[SiteMarkNo]
  LEFT OUTER JOIN [PAK_SiteLocations] AS [PAK_SiteLocations6]
    ON [PAK_SitePkgDLocation].[LocationID] = [PAK_SiteLocations6].[LocationID]
  INNER JOIN [PAK_SitePkgD] AS [PAK_SitePkgD7]
    ON [PAK_SitePkgDLocation].[ProjectID] = [PAK_SitePkgD7].[ProjectID]
    AND [PAK_SitePkgDLocation].[RecNo] = [PAK_SitePkgD7].[RecNo]
    AND [PAK_SitePkgDLocation].[RecSrNo] = [PAK_SitePkgD7].[RecSrNo]
  INNER JOIN [PAK_SitePkgH] AS [PAK_SitePkgH8]
    ON [PAK_SitePkgDLocation].[ProjectID] = [PAK_SitePkgH8].[ProjectID]
    AND [PAK_SitePkgDLocation].[RecNo] = [PAK_SitePkgH8].[RecNo]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units9]
    ON [PAK_SitePkgDLocation].[UOMQuantity] = [PAK_Units9].[UnitID]
  WHERE
  [PAK_SitePkgDLocation].[ProjectID] = @ProjectID
  AND [PAK_SitePkgDLocation].[RecNo] = @RecNo
  AND [PAK_SitePkgDLocation].[RecSrNo] = @RecSrNo
  AND [PAK_SitePkgDLocation].[RecSrLNo] = @RecSrLNo
GO
