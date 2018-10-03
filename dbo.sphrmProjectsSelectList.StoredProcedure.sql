USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmProjectsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[DCM_Projects].[ProjectCode],
		[DCM_Projects].[Description] 
  FROM [DCM_Projects] 
  ORDER BY
     CASE @orderBy WHEN 'ProjectCode' THEN [DCM_Projects].[ProjectCode] END,
     CASE @orderBy WHEN 'ProjectCode DESC' THEN [DCM_Projects].[ProjectCode] END DESC,
     CASE @orderBy WHEN 'Description' THEN [DCM_Projects].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [DCM_Projects].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
