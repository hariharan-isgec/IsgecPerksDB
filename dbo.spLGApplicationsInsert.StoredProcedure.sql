USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGApplicationsInsert]
  @Description NVarChar(100),
  @WebPath NVarChar(250),
  @GenerateDefaults Bit,
  @Return_ApplicationID Int = null OUTPUT
  AS
  INSERT [SYS_Applications]
  (
   [Description]
  ,[WebPath]
  ,[GenerateDefaults]
  )
  VALUES
  (
   @Description
  ,@WebPath
  ,@GenerateDefaults
  )
  SET @Return_ApplicationID = Scope_Identity()
GO
