USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmCheckPointsSelectByID]
  @CheckPointID Int 
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
  WHERE
  [ADM_CheckPoints].[CheckPointID] = @CheckPointID
GO
