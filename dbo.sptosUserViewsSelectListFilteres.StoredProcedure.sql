USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosUserViewsSelectListFilteres]
  @Filter_UserID NVarChar(8),
  @Filter_ProjectID NVarChar(6),
  @Filter_RootTaskID Int,
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
 ,ProjectID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UserID'
  SET @LGSQL = @LGSQL + ', ProjectID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TOS_UserViews].[UserID]'
  SET @LGSQL = @LGSQL + ', [TOS_UserViews].[ProjectID]'
  SET @LGSQL = @LGSQL + ' FROM [TOS_UserViews] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [TOS_UserViews].[UserID] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects2]'
  SET @LGSQL = @LGSQL + '    ON [TOS_UserViews].[ProjectID] = [IDM_Projects2].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks3]'
  SET @LGSQL = @LGSQL + '    ON [TOS_UserViews].[RootTaskID] = [TOS_Tasks3].[TaskID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_UserID > '') 
    SET @LGSQL = @LGSQL + ' AND [TOS_UserViews].[UserID] = ''' + @Filter_UserID + ''''
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [TOS_UserViews].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_RootTaskID > 0) 
    SET @LGSQL = @LGSQL + ' AND [TOS_UserViews].[RootTaskID] = ' + STR(@Filter_RootTaskID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UserID' THEN '[TOS_UserViews].[UserID]'
                        WHEN 'UserID DESC' THEN '[TOS_UserViews].[UserID] DESC'
                        WHEN 'ProjectID' THEN '[TOS_UserViews].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[TOS_UserViews].[ProjectID] DESC'
                        WHEN 'RootTaskID' THEN '[TOS_UserViews].[RootTaskID]'
                        WHEN 'RootTaskID DESC' THEN '[TOS_UserViews].[RootTaskID] DESC'
                        WHEN 'CLPView' THEN '[TOS_UserViews].[CLPView]'
                        WHEN 'CLPView DESC' THEN '[TOS_UserViews].[CLPView] DESC'
                        WHEN 'TaskView' THEN '[TOS_UserViews].[TaskView]'
                        WHEN 'TaskView DESC' THEN '[TOS_UserViews].[TaskView] DESC'
                        WHEN 'DelayNotification' THEN '[TOS_UserViews].[DelayNotification]'
                        WHEN 'DelayNotification DESC' THEN '[TOS_UserViews].[DelayNotification] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'IDM_Projects2_Description' THEN '[IDM_Projects2].[Description]'
                        WHEN 'IDM_Projects2_Description DESC' THEN '[IDM_Projects2].[Description] DESC'
                        WHEN 'TOS_Tasks3_Description' THEN '[TOS_Tasks3].[Description]'
                        WHEN 'TOS_Tasks3_Description DESC' THEN '[TOS_Tasks3].[Description] DESC'
                        ELSE '[TOS_UserViews].[UserID],[TOS_UserViews].[ProjectID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TOS_UserViews].[UserID] ,
		[TOS_UserViews].[ProjectID] ,
		[TOS_UserViews].[RootTaskID] ,
		[TOS_UserViews].[CLPView] ,
		[TOS_UserViews].[TaskView] ,
		[TOS_UserViews].[DelayNotification] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[IDM_Projects2].[Description] AS IDM_Projects2_Description,
		[TOS_Tasks3].[Description] AS TOS_Tasks3_Description 
  FROM [TOS_UserViews] 
    	INNER JOIN #PageIndex
          ON [TOS_UserViews].[UserID] = #PageIndex.UserID
          AND [TOS_UserViews].[ProjectID] = #PageIndex.ProjectID
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [TOS_UserViews].[UserID] = [aspnet_Users1].[LoginID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [TOS_UserViews].[ProjectID] = [IDM_Projects2].[ProjectID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks3]
    ON [TOS_UserViews].[RootTaskID] = [TOS_Tasks3].[TaskID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
