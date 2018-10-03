USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteMtlIssHSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
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
 ,ProjectID NVarChar(6) NOT NULL
 ,IssueNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', IssueNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_SiteIssueH].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [PAK_SiteIssueH].[IssueNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_SiteIssueH] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteIssueH].[IssueToCardNo] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteIssueH].[IssuedBy] = [aspnet_users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects3]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteIssueH].[ProjectID] = [IDM_Projects3].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_IssueStatus] AS [PAK_IssueStatus4]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteIssueH].[IssueStatusID] = [PAK_IssueStatus4].[IssueStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_IssueTypes] AS [PAK_IssueTypes5]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteIssueH].[IssueTypeID] = [PAK_IssueTypes5].[IssueTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users6]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteIssueH].[RequestedBy] = [aspnet_users6].[LoginID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [PAK_SiteIssueH].[ProjectID] = ''' + @Filter_ProjectID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[PAK_SiteIssueH].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[PAK_SiteIssueH].[ProjectID] DESC'
                        WHEN 'IssueNo' THEN '[PAK_SiteIssueH].[IssueNo]'
                        WHEN 'IssueNo DESC' THEN '[PAK_SiteIssueH].[IssueNo] DESC'
                        WHEN 'RequestedBy' THEN '[PAK_SiteIssueH].[RequestedBy]'
                        WHEN 'RequestedBy DESC' THEN '[PAK_SiteIssueH].[RequestedBy] DESC'
                        WHEN 'RequestedOn' THEN '[PAK_SiteIssueH].[RequestedOn]'
                        WHEN 'RequestedOn DESC' THEN '[PAK_SiteIssueH].[RequestedOn] DESC'
                        WHEN 'RequesterRemarks' THEN '[PAK_SiteIssueH].[RequesterRemarks]'
                        WHEN 'RequesterRemarks DESC' THEN '[PAK_SiteIssueH].[RequesterRemarks] DESC'
                        WHEN 'IssueToName' THEN '[PAK_SiteIssueH].[IssueToName]'
                        WHEN 'IssueToName DESC' THEN '[PAK_SiteIssueH].[IssueToName] DESC'
                        WHEN 'IssueToCardNo' THEN '[PAK_SiteIssueH].[IssueToCardNo]'
                        WHEN 'IssueToCardNo DESC' THEN '[PAK_SiteIssueH].[IssueToCardNo] DESC'
                        WHEN 'IssueRemarks' THEN '[PAK_SiteIssueH].[IssueRemarks]'
                        WHEN 'IssueRemarks DESC' THEN '[PAK_SiteIssueH].[IssueRemarks] DESC'
                        WHEN 'IssueTypeID' THEN '[PAK_SiteIssueH].[IssueTypeID]'
                        WHEN 'IssueTypeID DESC' THEN '[PAK_SiteIssueH].[IssueTypeID] DESC'
                        WHEN 'IssuedOn' THEN '[PAK_SiteIssueH].[IssuedOn]'
                        WHEN 'IssuedOn DESC' THEN '[PAK_SiteIssueH].[IssuedOn] DESC'
                        WHEN 'IssuedBy' THEN '[PAK_SiteIssueH].[IssuedBy]'
                        WHEN 'IssuedBy DESC' THEN '[PAK_SiteIssueH].[IssuedBy] DESC'
                        WHEN 'IssueStatusID' THEN '[PAK_SiteIssueH].[IssueStatusID]'
                        WHEN 'IssueStatusID DESC' THEN '[PAK_SiteIssueH].[IssueStatusID] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'IDM_Projects3_Description' THEN '[IDM_Projects3].[Description]'
                        WHEN 'IDM_Projects3_Description DESC' THEN '[IDM_Projects3].[Description] DESC'
                        WHEN 'PAK_IssueStatus4_Description' THEN '[PAK_IssueStatus4].[Description]'
                        WHEN 'PAK_IssueStatus4_Description DESC' THEN '[PAK_IssueStatus4].[Description] DESC'
                        WHEN 'PAK_IssueTypes5_Description' THEN '[PAK_IssueTypes5].[Description]'
                        WHEN 'PAK_IssueTypes5_Description DESC' THEN '[PAK_IssueTypes5].[Description] DESC'
                        WHEN 'aspnet_Users6_UserFullName' THEN '[aspnet_Users6].[UserFullName]'
                        WHEN 'aspnet_Users6_UserFullName DESC' THEN '[aspnet_Users6].[UserFullName] DESC'
                        ELSE '[PAK_SiteIssueH].[ProjectID],[PAK_SiteIssueH].[IssueNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_SiteIssueH].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [IDM_Projects3].[Description] AS IDM_Projects3_Description,
    [PAK_IssueStatus4].[Description] AS PAK_IssueStatus4_Description,
    [PAK_IssueTypes5].[Description] AS PAK_IssueTypes5_Description,
    [aspnet_Users6].[UserFullName] AS aspnet_Users6_UserFullName 
  FROM [PAK_SiteIssueH] 
      INNER JOIN #PageIndex
          ON [PAK_SiteIssueH].[ProjectID] = #PageIndex.ProjectID
          AND [PAK_SiteIssueH].[IssueNo] = #PageIndex.IssueNo
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
