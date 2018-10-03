USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRMenuByVRRoleSelectByID]
  @RecordID Int
  AS
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
  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles1]
    ON [SYS_VRMenuByVRRole].[VRRoleID] = [SYS_VRRoles1].[VRRoleID]
  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus2]
    ON [SYS_VRMenuByVRRole].[VRMenuID] = [SYS_VRMenus2].[VRMenuID]
  INNER JOIN [SYS_Applications] AS [SYS_Applications3]
    ON [SYS_VRMenuByVRRole].[ApplicationID] = [SYS_Applications3].[ApplicationID]
  WHERE
  [SYS_VRMenuByVRRole].[RecordID] = @RecordID
GO
