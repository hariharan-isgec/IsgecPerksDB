USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGSessionByUserSelectByApplicationID]
  @ApplicationID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[SYS_VRSessionByEmployee].[RecordID],
		[SYS_VRSessionByEmployee].[VRSessionID],
		[SYS_VRSessionByEmployee].[ApplicationID],
		[SYS_VRSessionByEmployee].[UserName],
		[SYS_VRSessionByEmployee].[MaintainGrid],
		[SYS_VRSessionByEmployee].[InsertForm],
		[SYS_VRSessionByEmployee].[UpdateForm],
		[SYS_VRSessionByEmployee].[DisplayGrid],
		[SYS_VRSessionByEmployee].[DisplayForm],
		[SYS_VRSessionByEmployee].[DeleteOption],
		[SYS_VRSessions1].[VRSessionID] AS SYS_VRSessions1_VRSessionID,
		[SYS_VRSessions1].[Description] AS SYS_VRSessions1_Description,
		[SYS_VRSessions1].[FileName] AS SYS_VRSessions1_FileName,
		[SYS_VRSessions1].[ApplicationID] AS SYS_VRSessions1_ApplicationID,
		[SYS_VRSessions1].[FolderLocation] AS SYS_VRSessions1_FolderLocation,
		[SYS_VRSessions1].[VRMenuName] AS SYS_VRSessions1_VRMenuName,
		[SYS_VRSessions1].[ToolTip] AS SYS_VRSessions1_ToolTip,
		[SYS_VRSessions1].[VRSessionType] AS SYS_VRSessions1_VRSessionType,
		[SYS_VRSessions1].[CSSClass] AS SYS_VRSessions1_CSSClass,
		[SYS_VRSessions1].[MaintainGrid] AS SYS_VRSessions1_MaintainGrid,
		[SYS_VRSessions1].[InsertForm] AS SYS_VRSessions1_InsertForm,
		[SYS_VRSessions1].[UpdateForm] AS SYS_VRSessions1_UpdateForm,
		[SYS_VRSessions1].[DisplayGrid] AS SYS_VRSessions1_DisplayGrid,
		[SYS_VRSessions1].[DisplayForm] AS SYS_VRSessions1_DisplayForm,
		[SYS_VRSessions1].[DeleteOption] AS SYS_VRSessions1_DeleteOption,
		[SYS_Applications2].[ApplicationID] AS SYS_Applications2_ApplicationID,
		[SYS_Applications2].[Description] AS SYS_Applications2_Description,
		[SYS_Applications2].[WebPath] AS SYS_Applications2_WebPath,
		[SYS_Applications2].[GenerateDefaults] AS SYS_Applications2_GenerateDefaults 
  FROM [SYS_VRSessionByEmployee] 
  INNER JOIN [SYS_VRSessions] AS [SYS_VRSessions1]
    ON [SYS_VRSessionByEmployee].[VRSessionID] = [SYS_VRSessions1].[VRSessionID]
  INNER JOIN [SYS_Applications] AS [SYS_Applications2]
    ON [SYS_VRSessionByEmployee].[ApplicationID] = [SYS_Applications2].[ApplicationID]
  WHERE
  [SYS_VRSessionByEmployee].[ApplicationID] = @ApplicationID
  ORDER BY
     CASE @orderBy WHEN 'RecordID' THEN [SYS_VRSessionByEmployee].[RecordID] END,
     CASE @orderBy WHEN 'RecordID DESC' THEN [SYS_VRSessionByEmployee].[RecordID] END DESC,
     CASE @orderBy WHEN 'VRSessionID' THEN [SYS_VRSessionByEmployee].[VRSessionID] END,
     CASE @orderBy WHEN 'VRSessionID DESC' THEN [SYS_VRSessionByEmployee].[VRSessionID] END DESC,
     CASE @orderBy WHEN 'ApplicationID' THEN [SYS_VRSessionByEmployee].[ApplicationID] END,
     CASE @orderBy WHEN 'ApplicationID DESC' THEN [SYS_VRSessionByEmployee].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'UserName' THEN [SYS_VRSessionByEmployee].[UserName] END,
     CASE @orderBy WHEN 'UserName DESC' THEN [SYS_VRSessionByEmployee].[UserName] END DESC,
     CASE @orderBy WHEN 'MaintainGrid' THEN [SYS_VRSessionByEmployee].[MaintainGrid] END,
     CASE @orderBy WHEN 'MaintainGrid DESC' THEN [SYS_VRSessionByEmployee].[MaintainGrid] END DESC,
     CASE @orderBy WHEN 'InsertForm' THEN [SYS_VRSessionByEmployee].[InsertForm] END,
     CASE @orderBy WHEN 'InsertForm DESC' THEN [SYS_VRSessionByEmployee].[InsertForm] END DESC,
     CASE @orderBy WHEN 'UpdateForm' THEN [SYS_VRSessionByEmployee].[UpdateForm] END,
     CASE @orderBy WHEN 'UpdateForm DESC' THEN [SYS_VRSessionByEmployee].[UpdateForm] END DESC,
     CASE @orderBy WHEN 'DisplayGrid' THEN [SYS_VRSessionByEmployee].[DisplayGrid] END,
     CASE @orderBy WHEN 'DisplayGrid DESC' THEN [SYS_VRSessionByEmployee].[DisplayGrid] END DESC,
     CASE @orderBy WHEN 'DisplayForm' THEN [SYS_VRSessionByEmployee].[DisplayForm] END,
     CASE @orderBy WHEN 'DisplayForm DESC' THEN [SYS_VRSessionByEmployee].[DisplayForm] END DESC,
     CASE @orderBy WHEN 'DeleteOption' THEN [SYS_VRSessionByEmployee].[DeleteOption] END,
     CASE @orderBy WHEN 'DeleteOption DESC' THEN [SYS_VRSessionByEmployee].[DeleteOption] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions1_VRSessionID' THEN [SYS_VRSessions1].[VRSessionID] END,
     CASE @orderBy WHEN 'SYS_VRSessions1_VRSessionID DESC' THEN [SYS_VRSessions1].[VRSessionID] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions1_Description' THEN [SYS_VRSessions1].[Description] END,
     CASE @orderBy WHEN 'SYS_VRSessions1_Description DESC' THEN [SYS_VRSessions1].[Description] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions1_FileName' THEN [SYS_VRSessions1].[FileName] END,
     CASE @orderBy WHEN 'SYS_VRSessions1_FileName DESC' THEN [SYS_VRSessions1].[FileName] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions1_ApplicationID' THEN [SYS_VRSessions1].[ApplicationID] END,
     CASE @orderBy WHEN 'SYS_VRSessions1_ApplicationID DESC' THEN [SYS_VRSessions1].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions1_FolderLocation' THEN [SYS_VRSessions1].[FolderLocation] END,
     CASE @orderBy WHEN 'SYS_VRSessions1_FolderLocation DESC' THEN [SYS_VRSessions1].[FolderLocation] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions1_VRMenuName' THEN [SYS_VRSessions1].[VRMenuName] END,
     CASE @orderBy WHEN 'SYS_VRSessions1_VRMenuName DESC' THEN [SYS_VRSessions1].[VRMenuName] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions1_ToolTip' THEN [SYS_VRSessions1].[ToolTip] END,
     CASE @orderBy WHEN 'SYS_VRSessions1_ToolTip DESC' THEN [SYS_VRSessions1].[ToolTip] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions1_VRSessionType' THEN [SYS_VRSessions1].[VRSessionType] END,
     CASE @orderBy WHEN 'SYS_VRSessions1_VRSessionType DESC' THEN [SYS_VRSessions1].[VRSessionType] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions1_CSSClass' THEN [SYS_VRSessions1].[CSSClass] END,
     CASE @orderBy WHEN 'SYS_VRSessions1_CSSClass DESC' THEN [SYS_VRSessions1].[CSSClass] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions1_MaintainGrid' THEN [SYS_VRSessions1].[MaintainGrid] END,
     CASE @orderBy WHEN 'SYS_VRSessions1_MaintainGrid DESC' THEN [SYS_VRSessions1].[MaintainGrid] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions1_InsertForm' THEN [SYS_VRSessions1].[InsertForm] END,
     CASE @orderBy WHEN 'SYS_VRSessions1_InsertForm DESC' THEN [SYS_VRSessions1].[InsertForm] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions1_UpdateForm' THEN [SYS_VRSessions1].[UpdateForm] END,
     CASE @orderBy WHEN 'SYS_VRSessions1_UpdateForm DESC' THEN [SYS_VRSessions1].[UpdateForm] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions1_DisplayGrid' THEN [SYS_VRSessions1].[DisplayGrid] END,
     CASE @orderBy WHEN 'SYS_VRSessions1_DisplayGrid DESC' THEN [SYS_VRSessions1].[DisplayGrid] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions1_DisplayForm' THEN [SYS_VRSessions1].[DisplayForm] END,
     CASE @orderBy WHEN 'SYS_VRSessions1_DisplayForm DESC' THEN [SYS_VRSessions1].[DisplayForm] END DESC,
     CASE @orderBy WHEN 'SYS_VRSessions1_DeleteOption' THEN [SYS_VRSessions1].[DeleteOption] END,
     CASE @orderBy WHEN 'SYS_VRSessions1_DeleteOption DESC' THEN [SYS_VRSessions1].[DeleteOption] END DESC,
     CASE @orderBy WHEN 'SYS_Applications2_ApplicationID' THEN [SYS_Applications2].[ApplicationID] END,
     CASE @orderBy WHEN 'SYS_Applications2_ApplicationID DESC' THEN [SYS_Applications2].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'SYS_Applications2_Description' THEN [SYS_Applications2].[Description] END,
     CASE @orderBy WHEN 'SYS_Applications2_Description DESC' THEN [SYS_Applications2].[Description] END DESC,
     CASE @orderBy WHEN 'SYS_Applications2_WebPath' THEN [SYS_Applications2].[WebPath] END,
     CASE @orderBy WHEN 'SYS_Applications2_WebPath DESC' THEN [SYS_Applications2].[WebPath] END DESC,
     CASE @orderBy WHEN 'SYS_Applications2_GenerateDefaults' THEN [SYS_Applications2].[GenerateDefaults] END,
     CASE @orderBy WHEN 'SYS_Applications2_GenerateDefaults DESC' THEN [SYS_Applications2].[GenerateDefaults] END DESC 
  SET @RecordCount = @@RowCount
GO
