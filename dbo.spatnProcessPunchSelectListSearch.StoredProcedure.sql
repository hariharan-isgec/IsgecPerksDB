USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnProcessPunchSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  RecordID Int NOT NULL
  )
  INSERT INTO #PageIndex (RecordID)
  SELECT [ATN_ProcessPunch].[RecordID] FROM [ATN_ProcessPunch]
 WHERE  
      [ATN_ProcessPunch].[FinYear] = @FinYear
   AND ( 
         STR(ISNULL([ATN_ProcessPunch].[RecordID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ProcessPunch].[FinYear],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'RecordID' THEN [ATN_ProcessPunch].[RecordID] END,
     CASE @orderBy WHEN 'RecordID DESC' THEN [ATN_ProcessPunch].[RecordID] END DESC,
     CASE @orderBy WHEN 'ProcessDate' THEN [ATN_ProcessPunch].[ProcessDate] END,
     CASE @orderBy WHEN 'ProcessDate DESC' THEN [ATN_ProcessPunch].[ProcessDate] END DESC,
     CASE @orderBy WHEN 'Processed' THEN [ATN_ProcessPunch].[Processed] END,
     CASE @orderBy WHEN 'Processed DESC' THEN [ATN_ProcessPunch].[Processed] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [ATN_ProcessPunch].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [ATN_ProcessPunch].[FinYear] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ATN_ProcessPunch].[RecordID],
		[ATN_ProcessPunch].[ProcessDate],
		[ATN_ProcessPunch].[Processed],
		[ATN_ProcessPunch].[FinYear] 
  FROM [ATN_ProcessPunch] 
    	INNER JOIN #PageIndex
          ON [ATN_ProcessPunch].[RecordID] = #PageIndex.RecordID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
