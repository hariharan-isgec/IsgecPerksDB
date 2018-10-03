USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteUserProjectsSelectListFilteres]
  @Filter_UserID NVarChar(8),
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
 ,UserID NVarChar(8) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UserID'
  SET @LGSQL = @LGSQL + ', ProjectID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_SiteUserProjects].[UserID]'
  SET @LGSQL = @LGSQL + ', [PAK_SiteUserProjects].[ProjectID]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_SiteUserProjects] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteUserProjects].[UserID] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_SiteUserProjects].[ProjectID] = [IDM_Projects2].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_UserID > '') 
    SET @LGSQL = @LGSQL + ' AND [PAK_SiteUserProjects].[UserID] = ''' + @Filter_UserID + ''''
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [PAK_SiteUserProjects].[ProjectID] = ''' + @Filter_ProjectID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UserID' THEN '[PAK_SiteUserProjects].[UserID]'
                        WHEN 'UserID DESC' THEN '[PAK_SiteUserProjects].[UserID] DESC'
                        WHEN 'ProjectID' THEN '[PAK_SiteUserProjects].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[PAK_SiteUserProjects].[ProjectID] DESC'
                        WHEN 'Active' THEN '[PAK_SiteUserProjects].[Active]'
                        WHEN 'Active DESC' THEN '[PAK_SiteUserProjects].[Active] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'IDM_Projects2_Description' THEN '[IDM_Projects2].[Description]'
                        WHEN 'IDM_Projects2_Description DESC' THEN '[IDM_Projects2].[Description] DESC'
                        ELSE '[PAK_SiteUserProjects].[UserID],[PAK_SiteUserProjects].[ProjectID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_SiteUserProjects].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [IDM_Projects2].[Description] AS IDM_Projects2_Description 
  FROM [PAK_SiteUserProjects] 
      INNER JOIN #PageIndex
          ON [PAK_SiteUserProjects].[UserID] = #PageIndex.UserID
          AND [PAK_SiteUserProjects].[ProjectID] = #PageIndex.ProjectID
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_SiteUserProjects].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [PAK_SiteUserProjects].[ProjectID] = [IDM_Projects2].[ProjectID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
