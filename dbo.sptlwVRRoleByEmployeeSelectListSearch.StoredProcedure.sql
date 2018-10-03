USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRRoleByEmployeeSelectListSearch]
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
  SELECT [SYS_VRRoleByEmployee].[RecordID] FROM [SYS_VRRoleByEmployee]
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRRoleByEmployee].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles2]
    ON [SYS_VRRoleByEmployee].[VRRoleID] = [SYS_VRRoles2].[VRRoleID]
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SYS_VRRoleByEmployee].[UserName] = [aspnet_Users1].[LoginID]
 WHERE  
      [SYS_VRRoleByEmployee].[ApplicationID] = (@ApplicationID)
   AND ( 
         STR(ISNULL([SYS_VRRoleByEmployee].[RecordID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRRoleByEmployee].[VRRoleID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRRoleByEmployee].[ApplicationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRRoleByEmployee].[UserName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RecordID' THEN [SYS_VRRoleByEmployee].[RecordID] END,
     CASE @OrderBy WHEN 'RecordID DESC' THEN [SYS_VRRoleByEmployee].[RecordID] END DESC,
     CASE @OrderBy WHEN 'VRRoleID' THEN [SYS_VRRoleByEmployee].[VRRoleID] END,
     CASE @OrderBy WHEN 'VRRoleID DESC' THEN [SYS_VRRoleByEmployee].[VRRoleID] END DESC,
     CASE @OrderBy WHEN 'ApplicationID' THEN [SYS_VRRoleByEmployee].[ApplicationID] END,
     CASE @OrderBy WHEN 'ApplicationID DESC' THEN [SYS_VRRoleByEmployee].[ApplicationID] END DESC,
     CASE @OrderBy WHEN 'UserName' THEN [SYS_VRRoleByEmployee].[UserName] END,
     CASE @OrderBy WHEN 'UserName DESC' THEN [SYS_VRRoleByEmployee].[UserName] END DESC,
     CASE @OrderBy WHEN 'SYS_Applications1_Description' THEN [SYS_Applications1].[Description] END,
     CASE @OrderBy WHEN 'SYS_Applications1_Description DESC' THEN [SYS_Applications1].[Description] END DESC,
     CASE @OrderBy WHEN 'SYS_VRRoles2_Description' THEN [SYS_VRRoles2].[Description] END,
     CASE @OrderBy WHEN 'SYS_VRRoles2_Description DESC' THEN [SYS_VRRoles2].[Description] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SYS_VRRoleByEmployee].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description,
    [SYS_VRRoles2].[Description] AS SYS_VRRoles2_Description,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName 
  FROM [SYS_VRRoleByEmployee] 
      INNER JOIN #PageIndex
          ON [SYS_VRRoleByEmployee].[RecordID] = #PageIndex.RecordID
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRRoleByEmployee].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles2]
    ON [SYS_VRRoleByEmployee].[VRRoleID] = [SYS_VRRoles2].[VRRoleID]
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SYS_VRRoleByEmployee].[UserName] = [aspnet_Users1].[LoginID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
