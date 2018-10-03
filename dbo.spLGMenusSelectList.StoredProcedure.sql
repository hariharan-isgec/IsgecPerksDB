USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGMenusSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
		[SYS_Applications2].[WebPath] AS SYS_Applications2_WebPath,
		[SYS_Applications2].[GenerateDefaults] AS SYS_Applications2_GenerateDefaults 
  FROM [SYS_VRMenus] 
  LEFT OUTER JOIN [SYS_VRMenus] AS [SYS_VRMenus1]
    ON [SYS_VRMenus].[ParentVRMenuID] = [SYS_VRMenus1].[VRMenuID]
  INNER JOIN [SYS_Applications] AS [SYS_Applications2]
    ON [SYS_VRMenus].[ApplicationID] = [SYS_Applications2].[ApplicationID]
  ORDER BY
     CASE @orderBy WHEN 'VRMenuID' THEN [SYS_VRMenus].[VRMenuID] END,
     CASE @orderBy WHEN 'VRMenuID DESC' THEN [SYS_VRMenus].[VRMenuID] END DESC,
     CASE @orderBy WHEN 'VRMenuName' THEN [SYS_VRMenus].[VRMenuName] END,
     CASE @orderBy WHEN 'VRMenuName DESC' THEN [SYS_VRMenus].[VRMenuName] END DESC,
     CASE @orderBy WHEN 'ToolTip' THEN [SYS_VRMenus].[ToolTip] END,
     CASE @orderBy WHEN 'ToolTip DESC' THEN [SYS_VRMenus].[ToolTip] END DESC,
     CASE @orderBy WHEN 'ParentVRMenuID' THEN [SYS_VRMenus].[ParentVRMenuID] END,
     CASE @orderBy WHEN 'ParentVRMenuID DESC' THEN [SYS_VRMenus].[ParentVRMenuID] END DESC,
     CASE @orderBy WHEN 'VRMenuType' THEN [SYS_VRMenus].[VRMenuType] END,
     CASE @orderBy WHEN 'VRMenuType DESC' THEN [SYS_VRMenus].[VRMenuType] END DESC,
     CASE @orderBy WHEN 'CSSClass' THEN [SYS_VRMenus].[CSSClass] END,
     CASE @orderBy WHEN 'CSSClass DESC' THEN [SYS_VRMenus].[CSSClass] END DESC,
     CASE @orderBy WHEN 'Sequence' THEN [SYS_VRMenus].[Sequence] END,
     CASE @orderBy WHEN 'Sequence DESC' THEN [SYS_VRMenus].[Sequence] END DESC,
     CASE @orderBy WHEN 'ApplicationID' THEN [SYS_VRMenus].[ApplicationID] END,
     CASE @orderBy WHEN 'ApplicationID DESC' THEN [SYS_VRMenus].[ApplicationID] END DESC,
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
