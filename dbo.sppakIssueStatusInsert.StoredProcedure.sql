USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakIssueStatusInsert]
  @Description NVarChar(50),
  @Return_IssueStatusID Int = null OUTPUT 
  AS
  INSERT [PAK_IssueStatus]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_IssueStatusID = Scope_Identity()
GO
