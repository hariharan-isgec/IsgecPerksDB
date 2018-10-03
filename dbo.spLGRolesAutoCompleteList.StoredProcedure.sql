USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGRolesAutoCompleteList]
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
			ORDER BY [SYS_VRRoles].[VRRoleID] 
	  END
GO
