USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApplicationStatusSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  ApplStatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (ApplStatusID)
  SELECT [ATN_ApplicationStatus].[ApplStatusID] FROM [ATN_ApplicationStatus]
 WHERE  
   ( 
         STR(ISNULL([ATN_ApplicationStatus].[ApplStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplicationStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'ApplStatusID' THEN [ATN_ApplicationStatus].[ApplStatusID] END,
     CASE @orderBy WHEN 'ApplStatusID DESC' THEN [ATN_ApplicationStatus].[ApplStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ATN_ApplicationStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ATN_ApplicationStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ATN_ApplicationStatus].[ApplStatusID],
		[ATN_ApplicationStatus].[Description] 
  FROM [ATN_ApplicationStatus] 
    	INNER JOIN #PageIndex
          ON [ATN_ApplicationStatus].[ApplStatusID] = #PageIndex.ApplStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
