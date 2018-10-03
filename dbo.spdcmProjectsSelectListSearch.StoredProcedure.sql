USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmProjectsSelectListSearch]
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
  )
  INSERT INTO #PageIndex (ProjectID)
  SELECT [DCM_Projects].[ProjectID] FROM [DCM_Projects]
 WHERE  
   ( 
         LOWER(ISNULL([DCM_Projects].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Projects].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'ProjectID' THEN [DCM_Projects].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [DCM_Projects].[ProjectID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [DCM_Projects].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [DCM_Projects].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[DCM_Projects].[ProjectID],
		[DCM_Projects].[Description] 
  FROM [DCM_Projects] 
    	INNER JOIN #PageIndex
          ON [DCM_Projects].[ProjectID] = #PageIndex.ProjectID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
