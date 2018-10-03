USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfUserDBRowsSelectByID]
  @LoginID NVarChar(8),
  @UserID NVarChar(8),
  @DashboardID Int,
  @DBRows Int 
  AS
  SELECT
    [WF_UserDBRows].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [WF_DBRows2].[Description] AS WF_DBRows2_Description,
    [WF_UserDashboards3].[DashboardID] AS WF_UserDashboards3_DashboardID,
    [WF_DBData4].[Description] AS WF_DBData4_Description,
    [WF_DBData5].[Description] AS WF_DBData5_Description,
    [WF_DBData6].[Description] AS WF_DBData6_Description 
  FROM [WF_UserDBRows] 
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [WF_UserDBRows].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [WF_DBRows] AS [WF_DBRows2]
    ON [WF_UserDBRows].[DashboardID] = [WF_DBRows2].[DashboardID]
    AND [WF_UserDBRows].[DBRows] = [WF_DBRows2].[DBRows]
  INNER JOIN [WF_UserDashboards] AS [WF_UserDashboards3]
    ON [WF_UserDBRows].[UserID] = [WF_UserDashboards3].[UserID]
    AND [WF_UserDBRows].[DashboardID] = [WF_UserDashboards3].[DashboardID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData4]
    ON [WF_UserDBRows].[ReminderCountDBDataID] = [WF_DBData4].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData5]
    ON [WF_UserDBRows].[ReminderAvgDBDataID] = [WF_DBData5].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData6]
    ON [WF_UserDBRows].[ReminderMaxDBDataID] = [WF_DBData6].[DBDataID]
  WHERE
  [WF_UserDBRows].[UserID] = @UserID
  AND [WF_UserDBRows].[DashboardID] = @DashboardID
  AND [WF_UserDBRows].[DBRows] = @DBRows
GO
