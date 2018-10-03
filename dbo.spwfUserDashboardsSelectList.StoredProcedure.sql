USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfUserDashboardsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'UserID' THEN [WF_UserDashboards].[UserID] END,
     CASE @OrderBy WHEN 'UserID DESC' THEN [WF_UserDashboards].[UserID] END DESC,
     CASE @OrderBy WHEN 'DashboardID' THEN [WF_UserDashboards].[DashboardID] END,
     CASE @OrderBy WHEN 'DashboardID DESC' THEN [WF_UserDashboards].[DashboardID] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [WF_UserDashboards].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [WF_UserDashboards].[Active] END DESC,
     CASE @OrderBy WHEN 'ActionAllowed' THEN [WF_UserDashboards].[ActionAllowed] END,
     CASE @OrderBy WHEN 'ActionAllowed DESC' THEN [WF_UserDashboards].[ActionAllowed] END DESC,
     CASE @OrderBy WHEN 'UpdateAllowed' THEN [WF_UserDashboards].[UpdateAllowed] END,
     CASE @OrderBy WHEN 'UpdateAllowed DESC' THEN [WF_UserDashboards].[UpdateAllowed] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'WF_Dashboards2_DBDescription' THEN [WF_Dashboards2].[DBDescription] END,
     CASE @OrderBy WHEN 'WF_Dashboards2_DBDescription DESC' THEN [WF_Dashboards2].[DBDescription] END DESC 
  SET @RecordCount = @@RowCount
GO
