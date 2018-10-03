USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRApplicationsAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[SYS_Applications].[Description] + ' [' + 
        STR([SYS_Applications].[ApplicationID])
        + ']', [SYS_Applications].[ApplicationID] 
			FROM [SYS_Applications] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [SYS_Applications].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[SYS_Applications].[Description] + ' [' + 
        STR([SYS_Applications].[ApplicationID])
        + ']', [SYS_Applications].[ApplicationID] 
			FROM [SYS_Applications] 
      WHERE ApplicationID >= @PREFIX 
			ORDER BY [SYS_Applications].[ApplicationID] 
	  END
GO
