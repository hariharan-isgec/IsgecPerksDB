USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfnewUserDBSelectByID]
  @LoginID NVarChar(8),
  @UserID NVarChar(8),
  @DashboardID Int,
  @DBRows Int 
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
  AND [WF_newUserDB].[DashboardID] = @DashboardID
  AND [WF_newUserDB].[DBRows] = @DBRows
GO
