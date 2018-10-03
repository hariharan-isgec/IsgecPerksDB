USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGMenusAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[SYS_VRMenus].[VRMenuName] + ' [' + 
        STR([SYS_VRMenus].[VRMenuID])
        + ']', [SYS_VRMenus].[VRMenuID] 
			FROM [SYS_VRMenus] 
      WHERE LOWER(VRMenuName) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [SYS_VRMenus].[VRMenuName] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[SYS_VRMenus].[VRMenuName] + ' [' + 
        STR([SYS_VRMenus].[VRMenuID])
        + ']', [SYS_VRMenus].[VRMenuID] 
			FROM [SYS_VRMenus] 
      WHERE VRMenuID >= @PREFIX 
			ORDER BY [SYS_VRMenus].[VRMenuID] 
	  END
GO
