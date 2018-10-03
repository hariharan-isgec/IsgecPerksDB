USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRSessionByEmployeeSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @ApplicationID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,RecordID Int NOT NULL
  )
  INSERT INTO #PageIndex (RecordID)
  SELECT [SYS_VRSessionByEmployee].[RecordID] FROM [SYS_VRSessionByEmployee]
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRSessionByEmployee].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  INNER JOIN [SYS_VRSessions] AS [SYS_VRSessions2]
    ON [SYS_VRSessionByEmployee].[VRSessionID] = [SYS_VRSessions2].[VRSessionID]
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SYS_VRSessionByEmployee].[UserName] = [aspnet_Users1].[LoginID]
 WHERE  
      [SYS_VRSessionByEmployee].[ApplicationID] = (@ApplicationID)
   AND ( 
         STR(ISNULL([SYS_VRSessionByEmployee].[RecordID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRSessionByEmployee].[VRSessionID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRSessionByEmployee].[ApplicationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRSessionByEmployee].[UserName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RecordID' THEN [SYS_VRSessionByEmployee].[RecordID] END,
     CASE @OrderBy WHEN 'RecordID DESC' THEN [SYS_VRSessionByEmployee].[RecordID] END DESC,
     CASE @OrderBy WHEN 'VRSessionID' THEN [SYS_VRSessionByEmployee].[VRSessionID] END,
     CASE @OrderBy WHEN 'VRSessionID DESC' THEN [SYS_VRSessionByEmployee].[VRSessionID] END DESC,
     CASE @OrderBy WHEN 'ApplicationID' THEN [SYS_VRSessionByEmployee].[ApplicationID] END,
     CASE @OrderBy WHEN 'ApplicationID DESC' THEN [SYS_VRSessionByEmployee].[ApplicationID] END DESC,
     CASE @OrderBy WHEN 'UserName' THEN [SYS_VRSessionByEmployee].[UserName] END,
     CASE @OrderBy WHEN 'UserName DESC' THEN [SYS_VRSessionByEmployee].[UserName] END DESC,
     CASE @OrderBy WHEN 'MaintainGrid' THEN [SYS_VRSessionByEmployee].[MaintainGrid] END,
     CASE @OrderBy WHEN 'MaintainGrid DESC' THEN [SYS_VRSessionByEmployee].[MaintainGrid] END DESC,
     CASE @OrderBy WHEN 'InsertForm' THEN [SYS_VRSessionByEmployee].[InsertForm] END,
     CASE @OrderBy WHEN 'InsertForm DESC' THEN [SYS_VRSessionByEmployee].[InsertForm] END DESC,
     CASE @OrderBy WHEN 'UpdateForm' THEN [SYS_VRSessionByEmployee].[UpdateForm] END,
     CASE @OrderBy WHEN 'UpdateForm DESC' THEN [SYS_VRSessionByEmployee].[UpdateForm] END DESC,
     CASE @OrderBy WHEN 'DisplayGrid' THEN [SYS_VRSessionByEmployee].[DisplayGrid] END,
     CASE @OrderBy WHEN 'DisplayGrid DESC' THEN [SYS_VRSessionByEmployee].[DisplayGrid] END DESC,
     CASE @OrderBy WHEN 'DisplayForm' THEN [SYS_VRSessionByEmployee].[DisplayForm] END,
     CASE @OrderBy WHEN 'DisplayForm DESC' THEN [SYS_VRSessionByEmployee].[DisplayForm] END DESC,
     CASE @OrderBy WHEN 'DeleteOption' THEN [SYS_VRSessionByEmployee].[DeleteOption] END,
     CASE @OrderBy WHEN 'DeleteOption DESC' THEN [SYS_VRSessionByEmployee].[DeleteOption] END DESC,
     CASE @OrderBy WHEN 'SYS_Applications1_Description' THEN [SYS_Applications1].[Description] END,
     CASE @OrderBy WHEN 'SYS_Applications1_Description DESC' THEN [SYS_Applications1].[Description] END DESC,
     CASE @OrderBy WHEN 'SYS_VRSessions2_Description' THEN [SYS_VRSessions2].[Description] END,
     CASE @OrderBy WHEN 'SYS_VRSessions2_Description DESC' THEN [SYS_VRSessions2].[Description] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SYS_VRSessionByEmployee].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description,
    [SYS_VRSessions2].[Description] AS SYS_VRSessions2_Description,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName 
  FROM [SYS_VRSessionByEmployee] 
      INNER JOIN #PageIndex
          ON [SYS_VRSessionByEmployee].[RecordID] = #PageIndex.RecordID
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRSessionByEmployee].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  INNER JOIN [SYS_VRSessions] AS [SYS_VRSessions2]
    ON [SYS_VRSessionByEmployee].[VRSessionID] = [SYS_VRSessions2].[VRSessionID]
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SYS_VRSessionByEmployee].[UserName] = [aspnet_Users1].[LoginID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
