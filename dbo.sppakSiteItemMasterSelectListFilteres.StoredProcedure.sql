USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteItemMasterSelectListFilteres]
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
 ,SiteMarkNo NVarChar(30) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', SiteMarkNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_SiteItemMaster].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [PAK_SiteItemMaster].[SiteMarkNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_SiteItemMaster] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteItemMaster].[ProjectID] = [IDM_Projects1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteItemMaster].[UOMQuantity] = [PAK_Units2].[UnitID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [PAK_SiteItemMaster].[ProjectID] = ''' + @Filter_ProjectID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[PAK_SiteItemMaster].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[PAK_SiteItemMaster].[ProjectID] DESC'
                        WHEN 'SiteMarkNo' THEN '[PAK_SiteItemMaster].[SiteMarkNo]'
                        WHEN 'SiteMarkNo DESC' THEN '[PAK_SiteItemMaster].[SiteMarkNo] DESC'
                        WHEN 'ItemDescription' THEN '[PAK_SiteItemMaster].[ItemDescription]'
                        WHEN 'ItemDescription DESC' THEN '[PAK_SiteItemMaster].[ItemDescription] DESC'
                        WHEN 'UOMQuantity' THEN '[PAK_SiteItemMaster].[UOMQuantity]'
                        WHEN 'UOMQuantity DESC' THEN '[PAK_SiteItemMaster].[UOMQuantity] DESC'
                        WHEN 'Quantity' THEN '[PAK_SiteItemMaster].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[PAK_SiteItemMaster].[Quantity] DESC'
                        WHEN 'IDM_Projects1_Description' THEN '[IDM_Projects1].[Description]'
                        WHEN 'IDM_Projects1_Description DESC' THEN '[IDM_Projects1].[Description] DESC'
                        WHEN 'PAK_Units2_Description' THEN '[PAK_Units2].[Description]'
                        WHEN 'PAK_Units2_Description DESC' THEN '[PAK_Units2].[Description] DESC'
                        ELSE '[PAK_SiteItemMaster].[ProjectID],[PAK_SiteItemMaster].[SiteMarkNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_SiteItemMaster].* ,
    [IDM_Projects1].[Description] AS IDM_Projects1_Description,
    [PAK_Units2].[Description] AS PAK_Units2_Description 
  FROM [PAK_SiteItemMaster] 
      INNER JOIN #PageIndex
          ON [PAK_SiteItemMaster].[ProjectID] = #PageIndex.ProjectID
          AND [PAK_SiteItemMaster].[SiteMarkNo] = #PageIndex.SiteMarkNo
  INNER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [PAK_SiteItemMaster].[ProjectID] = [IDM_Projects1].[ProjectID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units2]
    ON [PAK_SiteItemMaster].[UOMQuantity] = [PAK_Units2].[UnitID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
