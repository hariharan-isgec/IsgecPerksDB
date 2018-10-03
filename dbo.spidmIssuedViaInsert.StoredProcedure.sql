USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmIssuedViaInsert]
  @Description NVarChar(50),
  @Return_IssuedViaID Int = null OUTPUT
  AS
  INSERT [IDM_IssuedVia]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_IssuedViaID = Scope_Identity()
GO
