USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_LG_VRSessionByEmployeeDistinctInsert] 
  @UserName NVarChar(20),
  @VRSessionID Int,
  @ApplicationID Int,
  @MaintainGrid Bit,
  @InsertForm Bit,
  @UpdateForm Bit,
  @DisplayGrid Bit,
  @DisplayForm Bit,
  @DeleteOption Bit,
  @RecordID Int = null OUTPUT
  AS
  IF NOT EXISTS(SELECT [VRSessionID], [UserName] FROM [SYS_VRSessionByEmployee] WHERE [VRSessionID] = @VRSessionID AND [UserName] = @UserName AND [ApplicationID] = @ApplicationID)
  INSERT [SYS_VRSessionByEmployee]
  (
   [UserName]
  ,[VRSessionID]
  ,[ApplicationID]
  ,[MaintainGrid]
  ,[InsertForm]
  ,[UpdateForm]
  ,[DisplayGrid]
  ,[DisplayForm]
  ,[DeleteOption]
  )
  VALUES
  (
   @UserName
  ,@VRSessionID
  ,@ApplicationID
  ,@MaintainGrid
  ,@InsertForm
  ,@UpdateForm
  ,@DisplayGrid
  ,@DisplayForm
  ,@DeleteOption
  )
  SET @RecordID = Scope_Identity()
GO
