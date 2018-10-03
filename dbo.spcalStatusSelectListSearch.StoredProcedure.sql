USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalStatusSelectListSearch]
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
  CallStatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (CallStatusID)
  SELECT [CAL_Status].[CallStatusID] FROM [CAL_Status]
 WHERE  
   ( 
         STR(ISNULL([CAL_Status].[CallStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([CAL_Status].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CallStatusID' THEN [CAL_Status].[CallStatusID] END,
     CASE @orderBy WHEN 'CallStatusID DESC' THEN [CAL_Status].[CallStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [CAL_Status].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [CAL_Status].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[CAL_Status].[CallStatusID],
		[CAL_Status].[Description] 
  FROM [CAL_Status] 
    	INNER JOIN #PageIndex
          ON [CAL_Status].[CallStatusID] = #PageIndex.CallStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
