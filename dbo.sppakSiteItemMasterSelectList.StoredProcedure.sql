USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteItemMasterSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_SiteItemMaster].* ,
    [IDM_Projects1].[Description] AS IDM_Projects1_Description,
    [PAK_Units2].[Description] AS PAK_Units2_Description 
  FROM [PAK_SiteItemMaster] 
  INNER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [PAK_SiteItemMaster].[ProjectID] = [IDM_Projects1].[ProjectID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units2]
    ON [PAK_SiteItemMaster].[UOMQuantity] = [PAK_Units2].[UnitID]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [PAK_SiteItemMaster].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [PAK_SiteItemMaster].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'SiteMarkNo' THEN [PAK_SiteItemMaster].[SiteMarkNo] END,
     CASE @OrderBy WHEN 'SiteMarkNo DESC' THEN [PAK_SiteItemMaster].[SiteMarkNo] END DESC,
     CASE @OrderBy WHEN 'ItemDescription' THEN [PAK_SiteItemMaster].[ItemDescription] END,
     CASE @OrderBy WHEN 'ItemDescription DESC' THEN [PAK_SiteItemMaster].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'UOMQuantity' THEN [PAK_SiteItemMaster].[UOMQuantity] END,
     CASE @OrderBy WHEN 'UOMQuantity DESC' THEN [PAK_SiteItemMaster].[UOMQuantity] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [PAK_SiteItemMaster].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [PAK_SiteItemMaster].[Quantity] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects1_Description' THEN [IDM_Projects1].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects1_Description DESC' THEN [IDM_Projects1].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Units2_Description' THEN [PAK_Units2].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units2_Description DESC' THEN [PAK_Units2].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
