USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spctUserProjectInsert]
  @UserID NVarChar(8),
  @ProjectID NVarChar(6),
  @IsActive Bit,
  @Return_UserID NVarChar(8) = null OUTPUT, 
  @Return_ProjectID NVarChar(6) = null OUTPUT 
  AS
  INSERT [CT_UserProject]
  (
   [UserID]
  ,[ProjectID]
  ,[IsActive]
  )
  VALUES
  (
   UPPER(@UserID)
  ,UPPER(@ProjectID)
  ,@IsActive
  )
  SET @Return_UserID = @UserID
  SET @Return_ProjectID = @ProjectID
GO
