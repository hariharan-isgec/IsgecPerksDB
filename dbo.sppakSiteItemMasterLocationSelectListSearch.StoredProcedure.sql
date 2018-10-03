USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteItemMasterLocationSelectListSearch]
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
 ,SiteMarkNo NVarChar(30) NOT NULL
 ,LocationID Int NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID, SiteMarkNo, LocationID)
  SELECT [PAK_SiteItemMasterLocation].[ProjectID], [PAK_SiteItemMasterLocation].[SiteMarkNo], [PAK_SiteItemMasterLocation].[LocationID] FROM [PAK_SiteItemMasterLocation]
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
   ( 
         LOWER(ISNULL([PAK_SiteItemMasterLocation].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_SiteItemMasterLocation].[SiteMarkNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SiteItemMasterLocation].[LocationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SiteItemMasterLocation].[UOMQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PAK_SiteItemMasterLocation].[Quantity], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [PAK_SiteItemMasterLocation].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [PAK_SiteItemMasterLocation].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'SiteMarkNo' THEN [PAK_SiteItemMasterLocation].[SiteMarkNo] END,
     CASE @OrderBy WHEN 'SiteMarkNo DESC' THEN [PAK_SiteItemMasterLocation].[SiteMarkNo] END DESC,
     CASE @OrderBy WHEN 'LocationID' THEN [PAK_SiteItemMasterLocation].[LocationID] END,
     CASE @OrderBy WHEN 'LocationID DESC' THEN [PAK_SiteItemMasterLocation].[LocationID] END DESC,
     CASE @OrderBy WHEN 'UOMQuantity' THEN [PAK_SiteItemMasterLocation].[UOMQuantity] END,
     CASE @OrderBy WHEN 'UOMQuantity DESC' THEN [PAK_SiteItemMasterLocation].[UOMQuantity] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [PAK_SiteItemMasterLocation].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [PAK_SiteItemMasterLocation].[Quantity] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects1_Description' THEN [IDM_Projects1].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects1_Description DESC' THEN [IDM_Projects1].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_SiteItemMaster2_ItemDescription' THEN [PAK_SiteItemMaster2].[ItemDescription] END,
     CASE @OrderBy WHEN 'PAK_SiteItemMaster2_ItemDescription DESC' THEN [PAK_SiteItemMaster2].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'PAK_SiteLocations3_Description' THEN [PAK_SiteLocations3].[Description] END,
     CASE @OrderBy WHEN 'PAK_SiteLocations3_Description DESC' THEN [PAK_SiteLocations3].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Units4_Description' THEN [PAK_Units4].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units4_Description DESC' THEN [PAK_Units4].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PAK_SiteItemMasterLocation].* ,
    [IDM_Projects1].[Description] AS IDM_Projects1_Description,
    [PAK_SiteItemMaster2].[ItemDescription] AS PAK_SiteItemMaster2_ItemDescription,
    [PAK_SiteLocations3].[Description] AS PAK_SiteLocations3_Description,
    [PAK_Units4].[Description] AS PAK_Units4_Description 
  FROM [PAK_SiteItemMasterLocation] 
      INNER JOIN #PageIndex
          ON [PAK_SiteItemMasterLocation].[ProjectID] = #PageIndex.ProjectID
          AND [PAK_SiteItemMasterLocation].[SiteMarkNo] = #PageIndex.SiteMarkNo
          AND [PAK_SiteItemMasterLocation].[LocationID] = #PageIndex.LocationID
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
