USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptos_LG_MyTasksSelectListByUserProject]
  @StartRowIndex int,
  @MaximumRows int,
  @UserID NVarChar(8),
  @ProjectID NVarChar(6),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,UserID NVarChar(8) NOT NULL
 ,TaskID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UserID'
  SET @LGSQL = @LGSQL + ', TaskID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TOS_UserTasks].[UserID]'
  SET @LGSQL = @LGSQL + ', [TOS_UserTasks].[TaskID]'
  SET @LGSQL = @LGSQL + ' FROM [TOS_UserTasks] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [TOS_UserTasks].[UserID] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TOS_Tasks] AS [TOS_Tasks2]'
  SET @LGSQL = @LGSQL + '    ON [TOS_UserTasks].[TaskID] = [TOS_Tasks2].[TaskID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_TaskTypes] AS [TOS_TaskTypes3]'
  SET @LGSQL = @LGSQL + '    ON [TOS_UserTasks].[TaskTypeID] = [TOS_TaskTypes3].[TaskTypeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  AND [TOS_UserTasks].[UserID] = (''' + @UserID + ''')'
  SET @LGSQL = @LGSQL + '  AND [TOS_Tasks2].[ProjectID] = (''' + @ProjectID + ''')'
  SET @LGSQL = @LGSQL + '  ORDER BY [TOS_UserTasks].[TaskTypeID] '

  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TOS_UserTasks].[UserID] ,
		[TOS_UserTasks].[TaskID] ,
		[TOS_UserTasks].[TaskTypeID] ,
		[TOS_UserTasks].[EntryEnabled] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[TOS_Tasks2].[Description] AS TOS_Tasks2_Description,
		[TOS_TaskTypes3].[Description] AS TOS_TaskTypes3_Description 
  FROM [TOS_UserTasks] 
    	INNER JOIN #PageIndex
          ON [TOS_UserTasks].[UserID] = #PageIndex.UserID
          AND [TOS_UserTasks].[TaskID] = #PageIndex.TaskID
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [TOS_UserTasks].[UserID] = [aspnet_Users1].[LoginID]
  INNER JOIN [TOS_Tasks] AS [TOS_Tasks2]
    ON [TOS_UserTasks].[TaskID] = [TOS_Tasks2].[TaskID]
  LEFT OUTER JOIN [TOS_TaskTypes] AS [TOS_TaskTypes3]
    ON [TOS_UserTasks].[TaskTypeID] = [TOS_TaskTypes3].[TaskTypeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
