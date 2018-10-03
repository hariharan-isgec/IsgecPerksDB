USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSitePkgDSelectListFilteres]
  @Filter_RecNo Int,
  @Filter_ProjectID NVarChar(6),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,RecNo Int NOT NULL
 ,RecSrNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', RecNo'
  SET @LGSQL = @LGSQL + ', RecSrNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_SitePkgD].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [PAK_SitePkgD].[RecNo]'
  SET @LGSQL = @LGSQL + ', [PAK_SitePkgD].[RecSrNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_SitePkgD] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgD].[InventoryUpdatedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgD].[ProjectID] = [IDM_Projects2].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Documents] AS [PAK_Documents3]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgD].[DocumentNo] = [PAK_Documents3].[DocumentNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_InventoryStatus] AS [PAK_InventoryStatus4]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgD].[InventoryStatusID] = [PAK_InventoryStatus4].[InventoryStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_PakTypes] AS [PAK_PakTypes5]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgD].[PackTypeID] = [PAK_PakTypes5].[PackTypeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_PkgListD] AS [PAK_PkgListD6]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgD].[SerialNo] = [PAK_PkgListD6].[SerialNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SitePkgD].[PkgNo] = [PAK_PkgListD6].[PkgNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SitePkgD].[BOMNo] = [PAK_PkgListD6].[BOMNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SitePkgD].[ItemNo] = [PAK_PkgListD6].[ItemNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_PkgListH] AS [PAK_PkgListH7]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgD].[SerialNo] = [PAK_PkgListH7].[SerialNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SitePkgD].[PkgNo] = [PAK_PkgListH7].[PkgNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_PO] AS [PAK_PO8]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgD].[SerialNo] = [PAK_PO8].[SerialNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_SiteItemMaster] AS [PAK_SiteItemMaster9]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgD].[ProjectID] = [PAK_SiteItemMaster9].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SitePkgD].[SiteMarkNo] = [PAK_SiteItemMaster9].[SiteMarkNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_SitePkgH] AS [PAK_SitePkgH10]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgD].[ProjectID] = [PAK_SitePkgH10].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SitePkgD].[RecNo] = [PAK_SitePkgH10].[RecNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units11]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgD].[UOMQuantity] = [PAK_Units11].[UnitID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units12]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgD].[UOMPack] = [PAK_Units12].[UnitID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_MaterialStates] AS [VR_MaterialStates13]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgD].[MaterialStatusID] = [VR_MaterialStates13].[MaterialStateID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_RecNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_SitePkgD].[RecNo] = ' + STR(@Filter_RecNo)
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [PAK_SitePkgD].[ProjectID] = ''' + @Filter_ProjectID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[PAK_SitePkgD].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[PAK_SitePkgD].[ProjectID] DESC'
                        WHEN 'RecNo' THEN '[PAK_SitePkgD].[RecNo]'
                        WHEN 'RecNo DESC' THEN '[PAK_SitePkgD].[RecNo] DESC'
                        WHEN 'RecSrNo' THEN '[PAK_SitePkgD].[RecSrNo]'
                        WHEN 'RecSrNo DESC' THEN '[PAK_SitePkgD].[RecSrNo] DESC'
                        WHEN 'SerialNo' THEN '[PAK_SitePkgD].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[PAK_SitePkgD].[SerialNo] DESC'
                        WHEN 'PkgNo' THEN '[PAK_SitePkgD].[PkgNo]'
                        WHEN 'PkgNo DESC' THEN '[PAK_SitePkgD].[PkgNo] DESC'
                        WHEN 'BOMNo' THEN '[PAK_SitePkgD].[BOMNo]'
                        WHEN 'BOMNo DESC' THEN '[PAK_SitePkgD].[BOMNo] DESC'
                        WHEN 'ItemNo' THEN '[PAK_SitePkgD].[ItemNo]'
                        WHEN 'ItemNo DESC' THEN '[PAK_SitePkgD].[ItemNo] DESC'
                        WHEN 'SiteMarkNo' THEN '[PAK_SitePkgD].[SiteMarkNo]'
                        WHEN 'SiteMarkNo DESC' THEN '[PAK_SitePkgD].[SiteMarkNo] DESC'
                        WHEN 'UOMQuantity' THEN '[PAK_SitePkgD].[UOMQuantity]'
                        WHEN 'UOMQuantity DESC' THEN '[PAK_SitePkgD].[UOMQuantity] DESC'
                        WHEN 'Quantity' THEN '[PAK_SitePkgD].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[PAK_SitePkgD].[Quantity] DESC'
                        WHEN 'DocumentNo' THEN '[PAK_SitePkgD].[DocumentNo]'
                        WHEN 'DocumentNo DESC' THEN '[PAK_SitePkgD].[DocumentNo] DESC'
                        WHEN 'DocumentRevision' THEN '[PAK_SitePkgD].[DocumentRevision]'
                        WHEN 'DocumentRevision DESC' THEN '[PAK_SitePkgD].[DocumentRevision] DESC'
                        WHEN 'PackTypeID' THEN '[PAK_SitePkgD].[PackTypeID]'
                        WHEN 'PackTypeID DESC' THEN '[PAK_SitePkgD].[PackTypeID] DESC'
                        WHEN 'PackingMark' THEN '[PAK_SitePkgD].[PackingMark]'
                        WHEN 'PackingMark DESC' THEN '[PAK_SitePkgD].[PackingMark] DESC'
                        WHEN 'PackLength' THEN '[PAK_SitePkgD].[PackLength]'
                        WHEN 'PackLength DESC' THEN '[PAK_SitePkgD].[PackLength] DESC'
                        WHEN 'PackWidth' THEN '[PAK_SitePkgD].[PackWidth]'
                        WHEN 'PackWidth DESC' THEN '[PAK_SitePkgD].[PackWidth] DESC'
                        WHEN 'PackHeight' THEN '[PAK_SitePkgD].[PackHeight]'
                        WHEN 'PackHeight DESC' THEN '[PAK_SitePkgD].[PackHeight] DESC'
                        WHEN 'UOMPack' THEN '[PAK_SitePkgD].[UOMPack]'
                        WHEN 'UOMPack DESC' THEN '[PAK_SitePkgD].[UOMPack] DESC'
                        WHEN 'Remarks' THEN '[PAK_SitePkgD].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[PAK_SitePkgD].[Remarks] DESC'
                        WHEN 'DocumentReceived' THEN '[PAK_SitePkgD].[DocumentReceived]'
                        WHEN 'DocumentReceived DESC' THEN '[PAK_SitePkgD].[DocumentReceived] DESC'
                        WHEN 'NotFromPackingList' THEN '[PAK_SitePkgD].[NotFromPackingList]'
                        WHEN 'NotFromPackingList DESC' THEN '[PAK_SitePkgD].[NotFromPackingList] DESC'
                        WHEN 'OnlyPackageReceived' THEN '[PAK_SitePkgD].[OnlyPackageReceived]'
                        WHEN 'OnlyPackageReceived DESC' THEN '[PAK_SitePkgD].[OnlyPackageReceived] DESC'
                        WHEN 'MaterialStatusID' THEN '[PAK_SitePkgD].[MaterialStatusID]'
                        WHEN 'MaterialStatusID DESC' THEN '[PAK_SitePkgD].[MaterialStatusID] DESC'
                        WHEN 'InventoryStatusID' THEN '[PAK_SitePkgD].[InventoryStatusID]'
                        WHEN 'InventoryStatusID DESC' THEN '[PAK_SitePkgD].[InventoryStatusID] DESC'
                        WHEN 'InventoryUpdatedOn' THEN '[PAK_SitePkgD].[InventoryUpdatedOn]'
                        WHEN 'InventoryUpdatedOn DESC' THEN '[PAK_SitePkgD].[InventoryUpdatedOn] DESC'
                        WHEN 'InventoryUpdatedBy' THEN '[PAK_SitePkgD].[InventoryUpdatedBy]'
                        WHEN 'InventoryUpdatedBy DESC' THEN '[PAK_SitePkgD].[InventoryUpdatedBy] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'IDM_Projects2_Description' THEN '[IDM_Projects2].[Description]'
                        WHEN 'IDM_Projects2_Description DESC' THEN '[IDM_Projects2].[Description] DESC'
                        WHEN 'PAK_Documents3_cmba' THEN '[PAK_Documents3].[cmba]'
                        WHEN 'PAK_Documents3_cmba DESC' THEN '[PAK_Documents3].[cmba] DESC'
                        WHEN 'PAK_InventoryStatus4_Description' THEN '[PAK_InventoryStatus4].[Description]'
                        WHEN 'PAK_InventoryStatus4_Description DESC' THEN '[PAK_InventoryStatus4].[Description] DESC'
                        WHEN 'PAK_PakTypes5_Description' THEN '[PAK_PakTypes5].[Description]'
                        WHEN 'PAK_PakTypes5_Description DESC' THEN '[PAK_PakTypes5].[Description] DESC'
                        WHEN 'PAK_PkgListD6_PackingMark' THEN '[PAK_PkgListD6].[PackingMark]'
                        WHEN 'PAK_PkgListD6_PackingMark DESC' THEN '[PAK_PkgListD6].[PackingMark] DESC'
                        WHEN 'PAK_PkgListH7_SupplierRefNo' THEN '[PAK_PkgListH7].[SupplierRefNo]'
                        WHEN 'PAK_PkgListH7_SupplierRefNo DESC' THEN '[PAK_PkgListH7].[SupplierRefNo] DESC'
                        WHEN 'PAK_PO8_PODescription' THEN '[PAK_PO8].[PODescription]'
                        WHEN 'PAK_PO8_PODescription DESC' THEN '[PAK_PO8].[PODescription] DESC'
                        WHEN 'PAK_SiteItemMaster9_ItemDescription' THEN '[PAK_SiteItemMaster9].[ItemDescription]'
                        WHEN 'PAK_SiteItemMaster9_ItemDescription DESC' THEN '[PAK_SiteItemMaster9].[ItemDescription] DESC'
                        WHEN 'PAK_SitePkgH10_SupplierRefNo' THEN '[PAK_SitePkgH10].[SupplierRefNo]'
                        WHEN 'PAK_SitePkgH10_SupplierRefNo DESC' THEN '[PAK_SitePkgH10].[SupplierRefNo] DESC'
                        WHEN 'PAK_Units11_Description' THEN '[PAK_Units11].[Description]'
                        WHEN 'PAK_Units11_Description DESC' THEN '[PAK_Units11].[Description] DESC'
                        WHEN 'PAK_Units12_Description' THEN '[PAK_Units12].[Description]'
                        WHEN 'PAK_Units12_Description DESC' THEN '[PAK_Units12].[Description] DESC'
                        WHEN 'VR_MaterialStates13_Description' THEN '[VR_MaterialStates13].[Description]'
                        WHEN 'VR_MaterialStates13_Description DESC' THEN '[VR_MaterialStates13].[Description] DESC'
                        ELSE '[PAK_SitePkgD].[ProjectID],[PAK_SitePkgD].[RecNo],[PAK_SitePkgD].[RecSrNo]'
                    END
  EXEC (@LGSQL)

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
