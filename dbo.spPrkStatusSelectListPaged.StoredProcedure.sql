USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkStatusSelectListPaged]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  StatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (StatusID)
  SELECT [PRK_Status].[StatusID] FROM [PRK_Status]
  ORDER BY
     CASE @orderBy WHEN 'StatusID' THEN [PRK_Status].[StatusID] END,
     CASE @orderBy WHEN 'StatusID DESC' THEN [PRK_Status].[StatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [PRK_Status].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [PRK_Status].[Description] END DESC 

  SET @RecordCount = @@RowCount

  SELECT
		[PRK_Status].[StatusID],
		[PRK_Status].[Description] 
  FROM [PRK_Status] 
    	INNER JOIN #PageIndex
          ON [PRK_Status].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
GO
