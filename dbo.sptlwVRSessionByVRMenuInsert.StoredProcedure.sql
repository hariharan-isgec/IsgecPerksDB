USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRSessionByVRMenuInsert]
  @VRMenuID Int,
  @VRSessionID Int,
  @Sequence Int,
  @ApplicationID Int,
  @MaintainGrid Bit,
  @InsertForm Bit,
  @UpdateForm Bit,
  @DisplayGrid Bit,
  @DisplayForm Bit,
  @DeleteOption Bit,
  @Return_RecordID Int = null OUTPUT 
  AS
  INSERT [SYS_VRSessionByVRMenu]
  (
   [VRMenuID]
  ,[VRSessionID]
  ,[Sequence]
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
   @VRMenuID
  ,@VRSessionID
  ,@Sequence
  ,@ApplicationID
  ,@MaintainGrid
  ,@InsertForm
  ,@UpdateForm
  ,@DisplayGrid
  ,@DisplayForm
  ,@DeleteOption
  )
  SET @Return_RecordID = Scope_Identity()
GO
