USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosUserTasksSelectByID]
  @UserID NVarChar(8),
  @TaskID Int 
  AS
  SELECT
		[TOS_UserTasks].[UserID] ,
		[TOS_UserTasks].[TaskID] ,
		[TOS_UserTasks].[TaskTypeID] ,
		[TOS_UserTasks].[EntryEnabled] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[TOS_Tasks2].[Description] AS TOS_Tasks2_Description,
		[TOS_TaskTypes3].[Description] AS TOS_TaskTypes3_Description 
  FROM [TOS_UserTasks] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [TOS_UserTasks].[UserID] = [aspnet_Users1].[LoginID]
  INNER JOIN [TOS_Tasks] AS [TOS_Tasks2]
    ON [TOS_UserTasks].[TaskID] = [TOS_Tasks2].[TaskID]
  LEFT OUTER JOIN [TOS_TaskTypes] AS [TOS_TaskTypes3]
    ON [TOS_UserTasks].[TaskTypeID] = [TOS_TaskTypes3].[TaskTypeID]
  WHERE
  [TOS_UserTasks].[UserID] = @UserID
  AND [TOS_UserTasks].[TaskID] = @TaskID
GO
