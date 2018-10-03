USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmTmtlStatusSelectListSearch]
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
 ,StatusID NVarChar(1) NOT NULL
  )
  INSERT INTO #PageIndex (StatusID)
  SELECT [DCM_TmtlStatus].[StatusID] FROM [DCM_TmtlStatus]
 WHERE  
   ( 
         LOWER(ISNULL([DCM_TmtlStatus].[StatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_TmtlStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'StatusID' THEN [DCM_TmtlStatus].[StatusID] END,
     CASE @orderBy WHEN 'StatusID DESC' THEN [DCM_TmtlStatus].[StatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [DCM_TmtlStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [DCM_TmtlStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[DCM_TmtlStatus].[StatusID],
		[DCM_TmtlStatus].[Description] 
  FROM [DCM_TmtlStatus] 
    	INNER JOIN #PageIndex
          ON [DCM_TmtlStatus].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
