USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRSessionsSelectByID]
  @VRSessionID Int
  AS
  SELECT
		[SYS_VRSessions].[VRSessionID],
		[SYS_VRSessions].[Description],
		[SYS_VRSessions].[FileName],
		[SYS_VRSessions].[ApplicationID],
		[SYS_VRSessions].[FolderLocation],
		[SYS_VRSessions].[VRMenuName],
		[SYS_VRSessions].[ToolTip],
		[SYS_VRSessions].[VRSessionType],
		[SYS_VRSessions].[CSSClass],
		[SYS_VRSessions].[MaintainGrid],
		[SYS_VRSessions].[InsertForm],
		[SYS_VRSessions].[UpdateForm],
		[SYS_VRSessions].[DisplayGrid],
		[SYS_VRSessions].[DisplayForm],
		[SYS_VRSessions].[DeleteOption],
		[SYS_Applications1].[ApplicationID] AS SYS_Applications1_ApplicationID,
		[SYS_Applications1].[Description] AS SYS_Applications1_Description,
		[SYS_Applications1].[WebPath] AS SYS_Applications1_WebPath 
  FROM [SYS_VRSessions] 
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRSessions].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  WHERE
  [SYS_VRSessions].[VRSessionID] = @VRSessionID
GO
