USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmMonitorSheetHeaderSelectByID]
  @SheetID Int 
  AS
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
  LEFT OUTER JOIN [ADM_Schedules] AS [ADM_Schedules1]
    ON [ADM_ServiceSheetHeader].[ScheduleID] = [ADM_Schedules1].[ScheduleID]
  LEFT OUTER JOIN [ADM_Services] AS [ADM_Services2]
    ON [ADM_ServiceSheetHeader].[ServiceID] = [ADM_Services2].[ServiceID]
  WHERE
  [ADM_ServiceSheetHeader].[SheetID] = @SheetID
GO
