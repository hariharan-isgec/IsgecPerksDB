USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakIssueTypesInsert]
  @Description NVarChar(50),
  @Return_IssueTypeID Int = null OUTPUT 
  AS
  INSERT [PAK_IssueTypes]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_IssueTypeID = Scope_Identity()
GO
