USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteItemMasterSelectByID]
  @LoginID NVarChar(8),
  @ProjectID NVarChar(6),
  @SiteMarkNo NVarChar(30) 
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
  WHERE
  [PAK_SiteItemMaster].[ProjectID] = @ProjectID
  AND [PAK_SiteItemMaster].[SiteMarkNo] = @SiteMarkNo
GO
