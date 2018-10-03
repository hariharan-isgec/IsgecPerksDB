USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestStatesInsert]
  @Description NVarChar(30),
  @Return_StatusID Int = null OUTPUT 
  AS
  INSERT [VR_RequestStates]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_StatusID = Scope_Identity()
GO
