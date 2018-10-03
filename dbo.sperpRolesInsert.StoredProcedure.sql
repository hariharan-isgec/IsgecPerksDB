USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRolesInsert]
  @Description NVarChar(50),
  @Return_RoleID Int = null OUTPUT 
  AS
  INSERT [ERP_Roles]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_RoleID = Scope_Identity()
GO
