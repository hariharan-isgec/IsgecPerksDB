USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnMonthsSelectListSearch]
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
 ,MonthID NVarChar(3) NOT NULL
  )
  INSERT INTO #PageIndex (MonthID)
  SELECT [ATN_Months].[MonthID] FROM [ATN_Months]
 WHERE  
   ( 
         LOWER(ISNULL([ATN_Months].[MonthID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Months].[ShortName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Months].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'MonthID' THEN [ATN_Months].[MonthID] END,
     CASE @orderBy WHEN 'MonthID DESC' THEN [ATN_Months].[MonthID] END DESC,
     CASE @orderBy WHEN 'ShortName' THEN [ATN_Months].[ShortName] END,
     CASE @orderBy WHEN 'ShortName DESC' THEN [ATN_Months].[ShortName] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ATN_Months].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ATN_Months].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ATN_Months].[MonthID],
		[ATN_Months].[ShortName],
		[ATN_Months].[Description] 
  FROM [ATN_Months] 
    	INNER JOIN #PageIndex
          ON [ATN_Months].[MonthID] = #PageIndex.MonthID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
