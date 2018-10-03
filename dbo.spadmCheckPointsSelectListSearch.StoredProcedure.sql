USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmCheckPointsSelectListSearch]
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
 ,CheckPointID Int NOT NULL
  )
  INSERT INTO #PageIndex (CheckPointID)
  SELECT [ADM_CheckPoints].[CheckPointID] FROM [ADM_CheckPoints]
  INNER JOIN [ADM_Schedules] AS [ADM_Schedules1]
    ON [ADM_CheckPoints].[ScheduleID] = [ADM_Schedules1].[ScheduleID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [ADM_CheckPoints].[Initiator] = [aspnet_Users1].[UserName]
 WHERE  
   ( 
         STR(ISNULL([ADM_CheckPoints].[CheckPointID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_CheckPoints].[Descriptions],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_CheckPoints].[ScheduleID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ADM_CheckPoints].[DayOfSchedule], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_CheckPoints].[Initiator],'')) LIKE @KeyWord1
   ) 
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
    	INNER JOIN #PageIndex
          ON [ADM_CheckPoints].[CheckPointID] = #PageIndex.CheckPointID
  INNER JOIN [ADM_Schedules] AS [ADM_Schedules1]
    ON [ADM_CheckPoints].[ScheduleID] = [ADM_Schedules1].[ScheduleID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [ADM_CheckPoints].[Initiator] = [aspnet_Users1].[UserName]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
