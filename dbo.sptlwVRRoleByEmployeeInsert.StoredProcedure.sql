USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRRoleByEmployeeInsert]
  @VRRoleID Int,
  @ApplicationID Int,
  @UserName NVarChar(20),
  @Return_RecordID Int = null OUTPUT 
  AS
  INSERT [SYS_VRRoleByEmployee]
  (
   [VRRoleID]
  ,[ApplicationID]
  ,[UserName]
  )
  VALUES
  (
   @VRRoleID
  ,@ApplicationID
  ,@UserName
  )
  SET @Return_RecordID = Scope_Identity()
GO
