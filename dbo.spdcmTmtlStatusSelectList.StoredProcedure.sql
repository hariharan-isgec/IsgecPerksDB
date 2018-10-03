USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmTmtlStatusSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[DCM_TmtlStatus].[StatusID],
		[DCM_TmtlStatus].[Description] 
  FROM [DCM_TmtlStatus] 
  ORDER BY
     CASE @orderBy WHEN 'StatusID' THEN [DCM_TmtlStatus].[StatusID] END,
     CASE @orderBy WHEN 'StatusID DESC' THEN [DCM_TmtlStatus].[StatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [DCM_TmtlStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [DCM_TmtlStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
