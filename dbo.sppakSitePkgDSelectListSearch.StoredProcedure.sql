USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSitePkgDSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,RecNo Int NOT NULL
 ,RecSrNo Int NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID, RecNo, RecSrNo)
  SELECT [PAK_SitePkgD].[ProjectID], [PAK_SitePkgD].[RecNo], [PAK_SitePkgD].[RecSrNo] FROM [PAK_SitePkgD]
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
 WHERE  
   ( 
         STR(ISNULL([PAK_SitePkgD].[RecSrNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgD].[ItemNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_SitePkgD].[SiteMarkNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgD].[UOMQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgD].[Quantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgD].[PackTypeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgD].[InventoryStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_SitePkgD].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgD].[PackHeight], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgD].[UOMPack], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_SitePkgD].[InventoryUpdatedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgD].[MaterialStatusID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgD].[BOMNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgD].[DocumentNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgD].[PkgNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgD].[RecNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgD].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgD].[PackLength], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgD].[PackWidth], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_SitePkgD].[PackingMark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_SitePkgD].[DocumentRevision],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_SitePkgD].[ProjectID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [PAK_SitePkgD].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [PAK_SitePkgD].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'RecNo' THEN [PAK_SitePkgD].[RecNo] END,
     CASE @OrderBy WHEN 'RecNo DESC' THEN [PAK_SitePkgD].[RecNo] END DESC,
     CASE @OrderBy WHEN 'RecSrNo' THEN [PAK_SitePkgD].[RecSrNo] END,
     CASE @OrderBy WHEN 'RecSrNo DESC' THEN [PAK_SitePkgD].[RecSrNo] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [PAK_SitePkgD].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [PAK_SitePkgD].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'PkgNo' THEN [PAK_SitePkgD].[PkgNo] END,
     CASE @OrderBy WHEN 'PkgNo DESC' THEN [PAK_SitePkgD].[PkgNo] END DESC,
     CASE @OrderBy WHEN 'BOMNo' THEN [PAK_SitePkgD].[BOMNo] END,
     CASE @OrderBy WHEN 'BOMNo DESC' THEN [PAK_SitePkgD].[BOMNo] END DESC,
     CASE @OrderBy WHEN 'ItemNo' THEN [PAK_SitePkgD].[ItemNo] END,
     CASE @OrderBy WHEN 'ItemNo DESC' THEN [PAK_SitePkgD].[ItemNo] END DESC,
     CASE @OrderBy WHEN 'SiteMarkNo' THEN [PAK_SitePkgD].[SiteMarkNo] END,
     CASE @OrderBy WHEN 'SiteMarkNo DESC' THEN [PAK_SitePkgD].[SiteMarkNo] END DESC,
     CASE @OrderBy WHEN 'UOMQuantity' THEN [PAK_SitePkgD].[UOMQuantity] END,
     CASE @OrderBy WHEN 'UOMQuantity DESC' THEN [PAK_SitePkgD].[UOMQuantity] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [PAK_SitePkgD].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [PAK_SitePkgD].[Quantity] END DESC,
     CASE @OrderBy WHEN 'DocumentNo' THEN [PAK_SitePkgD].[DocumentNo] END,
     CASE @OrderBy WHEN 'DocumentNo DESC' THEN [PAK_SitePkgD].[DocumentNo] END DESC,
     CASE @OrderBy WHEN 'DocumentRevision' THEN [PAK_SitePkgD].[DocumentRevision] END,
     CASE @OrderBy WHEN 'DocumentRevision DESC' THEN [PAK_SitePkgD].[DocumentRevision] END DESC,
     CASE @OrderBy WHEN 'PackTypeID' THEN [PAK_SitePkgD].[PackTypeID] END,
     CASE @OrderBy WHEN 'PackTypeID DESC' THEN [PAK_SitePkgD].[PackTypeID] END DESC,
     CASE @OrderBy WHEN 'PackingMark' THEN [PAK_SitePkgD].[PackingMark] END,
     CASE @OrderBy WHEN 'PackingMark DESC' THEN [PAK_SitePkgD].[PackingMark] END DESC,
     CASE @OrderBy WHEN 'PackLength' THEN [PAK_SitePkgD].[PackLength] END,
     CASE @OrderBy WHEN 'PackLength DESC' THEN [PAK_SitePkgD].[PackLength] END DESC,
     CASE @OrderBy WHEN 'PackWidth' THEN [PAK_SitePkgD].[PackWidth] END,
     CASE @OrderBy WHEN 'PackWidth DESC' THEN [PAK_SitePkgD].[PackWidth] END DESC,
     CASE @OrderBy WHEN 'PackHeight' THEN [PAK_SitePkgD].[PackHeight] END,
     CASE @OrderBy WHEN 'PackHeight DESC' THEN [PAK_SitePkgD].[PackHeight] END DESC,
     CASE @OrderBy WHEN 'UOMPack' THEN [PAK_SitePkgD].[UOMPack] END,
     CASE @OrderBy WHEN 'UOMPack DESC' THEN [PAK_SitePkgD].[UOMPack] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [PAK_SitePkgD].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [PAK_SitePkgD].[Remarks] END DESC,
     CASE @OrderBy WHEN 'DocumentReceived' THEN [PAK_SitePkgD].[DocumentReceived] END,
     CASE @OrderBy WHEN 'DocumentReceived DESC' THEN [PAK_SitePkgD].[DocumentReceived] END DESC,
     CASE @OrderBy WHEN 'NotFromPackingList' THEN [PAK_SitePkgD].[NotFromPackingList] END,
     CASE @OrderBy WHEN 'NotFromPackingList DESC' THEN [PAK_SitePkgD].[NotFromPackingList] END DESC,
     CASE @OrderBy WHEN 'OnlyPackageReceived' THEN [PAK_SitePkgD].[OnlyPackageReceived] END,
     CASE @OrderBy WHEN 'OnlyPackageReceived DESC' THEN [PAK_SitePkgD].[OnlyPackageReceived] END DESC,
     CASE @OrderBy WHEN 'MaterialStatusID' THEN [PAK_SitePkgD].[MaterialStatusID] END,
     CASE @OrderBy WHEN 'MaterialStatusID DESC' THEN [PAK_SitePkgD].[MaterialStatusID] END DESC,
     CASE @OrderBy WHEN 'InventoryStatusID' THEN [PAK_SitePkgD].[InventoryStatusID] END,
     CASE @OrderBy WHEN 'InventoryStatusID DESC' THEN [PAK_SitePkgD].[InventoryStatusID] END DESC,
     CASE @OrderBy WHEN 'InventoryUpdatedOn' THEN [PAK_SitePkgD].[InventoryUpdatedOn] END,
     CASE @OrderBy WHEN 'InventoryUpdatedOn DESC' THEN [PAK_SitePkgD].[InventoryUpdatedOn] END DESC,
     CASE @OrderBy WHEN 'InventoryUpdatedBy' THEN [PAK_SitePkgD].[InventoryUpdatedBy] END,
     CASE @OrderBy WHEN 'InventoryUpdatedBy DESC' THEN [PAK_SitePkgD].[InventoryUpdatedBy] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects2_Description' THEN [IDM_Projects2].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects2_Description DESC' THEN [IDM_Projects2].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Documents3_cmba' THEN [PAK_Documents3].[cmba] END,
     CASE @OrderBy WHEN 'PAK_Documents3_cmba DESC' THEN [PAK_Documents3].[cmba] END DESC,
     CASE @OrderBy WHEN 'PAK_InventoryStatus4_Description' THEN [PAK_InventoryStatus4].[Description] END,
     CASE @OrderBy WHEN 'PAK_InventoryStatus4_Description DESC' THEN [PAK_InventoryStatus4].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_PakTypes5_Description' THEN [PAK_PakTypes5].[Description] END,
     CASE @OrderBy WHEN 'PAK_PakTypes5_Description DESC' THEN [PAK_PakTypes5].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_PkgListD6_PackingMark' THEN [PAK_PkgListD6].[PackingMark] END,
     CASE @OrderBy WHEN 'PAK_PkgListD6_PackingMark DESC' THEN [PAK_PkgListD6].[PackingMark] END DESC,
     CASE @OrderBy WHEN 'PAK_PkgListH7_SupplierRefNo' THEN [PAK_PkgListH7].[SupplierRefNo] END,
     CASE @OrderBy WHEN 'PAK_PkgListH7_SupplierRefNo DESC' THEN [PAK_PkgListH7].[SupplierRefNo] END DESC,
     CASE @OrderBy WHEN 'PAK_PO8_PODescription' THEN [PAK_PO8].[PODescription] END,
     CASE @OrderBy WHEN 'PAK_PO8_PODescription DESC' THEN [PAK_PO8].[PODescription] END DESC,
     CASE @OrderBy WHEN 'PAK_SiteItemMaster9_ItemDescription' THEN [PAK_SiteItemMaster9].[ItemDescription] END,
     CASE @OrderBy WHEN 'PAK_SiteItemMaster9_ItemDescription DESC' THEN [PAK_SiteItemMaster9].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'PAK_SitePkgH10_SupplierRefNo' THEN [PAK_SitePkgH10].[SupplierRefNo] END,
     CASE @OrderBy WHEN 'PAK_SitePkgH10_SupplierRefNo DESC' THEN [PAK_SitePkgH10].[SupplierRefNo] END DESC,
     CASE @OrderBy WHEN 'PAK_Units11_Description' THEN [PAK_Units11].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units11_Description DESC' THEN [PAK_Units11].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Units12_Description' THEN [PAK_Units12].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units12_Description DESC' THEN [PAK_Units12].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_MaterialStates13_Description' THEN [VR_MaterialStates13].[Description] END,
     CASE @OrderBy WHEN 'VR_MaterialStates13_Description DESC' THEN [VR_MaterialStates13].[Description] END DESC 

    SET @RecordCount = @@RowCount

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
      INNER JOIN #PageIndex
          ON [PAK_SitePkgD].[ProjectID] = #PageIndex.ProjectID
          AND [PAK_SitePkgD].[RecNo] = #PageIndex.RecNo
          AND [PAK_SitePkgD].[RecSrNo] = #PageIndex.RecSrNo
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
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
