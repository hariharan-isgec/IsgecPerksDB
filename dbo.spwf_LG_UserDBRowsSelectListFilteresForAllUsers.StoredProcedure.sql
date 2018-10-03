USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwf_LG_UserDBRowsSelectListFilteresForAllUsers]
  @Filter_DBRowID Int,
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
 ,DBRows Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UserID'
  SET @LGSQL = @LGSQL + ', DashboardID'
  SET @LGSQL = @LGSQL + ', DBRows'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[WF_UserDBRows].[UserID]'
  SET @LGSQL = @LGSQL + ', [WF_UserDBRows].[DashboardID]'
  SET @LGSQL = @LGSQL + ', [WF_UserDBRows].[DBRows]'
  SET @LGSQL = @LGSQL + ' FROM [WF_UserDBRows] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [WF_UserDBRows].[UserID] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [WF_DBRows] AS [WF_DBRows2]'
  SET @LGSQL = @LGSQL + '    ON [WF_UserDBRows].[DashboardID] = [WF_DBRows2].[DashboardID]'
  SET @LGSQL = @LGSQL + '    AND [WF_UserDBRows].[DBRows] = [WF_DBRows2].[DBRows]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [WF_UserDashboards] AS [WF_UserDashboards3]'
  SET @LGSQL = @LGSQL + '    ON [WF_UserDBRows].[UserID] = [WF_UserDashboards3].[UserID]'
  SET @LGSQL = @LGSQL + '    AND [WF_UserDBRows].[DashboardID] = [WF_UserDashboards3].[DashboardID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_DBRowID > 0) 
    SET @LGSQL = @LGSQL + ' AND [WF_UserDBRows].[DBRows] = ' + STR(@Filter_DBRowID) 
  IF (@Filter_DashboardID > 0) 
    SET @LGSQL = @LGSQL + ' AND [WF_UserDBRows].[DashboardID] = ' + STR(@Filter_DashboardID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UserID' THEN '[WF_UserDBRows].[UserID]'
                        WHEN 'UserID DESC' THEN '[WF_UserDBRows].[UserID] DESC'
                        WHEN 'DashboardID' THEN '[WF_UserDBRows].[DashboardID]'
                        WHEN 'DashboardID DESC' THEN '[WF_UserDBRows].[DashboardID] DESC'
                        WHEN 'DBRows' THEN '[WF_UserDBRows].[DBRows]'
                        WHEN 'DBRows DESC' THEN '[WF_UserDBRows].[DBRows] DESC'
                        WHEN 'Active' THEN '[WF_UserDBRows].[Active]'
                        WHEN 'Active DESC' THEN '[WF_UserDBRows].[Active] DESC'
                        WHEN 'ActionAllowed' THEN '[WF_UserDBRows].[ActionAllowed]'
                        WHEN 'ActionAllowed DESC' THEN '[WF_UserDBRows].[ActionAllowed] DESC'
                        WHEN 'UpdateAllowed' THEN '[WF_UserDBRows].[UpdateAllowed]'
                        WHEN 'UpdateAllowed DESC' THEN '[WF_UserDBRows].[UpdateAllowed] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'WF_DBRows2_Description' THEN '[WF_DBRows2].[Description]'
                        WHEN 'WF_DBRows2_Description DESC' THEN '[WF_DBRows2].[Description] DESC'
                        WHEN 'WF_UserDashboards3_DashboardID' THEN '[WF_UserDashboards3].[DashboardID]'
                        WHEN 'WF_UserDashboards3_DashboardID DESC' THEN '[WF_UserDashboards3].[DashboardID] DESC'
                        ELSE '[WF_UserDBRows].[UserID],[WF_UserDBRows].[DashboardID],[WF_UserDBRows].[DBRows]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [WF_UserDBRows].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [WF_DBRows2].[Description] AS WF_DBRows2_Description,
    [WF_UserDashboards3].[DashboardID] AS WF_UserDashboards3_DashboardID 
  FROM [WF_UserDBRows] 
      INNER JOIN #PageIndex
          ON [WF_UserDBRows].[UserID] = #PageIndex.UserID
          AND [WF_UserDBRows].[DashboardID] = #PageIndex.DashboardID
          AND [WF_UserDBRows].[DBRows] = #PageIndex.DBRows
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [WF_UserDBRows].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [WF_DBRows] AS [WF_DBRows2]
    ON [WF_UserDBRows].[DashboardID] = [WF_DBRows2].[DashboardID]
    AND [WF_UserDBRows].[DBRows] = [WF_DBRows2].[DBRows]
  INNER JOIN [WF_UserDashboards] AS [WF_UserDashboards3]
    ON [WF_UserDBRows].[UserID] = [WF_UserDashboards3].[UserID]
    AND [WF_UserDBRows].[DashboardID] = [WF_UserDashboards3].[DashboardID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
