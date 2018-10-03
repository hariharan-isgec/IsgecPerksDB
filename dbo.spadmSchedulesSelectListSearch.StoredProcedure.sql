USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmSchedulesSelectListSearch]
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
 ,ScheduleID NVarChar(20) NOT NULL
  )
  INSERT INTO #PageIndex (ScheduleID)
  SELECT [ADM_Schedules].[ScheduleID] FROM [ADM_Schedules]
 WHERE  
   ( 
         LOWER(ISNULL([ADM_Schedules].[ScheduleID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Schedules].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ADM_Schedules].[DaysOrDate], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'ScheduleID' THEN [ADM_Schedules].[ScheduleID] END,
     CASE @orderBy WHEN 'ScheduleID DESC' THEN [ADM_Schedules].[ScheduleID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_Schedules].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_Schedules].[Description] END DESC,
     CASE @orderBy WHEN 'FixDate' THEN [ADM_Schedules].[FixDate] END,
     CASE @orderBy WHEN 'FixDate DESC' THEN [ADM_Schedules].[FixDate] END DESC,
     CASE @orderBy WHEN 'DaysOrDate' THEN [ADM_Schedules].[DaysOrDate] END,
     CASE @orderBy WHEN 'DaysOrDate DESC' THEN [ADM_Schedules].[DaysOrDate] END DESC,
     CASE @orderBy WHEN 'IncludeHolidays' THEN [ADM_Schedules].[IncludeHolidays] END,
     CASE @orderBy WHEN 'IncludeHolidays DESC' THEN [ADM_Schedules].[IncludeHolidays] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ADM_Schedules].[ScheduleID],
		[ADM_Schedules].[Description],
		[ADM_Schedules].[FixDate],
		[ADM_Schedules].[DaysOrDate],
		[ADM_Schedules].[IncludeHolidays] 
  FROM [ADM_Schedules] 
    	INNER JOIN #PageIndex
          ON [ADM_Schedules].[ScheduleID] = #PageIndex.ScheduleID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
