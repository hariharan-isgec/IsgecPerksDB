USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRMenuByVRRoleSelectByVRRoleID]
  @ApplicationID Int,
  @VRRoleID Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SYS_VRMenuByVRRole].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description,
    [SYS_VRMenus2].[VRMenuName] AS SYS_VRMenus2_VRMenuName,
    [SYS_VRRoles3].[Description] AS SYS_VRRoles3_Description 
  FROM [SYS_VRMenuByVRRole] 
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRMenuByVRRole].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus2]
    ON [SYS_VRMenuByVRRole].[VRMenuID] = [SYS_VRMenus2].[VRMenuID]
  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles3]
    ON [SYS_VRMenuByVRRole].[VRRoleID] = [SYS_VRRoles3].[VRRoleID]
  WHERE
  [SYS_VRMenuByVRRole].[VRRoleID] = @VRRoleID
  AND [SYS_VRMenuByVRRole].[ApplicationID] = @ApplicationID
  ORDER BY
     CASE @OrderBy WHEN 'RecordID' THEN [SYS_VRMenuByVRRole].[RecordID] END,
     CASE @OrderBy WHEN 'RecordID DESC' THEN [SYS_VRMenuByVRRole].[RecordID] END DESC,
     CASE @OrderBy WHEN 'VRRoleID' THEN [SYS_VRMenuByVRRole].[VRRoleID] END,
     CASE @OrderBy WHEN 'VRRoleID DESC' THEN [SYS_VRMenuByVRRole].[VRRoleID] END DESC,
     CASE @OrderBy WHEN 'VRMenuID' THEN [SYS_VRMenuByVRRole].[VRMenuID] END,
     CASE @OrderBy WHEN 'VRMenuID DESC' THEN [SYS_VRMenuByVRRole].[VRMenuID] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [SYS_VRMenuByVRRole].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [SYS_VRMenuByVRRole].[Sequence] END DESC,
     CASE @OrderBy WHEN 'ApplicationID' THEN [SYS_VRMenuByVRRole].[ApplicationID] END,
     CASE @OrderBy WHEN 'ApplicationID DESC' THEN [SYS_VRMenuByVRRole].[ApplicationID] END DESC,
     CASE @OrderBy WHEN 'SYS_Applications1_Description' THEN [SYS_Applications1].[Description] END,
     CASE @OrderBy WHEN 'SYS_Applications1_Description DESC' THEN [SYS_Applications1].[Description] END DESC,
     CASE @OrderBy WHEN 'SYS_VRMenus2_VRMenuName' THEN [SYS_VRMenus2].[VRMenuName] END,
     CASE @OrderBy WHEN 'SYS_VRMenus2_VRMenuName DESC' THEN [SYS_VRMenus2].[VRMenuName] END DESC,
     CASE @OrderBy WHEN 'SYS_VRRoles3_Description' THEN [SYS_VRRoles3].[Description] END,
     CASE @OrderBy WHEN 'SYS_VRRoles3_Description DESC' THEN [SYS_VRRoles3].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
