USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentStatusInsert]
  @Description NVarChar(50),
  @Return_DocumentStatusID Int = null OUTPUT
  AS
  INSERT [IDM_DocumentStatus]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_DocumentStatusID = Scope_Identity()
GO
