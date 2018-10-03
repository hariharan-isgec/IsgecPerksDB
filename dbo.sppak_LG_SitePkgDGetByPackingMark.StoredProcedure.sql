USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppak_LG_SitePkgDGetByPackingMark]
  @Filter_RecNo Int,
  @Filter_ProjectID NVarChar(6),
  @LoginID NVarChar(8),
  @PackingMark NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    SELECT
    [PAK_SitePkgD].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [IDM_Projects2].[Description] AS IDM_Projects2_Description,
    [PAK_Documents3].[cmba] AS PAK_Documents3_cmba,
    [PAK_InventoryStatus4].[Description] AS PAK_InventoryStatus4_Description,
    [PAK_PakTypes5].[Description] AS PAK_PakTypes5_Description,
    [PAK_PkgListD6].[PackingMark] AS PAK_PkgListD6_PackingMark,
    [PAK_PkgListH7].[SupplierRefNo] AS PAK_PkgListH7_SupplierRefNo,
    [PAK_PO8].[PODescription] AS PAK_PO8_PODescription,
    [PAK_SiteItemMaster9].[ItemDescription] AS PAK_SiteItemMaster9_ItemDescription,
    [PAK_SitePkgH10].[SupplierRefNo] AS PAK_SitePkgH10_SupplierRefNo,
    [PAK_Units11].[Description] AS PAK_Units11_Description,
    [PAK_Units12].[Description] AS PAK_Units12_Description,
    [VR_MaterialStates13].[Description] AS VR_MaterialStates13_Description 
  FROM [PAK_SitePkgD] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_SitePkgD].[InventoryUpdatedBy] = [aspnet_users1].[LoginID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [PAK_SitePkgD].[ProjectID] = [IDM_Projects2].[ProjectID]
  LEFT OUTER JOIN [PAK_Documents] AS [PAK_Documents3]
    ON [PAK_SitePkgD].[DocumentNo] = [PAK_Documents3].[DocumentNo]
  LEFT OUTER JOIN [PAK_InventoryStatus] AS [PAK_InventoryStatus4]
    ON [PAK_SitePkgD].[InventoryStatusID] = [PAK_InventoryStatus4].[InventoryStatusID]
  LEFT OUTER JOIN [PAK_PakTypes] AS [PAK_PakTypes5]
    ON [PAK_SitePkgD].[PackTypeID] = [PAK_PakTypes5].[PackTypeID]
  INNER JOIN [PAK_PkgListD] AS [PAK_PkgListD6]
    ON [PAK_SitePkgD].[SerialNo] = [PAK_PkgListD6].[SerialNo]
    AND [PAK_SitePkgD].[PkgNo] = [PAK_PkgListD6].[PkgNo]
    AND [PAK_SitePkgD].[BOMNo] = [PAK_PkgListD6].[BOMNo]
    AND [PAK_SitePkgD].[ItemNo] = [PAK_PkgListD6].[ItemNo]
  INNER JOIN [PAK_PkgListH] AS [PAK_PkgListH7]
    ON [PAK_SitePkgD].[SerialNo] = [PAK_PkgListH7].[SerialNo]
    AND [PAK_SitePkgD].[PkgNo] = [PAK_PkgListH7].[PkgNo]
  INNER JOIN [PAK_PO] AS [PAK_PO8]
    ON [PAK_SitePkgD].[SerialNo] = [PAK_PO8].[SerialNo]
  LEFT OUTER JOIN [PAK_SiteItemMaster] AS [PAK_SiteItemMaster9]
    ON [PAK_SitePkgD].[ProjectID] = [PAK_SiteItemMaster9].[ProjectID]
    AND [PAK_SitePkgD].[SiteMarkNo] = [PAK_SiteItemMaster9].[SiteMarkNo]
  INNER JOIN [PAK_SitePkgH] AS [PAK_SitePkgH10]
    ON [PAK_SitePkgD].[ProjectID] = [PAK_SitePkgH10].[ProjectID]
    AND [PAK_SitePkgD].[RecNo] = [PAK_SitePkgH10].[RecNo]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units11]
    ON [PAK_SitePkgD].[UOMQuantity] = [PAK_Units11].[UnitID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units12]
    ON [PAK_SitePkgD].[UOMPack] = [PAK_Units12].[UnitID]
  LEFT OUTER JOIN [VR_MaterialStates] AS [VR_MaterialStates13]
    ON [PAK_SitePkgD].[MaterialStatusID] = [VR_MaterialStates13].[MaterialStateID]
  WHERE [PAK_SitePkgD].[RecNo] = @Filter_RecNo
        AND [PAK_SitePkgD].[ProjectID] = @Filter_ProjectID
        AND [PAK_SitePkgD].[PackingMark] = @PackingMark
  
    SET @RecordCount = @@RowCount

  END
GO
