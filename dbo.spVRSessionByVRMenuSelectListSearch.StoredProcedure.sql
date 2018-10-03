USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRSessionByVRMenuSelectListSearch]
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
  SELECT [SYS_VRSessionByVRMenu].[RecordID] FROM [SYS_VRSessionByVRMenu]
  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus1]
    ON [SYS_VRSessionByVRMenu].[VRMenuID] = [SYS_VRMenus1].[VRMenuID]
  INNER JOIN [SYS_VRSessions] AS [SYS_VRSessions2]
    ON [SYS_VRSessionByVRMenu].[VRSessionID] = [SYS_VRSessions2].[VRSessionID]
  INNER JOIN [SYS_Applications] AS [SYS_Applications3]
    ON [SYS_VRSessionByVRMenu].[ApplicationID] = [SYS_Applications3].[ApplicationID]
 WHERE  
      [SYS_VRSessionByVRMenu].[ApplicationID] = @ApplicationID
   AND ( 
         STR(ISNULL([SYS_VRSessionByVRMenu].[RecordID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRSessionByVRMenu].[VRMenuID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRSessionByVRMenu].[VRSessionID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRSessionByVRMenu].[Sequence], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRSessionByVRMenu].[ApplicationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRMenus1].[VRMenuName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRMenus1].[ToolTip],'')) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRMenus1].[ParentVRMenuID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRMenus1].[VRMenuType],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRMenus1].[CSSClass],'')) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRMenus1].[Sequence], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRMenus1].[ApplicationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRSessions2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRSessions2].[FileName],'')) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRSessions2].[ApplicationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRSessions2].[FolderLocation],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRSessions2].[VRMenuName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRSessions2].[ToolTip],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRSessions2].[VRSessionType],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRSessions2].[CSSClass],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_Applications3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_Applications3].[WebPath],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'RecordID' THEN [SYS_VRSessionByVRMenu].[RecordID] END,
     CASE @orderBy WHEN 'RecordID DESC' THEN [SYS_VRSessionByVRMenu].[RecordID] END DESC,
     CASE @orderBy WHEN 'VRMenuID' THEN [SYS_VRSessionByVRMenu].[VRMenuID] END,
     CASE @orderBy WHEN 'VRMenuID DESC' THEN [SYS_VRSessionByVRMenu].[VRMenuID] END DESC,
     CASE @orderBy WHEN 'VRSessionID' THEN [SYS_VRSessionByVRMenu].[VRSessionID] END,
     CASE @orderBy WHEN 'VRSessionID DESC' THEN [SYS_VRSessionByVRMenu].[VRSessionID] END DESC,
     CASE @orderBy WHEN 'Sequence' THEN [SYS_VRSessionByVRMenu].[Sequence] END,
     CASE @orderBy WHEN 'Sequence DESC' THEN [SYS_VRSessionByVRMenu].[Sequence] END DESC,
     CASE @orderBy WHEN 'ApplicationID' THEN [SYS_VRSessionByVRMenu].[ApplicationID] END,
     CASE @orderBy WHEN 'ApplicationID DESC' THEN [SYS_VRSessionByVRMenu].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'MaintainGrid' THEN [SYS_VRSessionByVRMenu].[MaintainGrid] END,
     CASE @orderBy WHEN 'MaintainGrid DESC' THEN [SYS_VRSessionByVRMenu].[MaintainGrid] END DESC,
     CASE @orderBy WHEN 'InsertForm' THEN [SYS_VRSessionByVRMenu].[InsertForm] END,
     CASE @orderBy WHEN 'InsertForm DESC' THEN [SYS_VRSessionByVRMenu].[InsertForm] END DESC,
     CASE @orderBy WHEN 'UpdateForm' THEN [SYS_VRSessionByVRMenu].[UpdateForm] END,
     CASE @orderBy WHEN 'UpdateForm DESC' THEN [SYS_VRSessionByVRMenu].[UpdateForm] END DESC,
     CASE @orderBy WHEN 'DisplayGrid' THEN [SYS_VRSessionByVRMenu].[DisplayGrid] END,
     CASE @orderBy WHEN 'DisplayGrid DESC' THEN [SYS_VRSessionByVRMenu].[DisplayGrid] END DESC,
     CASE @orderBy WHEN 'DisplayForm' THEN [SYS_VRSessionByVRMenu].[DisplayForm] END,
     CASE @orderBy WHEN 'DisplayForm DESC' THEN [SYS_VRSessionByVRMenu].[DisplayForm] END DESC,
     CASE @orderBy WHEN 'DeleteOption' THEN [SYS_VRSessionByVRMenu].[DeleteOption] END,
     CASE @orderBy WHEN 'DeleteOption DESC' THEN [SYS_VRSessionByVRMenu].[DeleteOption] END DESC,
     CASE @orderBy WHEN 'SYS_VRMenus1_VRMenuID' THEN [SYS_VRMenus1].[VRMenuID] END,
     CASE @orderBy WHEN 'SYS_VRMenus1_VRMenuID DESC' THEN [SYS_VRMenus1].[VRMenuID] END DESC,
     CASE @orderBy WHEN 'SYS_VRMenus1_VRMenuName' THEN [SYS_VRMenus1].[VRMenuName] END,
     CASE @orderBy WHEN 'SYS_VRMenus1_VRMenuName DESC' THEN [SYS_VRMenus1].[VRMenuName] END DESC,
     CASE @orderBy WHEN 'SYS_VRMenus1_ToolTip' THEN [SYS_VRMenus1].[ToolTip] END,
     CASE @orderBy WHEN 'SYS_VRMenus1_ToolTip DESC' THEN [SYS_VRMenus1].[ToolTip] END DESC,
     CASE @orderBy WHEN 'SYS_VRMenus1_ParentVRMenuID' THEN [SYS_VRMenus1].[ParentVRMenuID] END,
     CASE @orderBy WHEN 'SYS_VRMenus1_ParentVRMenuID DESC' THEN [SYS_VRMenus1].[ParentVRMenuID] END DESC,
     CASE @orderBy WHEN 'SYS_VRMenus1_VRMenuType' THEN [SYS_VRMenus1].[VRMenuType] END,
     CASE @orderBy WHEN 'SYS_VRMenus1_VRMenuType DESC' THEN [SYS_VRMenus1].[VRMenuType] END DESC,
     CASE @orderBy WHEN 'SYS_VRMenus1_CSSClass' THEN [SYS_VRMenus1].[CSSClass] END,
     CASE @orderBy WHEN 'SYS_VRMenus1_CSSClass DESC' THEN [SYS_VRMenus1].[CSSClass] END DESC,
     CASE @orderBy WHEN 'SYS_VRMenus1_Sequence' THEN [SYS_VRMenus1].[Sequence] END,
     CASE @orderBy WHEN 'SYS_VRMenus1_Sequence DESC' THEN [SYS_VRMenus1].[Sequence] END DESC,
     CASE @orderBy WHEN 'SYS_VRMenus1_ApplicationID' THEN [SYS_VRMenus1].[ApplicationID] END,
     CASE @orderBy WHEN 'SYS_VRMenus1_ApplicationID DESC' THEN [SYS_VRMenus1].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions2_VRSessionID' THEN [SYS_VRSessions2].[VRSessionID] END,
     CASE @orderBy WHEN 'SYS_VRSessions2_VRSessionID DESC' THEN [SYS_VRSessions2].[VRSessionID] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions2_Description' THEN [SYS_VRSessions2].[Description] END,
     CASE @orderBy WHEN 'SYS_VRSessions2_Description DESC' THEN [SYS_VRSessions2].[Description] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions2_FileName' THEN [SYS_VRSessions2].[FileName] END,
     CASE @orderBy WHEN 'SYS_VRSessions2_FileName DESC' THEN [SYS_VRSessions2].[FileName] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions2_ApplicationID' THEN [SYS_VRSessions2].[ApplicationID] END,
     CASE @orderBy WHEN 'SYS_VRSessions2_ApplicationID DESC' THEN [SYS_VRSessions2].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions2_FolderLocation' THEN [SYS_VRSessions2].[FolderLocation] END,
     CASE @orderBy WHEN 'SYS_VRSessions2_FolderLocation DESC' THEN [SYS_VRSessions2].[FolderLocation] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions2_VRMenuName' THEN [SYS_VRSessions2].[VRMenuName] END,
     CASE @orderBy WHEN 'SYS_VRSessions2_VRMenuName DESC' THEN [SYS_VRSessions2].[VRMenuName] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions2_ToolTip' THEN [SYS_VRSessions2].[ToolTip] END,
     CASE @orderBy WHEN 'SYS_VRSessions2_ToolTip DESC' THEN [SYS_VRSessions2].[ToolTip] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions2_VRSessionType' THEN [SYS_VRSessions2].[VRSessionType] END,
     CASE @orderBy WHEN 'SYS_VRSessions2_VRSessionType DESC' THEN [SYS_VRSessions2].[VRSessionType] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions2_CSSClass' THEN [SYS_VRSessions2].[CSSClass] END,
     CASE @orderBy WHEN 'SYS_VRSessions2_CSSClass DESC' THEN [SYS_VRSessions2].[CSSClass] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions2_MaintainGrid' THEN [SYS_VRSessions2].[MaintainGrid] END,
     CASE @orderBy WHEN 'SYS_VRSessions2_MaintainGrid DESC' THEN [SYS_VRSessions2].[MaintainGrid] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions2_InsertForm' THEN [SYS_VRSessions2].[InsertForm] END,
     CASE @orderBy WHEN 'SYS_VRSessions2_InsertForm DESC' THEN [SYS_VRSessions2].[InsertForm] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions2_UpdateForm' THEN [SYS_VRSessions2].[UpdateForm] END,
     CASE @orderBy WHEN 'SYS_VRSessions2_UpdateForm DESC' THEN [SYS_VRSessions2].[UpdateForm] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions2_DisplayGrid' THEN [SYS_VRSessions2].[DisplayGrid] END,
     CASE @orderBy WHEN 'SYS_VRSessions2_DisplayGrid DESC' THEN [SYS_VRSessions2].[DisplayGrid] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions2_DisplayForm' THEN [SYS_VRSessions2].[DisplayForm] END,
     CASE @orderBy WHEN 'SYS_VRSessions2_DisplayForm DESC' THEN [SYS_VRSessions2].[DisplayForm] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions2_DeleteOption' THEN [SYS_VRSessions2].[DeleteOption] END,
     CASE @orderBy WHEN 'SYS_VRSessions2_DeleteOption DESC' THEN [SYS_VRSessions2].[DeleteOption] END DESC,
     CASE @orderBy WHEN 'SYS_Applications3_ApplicationID' THEN [SYS_Applications3].[ApplicationID] END,
     CASE @orderBy WHEN 'SYS_Applications3_ApplicationID DESC' THEN [SYS_Applications3].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'SYS_Applications3_Description' THEN [SYS_Applications3].[Description] END,
     CASE @orderBy WHEN 'SYS_Applications3_Description DESC' THEN [SYS_Applications3].[Description] END DESC,
     CASE @orderBy WHEN 'SYS_Applications3_WebPath' THEN [SYS_Applications3].[WebPath] END,
     CASE @orderBy WHEN 'SYS_Applications3_WebPath DESC' THEN [SYS_Applications3].[WebPath] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[SYS_VRSessionByVRMenu].[RecordID],
		[SYS_VRSessionByVRMenu].[VRMenuID],
		[SYS_VRSessionByVRMenu].[VRSessionID],
		[SYS_VRSessionByVRMenu].[Sequence],
		[SYS_VRSessionByVRMenu].[ApplicationID],
		[SYS_VRSessionByVRMenu].[MaintainGrid],
		[SYS_VRSessionByVRMenu].[InsertForm],
		[SYS_VRSessionByVRMenu].[UpdateForm],
		[SYS_VRSessionByVRMenu].[DisplayGrid],
		[SYS_VRSessionByVRMenu].[DisplayForm],
		[SYS_VRSessionByVRMenu].[DeleteOption],
		[SYS_VRMenus1].[VRMenuID] AS SYS_VRMenus1_VRMenuID,
		[SYS_VRMenus1].[VRMenuName] AS SYS_VRMenus1_VRMenuName,
		[SYS_VRMenus1].[ToolTip] AS SYS_VRMenus1_ToolTip,
		[SYS_VRMenus1].[ParentVRMenuID] AS SYS_VRMenus1_ParentVRMenuID,
		[SYS_VRMenus1].[VRMenuType] AS SYS_VRMenus1_VRMenuType,
		[SYS_VRMenus1].[CSSClass] AS SYS_VRMenus1_CSSClass,
		[SYS_VRMenus1].[Sequence] AS SYS_VRMenus1_Sequence,
		[SYS_VRMenus1].[ApplicationID] AS SYS_VRMenus1_ApplicationID,
		[SYS_VRSessions2].[VRSessionID] AS SYS_VRSessions2_VRSessionID,
		[SYS_VRSessions2].[Description] AS SYS_VRSessions2_Description,
		[SYS_VRSessions2].[FileName] AS SYS_VRSessions2_FileName,
		[SYS_VRSessions2].[ApplicationID] AS SYS_VRSessions2_ApplicationID,
		[SYS_VRSessions2].[FolderLocation] AS SYS_VRSessions2_FolderLocation,
		[SYS_VRSessions2].[VRMenuName] AS SYS_VRSessions2_VRMenuName,
		[SYS_VRSessions2].[ToolTip] AS SYS_VRSessions2_ToolTip,
		[SYS_VRSessions2].[VRSessionType] AS SYS_VRSessions2_VRSessionType,
		[SYS_VRSessions2].[CSSClass] AS SYS_VRSessions2_CSSClass,
		[SYS_VRSessions2].[MaintainGrid] AS SYS_VRSessions2_MaintainGrid,
		[SYS_VRSessions2].[InsertForm] AS SYS_VRSessions2_InsertForm,
		[SYS_VRSessions2].[UpdateForm] AS SYS_VRSessions2_UpdateForm,
		[SYS_VRSessions2].[DisplayGrid] AS SYS_VRSessions2_DisplayGrid,
		[SYS_VRSessions2].[DisplayForm] AS SYS_VRSessions2_DisplayForm,
		[SYS_VRSessions2].[DeleteOption] AS SYS_VRSessions2_DeleteOption,
		[SYS_Applications3].[ApplicationID] AS SYS_Applications3_ApplicationID,
		[SYS_Applications3].[Description] AS SYS_Applications3_Description,
		[SYS_Applications3].[WebPath] AS SYS_Applications3_WebPath 
  FROM [SYS_VRSessionByVRMenu] 
    	INNER JOIN #PageIndex
          ON [SYS_VRSessionByVRMenu].[RecordID] = #PageIndex.RecordID
  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus1]
    ON [SYS_VRSessionByVRMenu].[VRMenuID] = [SYS_VRMenus1].[VRMenuID]
  INNER JOIN [SYS_VRSessions] AS [SYS_VRSessions2]
    ON [SYS_VRSessionByVRMenu].[VRSessionID] = [SYS_VRSessions2].[VRSessionID]
  INNER JOIN [SYS_Applications] AS [SYS_Applications3]
    ON [SYS_VRSessionByVRMenu].[ApplicationID] = [SYS_Applications3].[ApplicationID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
