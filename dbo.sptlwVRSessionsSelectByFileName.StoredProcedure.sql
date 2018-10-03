USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRSessionsSelectByFileName]
  @ApplicationID Int,
  @FileName NVarChar(50),
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SYS_VRSessions].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description 
  FROM [SYS_VRSessions] 
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRSessions].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  WHERE
  [SYS_VRSessions].[FileName] = @FileName
  AND [SYS_VRSessions].[ApplicationID] = @ApplicationID
  ORDER BY
     CASE @OrderBy WHEN 'VRSessionID' THEN [SYS_VRSessions].[VRSessionID] END,
     CASE @OrderBy WHEN 'VRSessionID DESC' THEN [SYS_VRSessions].[VRSessionID] END DESC,
     CASE @OrderBy WHEN 'FileName' THEN [SYS_VRSessions].[FileName] END,
     CASE @OrderBy WHEN 'FileName DESC' THEN [SYS_VRSessions].[FileName] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SYS_VRSessions].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SYS_VRSessions].[Description] END DESC,
     CASE @OrderBy WHEN 'FolderLocation' THEN [SYS_VRSessions].[FolderLocation] END,
     CASE @OrderBy WHEN 'FolderLocation DESC' THEN [SYS_VRSessions].[FolderLocation] END DESC,
     CASE @OrderBy WHEN 'VRMenuName' THEN [SYS_VRSessions].[VRMenuName] END,
     CASE @OrderBy WHEN 'VRMenuName DESC' THEN [SYS_VRSessions].[VRMenuName] END DESC,
     CASE @OrderBy WHEN 'ToolTip' THEN [SYS_VRSessions].[ToolTip] END,
     CASE @OrderBy WHEN 'ToolTip DESC' THEN [SYS_VRSessions].[ToolTip] END DESC,
     CASE @OrderBy WHEN 'VRSessionType' THEN [SYS_VRSessions].[VRSessionType] END,
     CASE @OrderBy WHEN 'VRSessionType DESC' THEN [SYS_VRSessions].[VRSessionType] END DESC,
     CASE @OrderBy WHEN 'CSSClass' THEN [SYS_VRSessions].[CSSClass] END,
     CASE @OrderBy WHEN 'CSSClass DESC' THEN [SYS_VRSessions].[CSSClass] END DESC,
     CASE @OrderBy WHEN 'ApplicationID' THEN [SYS_VRSessions].[ApplicationID] END,
     CASE @OrderBy WHEN 'ApplicationID DESC' THEN [SYS_VRSessions].[ApplicationID] END DESC,
     CASE @OrderBy WHEN 'MaintainGrid' THEN [SYS_VRSessions].[MaintainGrid] END,
     CASE @OrderBy WHEN 'MaintainGrid DESC' THEN [SYS_VRSessions].[MaintainGrid] END DESC,
     CASE @OrderBy WHEN 'InsertForm' THEN [SYS_VRSessions].[InsertForm] END,
     CASE @OrderBy WHEN 'InsertForm DESC' THEN [SYS_VRSessions].[InsertForm] END DESC,
     CASE @OrderBy WHEN 'UpdateForm' THEN [SYS_VRSessions].[UpdateForm] END,
     CASE @OrderBy WHEN 'UpdateForm DESC' THEN [SYS_VRSessions].[UpdateForm] END DESC,
     CASE @OrderBy WHEN 'DisplayGrid' THEN [SYS_VRSessions].[DisplayGrid] END,
     CASE @OrderBy WHEN 'DisplayGrid DESC' THEN [SYS_VRSessions].[DisplayGrid] END DESC,
     CASE @OrderBy WHEN 'DisplayForm' THEN [SYS_VRSessions].[DisplayForm] END,
     CASE @OrderBy WHEN 'DisplayForm DESC' THEN [SYS_VRSessions].[DisplayForm] END DESC,
     CASE @OrderBy WHEN 'DeleteOption' THEN [SYS_VRSessions].[DeleteOption] END,
     CASE @OrderBy WHEN 'DeleteOption DESC' THEN [SYS_VRSessions].[DeleteOption] END DESC,
     CASE @OrderBy WHEN 'SYS_Applications1_Description' THEN [SYS_Applications1].[Description] END,
     CASE @OrderBy WHEN 'SYS_Applications1_Description DESC' THEN [SYS_Applications1].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
