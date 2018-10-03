USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_LG_SetPageSize]
  @PageName NVarChar(250),
  @LoginID NVarChar(8),
  @PageSize Int,
  @ApplicationID Int 
AS 
BEGIN
	IF (EXISTS (SELECT [SYS_LGPageSize].[PageSize] FROM [SYS_LGPageSize] WHERE [SYS_LGPageSize].[PageName] = @PageName AND [SYS_LGPageSize].[LoginID] = @LoginID AND [SYS_LGPageSize].[ApplicationID] = @ApplicationID))
	BEGIN
		UPDATE [SYS_LGPageSize] SET [SYS_LGPageSize].[PageSize] = @PageSize
		WHERE [SYS_LGPageSize].[PageName] = @PageName 
			AND [SYS_LGPageSize].[LoginID] = @LoginID
			AND [SYS_LGPageSize].[ApplicationID] = @ApplicationID 
	END
	ELSE
	BEGIN
		INSERT INTO [SYS_LGPageSize]
					( PageName,
					  LoginID,
					  PageSize,
					  ApplicationID )
			 VALUES ( @PageName,
					  @LoginID,
					  @PageSize,
					  @ApplicationID )
	END

END
GO
