USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_LG_ValidateSessionByEmployee] 
  @UserName NVarChar(20),
  @FolderLocation NVarChar(250),
  @ApplicationID Int,
  @RecordID Int = 1 OUTPUT
  AS
  BEGIN
  DECLARE @VRSessionID Int
  SET @RecordID = 1 
  SELECT @VRSessionID = [SYS_VRSessions].[VRSessionID] FROM [SYS_VRSessions] WHERE [SYS_VRSessions].[FolderLocation] = @FolderLocation  AND [SYS_VRSessions].[ApplicationID] = @ApplicationID
  IF EXISTS(SELECT [UserName], [VRSessionID] FROM [SYS_VRSessionByEmployee] WHERE [UserName] = @UserName AND [VRSessionID] = @VRSessionID  AND [SYS_VRSessionByEmployee].[ApplicationID] = @ApplicationID)
		SET @RecordID = 0
  END
GO
