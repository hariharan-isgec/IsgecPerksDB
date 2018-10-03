USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcm_LG_UnlinkedDocumentsSelectListSearch]
  @Filter_ProjectID NVarChar(6),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  --SELECT [DCM_Documents].[ProjectID], [DCM_Documents].[DocumentID], [DCM_Documents].[RevisionNo] FROM [DCM_Documents] AS A 

    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,DocumentID NVarChar(30) NOT NULL
 ,RevisionNo NVarChar(2) NOT NULL
  )
   
  INSERT INTO #PageIndex (ProjectID, DocumentID, RevisionNo)    
  SELECT A.ProjectID, DocumentID, RevisionNo   
  FROM DCM_Documents AS A 
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects1] ON A.ProjectID = [DCM_Projects1].[ProjectID] 
  WHERE (A.ProjectID = @Filter_ProjectID) 
    AND (TmtlID IS NULL) 
    AND (LOWER(ISNULL(DocumentID,'')) LIKE @KeyWord1 OR LOWER(ISNULL(RevisionNo,'')) LIKE @KeyWord1 OR LOWER(ISNULL(A.Description,'')) LIKE @KeyWord1) 
    AND (RevisionNo = (SELECT MAX(RevisionNo) AS TEMP1 FROM DCM_Documents AS B WHERE ([ProjectID] = [A].[ProjectID]) AND ([DocumentID] = [A].[DocumentID]))) 
  ORDER BY
     CASE @orderBy WHEN 'ProjectID' THEN [A].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [A].[ProjectID] END DESC,
     CASE @orderBy WHEN 'DocumentID' THEN [A].[DocumentID] END,
     CASE @orderBy WHEN 'DocumentID DESC' THEN [A].[DocumentID] END DESC,
     CASE @orderBy WHEN 'RevisionNo' THEN [A].[RevisionNo] END,
     CASE @orderBy WHEN 'RevisionNo DESC' THEN [A].[RevisionNo] END DESC,
     CASE @orderBy WHEN 'Description' THEN [A].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [A].[Description] END DESC,
     CASE @orderBy WHEN 'Locked' THEN [A].[Locked] END,
     CASE @orderBy WHEN 'Locked DESC' THEN [A].[Locked] END DESC,
     CASE @orderBy WHEN 'TmtlID' THEN [A].[TmtlID] END,
     CASE @orderBy WHEN 'TmtlID DESC' THEN [A].[TmtlID] END DESC,
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
