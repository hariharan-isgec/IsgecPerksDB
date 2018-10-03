USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmappUserAppsInsert]
  @AppID Int,
  @UserID NVarChar(8),
  @IsActive Bit,
  @Return_AppID Int = null OUTPUT, 
  @Return_UserID NVarChar(8) = null OUTPUT 
  AS
  INSERT [MAPP_UserApps]
  (
   [AppID]
  ,[UserID]
  ,[IsActive]
  )
  VALUES
  (
   @AppID
  ,UPPER(@UserID)
  ,@IsActive
  )
  SET @Return_AppID = @AppID
  SET @Return_UserID = @UserID
GO
