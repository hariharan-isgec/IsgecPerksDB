USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSitePkgDLocationSelectListSearch]
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
 ,RecSrLNo Int NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID, RecNo, RecSrNo, RecSrLNo)
  SELECT [PAK_SitePkgDLocation].[ProjectID], [PAK_SitePkgDLocation].[RecNo], [PAK_SitePkgDLocation].[RecSrNo], [PAK_SitePkgDLocation].[RecSrLNo] FROM [PAK_SitePkgDLocation]
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
   ( 
         STR(ISNULL([PAK_SitePkgDLocation].[RecSrLNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgDLocation].[ItemNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_SitePkgDLocation].[SiteMarkNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgDLocation].[LocationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgDLocation].[UOMQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgDLocation].[Quantity], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_SitePkgDLocation].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgDLocation].[RecSrNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgDLocation].[RecNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_SitePkgDLocation].[ProjectID],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgDLocation].[BOMNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgDLocation].[PkgNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SitePkgDLocation].[SerialNo], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [PAK_SitePkgDLocation].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [PAK_SitePkgDLocation].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'RecNo' THEN [PAK_SitePkgDLocation].[RecNo] END,
     CASE @OrderBy WHEN 'RecNo DESC' THEN [PAK_SitePkgDLocation].[RecNo] END DESC,
     CASE @OrderBy WHEN 'RecSrNo' THEN [PAK_SitePkgDLocation].[RecSrNo] END,
     CASE @OrderBy WHEN 'RecSrNo DESC' THEN [PAK_SitePkgDLocation].[RecSrNo] END DESC,
     CASE @OrderBy WHEN 'RecSrLNo' THEN [PAK_SitePkgDLocation].[RecSrLNo] END,
     CASE @OrderBy WHEN 'RecSrLNo DESC' THEN [PAK_SitePkgDLocation].[RecSrLNo] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [PAK_SitePkgDLocation].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [PAK_SitePkgDLocation].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'PkgNo' THEN [PAK_SitePkgDLocation].[PkgNo] END,
     CASE @OrderBy WHEN 'PkgNo DESC' THEN [PAK_SitePkgDLocation].[PkgNo] END DESC,
     CASE @OrderBy WHEN 'BOMNo' THEN [PAK_SitePkgDLocation].[BOMNo] END,
     CASE @OrderBy WHEN 'BOMNo DESC' THEN [PAK_SitePkgDLocation].[BOMNo] END DESC,
     CASE @OrderBy WHEN 'ItemNo' THEN [PAK_SitePkgDLocation].[ItemNo] END,
     CASE @OrderBy WHEN 'ItemNo DESC' THEN [PAK_SitePkgDLocation].[ItemNo] END DESC,
     CASE @OrderBy WHEN 'SiteMarkNo' THEN [PAK_SitePkgDLocation].[SiteMarkNo] END,
     CASE @OrderBy WHEN 'SiteMarkNo DESC' THEN [PAK_SitePkgDLocation].[SiteMarkNo] END DESC,
     CASE @OrderBy WHEN 'LocationID' THEN [PAK_SitePkgDLocation].[LocationID] END,
     CASE @OrderBy WHEN 'LocationID DESC' THEN [PAK_SitePkgDLocation].[LocationID] END DESC,
     CASE @OrderBy WHEN 'UOMQuantity' THEN [PAK_SitePkgDLocation].[UOMQuantity] END,
     CASE @OrderBy WHEN 'UOMQuantity DESC' THEN [PAK_SitePkgDLocation].[UOMQuantity] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [PAK_SitePkgDLocation].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [PAK_SitePkgDLocation].[Quantity] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [PAK_SitePkgDLocation].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [PAK_SitePkgDLocation].[Remarks] END DESC,
     CASE @OrderBy WHEN 'Support' THEN [PAK_SitePkgDLocation].[Support] END,
     CASE @OrderBy WHEN 'Support DESC' THEN [PAK_SitePkgDLocation].[Support] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects1_Description' THEN [IDM_Projects1].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects1_Description DESC' THEN [IDM_Projects1].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_PkgListD2_PackingMark' THEN [PAK_PkgListD2].[PackingMark] END,
     CASE @OrderBy WHEN 'PAK_PkgListD2_PackingMark DESC' THEN [PAK_PkgListD2].[PackingMark] END DESC,
     CASE @OrderBy WHEN 'PAK_PkgListH3_SupplierRefNo' THEN [PAK_PkgListH3].[SupplierRefNo] END,
     CASE @OrderBy WHEN 'PAK_PkgListH3_SupplierRefNo DESC' THEN [PAK_PkgListH3].[SupplierRefNo] END DESC,
     CASE @OrderBy WHEN 'PAK_PO4_PODescription' THEN [PAK_PO4].[PODescription] END,
     CASE @OrderBy WHEN 'PAK_PO4_PODescription DESC' THEN [PAK_PO4].[PODescription] END DESC,
     CASE @OrderBy WHEN 'PAK_SiteItemMaster5_ItemDescription' THEN [PAK_SiteItemMaster5].[ItemDescription] END,
     CASE @OrderBy WHEN 'PAK_SiteItemMaster5_ItemDescription DESC' THEN [PAK_SiteItemMaster5].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'PAK_SiteLocations6_Description' THEN [PAK_SiteLocations6].[Description] END,
     CASE @OrderBy WHEN 'PAK_SiteLocations6_Description DESC' THEN [PAK_SiteLocations6].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_SitePkgD7_SiteMarkNo' THEN [PAK_SitePkgD7].[SiteMarkNo] END,
     CASE @OrderBy WHEN 'PAK_SitePkgD7_SiteMarkNo DESC' THEN [PAK_SitePkgD7].[SiteMarkNo] END DESC,
     CASE @OrderBy WHEN 'PAK_SitePkgH8_SupplierRefNo' THEN [PAK_SitePkgH8].[SupplierRefNo] END,
     CASE @OrderBy WHEN 'PAK_SitePkgH8_SupplierRefNo DESC' THEN [PAK_SitePkgH8].[SupplierRefNo] END DESC,
     CASE @OrderBy WHEN 'PAK_Units9_Description' THEN [PAK_Units9].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units9_Description DESC' THEN [PAK_Units9].[Description] END DESC 

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
