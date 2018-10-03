USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRSessionByEmployeeInsert]
  @VRSessionID Int,
  @ApplicationID Int,
  @UserName NVarChar(20),
  @MaintainGrid Bit,
  @InsertForm Bit,
  @UpdateForm Bit,
  @DisplayGrid Bit,
  @DisplayForm Bit,
  @DeleteOption Bit,
  @Return_RecordID Int = null OUTPUT 
  AS
  INSERT [SYS_VRSessionByEmployee]
  (
   [VRSessionID]
  ,[ApplicationID]
  ,[UserName]
  ,[MaintainGrid]
  ,[InsertForm]
  ,[UpdateForm]
  ,[DisplayGrid]
  ,[DisplayForm]
  ,[DeleteOption]
  )
  VALUES
  (
   @VRSessionID
  ,@ApplicationID
  ,@UserName
  ,@MaintainGrid
  ,@InsertForm
  ,@UpdateForm
  ,@DisplayGrid
  ,@DisplayForm
  ,@DeleteOption
  )
  SET @Return_RecordID = Scope_Identity()
GO
