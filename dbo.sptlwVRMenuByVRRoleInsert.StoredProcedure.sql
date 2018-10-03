USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRMenuByVRRoleInsert]
  @VRRoleID Int,
  @VRMenuID Int,
  @Sequence Int,
  @ApplicationID Int,
  @Return_RecordID Int = null OUTPUT 
  AS
  INSERT [SYS_VRMenuByVRRole]
  (
   [VRRoleID]
  ,[VRMenuID]
  ,[Sequence]
  ,[ApplicationID]
  )
  VALUES
  (
   @VRRoleID
  ,@VRMenuID
  ,@Sequence
  ,@ApplicationID
  )
  SET @Return_RecordID = Scope_Identity()
GO
