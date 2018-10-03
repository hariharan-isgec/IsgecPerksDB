USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteLocationTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_SiteLocationTypes].*  
  FROM [PAK_SiteLocationTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'LocationTypeID' THEN [PAK_SiteLocationTypes].[LocationTypeID] END,
     CASE @OrderBy WHEN 'LocationTypeID DESC' THEN [PAK_SiteLocationTypes].[LocationTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_SiteLocationTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_SiteLocationTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
