USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_LG_VRSessionByUserFile]
  @FileName NVarChar(251),
  @ApplicationID Int,
  @UserName NVarChar(20)
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
		[SYS_Applications2].[WebPath] AS SYS_Applications2_WebPath 
  FROM [SYS_VRSessionByEmployee] 
    INNER JOIN [SYS_VRSessions] AS [SYS_VRSessions1]
      ON [SYS_VRSessionByEmployee].[VRSessionID] = [SYS_VRSessions1].[VRSessionID]
    INNER JOIN [SYS_Applications] AS [SYS_Applications2] 
      ON [SYS_VRSessionByEmployee].[ApplicationID] = [SYS_Applications2].[ApplicationID] 
  WHERE 
            [SYS_VRSessionByEmployee].[UserName] = @UserName  
	   AND	[SYS_VRSessionByEmployee].[ApplicationID] = @ApplicationID 
       AND  [SYS_VRSessions1].[FileName] = @FileName
GO
