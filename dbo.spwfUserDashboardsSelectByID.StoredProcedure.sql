USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfUserDashboardsSelectByID]
  @LoginID NVarChar(8),
  @UserID NVarChar(8),
  @DashboardID Int 
  AS
  SELECT
    [WF_UserDashboards].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [WF_Dashboards2].[DBDescription] AS WF_Dashboards2_DBDescription 
  FROM [WF_UserDashboards] 
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [WF_UserDashboards].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [WF_Dashboards] AS [WF_Dashboards2]
    ON [WF_UserDashboards].[DashboardID] = [WF_Dashboards2].[DashboardID]
  WHERE
  [WF_UserDashboards].[UserID] = @UserID
  AND [WF_UserDashboards].[DashboardID] = @DashboardID
GO
