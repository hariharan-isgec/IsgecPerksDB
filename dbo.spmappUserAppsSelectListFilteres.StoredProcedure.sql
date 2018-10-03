USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmappUserAppsSelectListFilteres]
  @Filter_AppID Int,
  @Filter_UserID NVarChar(8),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,AppID Int NOT NULL
 ,UserID NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'AppID'
  SET @LGSQL = @LGSQL + ', UserID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[MAPP_UserApps].[AppID]'
  SET @LGSQL = @LGSQL + ', [MAPP_UserApps].[UserID]'
  SET @LGSQL = @LGSQL + ' FROM [MAPP_UserApps] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [MAPP_UserApps].[UserID] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [MAPP_Applications] AS [MAPP_Applications2]'
  SET @LGSQL = @LGSQL + '    ON [MAPP_UserApps].[AppID] = [MAPP_Applications2].[AppID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_AppID > 0) 
    SET @LGSQL = @LGSQL + ' AND [MAPP_UserApps].[AppID] = ' + STR(@Filter_AppID)
  IF (@Filter_UserID > '') 
    SET @LGSQL = @LGSQL + ' AND [MAPP_UserApps].[UserID] = ''' + @Filter_UserID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'AppID' THEN '[MAPP_UserApps].[AppID]'
                        WHEN 'AppID DESC' THEN '[MAPP_UserApps].[AppID] DESC'
                        WHEN 'UserID' THEN '[MAPP_UserApps].[UserID]'
                        WHEN 'UserID DESC' THEN '[MAPP_UserApps].[UserID] DESC'
                        WHEN 'IsActive' THEN '[MAPP_UserApps].[IsActive]'
                        WHEN 'IsActive DESC' THEN '[MAPP_UserApps].[IsActive] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'MAPP_Applications2_ApplicationName' THEN '[MAPP_Applications2].[ApplicationName]'
                        WHEN 'MAPP_Applications2_ApplicationName DESC' THEN '[MAPP_Applications2].[ApplicationName] DESC'
                        ELSE '[MAPP_UserApps].[AppID],[MAPP_UserApps].[UserID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [MAPP_UserApps].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [MAPP_Applications2].[ApplicationName] AS MAPP_Applications2_ApplicationName 
  FROM [MAPP_UserApps] 
      INNER JOIN #PageIndex
          ON [MAPP_UserApps].[AppID] = #PageIndex.AppID
          AND [MAPP_UserApps].[UserID] = #PageIndex.UserID
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [MAPP_UserApps].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [MAPP_Applications] AS [MAPP_Applications2]
    ON [MAPP_UserApps].[AppID] = [MAPP_Applications2].[AppID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
