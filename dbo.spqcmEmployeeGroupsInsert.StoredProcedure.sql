USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmEmployeeGroupsInsert]
  @Description NVarChar(50),
  @Return_GroupID Int = null OUTPUT 
  AS
  INSERT [QCM_EmployeeGroups]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_GroupID = Scope_Identity()
GO
