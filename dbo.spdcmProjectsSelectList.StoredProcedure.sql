USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmProjectsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[DCM_Projects].[ProjectID],
		[DCM_Projects].[Description] 
  FROM [DCM_Projects] 
  ORDER BY
     CASE @orderBy WHEN 'ProjectID' THEN [DCM_Projects].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [DCM_Projects].[ProjectID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [DCM_Projects].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [DCM_Projects].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
