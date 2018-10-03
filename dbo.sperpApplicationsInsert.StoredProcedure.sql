USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpApplicationsInsert]
  @ApplName NVarChar(50),
  @Return_ApplID Int = null OUTPUT 
  AS
  INSERT [ERP_Applications]
  (
   [ApplName]
  )
  VALUES
  (
   @ApplName
  )
  SET @Return_ApplID = Scope_Identity()
GO
