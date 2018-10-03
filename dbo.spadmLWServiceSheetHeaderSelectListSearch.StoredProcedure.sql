USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmLWServiceSheetHeaderSelectListSearch]
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
 ,SheetID Int NOT NULL
  )
  INSERT INTO #PageIndex (SheetID)
  SELECT [ADM_ServiceSheetHeader].[SheetID] FROM [ADM_ServiceSheetHeader]
 WHERE  
   ( 
         STR(ISNULL([ADM_ServiceSheetHeader].[SheetID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetHeader].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetHeader].[ServiceID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetHeader].[ScheduleID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'SheetID' THEN [ADM_ServiceSheetHeader].[SheetID] END,
     CASE @orderBy WHEN 'SheetID DESC' THEN [ADM_ServiceSheetHeader].[SheetID] END DESC,
     CASE @orderBy WHEN 'SheetDate' THEN [ADM_ServiceSheetHeader].[SheetDate] END,
     CASE @orderBy WHEN 'SheetDate DESC' THEN [ADM_ServiceSheetHeader].[SheetDate] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_ServiceSheetHeader].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_ServiceSheetHeader].[Description] END DESC,
     CASE @orderBy WHEN 'ServiceID' THEN [ADM_ServiceSheetHeader].[ServiceID] END,
     CASE @orderBy WHEN 'ServiceID DESC' THEN [ADM_ServiceSheetHeader].[ServiceID] END DESC,
     CASE @orderBy WHEN 'ScheduleID' THEN [ADM_ServiceSheetHeader].[ScheduleID] END,
     CASE @orderBy WHEN 'ScheduleID DESC' THEN [ADM_ServiceSheetHeader].[ScheduleID] END DESC,
     CASE @orderBy WHEN 'Initiated' THEN [ADM_ServiceSheetHeader].[Initiated] END,
     CASE @orderBy WHEN 'Initiated DESC' THEN [ADM_ServiceSheetHeader].[Initiated] END DESC,
     CASE @orderBy WHEN 'Monitored' THEN [ADM_ServiceSheetHeader].[Monitored] END,
     CASE @orderBy WHEN 'Monitored DESC' THEN [ADM_ServiceSheetHeader].[Monitored] END DESC,
     CASE @orderBy WHEN 'ProblemIdentified' THEN [ADM_ServiceSheetHeader].[ProblemIdentified] END,
     CASE @orderBy WHEN 'ProblemIdentified DESC' THEN [ADM_ServiceSheetHeader].[ProblemIdentified] END DESC,
     CASE @orderBy WHEN 'Closed' THEN [ADM_ServiceSheetHeader].[Closed] END,
     CASE @orderBy WHEN 'Closed DESC' THEN [ADM_ServiceSheetHeader].[Closed] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ADM_ServiceSheetHeader].[SheetID],
		[ADM_ServiceSheetHeader].[SheetDate],
		[ADM_ServiceSheetHeader].[Description],
		[ADM_ServiceSheetHeader].[ServiceID],
		[ADM_ServiceSheetHeader].[ScheduleID],
		[ADM_ServiceSheetHeader].[Initiated],
		[ADM_ServiceSheetHeader].[Monitored],
		[ADM_ServiceSheetHeader].[ProblemIdentified],
		[ADM_ServiceSheetHeader].[Closed] 
  FROM [ADM_ServiceSheetHeader] 
    	INNER JOIN #PageIndex
          ON [ADM_ServiceSheetHeader].[SheetID] = #PageIndex.SheetID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
