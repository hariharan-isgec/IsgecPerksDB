USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRSessionsInsert]
  @FileName NVarChar(50),
  @Description NVarChar(500),
  @FolderLocation NVarChar(250),
  @VRMenuName NVarChar(50),
  @ToolTip NVarChar(100),
  @VRSessionType NChar(1),
  @CSSClass NVarChar(30),
  @ApplicationID Int,
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
   [FileName]
  ,[Description]
  ,[FolderLocation]
  ,[VRMenuName]
  ,[ToolTip]
  ,[VRSessionType]
  ,[CSSClass]
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
   @FileName
  ,@Description
  ,@FolderLocation
  ,@VRMenuName
  ,@ToolTip
  ,@VRSessionType
  ,@CSSClass
  ,@ApplicationID
  ,@MaintainGrid
  ,@InsertForm
  ,@UpdateForm
  ,@DisplayGrid
  ,@DisplayForm
  ,@DeleteOption
  )
  SET @Return_VRSessionID = Scope_Identity()
GO
