USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRApplicationsInsert]
  @Description NVarChar(100),
  @WebPath NVarChar(250),
  @Return_ApplicationID Int = null OUTPUT
  AS
  INSERT [SYS_Applications]
  (
   [Description]
  ,[WebPath]
  )
  VALUES
  (
   @Description
  ,@WebPath
  )
  SET @Return_ApplicationID = Scope_Identity()
GO
