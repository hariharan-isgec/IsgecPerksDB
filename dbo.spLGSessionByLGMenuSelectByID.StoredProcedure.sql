USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGSessionByLGMenuSelectByID]
  @RecordID Int
  AS
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
		[SYS_Applications3].[WebPath] AS SYS_Applications3_WebPath,
		[SYS_Applications3].[GenerateDefaults] AS SYS_Applications3_GenerateDefaults 
  FROM [SYS_VRSessionByVRMenu] 
  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus1]
    ON [SYS_VRSessionByVRMenu].[VRMenuID] = [SYS_VRMenus1].[VRMenuID]
  INNER JOIN [SYS_VRSessions] AS [SYS_VRSessions2]
    ON [SYS_VRSessionByVRMenu].[VRSessionID] = [SYS_VRSessions2].[VRSessionID]
  INNER JOIN [SYS_Applications] AS [SYS_Applications3]
    ON [SYS_VRSessionByVRMenu].[ApplicationID] = [SYS_Applications3].[ApplicationID]
  WHERE
  [SYS_VRSessionByVRMenu].[RecordID] = @RecordID
GO
