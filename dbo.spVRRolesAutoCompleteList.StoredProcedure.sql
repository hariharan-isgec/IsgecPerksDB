USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRRolesAutoCompleteList]
  @ApplicationID Int,
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[SYS_VRRoles].[Description] + ' [' + 
        STR([SYS_VRRoles].[VRRoleID])
        + ']', [SYS_VRRoles].[VRRoleID] 
			FROM [SYS_VRRoles] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
      AND [SYS_VRRoles].[ApplicationID] = @ApplicationID
			ORDER BY [SYS_VRRoles].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[SYS_VRRoles].[Description] + ' [' + 
        STR([SYS_VRRoles].[VRRoleID])
        + ']', [SYS_VRRoles].[VRRoleID] 
			FROM [SYS_VRRoles] 
      WHERE VRRoleID >= @PREFIX 
      AND [SYS_VRRoles].[ApplicationID] = @ApplicationID
			ORDER BY [SYS_VRRoles].[VRRoleID] 
	  END
GO
