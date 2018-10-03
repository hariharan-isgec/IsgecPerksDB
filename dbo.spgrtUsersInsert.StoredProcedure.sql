USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtUsersInsert]
  @UserID NVarChar(8),
  @Designation NVarChar(100),
  @Department NVarChar(100),
  @DirectNo NVarChar(100),
  @CellNo NVarChar(100),
  @Return_UserID NVarChar(8) = null OUTPUT 
  AS
  INSERT [GRT_Users]
  (
   [UserID]
  ,[Designation]
  ,[Department]
  ,[DirectNo]
  ,[CellNo]
  )
  VALUES
  (
   UPPER(@UserID)
  ,@Designation
  ,@Department
  ,@DirectNo
  ,@CellNo
  )
  SET @Return_UserID = @UserID
GO
