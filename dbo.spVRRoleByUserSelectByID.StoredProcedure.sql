USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRRoleByUserSelectByID]
  @RecordID Int
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
		[SYS_Applications2].[ApplicationID] AS SYS_Applications2_ApplicationID,
		[SYS_Applications2].[Description] AS SYS_Applications2_Description,
		[SYS_Applications2].[WebPath] AS SYS_Applications2_WebPath,
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
  [SYS_VRRoleByEmployee].[RecordID] = @RecordID
GO
