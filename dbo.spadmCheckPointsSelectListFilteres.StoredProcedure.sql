USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmCheckPointsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CheckPointID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CheckPointID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_CheckPoints].[CheckPointID]'
  SET @LGSQL = @LGSQL + ' FROM [ADM_CheckPoints] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [ADM_Schedules] AS [ADM_Schedules1]'
  SET @LGSQL = @LGSQL + '    ON [ADM_CheckPoints].[ScheduleID] = [ADM_Schedules1].[ScheduleID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [ADM_CheckPoints].[Initiator] = [aspnet_Users1].[UserName]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CheckPointID' THEN '[ADM_CheckPoints].[CheckPointID]'
                        WHEN 'CheckPointID DESC' THEN '[ADM_CheckPoints].[CheckPointID] DESC'
                        WHEN 'Descriptions' THEN '[ADM_CheckPoints].[Descriptions]'
                        WHEN 'Descriptions DESC' THEN '[ADM_CheckPoints].[Descriptions] DESC'
                        WHEN 'ScheduleID' THEN '[ADM_CheckPoints].[ScheduleID]'
                        WHEN 'ScheduleID DESC' THEN '[ADM_CheckPoints].[ScheduleID] DESC'
                        WHEN 'StartDate' THEN '[ADM_CheckPoints].[StartDate]'
                        WHEN 'StartDate DESC' THEN '[ADM_CheckPoints].[StartDate] DESC'
                        WHEN 'DayOfSchedule' THEN '[ADM_CheckPoints].[DayOfSchedule]'
                        WHEN 'DayOfSchedule DESC' THEN '[ADM_CheckPoints].[DayOfSchedule] DESC'
                        WHEN 'Floating' THEN '[ADM_CheckPoints].[Floating]'
                        WHEN 'Floating DESC' THEN '[ADM_CheckPoints].[Floating] DESC'
                        WHEN 'LastGeneratedOn' THEN '[ADM_CheckPoints].[LastGeneratedOn]'
                        WHEN 'LastGeneratedOn DESC' THEN '[ADM_CheckPoints].[LastGeneratedOn] DESC'
                        WHEN 'LastEntryUpdated' THEN '[ADM_CheckPoints].[LastEntryUpdated]'
                        WHEN 'LastEntryUpdated DESC' THEN '[ADM_CheckPoints].[LastEntryUpdated] DESC'
                        WHEN 'LastEntryUpdatedOn' THEN '[ADM_CheckPoints].[LastEntryUpdatedOn]'
                        WHEN 'LastEntryUpdatedOn DESC' THEN '[ADM_CheckPoints].[LastEntryUpdatedOn] DESC'
                        WHEN 'Initiator' THEN '[ADM_CheckPoints].[Initiator]'
                        WHEN 'Initiator DESC' THEN '[ADM_CheckPoints].[Initiator] DESC'
                        WHEN 'ADM_Schedules1_Description' THEN '[ADM_Schedules].[Description]'
                        WHEN 'ADM_Schedules1_Description DESC' THEN '[ADM_Schedules1].[Description] DESC'
                        WHEN 'aspnet_users1_UserFullName' THEN '[aspnet_users].[UserFullName]'
                        WHEN 'aspnet_users1_UserFullName DESC' THEN '[aspnet_users1].[UserFullName] DESC'
                        ELSE '[ADM_CheckPoints].[CheckPointID]'
                    END
  EXEC (@LGSQL)

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
