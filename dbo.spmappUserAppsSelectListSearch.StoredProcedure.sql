USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmappUserAppsSelectListSearch]
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
 ,AppID Int NOT NULL
 ,UserID NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (AppID, UserID)
  SELECT [MAPP_UserApps].[AppID], [MAPP_UserApps].[UserID] FROM [MAPP_UserApps]
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [MAPP_UserApps].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [MAPP_Applications] AS [MAPP_Applications2]
    ON [MAPP_UserApps].[AppID] = [MAPP_Applications2].[AppID]
 WHERE  
   ( 
         STR(ISNULL([MAPP_UserApps].[AppID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MAPP_UserApps].[UserID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'AppID' THEN [MAPP_UserApps].[AppID] END,
     CASE @OrderBy WHEN 'AppID DESC' THEN [MAPP_UserApps].[AppID] END DESC,
     CASE @OrderBy WHEN 'UserID' THEN [MAPP_UserApps].[UserID] END,
     CASE @OrderBy WHEN 'UserID DESC' THEN [MAPP_UserApps].[UserID] END DESC,
     CASE @OrderBy WHEN 'IsActive' THEN [MAPP_UserApps].[IsActive] END,
     CASE @OrderBy WHEN 'IsActive DESC' THEN [MAPP_UserApps].[IsActive] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'MAPP_Applications2_ApplicationName' THEN [MAPP_Applications2].[ApplicationName] END,
     CASE @OrderBy WHEN 'MAPP_Applications2_ApplicationName DESC' THEN [MAPP_Applications2].[ApplicationName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [MAPP_UserApps].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [MAPP_Applications2].[ApplicationName] AS MAPP_Applications2_ApplicationName 
  FROM [MAPP_UserApps] 
      INNER JOIN #PageIndex
          ON [MAPP_UserApps].[AppID] = #PageIndex.AppID
          AND [MAPP_UserApps].[UserID] = #PageIndex.UserID
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [MAPP_UserApps].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [MAPP_Applications] AS [MAPP_Applications2]
    ON [MAPP_UserApps].[AppID] = [MAPP_Applications2].[AppID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
