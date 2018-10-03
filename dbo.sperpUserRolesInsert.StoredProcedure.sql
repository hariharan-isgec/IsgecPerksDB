USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpUserRolesInsert]
  @RequesterID NVarChar(8),
  @ApproverID NVarChar(8),
  @RoleID Int,
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [ERP_UserRoles]
  (
   [RequesterID]
  ,[ApproverID]
  ,[RoleID]
  )
  VALUES
  (
   @RequesterID
  ,@ApproverID
  ,@RoleID
  )
  SET @Return_SerialNo = Scope_Identity()
GO
