USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRSessionsInsert]
  @Description NVarChar(500),
  @FileName NVarChar(50),
  @ApplicationID Int,
  @FolderLocation NVarChar(250),
  @VRMenuName NVarChar(50),
  @ToolTip NVarChar(100),
  @VRSessionType NChar(1),
  @CSSClass NVarChar(30),
  @MaintainGrid Bit,
  @InsertForm Bit,
  @UpdateForm Bit,
  @DisplayGrid Bit,
  @DisplayForm Bit,
  @DeleteOption Bit,
  @Return_VRSessionID Int = null OUTPUT
  AS
  INSERT [SYS_VRSessions]
  (
   [Description]
  ,[FileName]
  ,[ApplicationID]
  ,[FolderLocation]
  ,[VRMenuName]
  ,[ToolTip]
  ,[VRSessionType]
  ,[CSSClass]
  ,[MaintainGrid]
  ,[InsertForm]
  ,[UpdateForm]
  ,[DisplayGrid]
  ,[DisplayForm]
  ,[DeleteOption]
  )
  VALUES
  (
   @Description
  ,@FileName
  ,@ApplicationID
  ,@FolderLocation
  ,@VRMenuName
  ,@ToolTip
  ,@VRSessionType
  ,@CSSClass
  ,@MaintainGrid
  ,@InsertForm
  ,@UpdateForm
  ,@DisplayGrid
  ,@DisplayForm
  ,@DeleteOption
  )
  SET @Return_VRSessionID = Scope_Identity()
GO
