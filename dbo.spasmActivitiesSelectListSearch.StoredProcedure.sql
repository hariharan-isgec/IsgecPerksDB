USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmActivitiesSelectListSearch]
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
 ,ActivityID NVarChar(20) NOT NULL
  )
  INSERT INTO #PageIndex (ActivityID)
  SELECT [ASM_Activities].[ActivityID] FROM [ASM_Activities]
 WHERE  
   ( 
         LOWER(ISNULL([ASM_Activities].[ActivityID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_Activities].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'ActivityID' THEN [ASM_Activities].[ActivityID] END,
     CASE @orderBy WHEN 'ActivityID DESC' THEN [ASM_Activities].[ActivityID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ASM_Activities].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ASM_Activities].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ASM_Activities].[ActivityID],
		[ASM_Activities].[Description] 
  FROM [ASM_Activities] 
    	INNER JOIN #PageIndex
          ON [ASM_Activities].[ActivityID] = #PageIndex.ActivityID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
