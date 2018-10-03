USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalCallTypesSelectListSearch]
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
  CallTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (CallTypeID)
  SELECT [CAL_CallTypes].[CallTypeID] FROM [CAL_CallTypes]
  LEFT OUTER JOIN [CAL_Priority] AS [CAL_Priority1]
    ON [CAL_CallTypes].[Priority] = [CAL_Priority1].[Priority]
 WHERE  
   ( 
         STR(ISNULL([CAL_CallTypes].[CallTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([CAL_CallTypes].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([CAL_CallTypes].[Priority],'')) LIKE @KeyWord1
     OR STR(ISNULL([CAL_CallTypes].[ResponseTime], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([CAL_Priority1].[Priority],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([CAL_Priority1].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CallTypeID' THEN [CAL_CallTypes].[CallTypeID] END,
     CASE @orderBy WHEN 'CallTypeID DESC' THEN [CAL_CallTypes].[CallTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [CAL_CallTypes].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [CAL_CallTypes].[Description] END DESC,
     CASE @orderBy WHEN 'Priority' THEN [CAL_CallTypes].[Priority] END,
     CASE @orderBy WHEN 'Priority DESC' THEN [CAL_CallTypes].[Priority] END DESC,
     CASE @orderBy WHEN 'ResponseTime' THEN [CAL_CallTypes].[ResponseTime] END,
     CASE @orderBy WHEN 'ResponseTime DESC' THEN [CAL_CallTypes].[ResponseTime] END DESC,
     CASE @orderBy WHEN 'CAL_Priority1_Priority' THEN [CAL_Priority1].[Priority] END,
     CASE @orderBy WHEN 'CAL_Priority1_Priority DESC' THEN [CAL_Priority1].[Priority] END DESC,
     CASE @orderBy WHEN 'CAL_Priority1_Description' THEN [CAL_Priority1].[Description] END,
     CASE @orderBy WHEN 'CAL_Priority1_Description DESC' THEN [CAL_Priority1].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[CAL_CallTypes].[CallTypeID],
		[CAL_CallTypes].[Description],
		[CAL_CallTypes].[Priority],
		[CAL_CallTypes].[ResponseTime],
		[CAL_Priority1].[Priority] AS CAL_Priority1_Priority,
		[CAL_Priority1].[Description] AS CAL_Priority1_Description 
  FROM [CAL_CallTypes] 
    	INNER JOIN #PageIndex
          ON [CAL_CallTypes].[CallTypeID] = #PageIndex.CallTypeID
  LEFT OUTER JOIN [CAL_Priority] AS [CAL_Priority1]
    ON [CAL_CallTypes].[Priority] = [CAL_Priority1].[Priority]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
