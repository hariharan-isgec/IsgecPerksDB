USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosUserTasksSelectListFilteres]
  @Filter_UserID NVarChar(8),
  @Filter_TaskID Int,
  @Filter_TaskTypeID NVarChar(2),
  @StartRowIndex int,
  @MaximumRows int,
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
  IF (@Filter_UserID > '') 
    SET @LGSQL = @LGSQL + ' AND [TOS_UserTasks].[UserID] = ''' + @Filter_UserID + ''''
  IF (@Filter_TaskID > 0) 
    SET @LGSQL = @LGSQL + ' AND [TOS_UserTasks].[TaskID] = ' + STR(@Filter_TaskID)
  IF (@Filter_TaskTypeID > '') 
    SET @LGSQL = @LGSQL + ' AND [TOS_UserTasks].[TaskTypeID] = ''' + @Filter_TaskTypeID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UserID' THEN '[TOS_UserTasks].[UserID]'
                        WHEN 'UserID DESC' THEN '[TOS_UserTasks].[UserID] DESC'
                        WHEN 'TaskID' THEN '[TOS_UserTasks].[TaskID]'
                        WHEN 'TaskID DESC' THEN '[TOS_UserTasks].[TaskID] DESC'
                        WHEN 'TaskTypeID' THEN '[TOS_UserTasks].[TaskTypeID]'
                        WHEN 'TaskTypeID DESC' THEN '[TOS_UserTasks].[TaskTypeID] DESC'
                        WHEN 'EntryEnabled' THEN '[TOS_UserTasks].[EntryEnabled]'
                        WHEN 'EntryEnabled DESC' THEN '[TOS_UserTasks].[EntryEnabled] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'TOS_Tasks2_Description' THEN '[TOS_Tasks].[Description]'
                        WHEN 'TOS_Tasks2_Description DESC' THEN '[TOS_Tasks2].[Description] DESC'
                        WHEN 'TOS_TaskTypes3_Description' THEN '[TOS_TaskTypes].[Description]'
                        WHEN 'TOS_TaskTypes3_Description DESC' THEN '[TOS_TaskTypes3].[Description] DESC'
                        ELSE '[TOS_UserTasks].[UserID],[TOS_UserTasks].[TaskID]'
                    END
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
