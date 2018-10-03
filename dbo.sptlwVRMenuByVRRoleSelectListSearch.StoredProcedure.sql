USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRMenuByVRRoleSelectListSearch]
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
  SELECT [SYS_VRMenuByVRRole].[RecordID] FROM [SYS_VRMenuByVRRole]
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRMenuByVRRole].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus2]
    ON [SYS_VRMenuByVRRole].[VRMenuID] = [SYS_VRMenus2].[VRMenuID]
  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles3]
    ON [SYS_VRMenuByVRRole].[VRRoleID] = [SYS_VRRoles3].[VRRoleID]
 WHERE  
      [SYS_VRMenuByVRRole].[ApplicationID] = (@ApplicationID)
   AND ( 
         STR(ISNULL([SYS_VRMenuByVRRole].[RecordID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRMenuByVRRole].[VRRoleID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRMenuByVRRole].[VRMenuID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRMenuByVRRole].[Sequence], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRMenuByVRRole].[ApplicationID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RecordID' THEN [SYS_VRMenuByVRRole].[RecordID] END,
     CASE @OrderBy WHEN 'RecordID DESC' THEN [SYS_VRMenuByVRRole].[RecordID] END DESC,
     CASE @OrderBy WHEN 'VRRoleID' THEN [SYS_VRMenuByVRRole].[VRRoleID] END,
     CASE @OrderBy WHEN 'VRRoleID DESC' THEN [SYS_VRMenuByVRRole].[VRRoleID] END DESC,
     CASE @OrderBy WHEN 'VRMenuID' THEN [SYS_VRMenuByVRRole].[VRMenuID] END,
     CASE @OrderBy WHEN 'VRMenuID DESC' THEN [SYS_VRMenuByVRRole].[VRMenuID] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [SYS_VRMenuByVRRole].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [SYS_VRMenuByVRRole].[Sequence] END DESC,
     CASE @OrderBy WHEN 'ApplicationID' THEN [SYS_VRMenuByVRRole].[ApplicationID] END,
     CASE @OrderBy WHEN 'ApplicationID DESC' THEN [SYS_VRMenuByVRRole].[ApplicationID] END DESC,
     CASE @OrderBy WHEN 'SYS_Applications1_Description' THEN [SYS_Applications1].[Description] END,
     CASE @OrderBy WHEN 'SYS_Applications1_Description DESC' THEN [SYS_Applications1].[Description] END DESC,
     CASE @OrderBy WHEN 'SYS_VRMenus2_VRMenuName' THEN [SYS_VRMenus2].[VRMenuName] END,
     CASE @OrderBy WHEN 'SYS_VRMenus2_VRMenuName DESC' THEN [SYS_VRMenus2].[VRMenuName] END DESC,
     CASE @OrderBy WHEN 'SYS_VRRoles3_Description' THEN [SYS_VRRoles3].[Description] END,
     CASE @OrderBy WHEN 'SYS_VRRoles3_Description DESC' THEN [SYS_VRRoles3].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SYS_VRMenuByVRRole].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description,
    [SYS_VRMenus2].[VRMenuName] AS SYS_VRMenus2_VRMenuName,
    [SYS_VRRoles3].[Description] AS SYS_VRRoles3_Description 
  FROM [SYS_VRMenuByVRRole] 
      INNER JOIN #PageIndex
          ON [SYS_VRMenuByVRRole].[RecordID] = #PageIndex.RecordID
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRMenuByVRRole].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus2]
    ON [SYS_VRMenuByVRRole].[VRMenuID] = [SYS_VRMenus2].[VRMenuID]
  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles3]
    ON [SYS_VRMenuByVRRole].[VRRoleID] = [SYS_VRRoles3].[VRRoleID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
