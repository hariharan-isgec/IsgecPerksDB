USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteItemMasterLocationSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
  @Filter_SiteMarkNo NVarChar(30),
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
 ,SiteMarkNo NVarChar(30) NOT NULL
 ,LocationID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', SiteMarkNo'
  SET @LGSQL = @LGSQL + ', LocationID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_SiteItemMasterLocation].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [PAK_SiteItemMasterLocation].[SiteMarkNo]'
  SET @LGSQL = @LGSQL + ', [PAK_SiteItemMasterLocation].[LocationID]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_SiteItemMasterLocation] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteItemMasterLocation].[ProjectID] = [IDM_Projects1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_SiteItemMaster] AS [PAK_SiteItemMaster2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteItemMasterLocation].[ProjectID] = [PAK_SiteItemMaster2].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [PAK_SiteItemMasterLocation].[SiteMarkNo] = [PAK_SiteItemMaster2].[SiteMarkNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_SiteLocations] AS [PAK_SiteLocations3]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteItemMasterLocation].[LocationID] = [PAK_SiteLocations3].[LocationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units4]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteItemMasterLocation].[UOMQuantity] = [PAK_Units4].[UnitID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [PAK_SiteItemMasterLocation].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_SiteMarkNo > '') 
    SET @LGSQL = @LGSQL + ' AND [PAK_SiteItemMasterLocation].[SiteMarkNo] = ''' + @Filter_SiteMarkNo + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[PAK_SiteItemMasterLocation].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[PAK_SiteItemMasterLocation].[ProjectID] DESC'
                        WHEN 'SiteMarkNo' THEN '[PAK_SiteItemMasterLocation].[SiteMarkNo]'
                        WHEN 'SiteMarkNo DESC' THEN '[PAK_SiteItemMasterLocation].[SiteMarkNo] DESC'
                        WHEN 'LocationID' THEN '[PAK_SiteItemMasterLocation].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[PAK_SiteItemMasterLocation].[LocationID] DESC'
                        WHEN 'UOMQuantity' THEN '[PAK_SiteItemMasterLocation].[UOMQuantity]'
                        WHEN 'UOMQuantity DESC' THEN '[PAK_SiteItemMasterLocation].[UOMQuantity] DESC'
                        WHEN 'Quantity' THEN '[PAK_SiteItemMasterLocation].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[PAK_SiteItemMasterLocation].[Quantity] DESC'
                        WHEN 'IDM_Projects1_Description' THEN '[IDM_Projects1].[Description]'
                        WHEN 'IDM_Projects1_Description DESC' THEN '[IDM_Projects1].[Description] DESC'
                        WHEN 'PAK_SiteItemMaster2_ItemDescription' THEN '[PAK_SiteItemMaster2].[ItemDescription]'
                        WHEN 'PAK_SiteItemMaster2_ItemDescription DESC' THEN '[PAK_SiteItemMaster2].[ItemDescription] DESC'
                        WHEN 'PAK_SiteLocations3_Description' THEN '[PAK_SiteLocations3].[Description]'
                        WHEN 'PAK_SiteLocations3_Description DESC' THEN '[PAK_SiteLocations3].[Description] DESC'
                        WHEN 'PAK_Units4_Description' THEN '[PAK_Units4].[Description]'
                        WHEN 'PAK_Units4_Description DESC' THEN '[PAK_Units4].[Description] DESC'
                        ELSE '[PAK_SiteItemMasterLocation].[ProjectID],[PAK_SiteItemMasterLocation].[SiteMarkNo],[PAK_SiteItemMasterLocation].[LocationID]'
                    END
  EXEC (@LGSQL)

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
