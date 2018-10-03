USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteUserProjectsSelectByID]
  @LoginID NVarChar(8),
  @UserID NVarChar(8),
  @ProjectID NVarChar(6) 
  AS
  SELECT
    [PAK_SiteUserProjects].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [IDM_Projects2].[Description] AS IDM_Projects2_Description 
  FROM [PAK_SiteUserProjects] 
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_SiteUserProjects].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [PAK_SiteUserProjects].[ProjectID] = [IDM_Projects2].[ProjectID]
  WHERE
  [PAK_SiteUserProjects].[UserID] = @UserID
  AND [PAK_SiteUserProjects].[ProjectID] = @ProjectID
GO
