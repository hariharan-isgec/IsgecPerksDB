USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmappUserAppsSelectByID]
  @LoginID NVarChar(8),
  @AppID Int,
  @UserID NVarChar(8) 
  AS
  SELECT
    [MAPP_UserApps].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [MAPP_Applications2].[ApplicationName] AS MAPP_Applications2_ApplicationName 
  FROM [MAPP_UserApps] 
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [MAPP_UserApps].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [MAPP_Applications] AS [MAPP_Applications2]
    ON [MAPP_UserApps].[AppID] = [MAPP_Applications2].[AppID]
  WHERE
  [MAPP_UserApps].[AppID] = @AppID
  AND [MAPP_UserApps].[UserID] = @UserID
GO
