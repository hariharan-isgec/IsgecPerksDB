USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmDocumentsSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,DocumentID NVarChar(30) NOT NULL
 ,RevisionNo NVarChar(2) NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID, DocumentID, RevisionNo)
  SELECT [DCM_Documents].[ProjectID], [DCM_Documents].[DocumentID], [DCM_Documents].[RevisionNo] FROM [DCM_Documents]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects1]
    ON [DCM_Documents].[ProjectID] = [DCM_Projects1].[ProjectID]
 WHERE  
   ( 
         LOWER(ISNULL([DCM_Documents].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Documents].[DocumentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Documents].[RevisionNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Documents].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([DCM_Documents].[TmtlID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Projects1].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Projects1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Projects1].[ProjectCode],'')) LIKE @KeyWord1
   ) 
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
    	INNER JOIN #PageIndex
          ON [DCM_Documents].[ProjectID] = #PageIndex.ProjectID
          AND [DCM_Documents].[DocumentID] = #PageIndex.DocumentID
          AND [DCM_Documents].[RevisionNo] = #PageIndex.RevisionNo
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects1]
    ON [DCM_Documents].[ProjectID] = [DCM_Projects1].[ProjectID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
