USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRRolesSelectByID]
  @VRRoleID Int
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
  WHERE
  [SYS_VRRoles].[VRRoleID] = @VRRoleID
GO
