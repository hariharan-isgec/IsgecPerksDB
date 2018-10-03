USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfnewUserDBSelectListFilteres]
  @Filter_UserID NVarChar(8),
  @Filter_DashboardID Int,
  @Filter_DBRows Int,
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
  SET @LGSQL = @LGSQL + '[WF_newUserDB].[UserID]'
  SET @LGSQL = @LGSQL + ', [WF_newUserDB].[DashboardID]'
  SET @LGSQL = @LGSQL + ', [WF_newUserDB].[DBRows]'
  SET @LGSQL = @LGSQL + ' FROM [WF_newUserDB] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [WF_newUserDB].[UserID] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [WF_Dashboards] AS [WF_Dashboards2]'
  SET @LGSQL = @LGSQL + '    ON [WF_newUserDB].[DashboardID] = [WF_Dashboards2].[DashboardID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [WF_DBRows] AS [WF_DBRows3]'
  SET @LGSQL = @LGSQL + '    ON [WF_newUserDB].[DashboardID] = [WF_DBRows3].[DashboardID]'
  SET @LGSQL = @LGSQL + '    AND [WF_newUserDB].[DBRows] = [WF_DBRows3].[DBRows]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_UserID > '') 
    SET @LGSQL = @LGSQL + ' AND [WF_newUserDB].[UserID] = ''' + @Filter_UserID + ''''
  IF (@Filter_DashboardID > 0) 
    SET @LGSQL = @LGSQL + ' AND [WF_newUserDB].[DashboardID] = ' + STR(@Filter_DashboardID)
  IF (@Filter_DBRows > 0) 
    SET @LGSQL = @LGSQL + ' AND [WF_newUserDB].[DBRows] = ' + STR(@Filter_DBRows)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UserID' THEN '[WF_newUserDB].[UserID]'
                        WHEN 'UserID DESC' THEN '[WF_newUserDB].[UserID] DESC'
                        WHEN 'DashboardID' THEN '[WF_newUserDB].[DashboardID]'
                        WHEN 'DashboardID DESC' THEN '[WF_newUserDB].[DashboardID] DESC'
                        WHEN 'DBRows' THEN '[WF_newUserDB].[DBRows]'
                        WHEN 'DBRows DESC' THEN '[WF_newUserDB].[DBRows] DESC'
                        WHEN 'Sequence' THEN '[WF_newUserDB].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[WF_newUserDB].[Sequence] DESC'
                        WHEN 'DataSource' THEN '[WF_newUserDB].[DataSource]'
                        WHEN 'DataSource DESC' THEN '[WF_newUserDB].[DataSource] DESC'
                        WHEN 'IsLeft' THEN '[WF_newUserDB].[IsLeft]'
                        WHEN 'IsLeft DESC' THEN '[WF_newUserDB].[IsLeft] DESC'
                        WHEN 'AppName_Left' THEN '[WF_newUserDB].[AppName_Left]'
                        WHEN 'AppName_Left DESC' THEN '[WF_newUserDB].[AppName_Left] DESC'
                        WHEN 'vTOTSQLl' THEN '[WF_newUserDB].[vTOTSQLl]'
                        WHEN 'vTOTSQLl DESC' THEN '[WF_newUserDB].[vTOTSQLl] DESC'
                        WHEN 'vREDSQLl' THEN '[WF_newUserDB].[vREDSQLl]'
                        WHEN 'vREDSQLl DESC' THEN '[WF_newUserDB].[vREDSQLl] DESC'
                        WHEN 'vAMBSQLl' THEN '[WF_newUserDB].[vAMBSQLl]'
                        WHEN 'vAMBSQLl DESC' THEN '[WF_newUserDB].[vAMBSQLl] DESC'
                        WHEN 'vGRESQLl' THEN '[WF_newUserDB].[vGRESQLl]'
                        WHEN 'vGRESQLl DESC' THEN '[WF_newUserDB].[vGRESQLl] DESC'
                        WHEN 'IsRight' THEN '[WF_newUserDB].[IsRight]'
                        WHEN 'IsRight DESC' THEN '[WF_newUserDB].[IsRight] DESC'
                        WHEN 'AppName_Right' THEN '[WF_newUserDB].[AppName_Right]'
                        WHEN 'AppName_Right DESC' THEN '[WF_newUserDB].[AppName_Right] DESC'
                        WHEN 'vTOTSQLr' THEN '[WF_newUserDB].[vTOTSQLr]'
                        WHEN 'vTOTSQLr DESC' THEN '[WF_newUserDB].[vTOTSQLr] DESC'
                        WHEN 'vREDSQLr' THEN '[WF_newUserDB].[vREDSQLr]'
                        WHEN 'vREDSQLr DESC' THEN '[WF_newUserDB].[vREDSQLr] DESC'
                        WHEN 'vAMBSQLr' THEN '[WF_newUserDB].[vAMBSQLr]'
                        WHEN 'vAMBSQLr DESC' THEN '[WF_newUserDB].[vAMBSQLr] DESC'
                        WHEN 'vGRESQLr' THEN '[WF_newUserDB].[vGRESQLr]'
                        WHEN 'vGRESQLr DESC' THEN '[WF_newUserDB].[vGRESQLr] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'WF_Dashboards2_DBDescription' THEN '[WF_Dashboards2].[DBDescription]'
                        WHEN 'WF_Dashboards2_DBDescription DESC' THEN '[WF_Dashboards2].[DBDescription] DESC'
                        WHEN 'WF_DBRows3_Description' THEN '[WF_DBRows3].[Description]'
                        WHEN 'WF_DBRows3_Description DESC' THEN '[WF_DBRows3].[Description] DESC'
                        ELSE '[WF_newUserDB].[UserID],[WF_newUserDB].[DashboardID],[WF_newUserDB].[DBRows]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [WF_newUserDB].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [WF_Dashboards2].[DBDescription] AS WF_Dashboards2_DBDescription,
    [WF_DBRows3].[Description] AS WF_DBRows3_Description 
  FROM [WF_newUserDB] 
      INNER JOIN #PageIndex
          ON [WF_newUserDB].[UserID] = #PageIndex.UserID
          AND [WF_newUserDB].[DashboardID] = #PageIndex.DashboardID
          AND [WF_newUserDB].[DBRows] = #PageIndex.DBRows
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [WF_newUserDB].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [WF_Dashboards] AS [WF_Dashboards2]
    ON [WF_newUserDB].[DashboardID] = [WF_Dashboards2].[DashboardID]
  INNER JOIN [WF_DBRows] AS [WF_DBRows3]
    ON [WF_newUserDB].[DashboardID] = [WF_DBRows3].[DashboardID]
    AND [WF_newUserDB].[DBRows] = [WF_DBRows3].[DBRows]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
