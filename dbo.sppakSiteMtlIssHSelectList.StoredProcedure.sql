USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteMtlIssHSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [PAK_SiteIssueH].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [PAK_SiteIssueH].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'IssueNo' THEN [PAK_SiteIssueH].[IssueNo] END,
     CASE @OrderBy WHEN 'IssueNo DESC' THEN [PAK_SiteIssueH].[IssueNo] END DESC,
     CASE @OrderBy WHEN 'RequestedBy' THEN [PAK_SiteIssueH].[RequestedBy] END,
     CASE @OrderBy WHEN 'RequestedBy DESC' THEN [PAK_SiteIssueH].[RequestedBy] END DESC,
     CASE @OrderBy WHEN 'RequestedOn' THEN [PAK_SiteIssueH].[RequestedOn] END,
     CASE @OrderBy WHEN 'RequestedOn DESC' THEN [PAK_SiteIssueH].[RequestedOn] END DESC,
     CASE @OrderBy WHEN 'RequesterRemarks' THEN [PAK_SiteIssueH].[RequesterRemarks] END,
     CASE @OrderBy WHEN 'RequesterRemarks DESC' THEN [PAK_SiteIssueH].[RequesterRemarks] END DESC,
     CASE @OrderBy WHEN 'IssueToName' THEN [PAK_SiteIssueH].[IssueToName] END,
     CASE @OrderBy WHEN 'IssueToName DESC' THEN [PAK_SiteIssueH].[IssueToName] END DESC,
     CASE @OrderBy WHEN 'IssueToCardNo' THEN [PAK_SiteIssueH].[IssueToCardNo] END,
     CASE @OrderBy WHEN 'IssueToCardNo DESC' THEN [PAK_SiteIssueH].[IssueToCardNo] END DESC,
     CASE @OrderBy WHEN 'IssueRemarks' THEN [PAK_SiteIssueH].[IssueRemarks] END,
     CASE @OrderBy WHEN 'IssueRemarks DESC' THEN [PAK_SiteIssueH].[IssueRemarks] END DESC,
     CASE @OrderBy WHEN 'IssueTypeID' THEN [PAK_SiteIssueH].[IssueTypeID] END,
     CASE @OrderBy WHEN 'IssueTypeID DESC' THEN [PAK_SiteIssueH].[IssueTypeID] END DESC,
     CASE @OrderBy WHEN 'IssuedOn' THEN [PAK_SiteIssueH].[IssuedOn] END,
     CASE @OrderBy WHEN 'IssuedOn DESC' THEN [PAK_SiteIssueH].[IssuedOn] END DESC,
     CASE @OrderBy WHEN 'IssuedBy' THEN [PAK_SiteIssueH].[IssuedBy] END,
     CASE @OrderBy WHEN 'IssuedBy DESC' THEN [PAK_SiteIssueH].[IssuedBy] END DESC,
     CASE @OrderBy WHEN 'IssueStatusID' THEN [PAK_SiteIssueH].[IssueStatusID] END,
     CASE @OrderBy WHEN 'IssueStatusID DESC' THEN [PAK_SiteIssueH].[IssueStatusID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects3_Description' THEN [IDM_Projects3].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects3_Description DESC' THEN [IDM_Projects3].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_IssueStatus4_Description' THEN [PAK_IssueStatus4].[Description] END,
     CASE @OrderBy WHEN 'PAK_IssueStatus4_Description DESC' THEN [PAK_IssueStatus4].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_IssueTypes5_Description' THEN [PAK_IssueTypes5].[Description] END,
     CASE @OrderBy WHEN 'PAK_IssueTypes5_Description DESC' THEN [PAK_IssueTypes5].[Description] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users6_UserFullName' THEN [aspnet_Users6].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users6_UserFullName DESC' THEN [aspnet_Users6].[UserFullName] END DESC 
  SET @RecordCount = @@RowCount
GO
