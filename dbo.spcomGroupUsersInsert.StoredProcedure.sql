USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomGroupUsersInsert]
  @GroupID NVarChar(6),
  @LoginID NVarChar(8),
  @Active Bit,
  @Return_GroupID NVarChar(6) = null OUTPUT, 
  @Return_LoginID NVarChar(8) = null OUTPUT 
  AS
  INSERT [SYS_GroupLogins]
  (
   [GroupID]
  ,[LoginID]
  ,[Active]
  )
  VALUES
  (
   UPPER(@GroupID)
  ,UPPER(@LoginID)
  ,@Active
  )
  SET @Return_GroupID = @GroupID
  SET @Return_LoginID = @LoginID
GO
