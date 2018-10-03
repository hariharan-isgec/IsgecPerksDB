USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGUsersInsert]
  @UserName NVarChar(20),
  @UserFullName NVarChar(50),
  @Return_UserName NVarChar(20) = null OUTPUT
  AS
  INSERT [aspnet_Users]
  (
   [UserName]
  ,[UserFullName]
  )
  VALUES
  (
   @UserName
  ,@UserFullName
  )
  SET @Return_UserName = @UserName
GO
