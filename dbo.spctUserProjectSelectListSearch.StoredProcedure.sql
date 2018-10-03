USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spctUserProjectSelectListSearch]
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
  SELECT [CT_UserProject].[UserID], [CT_UserProject].[ProjectID] FROM [CT_UserProject]
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [CT_UserProject].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [CT_UserProject].[ProjectID] = [IDM_Projects2].[ProjectID]
 WHERE  
   ( 
         LOWER(ISNULL([CT_UserProject].[UserID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([CT_UserProject].[ProjectID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'UserID' THEN [CT_UserProject].[UserID] END,
     CASE @OrderBy WHEN 'UserID DESC' THEN [CT_UserProject].[UserID] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [CT_UserProject].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [CT_UserProject].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'IsActive' THEN [CT_UserProject].[IsActive] END,
     CASE @OrderBy WHEN 'IsActive DESC' THEN [CT_UserProject].[IsActive] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects2_Description' THEN [IDM_Projects2].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects2_Description DESC' THEN [IDM_Projects2].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [CT_UserProject].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [IDM_Projects2].[Description] AS IDM_Projects2_Description 
  FROM [CT_UserProject] 
      INNER JOIN #PageIndex
          ON [CT_UserProject].[UserID] = #PageIndex.UserID
          AND [CT_UserProject].[ProjectID] = #PageIndex.ProjectID
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [CT_UserProject].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [CT_UserProject].[ProjectID] = [IDM_Projects2].[ProjectID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
