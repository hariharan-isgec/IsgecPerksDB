USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijtProjectsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[IDM_Projects].[ProjectID],
		[IDM_Projects].[Description] 
  FROM [IDM_Projects] 
  ORDER BY
     CASE @orderBy WHEN 'ProjectID' THEN [IDM_Projects].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [IDM_Projects].[ProjectID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_Projects].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_Projects].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
