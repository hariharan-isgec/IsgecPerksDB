USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteLocationsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_SiteLocations].* ,
    [PAK_SiteLocationTypes1].[Description] AS PAK_SiteLocationTypes1_Description 
  FROM [PAK_SiteLocations] 
  INNER JOIN [PAK_SiteLocationTypes] AS [PAK_SiteLocationTypes1]
    ON [PAK_SiteLocations].[LocationTypeID] = [PAK_SiteLocationTypes1].[LocationTypeID]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'LocationID' THEN [PAK_SiteLocations].[LocationID] END,
     CASE @OrderBy WHEN 'LocationID DESC' THEN [PAK_SiteLocations].[LocationID] END DESC,
     CASE @OrderBy WHEN 'LocationTypeID' THEN [PAK_SiteLocations].[LocationTypeID] END,
     CASE @OrderBy WHEN 'LocationTypeID DESC' THEN [PAK_SiteLocations].[LocationTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_SiteLocations].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_SiteLocations].[Description] END DESC,
     CASE @OrderBy WHEN 'GPSLocation' THEN [PAK_SiteLocations].[GPSLocation] END,
     CASE @OrderBy WHEN 'GPSLocation DESC' THEN [PAK_SiteLocations].[GPSLocation] END DESC,
     CASE @OrderBy WHEN 'PAK_SiteLocationTypes1_Description' THEN [PAK_SiteLocationTypes1].[Description] END,
     CASE @OrderBy WHEN 'PAK_SiteLocationTypes1_Description DESC' THEN [PAK_SiteLocationTypes1].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
