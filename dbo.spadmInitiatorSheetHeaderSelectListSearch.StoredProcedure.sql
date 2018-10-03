USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmInitiatorSheetHeaderSelectListSearch]
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
  LEFT OUTER JOIN [ADM_Schedules] AS [ADM_Schedules1]
    ON [ADM_ServiceSheetHeader].[ScheduleID] = [ADM_Schedules1].[ScheduleID]
  LEFT OUTER JOIN [ADM_Services] AS [ADM_Services2]
    ON [ADM_ServiceSheetHeader].[ServiceID] = [ADM_Services2].[ServiceID]
 WHERE  
   ( 
         STR(ISNULL([ADM_ServiceSheetHeader].[SheetID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetHeader].[ServiceID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetHeader].[ScheduleID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetHeader].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Schedules1].[ScheduleID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Schedules1].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ADM_Schedules1].[DaysOrDate], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Services2].[ServiceID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Services2].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ADM_Services2].[OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Services2].[ScheduleID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'SheetID' THEN [ADM_ServiceSheetHeader].[SheetID] END,
     CASE @orderBy WHEN 'SheetID DESC' THEN [ADM_ServiceSheetHeader].[SheetID] END DESC,
     CASE @orderBy WHEN 'SheetDate' THEN [ADM_ServiceSheetHeader].[SheetDate] END,
     CASE @orderBy WHEN 'SheetDate DESC' THEN [ADM_ServiceSheetHeader].[SheetDate] END DESC,
     CASE @orderBy WHEN 'ServiceID' THEN [ADM_ServiceSheetHeader].[ServiceID] END,
     CASE @orderBy WHEN 'ServiceID DESC' THEN [ADM_ServiceSheetHeader].[ServiceID] END DESC,
     CASE @orderBy WHEN 'ScheduleID' THEN [ADM_ServiceSheetHeader].[ScheduleID] END,
     CASE @orderBy WHEN 'ScheduleID DESC' THEN [ADM_ServiceSheetHeader].[ScheduleID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_ServiceSheetHeader].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_ServiceSheetHeader].[Description] END DESC,
     CASE @orderBy WHEN 'Initiated' THEN [ADM_ServiceSheetHeader].[Initiated] END,
     CASE @orderBy WHEN 'Initiated DESC' THEN [ADM_ServiceSheetHeader].[Initiated] END DESC,
     CASE @orderBy WHEN 'Monitored' THEN [ADM_ServiceSheetHeader].[Monitored] END,
     CASE @orderBy WHEN 'Monitored DESC' THEN [ADM_ServiceSheetHeader].[Monitored] END DESC,
     CASE @orderBy WHEN 'ProblemIdentified' THEN [ADM_ServiceSheetHeader].[ProblemIdentified] END,
     CASE @orderBy WHEN 'ProblemIdentified DESC' THEN [ADM_ServiceSheetHeader].[ProblemIdentified] END DESC,
     CASE @orderBy WHEN 'Closed' THEN [ADM_ServiceSheetHeader].[Closed] END,
     CASE @orderBy WHEN 'Closed DESC' THEN [ADM_ServiceSheetHeader].[Closed] END DESC,
     CASE @orderBy WHEN 'ADM_Schedules1_ScheduleID' THEN [ADM_Schedules1].[ScheduleID] END,
     CASE @orderBy WHEN 'ADM_Schedules1_ScheduleID DESC' THEN [ADM_Schedules1].[ScheduleID] END DESC,
     CASE @orderBy WHEN 'ADM_Schedules1_Description' THEN [ADM_Schedules1].[Description] END,
     CASE @orderBy WHEN 'ADM_Schedules1_Description DESC' THEN [ADM_Schedules1].[Description] END DESC,
     CASE @orderBy WHEN 'ADM_Schedules1_FixDate' THEN [ADM_Schedules1].[FixDate] END,
     CASE @orderBy WHEN 'ADM_Schedules1_FixDate DESC' THEN [ADM_Schedules1].[FixDate] END DESC,
     CASE @orderBy WHEN 'ADM_Schedules1_DaysOrDate' THEN [ADM_Schedules1].[DaysOrDate] END,
     CASE @orderBy WHEN 'ADM_Schedules1_DaysOrDate DESC' THEN [ADM_Schedules1].[DaysOrDate] END DESC,
     CASE @orderBy WHEN 'ADM_Schedules1_IncludeHolidays' THEN [ADM_Schedules1].[IncludeHolidays] END,
     CASE @orderBy WHEN 'ADM_Schedules1_IncludeHolidays DESC' THEN [ADM_Schedules1].[IncludeHolidays] END DESC,
     CASE @orderBy WHEN 'ADM_Services2_ServiceID' THEN [ADM_Services2].[ServiceID] END,
     CASE @orderBy WHEN 'ADM_Services2_ServiceID DESC' THEN [ADM_Services2].[ServiceID] END DESC,
     CASE @orderBy WHEN 'ADM_Services2_Description' THEN [ADM_Services2].[Description] END,
     CASE @orderBy WHEN 'ADM_Services2_Description DESC' THEN [ADM_Services2].[Description] END DESC,
     CASE @orderBy WHEN 'ADM_Services2_OfficeID' THEN [ADM_Services2].[OfficeID] END,
     CASE @orderBy WHEN 'ADM_Services2_OfficeID DESC' THEN [ADM_Services2].[OfficeID] END DESC,
     CASE @orderBy WHEN 'ADM_Services2_ScheduleID' THEN [ADM_Services2].[ScheduleID] END,
     CASE @orderBy WHEN 'ADM_Services2_ScheduleID DESC' THEN [ADM_Services2].[ScheduleID] END DESC,
     CASE @orderBy WHEN 'ADM_Services2_LastSheetDate' THEN [ADM_Services2].[LastSheetDate] END,
     CASE @orderBy WHEN 'ADM_Services2_LastSheetDate DESC' THEN [ADM_Services2].[LastSheetDate] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ADM_ServiceSheetHeader].[SheetID],
		[ADM_ServiceSheetHeader].[SheetDate],
		[ADM_ServiceSheetHeader].[ServiceID],
		[ADM_ServiceSheetHeader].[ScheduleID],
		[ADM_ServiceSheetHeader].[Description],
		[ADM_ServiceSheetHeader].[Initiated],
		[ADM_ServiceSheetHeader].[Monitored],
		[ADM_ServiceSheetHeader].[ProblemIdentified],
		[ADM_ServiceSheetHeader].[Closed],
		[ADM_Schedules1].[ScheduleID] AS ADM_Schedules1_ScheduleID,
		[ADM_Schedules1].[Description] AS ADM_Schedules1_Description,
		[ADM_Schedules1].[FixDate] AS ADM_Schedules1_FixDate,
		[ADM_Schedules1].[DaysOrDate] AS ADM_Schedules1_DaysOrDate,
		[ADM_Schedules1].[IncludeHolidays] AS ADM_Schedules1_IncludeHolidays,
		[ADM_Services2].[ServiceID] AS ADM_Services2_ServiceID,
		[ADM_Services2].[Description] AS ADM_Services2_Description,
		[ADM_Services2].[OfficeID] AS ADM_Services2_OfficeID,
		[ADM_Services2].[ScheduleID] AS ADM_Services2_ScheduleID,
		[ADM_Services2].[LastSheetDate] AS ADM_Services2_LastSheetDate 
  FROM [ADM_ServiceSheetHeader] 
    	INNER JOIN #PageIndex
          ON [ADM_ServiceSheetHeader].[SheetID] = #PageIndex.SheetID
  LEFT OUTER JOIN [ADM_Schedules] AS [ADM_Schedules1]
    ON [ADM_ServiceSheetHeader].[ScheduleID] = [ADM_Schedules1].[ScheduleID]
  LEFT OUTER JOIN [ADM_Services] AS [ADM_Services2]
    ON [ADM_ServiceSheetHeader].[ServiceID] = [ADM_Services2].[ServiceID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
