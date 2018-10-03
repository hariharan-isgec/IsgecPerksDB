USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfnewUserDBSelectByUserID]
  @UserID NVarChar(8),
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [WF_newUserDB].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [WF_Dashboards2].[DBDescription] AS WF_Dashboards2_DBDescription,
    [WF_DBRows3].[Description] AS WF_DBRows3_Description 
  FROM [WF_newUserDB] 
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [WF_newUserDB].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [WF_Dashboards] AS [WF_Dashboards2]
    ON [WF_newUserDB].[DashboardID] = [WF_Dashboards2].[DashboardID]
  INNER JOIN [WF_DBRows] AS [WF_DBRows3]
    ON [WF_newUserDB].[DashboardID] = [WF_DBRows3].[DashboardID]
    AND [WF_newUserDB].[DBRows] = [WF_DBRows3].[DBRows]
  WHERE
  [WF_newUserDB].[UserID] = @UserID
  ORDER BY
     CASE @OrderBy WHEN 'UserID' THEN [WF_newUserDB].[UserID] END,
     CASE @OrderBy WHEN 'UserID DESC' THEN [WF_newUserDB].[UserID] END DESC,
     CASE @OrderBy WHEN 'DashboardID' THEN [WF_newUserDB].[DashboardID] END,
     CASE @OrderBy WHEN 'DashboardID DESC' THEN [WF_newUserDB].[DashboardID] END DESC,
     CASE @OrderBy WHEN 'DBRows' THEN [WF_newUserDB].[DBRows] END,
     CASE @OrderBy WHEN 'DBRows DESC' THEN [WF_newUserDB].[DBRows] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [WF_newUserDB].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [WF_newUserDB].[Sequence] END DESC,
     CASE @OrderBy WHEN 'DataSource' THEN [WF_newUserDB].[DataSource] END,
     CASE @OrderBy WHEN 'DataSource DESC' THEN [WF_newUserDB].[DataSource] END DESC,
     CASE @OrderBy WHEN 'IsLeft' THEN [WF_newUserDB].[IsLeft] END,
     CASE @OrderBy WHEN 'IsLeft DESC' THEN [WF_newUserDB].[IsLeft] END DESC,
     CASE @OrderBy WHEN 'AppName_Left' THEN [WF_newUserDB].[AppName_Left] END,
     CASE @OrderBy WHEN 'AppName_Left DESC' THEN [WF_newUserDB].[AppName_Left] END DESC,
     CASE @OrderBy WHEN 'vTOTSQLl' THEN [WF_newUserDB].[vTOTSQLl] END,
     CASE @OrderBy WHEN 'vTOTSQLl DESC' THEN [WF_newUserDB].[vTOTSQLl] END DESC,
     CASE @OrderBy WHEN 'vREDSQLl' THEN [WF_newUserDB].[vREDSQLl] END,
     CASE @OrderBy WHEN 'vREDSQLl DESC' THEN [WF_newUserDB].[vREDSQLl] END DESC,
     CASE @OrderBy WHEN 'vAMBSQLl' THEN [WF_newUserDB].[vAMBSQLl] END,
     CASE @OrderBy WHEN 'vAMBSQLl DESC' THEN [WF_newUserDB].[vAMBSQLl] END DESC,
     CASE @OrderBy WHEN 'vGRESQLl' THEN [WF_newUserDB].[vGRESQLl] END,
     CASE @OrderBy WHEN 'vGRESQLl DESC' THEN [WF_newUserDB].[vGRESQLl] END DESC,
     CASE @OrderBy WHEN 'IsRight' THEN [WF_newUserDB].[IsRight] END,
     CASE @OrderBy WHEN 'IsRight DESC' THEN [WF_newUserDB].[IsRight] END DESC,
     CASE @OrderBy WHEN 'AppName_Right' THEN [WF_newUserDB].[AppName_Right] END,
     CASE @OrderBy WHEN 'AppName_Right DESC' THEN [WF_newUserDB].[AppName_Right] END DESC,
     CASE @OrderBy WHEN 'vTOTSQLr' THEN [WF_newUserDB].[vTOTSQLr] END,
     CASE @OrderBy WHEN 'vTOTSQLr DESC' THEN [WF_newUserDB].[vTOTSQLr] END DESC,
     CASE @OrderBy WHEN 'vREDSQLr' THEN [WF_newUserDB].[vREDSQLr] END,
     CASE @OrderBy WHEN 'vREDSQLr DESC' THEN [WF_newUserDB].[vREDSQLr] END DESC,
     CASE @OrderBy WHEN 'vAMBSQLr' THEN [WF_newUserDB].[vAMBSQLr] END,
     CASE @OrderBy WHEN 'vAMBSQLr DESC' THEN [WF_newUserDB].[vAMBSQLr] END DESC,
     CASE @OrderBy WHEN 'vGRESQLr' THEN [WF_newUserDB].[vGRESQLr] END,
     CASE @OrderBy WHEN 'vGRESQLr DESC' THEN [WF_newUserDB].[vGRESQLr] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'WF_Dashboards2_DBDescription' THEN [WF_Dashboards2].[DBDescription] END,
     CASE @OrderBy WHEN 'WF_Dashboards2_DBDescription DESC' THEN [WF_Dashboards2].[DBDescription] END DESC,
     CASE @OrderBy WHEN 'WF_DBRows3_Description' THEN [WF_DBRows3].[Description] END,
     CASE @OrderBy WHEN 'WF_DBRows3_Description DESC' THEN [WF_DBRows3].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
