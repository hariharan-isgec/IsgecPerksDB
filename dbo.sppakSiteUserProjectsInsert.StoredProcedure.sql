USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteUserProjectsInsert]
  @UserID NVarChar(8),
  @ProjectID NVarChar(6),
  @Active Bit,
  @Return_UserID NVarChar(8) = null OUTPUT, 
  @Return_ProjectID NVarChar(6) = null OUTPUT 
  AS
  INSERT [PAK_SiteUserProjects]
  (
   [UserID]
  ,[ProjectID]
  ,[Active]
  )
  VALUES
  (
   UPPER(@UserID)
  ,UPPER(@ProjectID)
  ,@Active
  )
  SET @Return_UserID = @UserID
  SET @Return_ProjectID = @ProjectID
GO
