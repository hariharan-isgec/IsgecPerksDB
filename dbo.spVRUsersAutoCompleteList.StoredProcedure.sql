USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRUsersAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[aspnet_Users].[UserFullName] + ' [' + 
        [aspnet_Users].[UserName]
        + ']', [aspnet_Users].[UserName] 
			FROM [aspnet_Users] 
      WHERE LOWER(UserFullName) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [aspnet_Users].[UserFullName] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[aspnet_Users].[UserFullName] + ' [' + 
        [aspnet_Users].[UserName]
        + ']', [aspnet_Users].[UserName] 
			FROM [aspnet_Users] 
      WHERE UserName >= @PREFIX 
			ORDER BY [aspnet_Users].[UserName] 
	  END
GO
