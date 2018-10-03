USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmSchedulesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ADM_Schedules].[ScheduleID],
		[ADM_Schedules].[Description],
		[ADM_Schedules].[FixDate],
		[ADM_Schedules].[DaysOrDate],
		[ADM_Schedules].[IncludeHolidays] 
  FROM [ADM_Schedules] 
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
GO
