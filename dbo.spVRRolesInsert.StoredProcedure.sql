USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRRolesInsert]
  @Description NVarChar(50),
  @VRRoleType NVarChar(1),
  @ApplicationID Int,
  @Return_VRRoleID Int = null OUTPUT
  AS
  INSERT [SYS_VRRoles]
  (
   [Description]
  ,[VRRoleType]
  ,[ApplicationID]
  )
  VALUES
  (
   @Description
  ,@VRRoleType
  ,@ApplicationID
  )
  SET @Return_VRRoleID = Scope_Identity()
GO
