USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrGroupsInsert]
  @GroupName NVarChar(30),
  @Return_GroupID Int = null OUTPUT 
  AS
  INSERT [VR_Groups]
  (
   [GroupName]
  )
  VALUES
  (
   @GroupName
  )
  SET @Return_GroupID = Scope_Identity()
GO
