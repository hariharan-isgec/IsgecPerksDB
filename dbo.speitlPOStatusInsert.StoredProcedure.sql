USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOStatusInsert]
  @Description NVarChar(30),
  @Return_StatusID Int = null OUTPUT 
  AS
  INSERT [EITL_POStatus]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_StatusID = Scope_Identity()
GO
