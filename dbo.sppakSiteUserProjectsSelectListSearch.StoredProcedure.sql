USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteUserProjectsSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,UserID NVarChar(8) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (UserID, ProjectID)
  SELECT [PAK_SiteUserProjects].[UserID], [PAK_SiteUserProjects].[ProjectID] FROM [PAK_SiteUserProjects]
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_SiteUserProjects].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [PAK_SiteUserProjects].[ProjectID] = [IDM_Projects2].[ProjectID]
 WHERE  
   ( 
         LOWER(ISNULL([PAK_SiteUserProjects].[UserID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_SiteUserProjects].[ProjectID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'UserID' THEN [PAK_SiteUserProjects].[UserID] END,
     CASE @OrderBy WHEN 'UserID DESC' THEN [PAK_SiteUserProjects].[UserID] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [PAK_SiteUserProjects].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [PAK_SiteUserProjects].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [PAK_SiteUserProjects].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [PAK_SiteUserProjects].[Active] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects2_Description' THEN [IDM_Projects2].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects2_Description DESC' THEN [IDM_Projects2].[Description] END DESC 

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
