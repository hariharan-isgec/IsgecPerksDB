USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApplicationStatusInsert]
  @Description NVarChar(20),
  @Return_ApplStatusID Int = null OUTPUT
  AS
  INSERT [ATN_ApplicationStatus]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_ApplStatusID = Scope_Identity()
GO
