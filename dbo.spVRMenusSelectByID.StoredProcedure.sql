USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRMenusSelectByID]
  @VRMenuID Int
  AS
  SELECT
		[SYS_VRMenus].[VRMenuID],
		[SYS_VRMenus].[VRMenuName],
		[SYS_VRMenus].[ToolTip],
		[SYS_VRMenus].[ParentVRMenuID],
		[SYS_VRMenus].[VRMenuType],
		[SYS_VRMenus].[CSSClass],
		[SYS_VRMenus].[Sequence],
		[SYS_VRMenus].[ApplicationID],
		[SYS_VRMenus1].[VRMenuID] AS SYS_VRMenus1_VRMenuID,
		[SYS_VRMenus1].[VRMenuName] AS SYS_VRMenus1_VRMenuName,
		[SYS_VRMenus1].[ToolTip] AS SYS_VRMenus1_ToolTip,
		[SYS_VRMenus1].[ParentVRMenuID] AS SYS_VRMenus1_ParentVRMenuID,
		[SYS_VRMenus1].[VRMenuType] AS SYS_VRMenus1_VRMenuType,
		[SYS_VRMenus1].[CSSClass] AS SYS_VRMenus1_CSSClass,
		[SYS_VRMenus1].[Sequence] AS SYS_VRMenus1_Sequence,
		[SYS_VRMenus1].[ApplicationID] AS SYS_VRMenus1_ApplicationID,
		[SYS_Applications2].[ApplicationID] AS SYS_Applications2_ApplicationID,
		[SYS_Applications2].[Description] AS SYS_Applications2_Description,
		[SYS_Applications2].[WebPath] AS SYS_Applications2_WebPath 
  FROM [SYS_VRMenus] 
  LEFT OUTER JOIN [SYS_VRMenus] AS [SYS_VRMenus1]
    ON [SYS_VRMenus].[ParentVRMenuID] = [SYS_VRMenus1].[VRMenuID]
  INNER JOIN [SYS_Applications] AS [SYS_Applications2]
    ON [SYS_VRMenus].[ApplicationID] = [SYS_Applications2].[ApplicationID]
  WHERE
  [SYS_VRMenus].[VRMenuID] = @VRMenuID
GO
