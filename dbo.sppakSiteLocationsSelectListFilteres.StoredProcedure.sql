USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteLocationsSelectListFilteres]
  @Filter_LocationTypeID Int,
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
 ,LocationID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'LocationID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_SiteLocations].[LocationID]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_SiteLocations] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [PAK_SiteLocationTypes] AS [PAK_SiteLocationTypes1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteLocations].[LocationTypeID] = [PAK_SiteLocationTypes1].[LocationTypeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_LocationTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_SiteLocations].[LocationTypeID] = ' + STR(@Filter_LocationTypeID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'LocationID' THEN '[PAK_SiteLocations].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[PAK_SiteLocations].[LocationID] DESC'
                        WHEN 'LocationTypeID' THEN '[PAK_SiteLocations].[LocationTypeID]'
                        WHEN 'LocationTypeID DESC' THEN '[PAK_SiteLocations].[LocationTypeID] DESC'
                        WHEN 'Description' THEN '[PAK_SiteLocations].[Description]'
                        WHEN 'Description DESC' THEN '[PAK_SiteLocations].[Description] DESC'
                        WHEN 'GPSLocation' THEN '[PAK_SiteLocations].[GPSLocation]'
                        WHEN 'GPSLocation DESC' THEN '[PAK_SiteLocations].[GPSLocation] DESC'
                        WHEN 'PAK_SiteLocationTypes1_Description' THEN '[PAK_SiteLocationTypes1].[Description]'
                        WHEN 'PAK_SiteLocationTypes1_Description DESC' THEN '[PAK_SiteLocationTypes1].[Description] DESC'
                        ELSE '[PAK_SiteLocations].[LocationID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_SiteLocations].* ,
    [PAK_SiteLocationTypes1].[Description] AS PAK_SiteLocationTypes1_Description 
  FROM [PAK_SiteLocations] 
      INNER JOIN #PageIndex
          ON [PAK_SiteLocations].[LocationID] = #PageIndex.LocationID
  INNER JOIN [PAK_SiteLocationTypes] AS [PAK_SiteLocationTypes1]
    ON [PAK_SiteLocations].[LocationTypeID] = [PAK_SiteLocationTypes1].[LocationTypeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
