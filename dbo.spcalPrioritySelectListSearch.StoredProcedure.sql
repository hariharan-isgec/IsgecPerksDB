USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalPrioritySelectListSearch]
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
  Priority NVarChar(1) NOT NULL
  )
  INSERT INTO #PageIndex (Priority)
  SELECT [CAL_Priority].[Priority] FROM [CAL_Priority]
 WHERE  
   ( 
         LOWER(ISNULL([CAL_Priority].[Priority],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([CAL_Priority].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'Priority' THEN [CAL_Priority].[Priority] END,
     CASE @orderBy WHEN 'Priority DESC' THEN [CAL_Priority].[Priority] END DESC,
     CASE @orderBy WHEN 'Description' THEN [CAL_Priority].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [CAL_Priority].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[CAL_Priority].[Priority],
		[CAL_Priority].[Description] 
  FROM [CAL_Priority] 
    	INNER JOIN #PageIndex
          ON [CAL_Priority].[Priority] = #PageIndex.Priority
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
