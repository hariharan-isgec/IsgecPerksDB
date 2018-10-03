USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteIssReqHSelectByID]
  @LoginID NVarChar(8),
  @ProjectID NVarChar(6),
  @IssueNo Int 
  AS
  SELECT
    [PAK_SiteIssueH].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [IDM_Projects3].[Description] AS IDM_Projects3_Description,
    [PAK_IssueStatus4].[Description] AS PAK_IssueStatus4_Description,
    [PAK_IssueTypes5].[Description] AS PAK_IssueTypes5_Description,
    [aspnet_Users6].[UserFullName] AS aspnet_Users6_UserFullName 
  FROM [PAK_SiteIssueH] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_SiteIssueH].[IssueToCardNo] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [PAK_SiteIssueH].[IssuedBy] = [aspnet_users2].[LoginID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects3]
    ON [PAK_SiteIssueH].[ProjectID] = [IDM_Projects3].[ProjectID]
  LEFT OUTER JOIN [PAK_IssueStatus] AS [PAK_IssueStatus4]
    ON [PAK_SiteIssueH].[IssueStatusID] = [PAK_IssueStatus4].[IssueStatusID]
  LEFT OUTER JOIN [PAK_IssueTypes] AS [PAK_IssueTypes5]
    ON [PAK_SiteIssueH].[IssueTypeID] = [PAK_IssueTypes5].[IssueTypeID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users6]
    ON [PAK_SiteIssueH].[RequestedBy] = [aspnet_users6].[LoginID]
  WHERE
  [PAK_SiteIssueH].[ProjectID] = @ProjectID
  AND [PAK_SiteIssueH].[IssueNo] = @IssueNo
GO
