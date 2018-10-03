USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmServicesSelectByID]
  @ServiceID NVarChar(10) 
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
  WHERE
  [ADM_Services].[ServiceID] = @ServiceID
GO
