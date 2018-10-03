USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRMenuByVRRoleSelectListSearch]
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
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  RecordID Int NOT NULL
  )
  INSERT INTO #PageIndex (RecordID)
  SELECT [SYS_VRMenuByVRRole].[RecordID] FROM [SYS_VRMenuByVRRole]
  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles1]
    ON [SYS_VRMenuByVRRole].[VRRoleID] = [SYS_VRRoles1].[VRRoleID]
  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus2]
    ON [SYS_VRMenuByVRRole].[VRMenuID] = [SYS_VRMenus2].[VRMenuID]
  INNER JOIN [SYS_Applications] AS [SYS_Applications3]
    ON [SYS_VRMenuByVRRole].[ApplicationID] = [SYS_Applications3].[ApplicationID]
 WHERE  
      [SYS_VRMenuByVRRole].[ApplicationID] = @ApplicationID
   AND ( 
         STR(ISNULL([SYS_VRMenuByVRRole].[RecordID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRMenuByVRRole].[VRRoleID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRMenuByVRRole].[VRMenuID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRMenuByVRRole].[Sequence], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRMenuByVRRole].[ApplicationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRRoles1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRRoles1].[VRRoleType],'')) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRRoles1].[ApplicationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRMenus2].[VRMenuName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRMenus2].[ToolTip],'')) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRMenus2].[ParentVRMenuID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRMenus2].[VRMenuType],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRMenus2].[CSSClass],'')) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRMenus2].[Sequence], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRMenus2].[ApplicationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_Applications3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_Applications3].[WebPath],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'RecordID' THEN [SYS_VRMenuByVRRole].[RecordID] END,
     CASE @orderBy WHEN 'RecordID DESC' THEN [SYS_VRMenuByVRRole].[RecordID] END DESC,
     CASE @orderBy WHEN 'VRRoleID' THEN [SYS_VRMenuByVRRole].[VRRoleID] END,
     CASE @orderBy WHEN 'VRRoleID DESC' THEN [SYS_VRMenuByVRRole].[VRRoleID] END DESC,
     CASE @orderBy WHEN 'VRMenuID' THEN [SYS_VRMenuByVRRole].[VRMenuID] END,
     CASE @orderBy WHEN 'VRMenuID DESC' THEN [SYS_VRMenuByVRRole].[VRMenuID] END DESC,
     CASE @orderBy WHEN 'Sequence' THEN [SYS_VRMenuByVRRole].[Sequence] END,
     CASE @orderBy WHEN 'Sequence DESC' THEN [SYS_VRMenuByVRRole].[Sequence] END DESC,
     CASE @orderBy WHEN 'ApplicationID' THEN [SYS_VRMenuByVRRole].[ApplicationID] END,
     CASE @orderBy WHEN 'ApplicationID DESC' THEN [SYS_VRMenuByVRRole].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'SYS_VRRoles1_VRRoleID' THEN [SYS_VRRoles1].[VRRoleID] END,
     CASE @orderBy WHEN 'SYS_VRRoles1_VRRoleID DESC' THEN [SYS_VRRoles1].[VRRoleID] END DESC,
     CASE @orderBy WHEN 'SYS_VRRoles1_Description' THEN [SYS_VRRoles1].[Description] END,
     CASE @orderBy WHEN 'SYS_VRRoles1_Description DESC' THEN [SYS_VRRoles1].[Description] END DESC,
     CASE @orderBy WHEN 'SYS_VRRoles1_VRRoleType' THEN [SYS_VRRoles1].[VRRoleType] END,
     CASE @orderBy WHEN 'SYS_VRRoles1_VRRoleType DESC' THEN [SYS_VRRoles1].[VRRoleType] END DESC,
     CASE @orderBy WHEN 'SYS_VRRoles1_ApplicationID' THEN [SYS_VRRoles1].[ApplicationID] END,
     CASE @orderBy WHEN 'SYS_VRRoles1_ApplicationID DESC' THEN [SYS_VRRoles1].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'SYS_VRMenus2_VRMenuID' THEN [SYS_VRMenus2].[VRMenuID] END,
     CASE @orderBy WHEN 'SYS_VRMenus2_VRMenuID DESC' THEN [SYS_VRMenus2].[VRMenuID] END DESC,
     CASE @orderBy WHEN 'SYS_VRMenus2_VRMenuName' THEN [SYS_VRMenus2].[VRMenuName] END,
     CASE @orderBy WHEN 'SYS_VRMenus2_VRMenuName DESC' THEN [SYS_VRMenus2].[VRMenuName] END DESC,
     CASE @orderBy WHEN 'SYS_VRMenus2_ToolTip' THEN [SYS_VRMenus2].[ToolTip] END,
     CASE @orderBy WHEN 'SYS_VRMenus2_ToolTip DESC' THEN [SYS_VRMenus2].[ToolTip] END DESC,
     CASE @orderBy WHEN 'SYS_VRMenus2_ParentVRMenuID' THEN [SYS_VRMenus2].[ParentVRMenuID] END,
     CASE @orderBy WHEN 'SYS_VRMenus2_ParentVRMenuID DESC' THEN [SYS_VRMenus2].[ParentVRMenuID] END DESC,
     CASE @orderBy WHEN 'SYS_VRMenus2_VRMenuType' THEN [SYS_VRMenus2].[VRMenuType] END,
     CASE @orderBy WHEN 'SYS_VRMenus2_VRMenuType DESC' THEN [SYS_VRMenus2].[VRMenuType] END DESC,
     CASE @orderBy WHEN 'SYS_VRMenus2_CSSClass' THEN [SYS_VRMenus2].[CSSClass] END,
     CASE @orderBy WHEN 'SYS_VRMenus2_CSSClass DESC' THEN [SYS_VRMenus2].[CSSClass] END DESC,
     CASE @orderBy WHEN 'SYS_VRMenus2_Sequence' THEN [SYS_VRMenus2].[Sequence] END,
     CASE @orderBy WHEN 'SYS_VRMenus2_Sequence DESC' THEN [SYS_VRMenus2].[Sequence] END DESC,
     CASE @orderBy WHEN 'SYS_VRMenus2_ApplicationID' THEN [SYS_VRMenus2].[ApplicationID] END,
     CASE @orderBy WHEN 'SYS_VRMenus2_ApplicationID DESC' THEN [SYS_VRMenus2].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'SYS_Applications3_ApplicationID' THEN [SYS_Applications3].[ApplicationID] END,
     CASE @orderBy WHEN 'SYS_Applications3_ApplicationID DESC' THEN [SYS_Applications3].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'SYS_Applications3_Description' THEN [SYS_Applications3].[Description] END,
     CASE @orderBy WHEN 'SYS_Applications3_Description DESC' THEN [SYS_Applications3].[Description] END DESC,
     CASE @orderBy WHEN 'SYS_Applications3_WebPath' THEN [SYS_Applications3].[WebPath] END,
     CASE @orderBy WHEN 'SYS_Applications3_WebPath DESC' THEN [SYS_Applications3].[WebPath] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[SYS_VRMenuByVRRole].[RecordID],
		[SYS_VRMenuByVRRole].[VRRoleID],
		[SYS_VRMenuByVRRole].[VRMenuID],
		[SYS_VRMenuByVRRole].[Sequence],
		[SYS_VRMenuByVRRole].[ApplicationID],
		[SYS_VRRoles1].[VRRoleID] AS SYS_VRRoles1_VRRoleID,
		[SYS_VRRoles1].[Description] AS SYS_VRRoles1_Description,
		[SYS_VRRoles1].[VRRoleType] AS SYS_VRRoles1_VRRoleType,
		[SYS_VRRoles1].[ApplicationID] AS SYS_VRRoles1_ApplicationID,
		[SYS_VRMenus2].[VRMenuID] AS SYS_VRMenus2_VRMenuID,
		[SYS_VRMenus2].[VRMenuName] AS SYS_VRMenus2_VRMenuName,
		[SYS_VRMenus2].[ToolTip] AS SYS_VRMenus2_ToolTip,
		[SYS_VRMenus2].[ParentVRMenuID] AS SYS_VRMenus2_ParentVRMenuID,
		[SYS_VRMenus2].[VRMenuType] AS SYS_VRMenus2_VRMenuType,
		[SYS_VRMenus2].[CSSClass] AS SYS_VRMenus2_CSSClass,
		[SYS_VRMenus2].[Sequence] AS SYS_VRMenus2_Sequence,
		[SYS_VRMenus2].[ApplicationID] AS SYS_VRMenus2_ApplicationID,
		[SYS_Applications3].[ApplicationID] AS SYS_Applications3_ApplicationID,
		[SYS_Applications3].[Description] AS SYS_Applications3_Description,
		[SYS_Applications3].[WebPath] AS SYS_Applications3_WebPath 
  FROM [SYS_VRMenuByVRRole] 
    	INNER JOIN #PageIndex
          ON [SYS_VRMenuByVRRole].[RecordID] = #PageIndex.RecordID
  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles1]
    ON [SYS_VRMenuByVRRole].[VRRoleID] = [SYS_VRRoles1].[VRRoleID]
  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus2]
    ON [SYS_VRMenuByVRRole].[VRMenuID] = [SYS_VRMenus2].[VRMenuID]
  INNER JOIN [SYS_Applications] AS [SYS_Applications3]
    ON [SYS_VRMenuByVRRole].[ApplicationID] = [SYS_Applications3].[ApplicationID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
