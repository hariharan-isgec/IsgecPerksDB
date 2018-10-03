USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRSessionsAutoCompleteList]
  @ApplicationID Int,
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[SYS_VRSessions].[Description] + ' [' + 
        STR([SYS_VRSessions].[VRSessionID])
        + ']', [SYS_VRSessions].[VRSessionID] 
			FROM [SYS_VRSessions] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
      AND [SYS_VRSessions].[ApplicationID] = @ApplicationID
			ORDER BY [SYS_VRSessions].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[SYS_VRSessions].[Description] + ' [' + 
        STR([SYS_VRSessions].[VRSessionID])
        + ']', [SYS_VRSessions].[VRSessionID] 
			FROM [SYS_VRSessions] 
      WHERE VRSessionID >= @PREFIX 
      AND [SYS_VRSessions].[ApplicationID] = @ApplicationID
			ORDER BY [SYS_VRSessions].[VRSessionID] 
	  END
GO
