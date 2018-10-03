USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcm_LG_UnlinkedDocumentsSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,DocumentID NVarChar(30) NOT NULL
 ,RevisionNo NVarChar(2) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'  
	SET @LGSQL = @LGSQL + ', DocumentID'  
	SET @LGSQL = @LGSQL + ', RevisionNo'  
	SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '  [A].[ProjectID]'  
	SET @LGSQL = @LGSQL + ', [A].[DocumentID]'  
	SET @LGSQL = @LGSQL + ', [A].[RevisionNo]'  
	SET @LGSQL = @LGSQL + '  FROM [DCM_Documents] AS A'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects1]'
  SET @LGSQL = @LGSQL + '    ON [A].[ProjectID] = [DCM_Projects1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  AND ([A].[TmtlID] IS NULL) '
  SET @LGSQL = @LGSQL + '  AND ([A].[ProjectID] = ''' + @Filter_ProjectID + ''')'
  SET @LGSQL = @LGSQL + '  AND ([A].[RevisionNo] = (SELECT MAX(RevisionNo) AS TEMP1 FROM DCM_DOCUMENTS AS B WHERE (ProjectID = [A].[ProjectID]) AND (DocumentID = [A].[DocumentID])))'
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[A].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[A].[ProjectID] DESC'
                        WHEN 'DocumentID' THEN '[A].[DocumentID]'
                        WHEN 'DocumentID DESC' THEN '[A].[DocumentID] DESC'
                        WHEN 'RevisionNo' THEN '[A].[RevisionNo]'
                        WHEN 'RevisionNo DESC' THEN '[A].[RevisionNo] DESC'
                        WHEN 'Description' THEN '[A].[Description]'
                        WHEN 'Description DESC' THEN '[A].[Description] DESC'
                        WHEN 'Locked' THEN '[A].[Locked]'
                        WHEN 'Locked DESC' THEN '[A].[Locked] DESC'
                        WHEN 'TmtlID' THEN '[A].[TmtlID]'
                        WHEN 'TmtlID DESC' THEN '[A].[TmtlID] DESC'
                        WHEN 'DCM_Projects1_ProjectID' THEN '[DCM_Projects1].[ProjectID]'
                        WHEN 'DCM_Projects1_ProjectID DESC' THEN '[DCM_Projects1].[ProjectID] DESC'
                        WHEN 'DCM_Projects1_Description' THEN '[DCM_Projects1].[Description]'
                        WHEN 'DCM_Projects1_Description DESC' THEN '[DCM_Projects1].[Description] DESC'
                        WHEN 'DCM_Projects1_ProjectCode' THEN '[DCM_Projects1].[ProjectCode]'
                        WHEN 'DCM_Projects1_ProjectCode DESC' THEN '[DCM_Projects1].[ProjectCode] DESC'
                        ELSE '[A].[ProjectID],[A].[DocumentID],[A].[RevisionNo]'
                    END
  EXEC (@LGSQL)

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
