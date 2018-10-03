USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmDocumentsSelectByProjectID]
  @ProjectID NVarChar(6),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[DCM_Documents].[ProjectID],
		[DCM_Documents].[DocumentID],
		[DCM_Documents].[RevisionNo],
		[DCM_Documents].[Description],
		[DCM_Documents].[Locked],
		[DCM_Documents].[TmtlID],
		[DCM_Projects1].[ProjectID] AS DCM_Projects1_ProjectID,
		[DCM_Projects1].[Description] AS DCM_Projects1_Description,
		[DCM_Projects1].[ProjectCode] AS DCM_Projects1_ProjectCode 
  FROM [DCM_Documents] 
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects1]
    ON [DCM_Documents].[ProjectID] = [DCM_Projects1].[ProjectID]
  WHERE
  [DCM_Documents].[ProjectID] = @ProjectID
  ORDER BY
     CASE @orderBy WHEN 'ProjectID' THEN [DCM_Documents].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [DCM_Documents].[ProjectID] END DESC,
     CASE @orderBy WHEN 'DocumentID' THEN [DCM_Documents].[DocumentID] END,
     CASE @orderBy WHEN 'DocumentID DESC' THEN [DCM_Documents].[DocumentID] END DESC,
     CASE @orderBy WHEN 'RevisionNo' THEN [DCM_Documents].[RevisionNo] END,
     CASE @orderBy WHEN 'RevisionNo DESC' THEN [DCM_Documents].[RevisionNo] END DESC,
     CASE @orderBy WHEN 'Description' THEN [DCM_Documents].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [DCM_Documents].[Description] END DESC,
     CASE @orderBy WHEN 'Locked' THEN [DCM_Documents].[Locked] END,
     CASE @orderBy WHEN 'Locked DESC' THEN [DCM_Documents].[Locked] END DESC,
     CASE @orderBy WHEN 'TmtlID' THEN [DCM_Documents].[TmtlID] END,
     CASE @orderBy WHEN 'TmtlID DESC' THEN [DCM_Documents].[TmtlID] END DESC,
     CASE @orderBy WHEN 'DCM_Projects1_ProjectID' THEN [DCM_Projects1].[ProjectID] END,
     CASE @orderBy WHEN 'DCM_Projects1_ProjectID DESC' THEN [DCM_Projects1].[ProjectID] END DESC,
     CASE @orderBy WHEN 'DCM_Projects1_Description' THEN [DCM_Projects1].[Description] END,
     CASE @orderBy WHEN 'DCM_Projects1_Description DESC' THEN [DCM_Projects1].[Description] END DESC,
     CASE @orderBy WHEN 'DCM_Projects1_ProjectCode' THEN [DCM_Projects1].[ProjectCode] END,
     CASE @orderBy WHEN 'DCM_Projects1_ProjectCode DESC' THEN [DCM_Projects1].[ProjectCode] END DESC 
  SET @RecordCount = @@RowCount
GO
