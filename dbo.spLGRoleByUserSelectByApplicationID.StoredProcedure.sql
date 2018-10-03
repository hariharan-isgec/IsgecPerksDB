USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGRoleByUserSelectByApplicationID]
  @ApplicationID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[SYS_VRRoleByEmployee].[RecordID],
		[SYS_VRRoleByEmployee].[VRRoleID],
		[SYS_VRRoleByEmployee].[ApplicationID],
		[SYS_VRRoleByEmployee].[UserName],
		[SYS_VRRoles1].[VRRoleID] AS SYS_VRRoles1_VRRoleID,
		[SYS_VRRoles1].[Description] AS SYS_VRRoles1_Description,
		[SYS_VRRoles1].[VRRoleType] AS SYS_VRRoles1_VRRoleType,
		[SYS_VRRoles1].[ApplicationID] AS SYS_VRRoles1_ApplicationID,
		[SYS_VRRoles1].[DefaultRole] AS SYS_VRRoles1_DefaultRole,
		[SYS_Applications2].[ApplicationID] AS SYS_Applications2_ApplicationID,
		[SYS_Applications2].[Description] AS SYS_Applications2_Description,
		[SYS_Applications2].[WebPath] AS SYS_Applications2_WebPath,
		[SYS_Applications2].[GenerateDefaults] AS SYS_Applications2_GenerateDefaults,
		[aspnet_users3].[UserName] AS aspnet_users3_UserName,
		[aspnet_users3].[UserFullName] AS aspnet_users3_UserFullName 
  FROM [SYS_VRRoleByEmployee] 
  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles1]
    ON [SYS_VRRoleByEmployee].[VRRoleID] = [SYS_VRRoles1].[VRRoleID]
  INNER JOIN [SYS_Applications] AS [SYS_Applications2]
    ON [SYS_VRRoleByEmployee].[ApplicationID] = [SYS_Applications2].[ApplicationID]
  INNER JOIN [aspnet_users] AS [aspnet_users3]
    ON [SYS_VRRoleByEmployee].[UserName] = [aspnet_users3].[UserName]
  WHERE
  [SYS_VRRoleByEmployee].[ApplicationID] = @ApplicationID
  ORDER BY
     CASE @orderBy WHEN 'RecordID' THEN [SYS_VRRoleByEmployee].[RecordID] END,
     CASE @orderBy WHEN 'RecordID DESC' THEN [SYS_VRRoleByEmployee].[RecordID] END DESC,
     CASE @orderBy WHEN 'VRRoleID' THEN [SYS_VRRoleByEmployee].[VRRoleID] END,
     CASE @orderBy WHEN 'VRRoleID DESC' THEN [SYS_VRRoleByEmployee].[VRRoleID] END DESC,
     CASE @orderBy WHEN 'ApplicationID' THEN [SYS_VRRoleByEmployee].[ApplicationID] END,
     CASE @orderBy WHEN 'ApplicationID DESC' THEN [SYS_VRRoleByEmployee].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'UserName' THEN [SYS_VRRoleByEmployee].[UserName] END,
     CASE @orderBy WHEN 'UserName DESC' THEN [SYS_VRRoleByEmployee].[UserName] END DESC,
     CASE @orderBy WHEN 'SYS_VRRoles1_VRRoleID' THEN [SYS_VRRoles1].[VRRoleID] END,
     CASE @orderBy WHEN 'SYS_VRRoles1_VRRoleID DESC' THEN [SYS_VRRoles1].[VRRoleID] END DESC,
     CASE @orderBy WHEN 'SYS_VRRoles1_Description' THEN [SYS_VRRoles1].[Description] END,
     CASE @orderBy WHEN 'SYS_VRRoles1_Description DESC' THEN [SYS_VRRoles1].[Description] END DESC,
     CASE @orderBy WHEN 'SYS_VRRoles1_VRRoleType' THEN [SYS_VRRoles1].[VRRoleType] END,
     CASE @orderBy WHEN 'SYS_VRRoles1_VRRoleType DESC' THEN [SYS_VRRoles1].[VRRoleType] END DESC,
     CASE @orderBy WHEN 'SYS_VRRoles1_ApplicationID' THEN [SYS_VRRoles1].[ApplicationID] END,
     CASE @orderBy WHEN 'SYS_VRRoles1_ApplicationID DESC' THEN [SYS_VRRoles1].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'SYS_VRRoles1_DefaultRole' THEN [SYS_VRRoles1].[DefaultRole] END,
     CASE @orderBy WHEN 'SYS_VRRoles1_DefaultRole DESC' THEN [SYS_VRRoles1].[DefaultRole] END DESC,
     CASE @orderBy WHEN 'SYS_Applications2_ApplicationID' THEN [SYS_Applications2].[ApplicationID] END,
     CASE @orderBy WHEN 'SYS_Applications2_ApplicationID DESC' THEN [SYS_Applications2].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'SYS_Applications2_Description' THEN [SYS_Applications2].[Description] END,
     CASE @orderBy WHEN 'SYS_Applications2_Description DESC' THEN [SYS_Applications2].[Description] END DESC,
     CASE @orderBy WHEN 'SYS_Applications2_WebPath' THEN [SYS_Applications2].[WebPath] END,
     CASE @orderBy WHEN 'SYS_Applications2_WebPath DESC' THEN [SYS_Applications2].[WebPath] END DESC,
     CASE @orderBy WHEN 'SYS_Applications2_GenerateDefaults' THEN [SYS_Applications2].[GenerateDefaults] END,
     CASE @orderBy WHEN 'SYS_Applications2_GenerateDefaults DESC' THEN [SYS_Applications2].[GenerateDefaults] END DESC,
     CASE @orderBy WHEN 'aspnet_users3_UserName' THEN [aspnet_users3].[UserName] END,
     CASE @orderBy WHEN 'aspnet_users3_UserName DESC' THEN [aspnet_users3].[UserName] END DESC,
     CASE @orderBy WHEN 'aspnet_users3_UserFullName' THEN [aspnet_users3].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_users3_UserFullName DESC' THEN [aspnet_users3].[UserFullName] END DESC 
  SET @RecordCount = @@RowCount
GO
