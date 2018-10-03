USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRRolesInsert]
  @Description NVarChar(50),
  @VRRoleType NVarChar(1),
  @ApplicationID Int,
  @DefaultRole Bit,
  @Return_VRRoleID Int = null OUTPUT 
  AS
  INSERT [SYS_VRRoles]
  (
   [Description]
  ,[VRRoleType]
  ,[ApplicationID]
  ,[DefaultRole]
  )
  VALUES
  (
   @Description
  ,@VRRoleType
  ,@ApplicationID
  ,@DefaultRole
  )
  SET @Return_VRRoleID = Scope_Identity()
GO
