USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfUserDashboardsSelectListFilteres]
  @Filter_UserID NVarChar(8),
  @Filter_DashboardID Int,
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
 ,UserID NVarChar(8) NOT NULL
 ,DashboardID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UserID'
  SET @LGSQL = @LGSQL + ', DashboardID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[WF_UserDashboards].[UserID]'
  SET @LGSQL = @LGSQL + ', [WF_UserDashboards].[DashboardID]'
  SET @LGSQL = @LGSQL + ' FROM [WF_UserDashboards] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [WF_UserDashboards].[UserID] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [WF_Dashboards] AS [WF_Dashboards2]'
  SET @LGSQL = @LGSQL + '    ON [WF_UserDashboards].[DashboardID] = [WF_Dashboards2].[DashboardID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_UserID > '') 
    SET @LGSQL = @LGSQL + ' AND [WF_UserDashboards].[UserID] = ''' + @Filter_UserID + ''''
  IF (@Filter_DashboardID > 0) 
    SET @LGSQL = @LGSQL + ' AND [WF_UserDashboards].[DashboardID] = ' + STR(@Filter_DashboardID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UserID' THEN '[WF_UserDashboards].[UserID]'
                        WHEN 'UserID DESC' THEN '[WF_UserDashboards].[UserID] DESC'
                        WHEN 'DashboardID' THEN '[WF_UserDashboards].[DashboardID]'
                        WHEN 'DashboardID DESC' THEN '[WF_UserDashboards].[DashboardID] DESC'
                        WHEN 'Active' THEN '[WF_UserDashboards].[Active]'
                        WHEN 'Active DESC' THEN '[WF_UserDashboards].[Active] DESC'
                        WHEN 'ActionAllowed' THEN '[WF_UserDashboards].[ActionAllowed]'
                        WHEN 'ActionAllowed DESC' THEN '[WF_UserDashboards].[ActionAllowed] DESC'
                        WHEN 'UpdateAllowed' THEN '[WF_UserDashboards].[UpdateAllowed]'
                        WHEN 'UpdateAllowed DESC' THEN '[WF_UserDashboards].[UpdateAllowed] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'WF_Dashboards2_DBDescription' THEN '[WF_Dashboards2].[DBDescription]'
                        WHEN 'WF_Dashboards2_DBDescription DESC' THEN '[WF_Dashboards2].[DBDescription] DESC'
                        ELSE '[WF_UserDashboards].[UserID],[WF_UserDashboards].[DashboardID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [WF_UserDashboards].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [WF_Dashboards2].[DBDescription] AS WF_Dashboards2_DBDescription 
  FROM [WF_UserDashboards] 
      INNER JOIN #PageIndex
          ON [WF_UserDashboards].[UserID] = #PageIndex.UserID
          AND [WF_UserDashboards].[DashboardID] = #PageIndex.DashboardID
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [WF_UserDashboards].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [WF_Dashboards] AS [WF_Dashboards2]
    ON [WF_UserDashboards].[DashboardID] = [WF_Dashboards2].[DashboardID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
