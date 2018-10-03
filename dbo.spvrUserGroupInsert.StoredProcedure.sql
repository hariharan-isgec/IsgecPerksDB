USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrUserGroupInsert]
  @UserID NVarChar(8),
  @GroupID Int,
  @RoleID NVarChar(20),
  @OutOfContractApprover Bit,
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [VR_UserGroup]
  (
   [UserID]
  ,[GroupID]
  ,[RoleID]
  ,[OutOfContractApprover]
  )
  VALUES
  (
   @UserID
  ,@GroupID
  ,@RoleID
  ,@OutOfContractApprover
  )
  SET @Return_SerialNo = Scope_Identity()
GO
