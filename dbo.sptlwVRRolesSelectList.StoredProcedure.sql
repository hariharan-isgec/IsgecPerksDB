USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRRolesSelectList]
  @ApplicationID Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SYS_VRRoles].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description 
  FROM [SYS_VRRoles] 
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRRoles].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  WHERE 1 = 1  
  AND [SYS_VRRoles].[ApplicationID] = (@ApplicationID)  
  ORDER BY
     CASE @OrderBy WHEN 'VRRoleID' THEN [SYS_VRRoles].[VRRoleID] END,
     CASE @OrderBy WHEN 'VRRoleID DESC' THEN [SYS_VRRoles].[VRRoleID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SYS_VRRoles].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SYS_VRRoles].[Description] END DESC,
     CASE @OrderBy WHEN 'VRRoleType' THEN [SYS_VRRoles].[VRRoleType] END,
     CASE @OrderBy WHEN 'VRRoleType DESC' THEN [SYS_VRRoles].[VRRoleType] END DESC,
     CASE @OrderBy WHEN 'ApplicationID' THEN [SYS_VRRoles].[ApplicationID] END,
     CASE @OrderBy WHEN 'ApplicationID DESC' THEN [SYS_VRRoles].[ApplicationID] END DESC,
     CASE @OrderBy WHEN 'DefaultRole' THEN [SYS_VRRoles].[DefaultRole] END,
     CASE @OrderBy WHEN 'DefaultRole DESC' THEN [SYS_VRRoles].[DefaultRole] END DESC,
     CASE @OrderBy WHEN 'SYS_Applications1_Description' THEN [SYS_Applications1].[Description] END,
     CASE @OrderBy WHEN 'SYS_Applications1_Description DESC' THEN [SYS_Applications1].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
