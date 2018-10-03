USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchStatusSelectListSearch]
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
  PunchStatusID NVarChar(2) NOT NULL
  )
  INSERT INTO #PageIndex (PunchStatusID)
  SELECT [ATN_PunchStatus].[PunchStatusID] FROM [ATN_PunchStatus]
 WHERE  
   ( 
         LOWER(ISNULL([ATN_PunchStatus].[PunchStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_PunchStatus].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_PunchStatus].[PunchValue], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'PunchStatusID' THEN [ATN_PunchStatus].[PunchStatusID] END,
     CASE @orderBy WHEN 'PunchStatusID DESC' THEN [ATN_PunchStatus].[PunchStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ATN_PunchStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ATN_PunchStatus].[Description] END DESC,
     CASE @orderBy WHEN 'PunchValue' THEN [ATN_PunchStatus].[PunchValue] END,
     CASE @orderBy WHEN 'PunchValue DESC' THEN [ATN_PunchStatus].[PunchValue] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ATN_PunchStatus].[PunchStatusID],
		[ATN_PunchStatus].[Description],
		[ATN_PunchStatus].[PunchValue] 
  FROM [ATN_PunchStatus] 
    	INNER JOIN #PageIndex
          ON [ATN_PunchStatus].[PunchStatusID] = #PageIndex.PunchStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
