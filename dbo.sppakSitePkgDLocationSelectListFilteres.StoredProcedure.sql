USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSitePkgDLocationSelectListFilteres]
  @Filter_RecSrNo Int,
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
 ,RecSrLNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', RecNo'
  SET @LGSQL = @LGSQL + ', RecSrNo'
  SET @LGSQL = @LGSQL + ', RecSrLNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_SitePkgDLocation].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [PAK_SitePkgDLocation].[RecNo]'
  SET @LGSQL = @LGSQL + ', [PAK_SitePkgDLocation].[RecSrNo]'
  SET @LGSQL = @LGSQL + ', [PAK_SitePkgDLocation].[RecSrLNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_SitePkgDLocation] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgDLocation].[ProjectID] = [IDM_Projects1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_PkgListD] AS [PAK_PkgListD2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgDLocation].[SerialNo] = [PAK_PkgListD2].[SerialNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SitePkgDLocation].[PkgNo] = [PAK_PkgListD2].[PkgNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SitePkgDLocation].[BOMNo] = [PAK_PkgListD2].[BOMNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SitePkgDLocation].[ItemNo] = [PAK_PkgListD2].[ItemNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_PkgListH] AS [PAK_PkgListH3]'
  --SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgDLocation].[SerialNo] = [PAK_PkgListH3].[SerialNo]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgDLocation].[PkgNo] = [PAK_PkgListH3].[PkgNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_PO] AS [PAK_PO4]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgDLocation].[SerialNo] = [PAK_PO4].[SerialNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_SiteItemMaster] AS [PAK_SiteItemMaster5]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgDLocation].[ProjectID] = [PAK_SiteItemMaster5].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SitePkgDLocation].[SiteMarkNo] = [PAK_SiteItemMaster5].[SiteMarkNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_SiteLocations] AS [PAK_SiteLocations6]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgDLocation].[LocationID] = [PAK_SiteLocations6].[LocationID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_SitePkgD] AS [PAK_SitePkgD7]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgDLocation].[ProjectID] = [PAK_SitePkgD7].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SitePkgDLocation].[RecNo] = [PAK_SitePkgD7].[RecNo]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SitePkgDLocation].[RecSrNo] = [PAK_SitePkgD7].[RecSrNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_SitePkgH] AS [PAK_SitePkgH8]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgDLocation].[ProjectID] = [PAK_SitePkgH8].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SitePkgDLocation].[RecNo] = [PAK_SitePkgH8].[RecNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units9]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SitePkgDLocation].[UOMQuantity] = [PAK_Units9].[UnitID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_RecSrNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_SitePkgDLocation].[RecSrNo] = ' + STR(@Filter_RecSrNo)
  IF (@Filter_RecNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_SitePkgDLocation].[RecNo] = ' + STR(@Filter_RecNo)
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [PAK_SitePkgDLocation].[ProjectID] = ''' + @Filter_ProjectID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[PAK_SitePkgDLocation].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[PAK_SitePkgDLocation].[ProjectID] DESC'
                        WHEN 'RecNo' THEN '[PAK_SitePkgDLocation].[RecNo]'
                        WHEN 'RecNo DESC' THEN '[PAK_SitePkgDLocation].[RecNo] DESC'
                        WHEN 'RecSrNo' THEN '[PAK_SitePkgDLocation].[RecSrNo]'
                        WHEN 'RecSrNo DESC' THEN '[PAK_SitePkgDLocation].[RecSrNo] DESC'
                        WHEN 'RecSrLNo' THEN '[PAK_SitePkgDLocation].[RecSrLNo]'
                        WHEN 'RecSrLNo DESC' THEN '[PAK_SitePkgDLocation].[RecSrLNo] DESC'
                        WHEN 'SerialNo' THEN '[PAK_SitePkgDLocation].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[PAK_SitePkgDLocation].[SerialNo] DESC'
                        WHEN 'PkgNo' THEN '[PAK_SitePkgDLocation].[PkgNo]'
                        WHEN 'PkgNo DESC' THEN '[PAK_SitePkgDLocation].[PkgNo] DESC'
                        WHEN 'BOMNo' THEN '[PAK_SitePkgDLocation].[BOMNo]'
                        WHEN 'BOMNo DESC' THEN '[PAK_SitePkgDLocation].[BOMNo] DESC'
                        WHEN 'ItemNo' THEN '[PAK_SitePkgDLocation].[ItemNo]'
                        WHEN 'ItemNo DESC' THEN '[PAK_SitePkgDLocation].[ItemNo] DESC'
                        WHEN 'SiteMarkNo' THEN '[PAK_SitePkgDLocation].[SiteMarkNo]'
                        WHEN 'SiteMarkNo DESC' THEN '[PAK_SitePkgDLocation].[SiteMarkNo] DESC'
                        WHEN 'LocationID' THEN '[PAK_SitePkgDLocation].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[PAK_SitePkgDLocation].[LocationID] DESC'
                        WHEN 'UOMQuantity' THEN '[PAK_SitePkgDLocation].[UOMQuantity]'
                        WHEN 'UOMQuantity DESC' THEN '[PAK_SitePkgDLocation].[UOMQuantity] DESC'
                        WHEN 'Quantity' THEN '[PAK_SitePkgDLocation].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[PAK_SitePkgDLocation].[Quantity] DESC'
                        WHEN 'Remarks' THEN '[PAK_SitePkgDLocation].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[PAK_SitePkgDLocation].[Remarks] DESC'
                        WHEN 'Support' THEN '[PAK_SitePkgDLocation].[Support]'
                        WHEN 'Support DESC' THEN '[PAK_SitePkgDLocation].[Support] DESC'
                        WHEN 'IDM_Projects1_Description' THEN '[IDM_Projects1].[Description]'
                        WHEN 'IDM_Projects1_Description DESC' THEN '[IDM_Projects1].[Description] DESC'
                        WHEN 'PAK_PkgListD2_PackingMark' THEN '[PAK_PkgListD2].[PackingMark]'
                        WHEN 'PAK_PkgListD2_PackingMark DESC' THEN '[PAK_PkgListD2].[PackingMark] DESC'
                        WHEN 'PAK_PkgListH3_SupplierRefNo' THEN '[PAK_PkgListH3].[SupplierRefNo]'
                        WHEN 'PAK_PkgListH3_SupplierRefNo DESC' THEN '[PAK_PkgListH3].[SupplierRefNo] DESC'
                        WHEN 'PAK_PO4_PODescription' THEN '[PAK_PO4].[PODescription]'
                        WHEN 'PAK_PO4_PODescription DESC' THEN '[PAK_PO4].[PODescription] DESC'
                        WHEN 'PAK_SiteItemMaster5_ItemDescription' THEN '[PAK_SiteItemMaster5].[ItemDescription]'
                        WHEN 'PAK_SiteItemMaster5_ItemDescription DESC' THEN '[PAK_SiteItemMaster5].[ItemDescription] DESC'
                        WHEN 'PAK_SiteLocations6_Description' THEN '[PAK_SiteLocations6].[Description]'
                        WHEN 'PAK_SiteLocations6_Description DESC' THEN '[PAK_SiteLocations6].[Description] DESC'
                        WHEN 'PAK_SitePkgD7_SiteMarkNo' THEN '[PAK_SitePkgD7].[SiteMarkNo]'
                        WHEN 'PAK_SitePkgD7_SiteMarkNo DESC' THEN '[PAK_SitePkgD7].[SiteMarkNo] DESC'
                        WHEN 'PAK_SitePkgH8_SupplierRefNo' THEN '[PAK_SitePkgH8].[SupplierRefNo]'
                        WHEN 'PAK_SitePkgH8_SupplierRefNo DESC' THEN '[PAK_SitePkgH8].[SupplierRefNo] DESC'
                        WHEN 'PAK_Units9_Description' THEN '[PAK_Units9].[Description]'
                        WHEN 'PAK_Units9_Description DESC' THEN '[PAK_Units9].[Description] DESC'
                        ELSE '[PAK_SitePkgDLocation].[ProjectID],[PAK_SitePkgDLocation].[RecNo],[PAK_SitePkgDLocation].[RecSrNo],[PAK_SitePkgDLocation].[RecSrLNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
      INNER JOIN #PageIndex
          ON [PAK_SitePkgDLocation].[ProjectID] = #PageIndex.ProjectID
          AND [PAK_SitePkgDLocation].[RecNo] = #PageIndex.RecNo
          AND [PAK_SitePkgDLocation].[RecSrNo] = #PageIndex.RecSrNo
          AND [PAK_SitePkgDLocation].[RecSrLNo] = #PageIndex.RecSrLNo
  INNER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [PAK_SitePkgDLocation].[ProjectID] = [IDM_Projects1].[ProjectID]
  INNER JOIN [PAK_PkgListD] AS [PAK_PkgListD2]
    ON [PAK_SitePkgDLocation].[SerialNo] = [PAK_PkgListD2].[SerialNo]
    AND [PAK_SitePkgDLocation].[PkgNo] = [PAK_PkgListD2].[PkgNo]
    AND [PAK_SitePkgDLocation].[BOMNo] = [PAK_PkgListD2].[BOMNo]
    AND [PAK_SitePkgDLocation].[ItemNo] = [PAK_PkgListD2].[ItemNo]
  INNER JOIN [PAK_PkgListH] AS [PAK_PkgListH3]
    --ON [PAK_SitePkgDLocation].[SerialNo] = [PAK_PkgListH3].[SerialNo]
    ON [PAK_SitePkgDLocation].[PkgNo] = [PAK_PkgListH3].[PkgNo]
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
