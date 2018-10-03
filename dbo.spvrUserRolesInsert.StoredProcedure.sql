USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrUserRolesInsert]
  @UserID NVarChar(8),
  @DivisionID NVarChar(6),
  @RoleID NVarChar(15),
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [VR_UserRoles]
  (
   [UserID]
  ,[DivisionID]
  ,[RoleID]
  )
  VALUES
  (
   @UserID
  ,@DivisionID
  ,@RoleID
  )
  SET @Return_SerialNo = Scope_Identity()
GO
