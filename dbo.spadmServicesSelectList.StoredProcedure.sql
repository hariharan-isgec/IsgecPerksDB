USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmServicesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ADM_Services].[ServiceID],
		[ADM_Services].[Description],
		[ADM_Services].[OfficeID],
		[ADM_Services].[ScheduleID],
		[ADM_Services].[LastSheetDate],
		[HRM_Offices1].[OfficeID] AS HRM_Offices1_OfficeID,
		[HRM_Offices1].[Description] AS HRM_Offices1_Description,
		[ADM_Schedules1].[ScheduleID] AS ADM_Schedules1_ScheduleID,
		[ADM_Schedules1].[Description] AS ADM_Schedules1_Description,
		[ADM_Schedules1].[FixDate] AS ADM_Schedules1_FixDate,
		[ADM_Schedules1].[DaysOrDate] AS ADM_Schedules1_DaysOrDate,
		[ADM_Schedules1].[IncludeHolidays] AS ADM_Schedules1_IncludeHolidays 
  FROM [ADM_Services] 
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices1]
    ON [ADM_Services].[OfficeID] = [HRM_Offices1].[OfficeID]
  INNER JOIN [ADM_Schedules] AS [ADM_Schedules1]
    ON [ADM_Services].[ScheduleID] = [ADM_Schedules1].[ScheduleID]
  ORDER BY
     CASE @orderBy WHEN 'ServiceID' THEN [ADM_Services].[ServiceID] END,
     CASE @orderBy WHEN 'ServiceID DESC' THEN [ADM_Services].[ServiceID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_Services].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_Services].[Description] END DESC,
     CASE @orderBy WHEN 'OfficeID' THEN [ADM_Services].[OfficeID] END,
     CASE @orderBy WHEN 'OfficeID DESC' THEN [ADM_Services].[OfficeID] END DESC,
     CASE @orderBy WHEN 'ScheduleID' THEN [ADM_Services].[ScheduleID] END,
     CASE @orderBy WHEN 'ScheduleID DESC' THEN [ADM_Services].[ScheduleID] END DESC,
     CASE @orderBy WHEN 'LastSheetDate' THEN [ADM_Services].[LastSheetDate] END,
     CASE @orderBy WHEN 'LastSheetDate DESC' THEN [ADM_Services].[LastSheetDate] END DESC,
     CASE @orderBy WHEN 'HRM_Offices1_OfficeID' THEN [HRM_Offices1].[OfficeID] END,
     CASE @orderBy WHEN 'HRM_Offices1_OfficeID DESC' THEN [HRM_Offices1].[OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices1_Description' THEN [HRM_Offices1].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices1_Description DESC' THEN [HRM_Offices1].[Description] END DESC,
     CASE @orderBy WHEN 'ADM_Schedules1_ScheduleID' THEN [ADM_Schedules1].[ScheduleID] END,
     CASE @orderBy WHEN 'ADM_Schedules1_ScheduleID DESC' THEN [ADM_Schedules1].[ScheduleID] END DESC,
     CASE @orderBy WHEN 'ADM_Schedules1_Description' THEN [ADM_Schedules1].[Description] END,
     CASE @orderBy WHEN 'ADM_Schedules1_Description DESC' THEN [ADM_Schedules1].[Description] END DESC,
     CASE @orderBy WHEN 'ADM_Schedules1_FixDate' THEN [ADM_Schedules1].[FixDate] END,
     CASE @orderBy WHEN 'ADM_Schedules1_FixDate DESC' THEN [ADM_Schedules1].[FixDate] END DESC,
     CASE @orderBy WHEN 'ADM_Schedules1_DaysOrDate' THEN [ADM_Schedules1].[DaysOrDate] END,
     CASE @orderBy WHEN 'ADM_Schedules1_DaysOrDate DESC' THEN [ADM_Schedules1].[DaysOrDate] END DESC,
     CASE @orderBy WHEN 'ADM_Schedules1_IncludeHolidays' THEN [ADM_Schedules1].[IncludeHolidays] END,
     CASE @orderBy WHEN 'ADM_Schedules1_IncludeHolidays DESC' THEN [ADM_Schedules1].[IncludeHolidays] END DESC 
  SET @RecordCount = @@RowCount
GO
