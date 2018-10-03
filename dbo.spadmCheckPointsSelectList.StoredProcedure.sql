USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmCheckPointsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ADM_CheckPoints].[CheckPointID] ,
		[ADM_CheckPoints].[Descriptions] ,
		[ADM_CheckPoints].[ScheduleID] ,
		[ADM_CheckPoints].[StartDate] ,
		[ADM_CheckPoints].[DayOfSchedule] ,
		[ADM_CheckPoints].[Floating] ,
		[ADM_CheckPoints].[LastGeneratedOn] ,
		[ADM_CheckPoints].[LastEntryUpdated] ,
		[ADM_CheckPoints].[LastEntryUpdatedOn] ,
		[ADM_CheckPoints].[Initiator] ,
		[ADM_Schedules1].[Description] AS ADM_Schedules1_Description,
		[aspnet_users1].[UserFullName] AS aspnet_users1_UserFullName 
  FROM [ADM_CheckPoints] 
  INNER JOIN [ADM_Schedules] AS [ADM_Schedules1]
    ON [ADM_CheckPoints].[ScheduleID] = [ADM_Schedules1].[ScheduleID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [ADM_CheckPoints].[Initiator] = [aspnet_Users1].[UserName]
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'CheckPointID' THEN [ADM_CheckPoints].[CheckPointID] END,
     CASE @orderBy WHEN 'CheckPointID DESC' THEN [ADM_CheckPoints].[CheckPointID] END DESC,
     CASE @orderBy WHEN 'Descriptions' THEN [ADM_CheckPoints].[Descriptions] END,
     CASE @orderBy WHEN 'Descriptions DESC' THEN [ADM_CheckPoints].[Descriptions] END DESC,
     CASE @orderBy WHEN 'ScheduleID' THEN [ADM_CheckPoints].[ScheduleID] END,
     CASE @orderBy WHEN 'ScheduleID DESC' THEN [ADM_CheckPoints].[ScheduleID] END DESC,
     CASE @orderBy WHEN 'StartDate' THEN [ADM_CheckPoints].[StartDate] END,
     CASE @orderBy WHEN 'StartDate DESC' THEN [ADM_CheckPoints].[StartDate] END DESC,
     CASE @orderBy WHEN 'DayOfSchedule' THEN [ADM_CheckPoints].[DayOfSchedule] END,
     CASE @orderBy WHEN 'DayOfSchedule DESC' THEN [ADM_CheckPoints].[DayOfSchedule] END DESC,
     CASE @orderBy WHEN 'Floating' THEN [ADM_CheckPoints].[Floating] END,
     CASE @orderBy WHEN 'Floating DESC' THEN [ADM_CheckPoints].[Floating] END DESC,
     CASE @orderBy WHEN 'LastGeneratedOn' THEN [ADM_CheckPoints].[LastGeneratedOn] END,
     CASE @orderBy WHEN 'LastGeneratedOn DESC' THEN [ADM_CheckPoints].[LastGeneratedOn] END DESC,
     CASE @orderBy WHEN 'LastEntryUpdated' THEN [ADM_CheckPoints].[LastEntryUpdated] END,
     CASE @orderBy WHEN 'LastEntryUpdated DESC' THEN [ADM_CheckPoints].[LastEntryUpdated] END DESC,
     CASE @orderBy WHEN 'LastEntryUpdatedOn' THEN [ADM_CheckPoints].[LastEntryUpdatedOn] END,
     CASE @orderBy WHEN 'LastEntryUpdatedOn DESC' THEN [ADM_CheckPoints].[LastEntryUpdatedOn] END DESC,
     CASE @orderBy WHEN 'Initiator' THEN [ADM_CheckPoints].[Initiator] END,
     CASE @orderBy WHEN 'Initiator DESC' THEN [ADM_CheckPoints].[Initiator] END DESC,
     CASE @orderBy WHEN 'ADM_Schedules1_Description' THEN [ADM_Schedules1].[Description] END,
     CASE @orderBy WHEN 'ADM_Schedules1_Description DESC' THEN [ADM_Schedules1].[Description] END DESC,
     CASE @orderBy WHEN 'aspnet_users1_UserFullName' THEN [aspnet_users1].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_users1_UserFullName DESC' THEN [aspnet_users1].[UserFullName] END DESC 
  SET @RecordCount = @@RowCount
GO
