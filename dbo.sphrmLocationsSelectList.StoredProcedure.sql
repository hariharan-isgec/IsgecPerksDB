USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmLocationsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [HRM_Locations].*  
  FROM [HRM_Locations] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'LocationID' THEN [HRM_Locations].[LocationID] END,
     CASE @OrderBy WHEN 'LocationID DESC' THEN [HRM_Locations].[LocationID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [HRM_Locations].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [HRM_Locations].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
