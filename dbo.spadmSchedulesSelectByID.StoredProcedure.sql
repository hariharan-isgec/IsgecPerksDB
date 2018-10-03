USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmSchedulesSelectByID]
  @ScheduleID NVarChar(20) 
  AS
  SELECT
		[ADM_Schedules].[ScheduleID],
		[ADM_Schedules].[Description],
		[ADM_Schedules].[FixDate],
		[ADM_Schedules].[DaysOrDate],
		[ADM_Schedules].[IncludeHolidays] 
  FROM [ADM_Schedules] 
  WHERE
  [ADM_Schedules].[ScheduleID] = @ScheduleID
GO
