USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRRolesSelectList]
  @ApplicationID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[SYS_VRRoles].[VRRoleID],
		[SYS_VRRoles].[Description],
		[SYS_VRRoles].[VRRoleType],
		[SYS_VRRoles].[ApplicationID],
		[SYS_Applications1].[ApplicationID] AS SYS_Applications1_ApplicationID,
		[SYS_Applications1].[Description] AS SYS_Applications1_Description,
		[SYS_Applications1].[WebPath] AS SYS_Applications1_WebPath 
  FROM [SYS_VRRoles] 
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRRoles].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  WHERE [SYS_VRRoles].[ApplicationID] = @ApplicationID
  ORDER BY
     CASE @orderBy WHEN 'VRRoleID' THEN [SYS_VRRoles].[VRRoleID] END,
     CASE @orderBy WHEN 'VRRoleID DESC' THEN [SYS_VRRoles].[VRRoleID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [SYS_VRRoles].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [SYS_VRRoles].[Description] END DESC,
     CASE @orderBy WHEN 'VRRoleType' THEN [SYS_VRRoles].[VRRoleType] END,
     CASE @orderBy WHEN 'VRRoleType DESC' THEN [SYS_VRRoles].[VRRoleType] END DESC,
     CASE @orderBy WHEN 'ApplicationID' THEN [SYS_VRRoles].[ApplicationID] END,
     CASE @orderBy WHEN 'ApplicationID DESC' THEN [SYS_VRRoles].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'SYS_Applications1_ApplicationID' THEN [SYS_Applications1].[ApplicationID] END,
     CASE @orderBy WHEN 'SYS_Applications1_ApplicationID DESC' THEN [SYS_Applications1].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'SYS_Applications1_Description' THEN [SYS_Applications1].[Description] END,
     CASE @orderBy WHEN 'SYS_Applications1_Description DESC' THEN [SYS_Applications1].[Description] END DESC,
     CASE @orderBy WHEN 'SYS_Applications1_WebPath' THEN [SYS_Applications1].[WebPath] END,
     CASE @orderBy WHEN 'SYS_Applications1_WebPath DESC' THEN [SYS_Applications1].[WebPath] END DESC 
  SET @RecordCount = @@RowCount
GO
